function Params = Fresh(Params)

%%  1119
Space2 = 10.^[-1:0.4:5]; % kcat
Space3 = 10.^[0:.3:6]; % km

cv=0.2;
 
Params.tau = Params.tau;

% Params.SR_C3=Cohe(Params.SR_C3,0,Space1);
% Params.SR_C9=Cohe(Params.SR_C9,0,Space1);
% Params.SR_XIAP=Cohe(Params.SR_XIAP,0,Space1);

Params.K_C9C3=Cohe(Params.K_C9C3,cv,Space3);
Params.A_C9C3=Cohe(Params.A_C9C3,cv,Space2); 
[Params.a1,Params.a2,Params.a3] = GenerateKineticsConcents(Params.K_C9C3,     Params.A_C9C3);



Params.K_XIAPC3=Cohe(Params.K_XIAPC3,cv,Space3);
Params.A_XIAPC3=Cohe(Params.A_XIAPC3,cv,Space2);
[Params.c1,Params.c2,Params.c3] = GenerateKineticsConcents(Params.K_XIAPC3,   Params.A_XIAPC3);


Params.d1=Params.d1;
Params.d2=Params.d2;


Params.K_C3C9=Cohe(Params.K_C3C9,cv,Space3);
Params.A_C3C9=Cohe(Params.A_C3C9,cv,Space2);
[Params.e1,Params.e2,Params.e3] = GenerateKineticsConcents(Params.K_C3C9,     Params.A_C3C9);


Params.K_XIAPC9=Cohe(Params.K_XIAPC9,cv,Space3);
Params.A_XIAPC9=Cohe(Params.A_XIAPC9,cv,Space2);
[Params.f1,Params.f2,Params.f3] = GenerateKineticsConcents(Params.K_XIAPC9, 0);



Params.K_C3XIAP=Cohe(Params.K_C3XIAP,cv,Space3);
Params.A_C3XIAP=Cohe(Params.A_C3XIAP,cv,Space2);
[Params.g1,Params.g2,Params.g3] = GenerateKineticsConcents(Params.K_C3XIAP,     Params.A_C3XIAP);

Params.K_C3S=1;
Params.A_C3S=6;
[Params.h1,Params.h2,Params.h3] = GenerateKineticsConcents(Params.K_C3S,     Params.A_C3S);
      
Params.MGreen  = Cohe(Params.MGreen,cv,10.^[-4:1:-1]);
Params.MRed    = Cohe(Params.MRed,cv,10.^[-4:1:-1]);
    
end


function  Value=Cohe(Mean,Variability,Bound)
rng('shuffle')
% normal distribution with Mean=Mean, SD=Mean*Variability

Value=abs(normrnd(Mean,Mean*Variability));

if Value>max(Bound)|Value<min(Bound)
    Value=Bound(unidrnd((sum(size(Bound))-1)));
end

end


function [kon,koff,kcat]=GenerateKineticsConcents(Km,kcat)
%% Given Km,kcat, evalute k1,k-1,kcat 
%  Suppose kcat=k-1*Fold
%  Km=(k-1+kcat)/k1 

Fold_S = [1e-1 1 1e1 0.5e2 1e2 0.5e3 1e3];
Fold = Fold_S(unidrnd(7));

koff = kcat/Fold;
kon  = (koff+kcat)/Km;

if kcat==0
koff=1;
kon=1/Km;
end

end