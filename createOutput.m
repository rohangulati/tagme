clear;
load data/test.mat;
load data/wMatrix.mat;

% Hellinger's kernel (histograms are l1 normalized)
m = size(test.histograms,2);
scores = (sqrt(test.histograms))'*W + ones(m,1)*Bias;
save data/scores.mat scores;

%output = zeros(size(scores,1));
%maxM = max(scores')';

%for i=1:size(scores,1)
%	maxVal = max(scores(i));
%	count = 0;
%	reqInd = 0;
%	for j=1:5
%		if(maxVal == scores(i,j))
%			count = count + 1;
%			reqI = j;
%		end
%	end
%	if(count > 1)
%		fprintf('wrong for image(%d) : %s\n',i,test.names{i});
%		scores(i,:)
%	end
%	output(i) = reqInd;
%end

