clc;
clearvars -EXCEPT Params aaa
 
%% -- Step1: Initaliaiton as inducer=0 stable solution.

InducerSingle = 25e-2;

Params=Step1_ReactionConstants();

Inducer.T1 = InducerSingle;
Inducer.T2 = InducerSingle;
Inducer.T3 = InducerSingle;
n=1;


tic;
[Apotosis,Apotosis_Green,Apotosis_Red,Score]=Step2_DoitSame(Params,n,Inducer);
toc;
 
 
 %% -- Step3: Plot Trace
close all;
  figure(4)
  ShowUsDetail(Apotosis)
 ShowUsDetail(Apotosis_Green)
   ShowUsDetail(Apotosis_Red)
  
%    
%    for k=unidrnd(n)
% close all;
% figure(5)
%    ShowUsDetail(Apotosis(k))
%    ShowUsDetail(Apotosis_Green(k))
%    ShowUsDetail(Apotosis_Red(k))
%    end
%    
   
   
%     figure
%     ShowUsDetail_5(Apotosis)
%     ShowUsDetail_5(Apotosis_Green)
%  ShowUsDetail_5(Apotosis_Red)
%   

%   figure(9)
%    Step3_Phaseplot(Apotosis)
%    Step3_Phaseplot(Apotosis_Green)
%    Step3_Phaseplot(Apotosis_Red)

   
%    figure(15)
%  hold on
%   Step3_ShowUs1(Apotosis);
% %  Step3_ShowUs1(Apotosis_Green);
%     Step3_ShowUs1(Apotosis_Red);
% %  

  