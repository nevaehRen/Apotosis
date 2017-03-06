function [C3 S]=FRET2C3_Limitation(FRET)
kcat=300;  % kcat=9/s  540/min
Km=120;   % Km=4.68uM  4680nM

% FRET 
% dF is dFRET/dt
%

if (mean(FRET(2:end)-FRET(1:(end-1))))>0
F=max(FRET)-FRET;
else
    F=FRET;
end

dF=[0 abs(FRET(2:end)-FRET(1:(end-1)))];


C3=Km*dF./(kcat*F-dF);


S=dF./(C3/Km);




