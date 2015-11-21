clc;

building;
W(:,1) = w;
Bias(:,1) = bias;

cars;
W(:,2) = w;
Bias(:,2) = bias;

face;
W(:,3) = w;
Bias(:,3) = bias;

flower;
W(:,4) = w;
Bias(:,4) = bias;

shoes;
W(:,5) = w;
Bias(:,5) = bias;

save data/wMatrix.mat W Bias;
