function [kon,koff,kcat]=GenerateRandom(Km,kcat)
% suppose a3=a2*Fold
% Km=(a2+a3)/a1 

if kcat~=0
    
Fold=unidrnd(1000)+1;

if unidrnd(2)==1
  Fold=1/Fold;
end

koff=kcat/Fold;
kon=(koff+kcat)/Km;

else
    
koff=1;
kon=1/Km;
end



% 
% 
%  function K=GenerateRandom_synthesis(Km,kcat)
% -%- suppose a3=a2*Fold
% -%- Km=(a2+a3)/a1 
% 
% Fold=unidrnd(10);
% 
% koff=kcat/Fold;
% kon=(koff+kcat)/Km;
% 
% K=[kon,koff,kcat];

