function ShowUsDetail(Apotosis)
% plot Y according Time

Time=Apotosis.time;
Y=Apotosis.Y;

if Apotosis(1).Params.Type==2
Colors=summer(1);
elseif Apotosis(1).Params.Type==3
Colors=autumn(1);%
else
Colors=[0 0 0];
end
%%



set(gcf,'Position',[10  6  900 800], 'color',[1 1 1]);

subplot(4,3,1)
hold on
plot(Time,Y(:,1),'Color',Colors,'Linewidth',2);
plot(Time,Y(:,2),'Color',Colors,'Linewidth',2,'Linestyle',':');
plot(Time,Y(:,3),'Color',Colors,'Linewidth',2,'Linestyle','-.');

xlabel('t(min)');
legend('pC3','pC3*C9','pC3*C9star');
ylim([0; Inf]);


subplot(4,3,4)
hold on
plot(Time,Y(:,5),'Color',Colors,'Linewidth',2);
plot(Time,Y(:,8),'Color',Colors,'Linewidth',2,'Linestyle',':');
plot(Time,Y(:,9),'Color',Colors,'Linewidth',2,'Linestyle','--');
plot(Time,Y(:,12),'Color',Colors,'Linewidth',2,'Linestyle','-.');

xlabel('t(min)');
legend('C3','C3*XIAP','XIAP*C3','C3*C9');
ylim([0; Inf]);


subplot(4,3,7)
hold on
plot(Time,Y(:,10),'Color',Colors,'Linewidth',2);

xlabel('t(min)');
legend('C3*Cleave ');
ylim([0; Inf]);

subplot(4,3,10)
hold on
plot(Time,Y(:,19),'Color',Colors,'Linewidth',2,'Linestyle','--');

xlabel('t(min)');
legend('Inducer');
ylim([0; Inf]);




subplot(4,3,2)
hold on
plot(Time,Y(:,11),'Color',Colors,'Linewidth',2);

xlabel('t(min)');
legend('pC9');
ylim([0; Inf]);

subplot(4,3,5)
hold on
plot(Time,Y(:,4),'Color',Colors,'Linewidth',2);
plot(Time,Y(:,12),'Color',Colors,'Linewidth',2,'Linestyle','-.');
plot(Time,Y(:,13),'Color',Colors,'Linewidth',2,'Linestyle',':');

xlabel('t(min)');
legend('C9','C9*C3','C9*XIAP');
ylim([0; Inf]);

subplot(4,3,8)
hold on
plot(Time,Y(:,6),'Color',Colors,'Linewidth',2);
plot(Time,Y(:,3),'Color',Colors,'Linewidth',2,'Linestyle',':');

xlabel('t(min)');
legend('C9star','C9star*pC3');
ylim([0; Inf]);

subplot(4,3,11)
hold on
plot(Time,Y(:,14),'Color',Colors,'Linewidth',2);

xlabel('t(min)');
legend('C9cleave');
ylim([0; Inf]);


subplot(4,3,11)
hold on
plot(Time,Y(:,14),'Color',Colors,'Linewidth',2);

xlabel('t(min)');
legend('C9cleave');
ylim([0; Inf]);


subplot(4,3,3)
hold on
plot(Time,Y(:,7),'Color',Colors,'Linewidth',2);

xlabel('t(min)');
legend('XIAP');
ylim([0; Inf]);


subplot(4,3,6)
hold on
plot(Time,Y(:,8),'Color',Colors,'Linewidth',2);
plot(Time,Y(:,13),'Color',Colors,'Linewidth',2,'Linestyle',':');
plot(Time,Y(:,9),'Color',Colors,'Linewidth',2,'Linestyle','-.');

xlabel('t(min)');
legend('C3*XIAP','C9*XIAP','XIAP*C3(kill)');
ylim([0; Inf]);



subplot(4,3,9)
hold on
plot(Time,Y(:,15),'Color',Colors,'Linewidth',2);

xlabel('t(min)');
legend('XIAPCleave');
ylim([0; Inf]);


subplot(4,3,12)
hold on
plot(Time,Y(:,18),'Color',Colors,'Linewidth',2);
% plot(Time,Apotosis.FRET,'Color',Colors,'Linewidth',2);
set(gca,'ylim',[0,1.1])

xlabel('t(min)');
legend('FRET');




%set(present,'ylim',[0,1.1])



