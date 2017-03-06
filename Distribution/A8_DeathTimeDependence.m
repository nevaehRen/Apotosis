clc;
clearvars -EXCEPT K aaa
 
% -- Step1: Initaliaiton as inducer=0 stable solution.
t=2000;
n=1;
Record=[];
K=Step1_ReactionConstants();

Inducer=[0.0025:0.0001:0.025 0.026:0.001:0.25 0.25:0.01:6 6:1:25];%0.025*(1:1000);

for j=Inducer


% tic;
[Apotosis,Apotosis_Green,Apotosis_Red]=Step2_DoitSame(j,t,n,K);
% toc;
 
Record=[Record;j Apotosis.Deathtime Apotosis_Green.Deathtime Apotosis_Red.Deathtime];



end




  figure(4)
  BGD;
  plot(Record(:,1),Record(:,2),'k','Linewidth',2,'marker','+')
  hold on
  plot(Record(:,1),Record(:,3),'color',[0 0.5 0],'Linewidth',2,'marker','+')
  plot(Record(:,1),Record(:,4),'r','Linewidth',2,'marker','+')

  
  xlabel('Inducer')
  ylabel('Deathtime')
  
  

  
  
  %% pC3
  
  clc;
clearvars -EXCEPT K aaa
 
% -- Step1: Initaliaiton as inducer=0 stable solution.
t=2000;
n=1;
Record=[];

pC3=[0.01:0.01:1 1:0.1:5 6:100];
for j=pC3

K=Step1_ReactionConstants();
K(end-6)=K(end-6)*j;
    
Inducer=25;
% tic;
[Apotosis,Apotosis_Green,Apotosis_Red]=Step2_DoitSame(Inducer,t,n,K);
% toc;
 
Record=[Record;Inducer Apotosis.Deathtime Apotosis_Green.Deathtime Apotosis_Red.Deathtime];



end

  figure(3)
  BGD;
  plot(pC3,Record(:,2),'k','Linewidth',2,'marker','+')
  hold on
  plot(pC3,Record(:,3),'color',[0 0.5 0],'Linewidth',2,'marker','+')
  plot(pC3,Record(:,4),'r','Linewidth',2,'marker','+')

  set(gca,'xscale','log')
  
  xlabel('pC3')
  ylabel('Deathtime')
%%


%%







 
  %% pC9
  
  clc;
clearvars -EXCEPT K aaa
 
% -- Step1: Initaliaiton as inducer=0 stable solution.
t=2000;
n=1;
Record=[];

pC9=[0.01:0.01:1 1:0.1:5 6:100];
for j=pC9

K=Step1_ReactionConstants();
K(end-5)=K(end-5)*j;
    
Inducer=25;
% tic;
[Apotosis,Apotosis_Green,Apotosis_Red]=Step2_DoitSame(Inducer,t,n,K);
% toc;
 
Record=[Record;Inducer Apotosis.Deathtime Apotosis_Green.Deathtime Apotosis_Red.Deathtime];



end

  figure(2)
  BGD;
  plot(pC9,Record(:,2),'k','Linewidth',2,'marker','+')
  hold on
  plot(pC9,Record(:,3),'color',[0 0.5 0],'Linewidth',2,'marker','+')
  plot(pC9,Record(:,4),'r','Linewidth',2,'marker','+')

  set(gca,'xscale','log')
  
  xlabel('pC9')
  ylabel('Deathtime')
  
  
  
  
  
  
  %% XIAP
  
  clc;
clearvars -EXCEPT K aaa
 
% -- Step1: Initaliaiton as inducer=0 stable solution.
t=2000;
n=1;
Record=[];

XIAP=[0.01:0.01:1 1:0.1:5 6:100];
for j=XIAP

K=Step1_ReactionConstants();
K(end-4)=K(end-4)*j;
    
Inducer=25;
% tic;
[Apotosis,Apotosis_Green,Apotosis_Red]=Step2_DoitSame(Inducer,t,n,K);
% toc;
 
Record=[Record;Inducer Apotosis.Deathtime Apotosis_Green.Deathtime Apotosis_Red.Deathtime];



end

  figure(1)
  BGD;
  plot(XIAP,Record(:,2),'k','Linewidth',2,'marker','+')
  hold on
  plot(XIAP,Record(:,3),'color',[0 0.5 0],'Linewidth',2,'marker','+')
  plot(XIAP,Record(:,4),'r','Linewidth',2,'marker','+')

  set(gca,'xscale','log')
  
  xlabel('XIAP')
  ylabel('Deathtime')
  