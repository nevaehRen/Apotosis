function Step3_Phaseplot(ApotosisFull)


n=sum(size(ApotosisFull))-1;

% figure(3)
set(gcf,'Position',[10  6  710 800], 'color',[1 1 1]);



if ApotosisFull.K(28)<1
Colors=summer(1);
elseif ApotosisFull.K(29)<1
Colors=autumn(1);%
else
Colors=[0 0 0];
end
%%

%%
for i=1:n
    
Apotosis=ApotosisFull(i);

Time=Apotosis.time;


% subplot(7,1,1)
hold on
plot3(Apotosis.XIAP,Apotosis.C3,Apotosis.C9,'Linewidth',2,'Color',Colors);
plot3(Apotosis.XIAP(end),Apotosis.C3(end),Apotosis.C9(end),'o','Color',Colors);

xlabel('XIAP');
ylabel('C3');
zlabel('C9');


set(gca,'xscale','log');
set(gca,'yscale','log');




end


