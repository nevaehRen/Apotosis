function [Distribtuion,DeathRate]=Step3_DeathDistrubution(Apotosis)


n=sum(size(Apotosis))-1;
Time=Apotosis(1).time(end);
Momp=[];

for i=1:n
Momp=[Momp;Apotosis(i).Deathtime];
end

DeathRate=sum(Momp<Time*0.9)/sum(Momp>0);


[N,X]=hist(Momp,0:1000:3000);

sum(Momp<500)/n

Distribtuion=100*N/sum(N)*DeathRate;