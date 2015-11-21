function pred = predict(scores)

pred = -ones(size(scores));
for i=1:length(scores)
	if(scores(i) > 0)
		pred(i) = 1;
	end
end
