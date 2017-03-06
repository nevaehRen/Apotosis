function  Value=CoheLogNorm(Mean,Variability)
%%
% Mean=1.0938e4; Input in normal scale  
% cv=0.766/9.3;   cv ??log????????????????????????????????????(!!!!ratio is in log scale)
% 
% 
% Value=[];
% for i=1:10000;
% Value=[Value;CoheLogNorm(Mean,cv)];
% end
% Output also in normal scale
%%

if isempty(Variability)
Variability=0.766;
end

%% normal distribution with Mean=Mean, SD=Mean*Variability
Value=exp(normrnd(log(Mean),Variability));

end
