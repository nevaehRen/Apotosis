 function [Apotosis,Apotosis_Green,Apotosis_Red,Value]=Step2_DoitSame(Params,n,Inducer)                

 %% Generate Reaction Constants for Mutation 2,3
          Params_Green = Params;
       Params_Green.f1 = Params_Green.f1*Params.MGreen;
     Params_Green.Type = 2;
 
            Params_Red = Params;
         Params_Red.e1 = Params_Red.e1*Params.MRed;
       Params_Red.Type = 3;
       
%% Genenrate Random Space pC3,pC9,XIAP space
if n==1
   InitialSpace = [Params.SR_C3,Params.SR_C9,Params.SR_XIAP]/Params.tau;
else
   InitialSpace = RandSpace(Params.SR_C3/Params.tau,Params.SR_C9/Params.tau,Params.SR_XIAP/Params.tau,n);
end

%% Calculate 3 Tables

 Inducers_T1=Inducer.T1;
 Inducers_T2=Inducer.T2;
 Inducers_T3=Inducer.T3;

[Apotosis,       Table] =  TC(Inducers_T1,InitialSpace,Params,n);
[Apotosis_Green, Table_Green] = TC(Inducers_T2,InitialSpace,Params_Green,n);
[Apotosis_Red,   Table_Red] =  TC(Inducers_T3,InitialSpace,Params_Red,n);

%% Calculate score
Value=Step3_Score(Table,Table_Green,Table_Red);


end
 
 function Value=Step3_Score(TableC_T1,TableC_T2,TableC_T3)
load DeathDistribution.mat


Predict = [TableC_T1;TableC_T2;TableC_T3];
I = ismember(Predict(:,1),[0.01 0.25 2.50 25.00]);
Predict   = Predict(I,:);
Value.Predict = Predict;
Predict = Predict(:);

I = ismember(Table_T1(:,1),TableC_T1(:,1));
Table_T1    = Table_T1(I,:);
I = ismember(Table_T2(:,1),TableC_T2(:,1));
Table_T2    = Table_T2(I,:);
I = ismember(Table_T3(:,1),TableC_T3(:,1));
Table_T3    = Table_T3(I,:);

True    = [Table_T1; Table_T2; Table_T3];
Value.Real    = True;
True    = True(:);

Value.Score = (Predict'*True)/(Predict'*Predict)/(True'*True);


 end
 

function [Apotosis, Table]=TC(Inducers,InitialSpace,Params,n) 
    %--% Input:  Initial Condition:inducer, InitialSpace:random space of pC3 pC9 XIAP, Reaction Constants:Params
    %--% Output: Apotosis:trace   Table:death distribution
    if isempty(Inducers) 
        Apotosis=[];
        Table=[125 0 0 0 1];
    else

        Table=[];

        for i=1:sum(size(Inducers))-1
            Temp=[];
            Params.Inducer=Inducers(i);
        for j=1:n
            Params_Space(j) = Params;
            
        end

            parfor j=1:n

            %% Change pC9,pC3,XIAP initial concentration 
                          INIt = zeros(1,24);
                          INIt(16) = 2000; 
                          INIt(19) = Params.Inducer; 
                     INIt([1,11,7]) = InitialSpace(j,1:3);

            %% Calculate every mutation's trace
                        Apotosis(i,j) = Step2_Experiment(INIt,Params);
                        Temp=[Temp;Apotosis(i,j).Deathtime];
            end

        %%%%%%%%%%

            [N,~]=hist(Temp,0:1000:3000);
            DeathTimeDistribution=[Apotosis(i,j).Params.Inducer; N'/sum(N) ]';

            Table=[Table;DeathTimeDistribution];
        end
    end
end

    
function Apotosis=Step2_Experiment(INIt,Params)
    %%Input:  Initial Condition:INIt,  Reaction Constants:Params
    %%Output: Apotosis struct contain everything
    
    t=2000;
    [Time,sol] = ode15s('aptosis',[0:1:t],INIt, [], Params);
    %%  
    Apotosis.Params = Params;  
    Apotosis.time=Time;
    Apotosis.pC3=sol(:,1);
    Apotosis.C3=sol(:,5);
    Apotosis.pC9=sol(:,11);
    Apotosis.C9=sol(:,4);
    Apotosis.C9star=sol(:,6);
    Apotosis.XIAP=sol(:,7);
    sol(:,18)=sol(:,18)/INIt(16);
    Apotosis.FRET=sol(:,18);
    Apotosis.Y=sol;
    
%^%---- FRET defined DeathTime
%     if  Apotosis.FRET(end)<0.9
%         Apotosis.Deathtime=3000;
%     else
%         [Y I]=min(abs(Apotosis.FRET-0.5));
%         Apotosis.Deathtime=Apotosis.time(I);
%      end

%^%---- C3   defined DeathTime
   if Apotosis.C3<100
        Apotosis.Deathtime=3000;
   else
        [Y I]=min(abs(Apotosis.C3-100));
        Apotosis.Deathtime=Apotosis.time(I);
    end

    
end



function r=RandSpace(pC3,pC9,XIAP,n)

% pC3=115;
% pC9=53.5427;
% XIAP=85.5746;

      R = 0.6;

%  pC3var = (2*pC3)^2;
%  pC9var = (3*pC9)^2;
% XIAPvar = (2*XIAP)^2;

 pC3var = (0.7*pC3)^2;
 pC9var = (0.7*pC9)^2;
XIAPvar = (0.7*XIAP)^2;

   mu = [pC3, pC9, XIAP];
sigma = [      pC3var          ,           0            , R*sqrt(pC3var*XIAPvar)
                    0          ,        pC9var          , 0
         R*sqrt(pC3var*XIAPvar),           0            ,      XIAPvar        ];
     
rng default  % For reproducibility
%rng('shuffle');  %randomrize the seed of random number generator


r = abs(mvnrnd(mu,sigma,n));

disp('Death Ratio:')
disp(sum(r(:,1)>r(:,3)/5)/sum(r(:,1)>0))

% figure(1111)
% hold on
% plot3(r(:,1),r(:,2),r(:,3),'Marker','.','Color',rand(1,3),'Linestyle','none')
% 
% figure
% hist(log(r(:,1)))

end

% function r=RandSpace(pC3,pC9,XIAP,n)
% 
% % pC3=115;
% % pC9=53.5427;
% % XIAP=85.5746;
% 
%       R = 0.6;
% 
%  pC3var = (0.8573*pC3)^2;
%  pC9var = (0.8573*pC9)^2;
% XIAPvar = (0.8573*XIAP)^2;
% 
%  pC3var = (0.5*pC3)^2;
%  pC9var = (0.5*pC9)^2;
% XIAPvar = (0.5*XIAP)^2;
% 
% 
%    mu = [pC3, pC9, XIAP];
% sigma = [      pC3var          ,  R*sqrt(pC3var*pC9var) , R*sqrt(pC3var*XIAPvar)
%          R*sqrt(pC3var*pC9var) ,        pC9var          , R*sqrt(pC9var*XIAPvar)
%          R*sqrt(pC3var*XIAPvar),  R*sqrt(pC9var*XIAPvar),      XIAPvar        ];
%      
% rng default  % For reproducibility
% %rng('shuffle');  %randomrize the seed of random number generator
% 
% 
% r = abs(mvnrnd(mu,sigma,n));
% 
% % figure(1111)
% % hold on
% % plot3(r(:,1),r(:,2),r(:,3),'Marker','.','Color',rand(1,3),'Linestyle','none')
% 
% 
% 
% end
% 
% 

