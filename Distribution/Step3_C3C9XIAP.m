function [f1,h]=Step3_C3C9XIAP(Apotosis,Type)

%%

if Apotosis(1).K(28)<1
Colors=summer(6);
elseif Apotosis(1).K(29)<1
Colors=autumn(6);%
else
Colors=bone(6);
end
%%

Recording=[];

n=sum(size(Apotosis))-1;

 for i=1:n
     Recording=[Recording;Apotosis(i).K(23),Apotosis(i).K(24),Apotosis(i).K(25),Apotosis(i).Deathtime];
 end

pC3=Recording(:,1);
pC9=Recording(:,2);
XIAP=Recording(:,3);
Time=Recording(:,4);

I=Time>600&Time<1400;

if sum(I)<3
  I=Time>300&Time<1400;
end

X=log(pC3(I));
Y=log(pC9(I));
Z=log(XIAP(I));

figure(12)
 hist(Time);

figure(10)
BGD;

 scatter3(Recording(:,1),Recording(:,2),Recording(:,3),20,Recording(:,4),'filled')
xlabel('pC3')
ylabel('pC9')
zlabel('XIAP')

set(gca,'xscale','log');
set(gca,'yscale','log');
set(gca,'zscale','log');
grid off;
colorbar;




 
g = fittype( @(a,b,c,x,y) a*x+b*y+c,'independent', {'x', 'y'}, 'dependent', 'z' );
f1 = fit( [X, Y],Z, g);
 

xx=linspace(min(log(pC3)),max(log(pC3)),100);
yy=linspace(min(log(pC9)),max(log(pC9)),100);
[x,y]=meshgrid(xx,yy);
z=f1.a*x+f1.b*y+f1.c;
hold on
mesh(exp(x),exp(y),exp(z))


figure(11)
HBGD;
hold on
h=quiver3(0,0,0,f1.a,f1.b,-1/f1.c,'color',Colors(6-Type,:),'Linewidth',3);
adjust_quiver_arrowhead_size(h, 0.3);
xlabel('a')
ylabel('b')
zlabel('c')










