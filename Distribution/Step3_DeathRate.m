function [Momp,DeathRate]=Step3_DeathRate(Apotosis)

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


% figure
BGD;

subplot(3,1,1)
[N,X]=hist(Momp,0:50:Time,'Color',Colors);
hold on
bar(X,100*N/sum(N),'EdgeColor',Colors,'FaceColor',Colors)
set(gca,'xlim',[0,Time*1.1])
%xlabel('Death Time')
ylabel('Percentage %')

title(strcat('DeathRate:',num2str(DeathRate*100),'%'));



subplot(3,1,2)

hold on
for i=1:n
   plot(Apotosis(i).time,Apotosis(i).C3,'Color',Colors)
end

ylabel('C3')


subplot(3,1,3)
hold on
for i=1:n
   plot(Apotosis(i).time,Apotosis(i).FRET,'Color',Colors)
end
ylabel('FRET')




