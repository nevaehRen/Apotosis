function Batch_Ploting(K,aaa)
clc;
clearvars -EXCEPT K aaa
 
ConcentrationRange=[2.5e-3,2.5e-2,0.25,2.5,25];



for Inducer=ConcentrationRange;
    
 
% %% -- Step1: Initaliaiton as inducer=0 stable solution.
t=2000;
n=10;

 tic;
[Apotosis,Apotosis_Green,Apotosis_Red]=Step2_DoitSame(Inducer,t,n,K);
 toc;
 
%% -- Step3: Plot Distribution
    figure(1)
set(gcf,'Position',[10  6 1300 900], 'color',[1 1 1]);
    subplot(3,3,1)
[Momp,DeathRate]=Step3_DeathDistrubutionPlot(Apotosis);
    subplot(3,3,4)
BGD;
Step3_DeathC3(Apotosis);
    subplot(3,3,7)
BGD;
Step3_DeathFRET(Apotosis);
    subplot(3,3,2)
[Momp,DeathRate]=Step3_DeathDistrubutionPlot(Apotosis_Green);
    subplot(3,3,5)
BGD;
Step3_DeathC3(Apotosis_Green);
    subplot(3,3,8)
BGD;
Step3_DeathFRET(Apotosis_Green);
    subplot(3,3,3)
[Momp,DeathRate]=Step3_DeathDistrubutionPlot(Apotosis_Red);
    subplot(3,3,6)
BGD;
Step3_DeathC3(Apotosis_Red);
    subplot(3,3,9)
BGD;
Step3_DeathFRET(Apotosis_Red);

 
PicName=strcat('group',num2str(aaa),' Inducer-',num2str(Inducer),'.png');
suptitle(PicName);
px=getframe(gcf);
imwrite(px.cdata,PicName);
close;
%  
eval(strcat('save(''' ,PicName,'.mat'')'))
 
 
end
 
 
 

