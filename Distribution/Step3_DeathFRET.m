function Step3_DeathFRET(Apotosis,Type)

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

hold on
for i=1:n
   plot(Apotosis(i).time,Apotosis(i).FRET,'Color',Colors)
end
ylabel('FRET')
set(gca,'ylim',[0 1.1]);




