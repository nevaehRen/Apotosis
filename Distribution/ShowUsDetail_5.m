function ShowUsDetail_5(Apotosis)
% plot Y according Time

Time=Apotosis.time;
Y=Apotosis.Y;

if Apotosis.K(28)<1
Colors=summer(1);
elseif Apotosis.K(29)<1
Colors=autumn(1);%
else
Colors=[0 0 0];
end
%%



set(gcf,'Position',[10  6  900 800], 'color',[1 1 1]);

subplot(1,2,1)

hold on
plot(Time,Y(:,4),'Color',Colors,'Linewidth',2);
plot(Time,Y(:,12),'Color',Colors,'Linewidth',2,'Linestyle','-.');
plot(Time,Y(:,13),'Color',Colors,'Linewidth',2,'Linestyle',':');
plot(Time,Apotosis.XIAP,'Color','m','Linewidth',2,'Linestyle',':');


xlabel('t(min)');
legend('C9','C9*C3','C9*XIAP','XIAP');





subplot(1,2,2)
hold on
plot(Time,Y(:,8),'Color',Colors,'Linewidth',2);
plot(Time,Y(:,13),'Color',Colors,'Linewidth',2,'Linestyle',':');
plot(Time,Y(:,9),'Color',Colors,'Linewidth',2,'Linestyle','-.');

xlabel('t(min)');
legend('C3*XIAP','C9*XIAP','XIAP*C3(kill)');



%set(present,'ylim',[0,1.1])



