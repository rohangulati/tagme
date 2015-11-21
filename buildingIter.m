%clear;clc;
load data/train.mat;
load data/valid.mat;

%for building-----------------------------------------------------------------------------------------------
pos.names = building_train.names;
pos.histograms = building_train.histograms;
neg.names = {face_train.names{:},flower_train.names{:},cars_train.names{:},shoes_train.names{:}};
neg.histograms = [face_train.histograms,flower_train.histograms,cars_train.histograms,shoes_train.histograms];
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

% Train the linear SVM
%s = 1;
%l = 200;
wrong = ones(l-s+1);
for i=s:l
	C = i;
%	C = 10 ;
	[w, bias] = trainLinearSVM(histograms, labels, C) ;

	% Evaluate the scores on the training data
	scores = w' * histograms + bias ;

	% --------------------------------------------------------------------
	% Stage C: Classify the test images and assess the performance
	% --------------------------------------------------------------------
	% Test the linar SVM
	testHistograms = [building_valid.histograms,face_valid.histograms,flower_valid.histograms,cars_valid.histograms,shoes_valid.histograms];
	m = size(testHistograms,2);
	expTestLabels = [ones(1,numel(building_valid.names)), -ones(1,m-numel(building_valid.names))] ;
	testHistograms = sqrt(testHistograms) ;
	testScores = w' * testHistograms + bias ;

	pred = predict(testScores);
%	fprintf('\nValidation Set Accuracy for building: %f%%', mean(double(pred == expTestLabels)) * 100);
%	fprintf('\nWrongly predicted buildings: %d %f\n',i, m-sum((pred == expTestLabels)));
	wrong(i-s+1) = m-sum((pred == expTestLabels));
end

minC = 0;
xlabel('C');
ylabel('incorrect images');

figure(3);
t = s:1:l;
wrong = wrong(:,1);
plot(t,wrong(:,1));
fprintf('\nmin error building: %d\n',min(wrong));
fprintf('min at index: ');
for i=s:l
	if(wrong(i-s+1)==min(wrong))
		fprintf('%d ',s+i-1);
		maxC = i;
	end
end
fprintf('\n');
%car end --------------------------------------------------------------------------------------------------------------------
