function Step3_ShowUs(ApotosisFull)


n=sum(size(ApotosisFull))-1;

% figure(3)
set(gcf,'Position',[10  6  710 800], 'color',[1 1 1]);

%%
if ApotosisFull(1).Params.Type==2
Colors=summer(1);
elseif ApotosisFull(1).Params.Type==3
Colors=autumn(1);%
else
Colors=[0 0 0];
end
%%


%%
for i=1:n
    
Apotosis=ApotosisFull(i);

Time=Apotosis.time;


subplot(7,1,1)
hold on
plot(Time,Apotosis.pC9,'Color',Colors,'Linewidth',2);
xlabel('t(min)');
ylabel('pC9');


subplot(7,1,2)
hold on
plot(Time,Apotosis.C9,'Color',Colors,'Linewidth',2);
xlabel('t(min)');
ylabel('C9');


subplot(7,1,3)
hold on
plot(Time,Apotosis.C9star,'Color',Colors,'Linewidth',2);
xlabel('t(min)');
ylabel('C9star');


subplot(7,1,4)
hold on
plot(Time,Apotosis.pC3,'Color',Colors,'Linewidth',2);
xlabel('t(min)');
ylabel('PC3');


subplot(7,1,5)
hold on
plot(Time,Apotosis.C3,'Color',Colors,'Linewidth',2);
xlabel('t(min)');
ylabel('C3');


subplot(7,1,6)
hold on
plot(Time,Apotosis.XIAP,'Color',Colors,'Linewidth',2);
xlabel('t(min)');
ylabel('XIAP');



subplot(7,1,7)
hold on
plot(Time,Apotosis.FRET,'Color',Colors,'Linewidth',2);
set(gca,'ylim',[0 1.1]);
xlabel('t(min)');
ylabel('FRET');

end


