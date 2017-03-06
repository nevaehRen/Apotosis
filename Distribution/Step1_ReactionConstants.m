function Params=Step1_ReactionConstants()

%%  1119
% kcat: [1e-3 1e3]   h-1
% kon:  [0.1-10] nM-1h-1
% koff: [1 - 500] h-1

% XIAP:C3:C9=[1:0.1-10:0.1-10]  100nM
% kcat:      [1e-3 1e3]   h-1
% Km:        [1e-1,1e2]   100nM
% koff:kcat: [1e-3 1e-2 1e-1 1 1e1 1e2 1e3] 
% tau: 0.0417   1/24 h-1

% Space1 = [0.1 0.51 0.9 0.8  1 1.5 2 4  10]; 
Space2 = 10.^[-3:0.1:2]; % kcat
Space3 = 10.^[0:.3:5]; % km

%% 
cv=0;
pC3=Cohe(550,0);%
pC9=Cohe(900,0);%
XIAP=Cohe(700,0);%
tau=Cohe(7e-6,cv);%
A_pC3=pC3*tau;%
A_C9C3=Cohe(0.1,cv);%
K_C9C3=Cohe(1e4,cv)*0.7;%
A_C9starC3=A_C9C3*10;%
K_C9starC3=K_C9C3;%
A_XIAPC3=Cohe(1/10,cv);%
K_XIAPC3=Cohe(1e3,cv);%
b_C3=tau;%
A_pC9=pC9*tau;%
A_C9=0.0001;
A_C3C9=Cohe(2.8387,cv)*5;
K_C3C9=Cohe(1e5,cv);
A_XIAPC9=Cohe(0,cv);%
K_XIAPC9=Cohe(1e4,cv);%
b_C9=tau;%
A_XIAP=XIAP*tau;%
A_C3XIAP=Cohe(1/2,cv);
K_C3XIAP=Cohe(1e3,cv);
b_XIAP=tau;%


%% 903
% cv=0;
% pC3=Cohe(120,0);
% pC9=Cohe(30,0);
% XIAP=Cohe(60,0);
% tau=Cohe(1e-4,cv)*60;
% A_pC3=pC3*tau;
% A_C9C3=Cohe(0.45514,cv)*60;
% K_C9C3=Cohe(58.7331,cv);
% A_C9starC3=A_C9C3*15;
% K_C9starC3=K_C9C3/15;
% A_XIAPC3=Cohe(1.1177,cv)/3*60;
% K_XIAPC3=Cohe(4.3037,cv);
% b_C3=tau;
% A_pC9=pC9*tau;
% A_C9=0.1*60;
% A_C3C9=Cohe(2.8387,cv)*60;
% K_C3C9=Cohe(17.4946,cv)*2;
% A_XIAPC9=Cohe(0.52783,cv)*60;
% K_XIAPC9=Cohe(60.1606,cv);
% b_C9=tau;
% A_XIAP=XIAP*tau;
% A_C3XIAP=Cohe(5.6318,cv)*60;
% K_C3XIAP=Cohe(7.8935,cv);
% b_XIAP=tau;


%--% Total Random
% cv=0;
% pC3=Cohe(Space1);
% pC9=Cohe(Space1);
% XIAP=1;
% tau=0.0417;
% A_pC3=pC3*tau;
% A_C9C3=Cohe(Space2);
% K_C9C3=Cohe(Space3);
% A_C9starC3=Space2;
% K_C9starC3=K_C9C3/15;
% A_XIAPC3=Cohe(Space2);
% K_XIAPC3=Cohe(Space3);
% b_C3=tau;
% A_pC9=pC9*tau;
% A_C9=0.1*3600;
% A_C3C9=Cohe(Space2);
% K_C3C9=Cohe(Space3);
% A_XIAPC9=Cohe(Space2);
% K_XIAPC9=Cohe(Space3);
% b_C9=tau;
% A_XIAP=XIAP*tau;
% A_C3XIAP=Cohe(Space2);
% K_C3XIAP=Cohe(Space3);
% b_XIAP=tau;

%% ----- Step1: Reaction Constants kon koff kcat


%%
Params.tau=tau;

Params.SR_C3=A_pC3;
Params.SR_C9=A_pC9;
Params.SR_XIAP=A_XIAP;

Params.K_C9C3=K_C9C3;
Params.A_C9C3=A_C9C3; 
[Params.a1,Params.a2,Params.a3] = GenerateKineticsConcents(Params.K_C9C3,     Params.A_C9C3);

Params.K_C9starC3=K_C9starC3;
Params.A_C9starC3=A_C9starC3;
[Params.b1,Params.b2,Params.b3] = GenerateKineticsConcents(Params.K_C9starC3, Params.A_C9starC3);


Params.K_XIAPC3=K_XIAPC3;
Params.A_XIAPC3=A_XIAPC3;
[Params.c1,Params.c2,Params.c3] = GenerateKineticsConcents(Params.K_XIAPC3,   Params.A_XIAPC3);


Params.d1=A_C9;
Params.d2=1e-6;


Params.K_C3C9=K_C3C9;
Params.A_C3C9=A_C3C9;
[Params.e1,Params.e2,Params.e3] = GenerateKineticsConcents(Params.K_C3C9,     Params.A_C3C9);

Params.K_XIAPC9=K_XIAPC9;
Params.A_XIAPC9=A_XIAPC9;
[Params.f1,Params.f2,Params.f3] = GenerateKineticsConcents(Params.K_XIAPC9, Params.A_XIAPC9);

Params.K_C3XIAP=K_C3XIAP;
Params.A_C3XIAP=A_C3XIAP;
[Params.g1,Params.g2,Params.g3] = GenerateKineticsConcents(Params.K_C3XIAP,     Params.A_C3XIAP);

Params.K_C3S=1e5;
Params.A_C3S=2;
[Params.h1,Params.h2,Params.h3] = GenerateKineticsConcents(Params.K_C3S,     Params.A_C3S);

Params.Type=1;

Params.MGreen=0;
Params.MRed=0;
 
end

% function  Value=Cohe(WaitingList)
% Value=WaitingList(unidrnd((sum(size(WaitingList))-1)));
% end
function  Value=Cohe(Mean,Variability)
% normal distribution with Mean=Mean, SD=Mean*Variability

Value=abs(normrnd(Mean,Mean*Variability));


end

function [kon,koff,kcat]=GenerateKineticsConcents(Km,kcat)
%% Given Km,kcat, evalute k1,k-1,kcat 
%  Suppose kcat=k-1*Fold
%  Km=(k-1+kcat)/k1 

Fold_S = [1e-3 0.5e-2 1e-2 0.5e-1 1e-1 0.5 1 5 1e1 0.5e2 1e2 0.5e3 1e3];
Fold = Fold_S(unidrnd(13));

koff = kcat/Fold;
kon  = (koff+kcat)/Km;

if kcat==0
koff=1e-2;
kon=1/Km;
end

end

