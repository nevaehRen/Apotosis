clc;
clearvars -EXCEPT Params aaa
%  
% if(~matlabpool('size'))
% matlabpool
% end

ConcentrationRange=[0.010;0.25;2.5;25];
 ConcentrationRange=[25;];

%%
aaa=1;

Params=Step1_ReactionConstants();

for s=1:sum(size(ConcentrationRange))-1;
    
 InducerSingle=ConcentrationRange(s);
%%% -- Step1: Initaliaiton as inducer=0 stable solution.
n=100;
Inducer.T1 = InducerSingle;
Inducer.T2 = InducerSingle;
Inducer.T3 = InducerSingle;

tic;
[Apotosis,Apotosis_Green,Apotosis_Red,Score]=Step2_DoitSame(Params,n,Inducer);
toc;
 
%% -- Step3: Plot Distribution
    figure(5)
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

 
PicName=strcat('group',num2str(aaa),' Inducer-',num2str(InducerSingle),'.png');
suptitle(PicName);
px=getframe(gcf);
imwrite(px.cdata,PicName);
%close;
  
eval(strcat('save(''' ,PicName,'.mat'')'))
 
 
end
 


if(matlabpool('size') )
matlabpool close
end







