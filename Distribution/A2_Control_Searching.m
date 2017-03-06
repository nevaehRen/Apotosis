clc;clear;
if(~matlabpool('size'))
matlabpool(12)
else
matlabpool close force local    
end
Type='Waiting';

if strcmp(Type,'WT')
Inducers.T1=[0.010;0.25;2.5;25];Inducers.T2=[];Inducers.T3=[];
elseif strcmp(Type,'Green')
Inducers.T1=[];Inducers.T2=[0.010;0.25;2.5;25];Inducers.T3=[];
elseif strcmp(Type,'Whole')
Inducers.T1=[0.010;0.25;2.5;25];Inducers.T2=[0.010;0.25;2.5;25];Inducers.T3=[0.25;2.5;25];
end

Best_Count=100;Best_Score=10;Params_Temp=Step1_ReactionConstants();

aaa=100;
while(aaa<200)
    
while(1) 
%    Params=Fresh(Params_Temp);
   
%%% -- Step1: Initaliaiton as inducer=0 stable solution.
n=100;

tic;
[Apotosis,Apotosis_Green,Apotosis_Red,Value]=Step2_DoitSame(Params,n,Inducers);
toc; 
 
%%% -- Step3: Plot Distribution

ErrorMatrix = abs(Value.Predict-Value.Real);

Value.Score = sum(sum(ErrorMatrix));
Value.Count = sum(sum(ErrorMatrix>0.12));


%%% Record best so far
if (Value.Count<Best_Count)||(Value.Score<Best_Score)
   if rand(1)<0.9
   disp('Jump!')
   Best_Count = Value.Count;
   Best_Score = Value.Score;
   Params_Temp = Params;
   clearvars Apotosis Apotosis_Green Apotosis_Red
   save Temp.mat 
   end
end

   disp('-------')
   disp('So far Score:')
   disp(Value.Score)
   disp('So far Count:')
   disp(Value.Count)
   Value.Predict
   disp('-------')

   
 if Value.Count>3
 break;
 end   
 
 
PicName=strcat('group',num2str(aaa+1000),' Inducer-25','Count',num2str(Value.Count));
clearvars Apotosis Apotosis_Green Apotosis_Red
eval(strcat('save(''' ,PicName,'.mat'')'))

aaa=aaa+1;
Params_Temp=Step1_ReactionConstants();
end  
end