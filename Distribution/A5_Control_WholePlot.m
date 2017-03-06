clc;
clearvars -EXCEPT Params aaa

% if(~matlabpool('size'))
% matlabpool
% end

ConcentrationRange=[0.05;0.25;2.5;25];
columns=sum(size(ConcentrationRange))-1;
  
Params=Step1_ReactionConstants();

for num=1
    
%%% -- Step1: Calculate traces.
n=100;
Inducer.T1 = ConcentrationRange;
Inducer.T2 = ConcentrationRange;
Inducer.T3 = ConcentrationRange;

tic;
[Apotosis,Apotosis_Green,Apotosis_Red,Score]=Step2_DoitSame(Params,n,Inducer);
toc;

%%% -- Step2: Plot them.
    figure
    set(gcf,'Position',[10  6 1500 1000], 'color',[1 1 1]);
    load DeathDistribution.mat
for m=1:sum(size(Inducer.T1))-1
subplot(3,4,m);
[Momp,DeathRate]=Step3_DeathDistrubutionPlot(Apotosis(m,:));
set(gca,'ylim',[0 1-Table_T1(m,5)]*100)
end

for m=1:sum(size(Inducer.T2))-1
subplot(3,4,m+4);
[Momp_Green,DeathRate_Green]=Step3_DeathDistrubutionPlot(Apotosis_Green(m,:));
set(gca,'ylim',[0 1-Table_T2(m,5)]*100)
end

for m=1:sum(size(Inducer.T3))-1
subplot(3,4,m+8);
[Momp_Red,DeathRate_Red]=Step3_DeathDistrubutionPlot(Apotosis_Red(m,:));
set(gca,'ylim',[0 1-Table_T3(m,5)]*100)
 end

%%% -- Step3: save them.

PicName=strcat('group',num2str(i),'.png');
suptitle(PicName);
px=getframe(gcf);
imwrite(px.cdata,PicName);
% close;

end


% if(matlabpool('size') )
% matlabpool close
% end