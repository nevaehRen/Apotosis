



load('group503 Inducer-0.0025.png.mat')
[f1,h]=Step3_C3C9XIAP(Apotosis,1);

load('group503 Inducer-0.025.png.mat')
[f2,h]=Step3_C3C9XIAP(Apotosis,2);

load('group503 Inducer-0.25.png.mat')
[f3,h]=Step3_C3C9XIAP(Apotosis,3);

load('group503 Inducer-2.5.png.mat')
[f4,h]=Step3_C3C9XIAP(Apotosis,4);

load('group503 Inducer-25.png.mat')
[f5,h]=Step3_C3C9XIAP(Apotosis,5);



adjust_quiver_arrowhead_size(h, 0.3);


load('group503 Inducer-0.0025.png.mat')
[f1,h]=Step3_C3C9XIAP(Apotosis_Green,1);

load('group503 Inducer-0.025.png.mat')
[f2,h]=Step3_C3C9XIAP(Apotosis_Green,2);

load('group503 Inducer-0.25.png.mat')
[f3,h]=Step3_C3C9XIAP(Apotosis_Green,3);

load('group503 Inducer-2.5.png.mat')
[f4,h]=Step3_C3C9XIAP(Apotosis_Green,4);

load('group503 Inducer-25.png.mat')
[f5,h]=Step3_C3C9XIAP(Apotosis_Green,5);





load('group503 Inducer-0.0025.png.mat')
[f1,h]=Step3_C3C9XIAP(Apotosis_Red,1);

load('group503 Inducer-0.025.png.mat')
[f2,h]=Step3_C3C9XIAP(Apotosis_Red,2);

load('group503 Inducer-0.25.png.mat')
[f3,h]=Step3_C3C9XIAP(Apotosis_Red,3);

load('group503 Inducer-2.5.png.mat')
[f4,h]=Step3_C3C9XIAP(Apotosis_Red,4);

load('group503 Inducer-25.png.mat')
[f5,h]=Step3_C3C9XIAP(Apotosis_Red,5);










[f3,h]=Step3_C3C9XIAP(Apotosis,3);
[f3,h]=Step3_C3C9XIAP(Apotosis_Green,3);
[f3,h]=Step3_C3C9XIAP(Apotosis_Red,3);


adjust_quiver_arrowhead_size(h, 0.3);




