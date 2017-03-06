function K=Step1_ReactionConstants()
% 


cv=0.00;
pC3=Cohe(130,cv); 
pC9=Cohe(46,cv); 
XIAP=Cohe(335,cv);   %20
tau=Cohe(0.005,cv); 
T2=1;
T3=1;

A_pC3=pC3*tau;

A_C9C3=Cohe(0.4578,cv);  %k9p3=0.2;
K_C9C3=Cohe(192,cv);%  Km9p3=340;
A_C9starC3=A_C9C3*9;     % k9a3=1.8;
K_C9starC3=K_C9C3/5;   %  Km9a3=340;
A_XIAPC3=Cohe(4.7418,cv)/200;   %    kX3=10;  
K_XIAPC3=Cohe(21,cv);   % KmX3=100;
b_C3=tau;

A_pC9=pC9*tau;
A_C9=0.1; 
A_C3C9=Cohe(1.3335,cv); 
K_C3C9=Cohe(5.273,cv); 
A_XIAPC9=Cohe(2.3927,cv); 
K_XIAPC9=Cohe(43.1842,cv);  
b_C9=tau;

A_XIAP=XIAP*tau; 
A_C3XIAP=Cohe(6,cv); 
K_C3XIAP=Cohe(14.2506,cv)*2; 
b_XIAP=tau;

% cv=0;
% pC3=Cohe(277,cv); 
% pC9=Cohe(92,cv); 
% XIAP = Cohe(67*1.3,cv);   %20
% tau=Cohe(0.05,cv);  
% 
% A_pC3=pC3*tau;
% 
% A_C9C3=Cohe(0.4578,cv);  %k9p3=0.2;
% K_C9C3=Cohe(192,cv);%  Km9p3=340;
% A_C9starC3=A_C9C3*9;     % k9a3=1.8;
% K_C9starC3=K_C9C3;   %  Km9a3=340;
% A_XIAPC3=Cohe(4.7418,cv);   %    kX3=10;  
% K_XIAPC3=Cohe(31,cv);   % KmX3=100;
% b_C3=tau;
% 
% A_pC9=pC9*tau;
% A_C9=0.0064; 
% A_C3C9=Cohe(0.2667,cv); 
% K_C3C9=Cohe(0.5273,cv); 
% A_XIAPC9=Cohe(2.3927,cv); 
% K_XIAPC9=Cohe(43.1842,cv);  
% b_C9=tau;
% 
% A_XIAP=XIAP*tau; 
% A_C3XIAP=Cohe(2.8721,cv); 
% K_C3XIAP=Cohe(14.2506,cv); 
% b_XIAP=tau;




%% ----- Step1: Reaction Constants kon koff kcat

%%
SR_C3=A_pC3;
SR_C9=A_pC9;
SR_XIAP=A_XIAP;

%%
[a1,a2,a3]=GenerateRandom(Cohe(K_C9C3,cv),Cohe(A_C9C3,cv)); % pC3--C9-->C3

[b1,b2,b3]=GenerateRandom(Cohe(K_C9starC3,cv),Cohe(A_C9starC3,cv));   % pC3--C9star-->C3

[c1,c2,c3]=GenerateRandom(Cohe(K_XIAPC3,cv),Cohe(A_XIAPC3,cv));   % C3--XIAP-->C3_cleave

d1=A_C9;%*abs(randn(1))*cv;


[e1,e2,e3]=GenerateRandom(Cohe(K_C3C9,cv),Cohe(A_C3C9,cv));  % C9--C3-->C9star
e1=e1;

[f1,f2,f3]=GenerateRandom(Cohe(K_XIAPC9,cv),Cohe(A_XIAPC9,cv));  % C9--XIAP-->C9_cleave


f1=f1;

[g1,g2,g3]=GenerateRandom(Cohe(K_C3XIAP,cv),Cohe(A_C3XIAP,cv)); % XIAP--C3-->XIAP_cleave

[h1,h2,h3]=GenerateRandom(Cohe(10000,cv),Cohe(200,cv)); % Substrate--C3-->Substrate_cleave


%%
K=[a1 a2 a3 b1 b2 b3 c1 c2 c3 d1 e1 e2 e3 f1 f2 f3 g1 g2 g3 h1 h2 h3 SR_C3 SR_C9 SR_XIAP tau 0 1 1];



