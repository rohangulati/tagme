clear;clc;
load data/test.mat;
load data/wCars.mat;

scores = w'*sqrt(test.histograms)+bias;
pred = predict(scores);

expTestLabels = -ones(size(pred));
for i=1:size(test.names)
	if(~(pred(i)==expTestLabels(i)))
		fprintf('\n%d %s ',i,test.names{i});
	end
end
fprintf('\n');