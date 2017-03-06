function Transform(K)
% 



%%
a1=K(1);
a2=K(2);
a3=K(3);

b1=K(4);
b2=K(5);
b3=K(6);

c1=K(7);
c2=K(8);
c3=K(9);

d1=K(10);

e1=K(11);
e2=K(12);
e3=K(13);

f1=K(14);
f2=K(15);
f3=K(16);

g1=K(17);
g2=K(18);
g3=K(19);

h1=K(20);
h2=K(21);
h3=K(22);
K_C3S=RGR([h1 h2 h3]);


SR_C3=K(23);
SR_C9=K(24);
SR_XIAP=K(25);

tau=K(26);
%%


pC3=SR_C3/tau;
pC9=SR_C9/tau;
XIAP=SR_XIAP/tau;


%%
disp('cv=0;')
disp(strcat('pC3=Cohe(',num2str(pC3),',cv);')) 
disp(strcat('pC9=Cohe(',num2str(pC9),',cv);') )
disp(strcat('XIAP=Cohe(',num2str(XIAP),',cv);') ) 
disp(strcat('tau=Cohe(',num2str(tau),',0);') ) 

K_C9C3=RGR([a1 a2 a3]);
disp(strcat('A_pC3=pC3*tau;') )
disp(strcat('A_C9C3=Cohe(',num2str(a3),',cv);')) 
disp(strcat('K_C9C3=Cohe(',num2str(K_C9C3),',cv);')) 

K_XIAPC3=RGR([c1 c2 c3]);
disp(strcat('A_C9starC3=A_C9C3*15;') )
disp(strcat('K_C9starC3=K_C9C3/15;') )
disp(strcat('A_XIAPC3=Cohe(',num2str(c3),',cv);')   )
disp(strcat('K_XIAPC3=Cohe(',num2str(K_XIAPC3),',cv);') )
disp(strcat('b_C3=tau;') )

K_C3C9=RGR([e1 e2 e3]);
K_XIAPC9=RGR([f1 f2 f3]);
disp(strcat('A_pC9=pC9*tau;') )
disp(strcat('A_C9=',num2str(d1),';') )
disp(strcat('A_C3C9=Cohe(',num2str(e3),',cv);') )
disp(strcat('K_C3C9=Cohe(',num2str(K_C3C9),',cv);') )
disp(strcat('A_XIAPC9=Cohe(',num2str(f3),',cv);')  )
disp(strcat('K_XIAPC9=Cohe(',num2str(K_XIAPC9),',cv);')  )
disp(strcat('b_C9=tau;') )

K_C3XIAP=RGR([g1 g2 g3]);
disp(strcat('A_XIAP=XIAP*tau;') )
disp(strcat('A_C3XIAP=Cohe(',num2str(g3),',cv);') )
disp(strcat('K_C3XIAP=Cohe(',num2str(K_C3XIAP),',cv);') )
disp(strcat('b_XIAP=tau;'))
%%


