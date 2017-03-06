function [Momp,DeathRate]=Step3_DeathDistrubutionPlot(Apotosis)

%%
if Apotosis(1).Params.Type==2
Colors=summer(1);
elseif Apotosis(1).Params.Type==3
Colors=autumn(1);%
else
Colors=[0 0 0];
end
%%


n=sum(size(Apotosis))-1;
Time=Apotosis(1).time(end);
Momp=[];

for i=1:n
Momp=[Momp;Apotosis(i).Deathtime];
end

DeathRate=sum(Momp<Time*0.9)/sum(Momp>0);


BGD;

[N,X]=hist(Momp,-50:100:Time,'Color',Colors);
hold on
bar(X,100*N/sum(N),'EdgeColor',Colors,'FaceColor',Colors)
set(gca,'xlim',[0,Time*1.1])

ylabel('Percentage %')

title(strcat('DeathRate:',num2str(DeathRate*100),'%'));


