function [C3 S]=FRET2C3(FRET)

k_cleave=1;

% FRET 
% dF is dFRET/dt
%

dF=abs(FRET(2:end)-FRET(1:(end-1)));

n=sum(size(dF));

C3=zeros(n,1);


S=max(FRET)-FRET;

for i=n:-1:2;
 

if S(i)~=0
C3(i)=dF(i-1)/(k_cleave*S(i));
end

end




