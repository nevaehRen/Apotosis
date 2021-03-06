
function dy = aptosis(t, y, flag, Params)

dy = zeros(24,1);   



%% --- Step2: Define 18 Variables ---
        pC3 = y(1);
     pC3_C9 = y(2);
 pC3_C9star = y(3);
         C9 = y(4);
         C3 = y(5);
     C9star = y(6); 
       XIAP = y(7);    
    C3_XIAP = y(8);    
    XIAP_C3 = y(9) ; 
  C3_cleave = y(10);
        pC9 = y(11);  
      C9_C3 = y(12); 
    C9_XIAP = y(13);  
  C9_cleave = y(14); 
XIAP_cleave = y(15);
          S = y(16);  
       S_C3 = y(17); 
   S_Cleave = y(18);
   
   
   if t<0.1
    Inducer = 0;
   else
    Inducer = y(19);
   end   

   C9m=y(20);
   C9m_pC9=y(21);
   C9starm=y(22);
   C9starm_pC9=y(23);
   C9m_C9starm=y(24);

   
%% --- Step3: Calculate Flux

      [A1,A2,A3] = ReactionFlux( pC3,     C9,  pC3_C9,     [],   [Params.a1,Params.a2,Params.a3]);
      [B1,B2,B3] = ReactionFlux( pC3, C9star,  pC3_C9star, [],   [Params.b1,Params.b2,Params.b3]);
[C_R1,C_R2,C_R3] = ReactionFlux(  C3,   XIAP,  C3_XIAP,    [],   [Params.c1,Params.c2,Params.c3]);


        D1 = Params.d1*pC9*pC9*Inducer;
        D2 = Params.d2*C9;

      [E1,E2,E3] = ReactionFlux(  C9,     C3,  C9_C3,      [],   [Params.e1,Params.e2,Params.e3]);

      [F1,F2,F3] = ReactionFlux(  C9,   XIAP,  C9_XIAP,    [],   [Params.f1,Params.f2,Params.f3]);     
      [G1,G2,G3] = ReactionFlux(XIAP,     C3,  XIAP_C3,    [],   [Params.g1,Params.g2,Params.g3]);
      [H1,H2,H3] = ReactionFlux(   S,     C3,     S_C3,    [],   [Params.h1,Params.h2,Params.h3]);

      
     ka=1/500; 
     kd=1/100;
    
      J1 = ka*pC9*C9m*Inducer;
      J2 = kd*C9m_pC9;
      
          
      K1 = ka*C9m*C9m*Inducer;
      K2 = kd*C9;
      
      
      L1 = ka*C9starm*pC9*Inducer;
      L2 = kd*C9starm_pC9;
      
            
      M1 = ka*C9starm*C9starm*Inducer;
      M2 = kd*C9star;
 
                  
      N1 = ka*C9starm*C9m*Inducer;
      N2 = kd*C9m_C9starm;
      
      
      
      
%% --- Step4: Calculate derivate

tau  = Params.tau;
fast = 1/70;
slow = 1/240;

%pC3
    dy(1) = -A1+A2-B1+B2 + (Params.SR_C3-tau*pC3);
%pC3_C9
    dy(2) = A1-A2-A3;
%pC3_C9star
    dy(3) = B1-B2-B3;
%C9
    dy(4) = -A1+A2+A3+D1-E1+E2-F1+F2+K1-K2; %-fast*C9 
%C3
    dy(5) = A3+B3-C_R1+C_R2-E1+E2+E3-G1+G2+G3-H1+H2+H3;
%C9star
    dy(6) = -B1+B2+B3+E3+M1-M2;%-slow*C9star;
%XIAP
    dy(7) = -C_R1+C_R2+C_R3-F1+F2+F3-G1+G2 + (Params.SR_XIAP-tau*XIAP);
%C3_XIAP
    dy(8) = C_R1-C_R2-C_R3;
%XIAP_C3
    dy(9) = G1-G2-G3;
%C3_Cleave
   dy(10) = C_R3;
%pC9
   dy(11)= -2*D1+2*D2-J1+J2-L1+L2+(Params.SR_C9-tau*pC9);
%C9_C3
   dy(12) = E1-E2-E3;
%C9_XIAP
   dy(13) = F1-F2-F3;
%C9_Cleave
   dy(14) = F3+fast*C9+slow*C9star;
%XIAP_Cleave
   dy(15) = G3;
%S
   dy(16) = -H1+H2;
%S_C3
   dy(17) = H1-H2-H3;
%S_Cleave
   dy(18) = H3;
%I
   dy(19) = (-D1+D2+F3-J1+J2-K1+K2-L1+L2-M1+M2-N1+N2)*1e-3;
   
   
%C9m=y(20);
   dy(20) = -J1+J2-2*K1+2*K2 -N1+N2 ;
%C9m_pC9=y(21);
   dy(21) = J1-J2;
%C9starm=y(22);
   dy(22) = -L1+L2-2*M1+2*M2 -N1+N2 ;
%C9starm_pC9=y(23);
   dy(23) = L1-L2;
%C9m_C9starm=y(24);
   dy(24) = N1-N2;   

end






function [P1,P2,P3]=ReactionFlux(S,E,S_E,K,A)
%% Calculate 3 flux for Reaction under 2 modes: 
% S+E <--- Km ---> S*E --kcat--> Scleave + E
% S+E <--k1,k-1--> S*E --kcat--> Scleave + E
%%

if nargin == 4       % Given Km,kcat
        Km = K(1);
      kcat = K(2);
[k1,k2,k3] = GenerateRandom(Km,kcat);

elseif nargin == 5   % Given k1,k-1,kcat
        k1 = A(1);
        k2 = A(2);
        k3 = A(3);
end

P1=k1*S*E;
P2=k2*S_E;
P3=k3*S_E;

end


