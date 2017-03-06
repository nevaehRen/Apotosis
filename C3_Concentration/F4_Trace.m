
clc;
clear;
Experiment=('T1_25.0_Death1.mat');

load(Experiment)

%%% --- step1: find all trace
Name=who;
k=sum(size(Name))-1;

%%% --- step2: Time Resolution
Timing=[];
dt=.1;
Window_Left=50;

%%% --- step2: specify color
if   strcmp(Experiment(end-6:end-4),'Sur')
Colors=[0 0 1];
elseif  str2num(Experiment(2))==1
 Colors=[0 0 0];
 Colors_small=[200 197 197]/255;
elseif str2num(Experiment(2))==2
 Colors=[0 0.6 0];
 Colors_small=[189 251 205]/255;
else
 Colors=[0.9 0 0];
 Colors_small=[251 193 189]/255;
end


%%% --- step3: specify time
eval(strcat('Time=',cell2mat(Name(2)),';'))  % Read Patient Data
Recording=[];
RecordingS=[];

for i=[3:k]  %20 23??

%%% --- step4: delte Nan in FRET and Time
eval(strcat('FRET=',cell2mat(Name(i)),';'))  

            %%% ---  Cell to number variable type
if isa(FRET,'cell') 
FRET=str2num(char(FRET));
end
            %%% ---  delete all NaN in FRET data
TimeTemp=Time;
TimeTemp(isnan(FRET))=[];

FRET(isnan(FRET))=[];
            %%% ---  intervalue according to given time resolution
FRET_old=FRET;
FRET = interp1(TimeTemp,FRET,TimeTemp(1):dt:TimeTemp(end),'spline'); 



%%% --- step5.1: 1/2 max F
            %%% ---  dF maximal as Zero (FRET<1.3 or decrease has been excluded)

FRETMid=(max(FRET)-min(FRET))/2+min(FRET);

[Y I]=min(abs(FRET-FRETMid));



%%% --- step5.2: redefine max dF as 6, shrink window to max-5??max+5
            %%% ---  dF maximal as Zero (FRET<1.3 or decrease has been excluded)

% dF=abs([0;(FRET(2:end)-FRET(1:end-1))']);
% [MM I_FRET]=max(FRET);
% 
% dF(FRET<1.3)=0;
% dF(FRET>1.8)=0;
% dF(I_FRET:end)=0;
% 
% [Y I]=max(dF);



% 
%%% ---  Time Window = [-20min, 25min] ,Dead Cell(FRET>1.5)
if  I>Window_Left/dt&sum(size(FRET))>(I+25/dt+1)&(FRET(end))>1.5

Index=(I-Window_Left/dt):(I+25/dt);

Timenew=TimeTemp(1):dt:TimeTemp(end);

%end

if Timenew(I)<170

% figure(10)
% set(gcf,'Color',[1 1 1])
% set(gca,'Fontsize',12,'FontName','Comic Sans MS')
% hold on
% plot(Timenew,FRET,'Color',Colors_small)
% plot(Timenew(I),FRET(I),'r.')
% Timing=[Timing;Timenew(I)];
% 
% ylabel('FRET')
% 
% 

[C3 S]=FRET2C3_Re(FRET(Index));
timee=dt*(Index-I);
Recording=[C3';Recording];
RecordingS=[S;RecordingS];


figure(9)
set(gcf,'Color',[1 1 1])
set(gca,'Fontsize',12,'FontName','Comic Sans MS')
hold on
plot(dt*(Index-I),C3./0.015,'Color',Colors_small)
ylabel('C3')


end

end

end


figure(9)
set(gcf,'Color',[1 1 1])
set(gca,'Fontsize',12,'FontName','Comic Sans MS')
hold on
plot(timee,mean(Recording./0.015),'Color',Colors,'Linewidth',4)
set(gca,'ylim',[0 1.42])
set(gca,'xlim',[-50 10])
xlabel('Time ( min )')
ylabel('C3 Concentration')




