%clear;clc;
load data/train.mat;
%load data/valid.mat;

%for cars-----------------------------------------------------------------------------------------------
pos.names = cars_train.names;
pos.histograms = cars_train.histograms;
neg.names = {building_train.names{:},flower_train.names{:},face_train.names{:},shoes_train.names{:}};
neg.histograms = [building_train.histograms,flower_train.histograms,face_train.histograms,shoes_train.histograms];
histograms = [pos.histograms, neg.histograms] ;
labels = [ones(1,numel(pos.names)), - ones(1,numel(neg.names))] ;
clear pos neg;
% count how many images are there
fprintf('\nNumber of training images: %d positive, %d negative', ...
        sum(labels > 0), sum(labels < 0)) ;

% Hellinger's kernel (histograms are l1 normalized)
histograms = sqrt(histograms) ;
% --------------------------------------------------------------------
% Stage B: Training a classifier
% --------------------------------------------------------------------
m = size(histograms,2);
% Train the linear SVM
	C = 189 ;
%	C = 100;
	[w, bias] = trainLinearSVM(histograms, labels, C) ;

	% Evaluate the scores on the training data
	scores = w' * histograms + bias ;
	pred = predict(scores);
	fprintf('\nValidation Set Accuracy for cars: %f%%', mean(double(pred == labels)) * 100);
	fprintf('\nWrongly predicted cars: %d\n',m-sum(double(pred == labels)));
	save data/wCars.mat w bias;
	% --------------------------------------------------------------------
	% Stage C: Classify the test images and assess the performance
	% --------------------------------------------------------------------
	% Test the linar SVM
%	testHistograms = [cars_valid.histograms,building_valid.histograms,flower_valid.histograms,face_valid.histograms,shoes_valid.histograms];
%	m = size(testHistograms,2);
%	expTestLabels = [ones(1,numel(cars_valid.names)), -ones(1,m-numel(cars_valid.names))] ;
%	testHistograms = sqrt(testHistograms) ;
%	testScores = w' * testHistograms + bias ;

%	pred = predict(testScores);
%	fprintf('\nValidation Set Accuracy for cars: %f%%', mean(double(pred == expTestLabels)) * 100);
%	fprintf('\nWrongly predicted cars: %d\n',m-sum(double(pred == expTestLabels)));
%fprintf('incorrect car images : ');
%for i=1:size(cars_valid.names,2)
%	if(~(pred(i)==expTestLabels(i)))
%		fprintf('\n%s ',cars_valid.names{i});
%	end
%end
%fprintf('\n');
%car end --------------------------------------------------------------------------------------------------------------------