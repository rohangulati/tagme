clc;
load data/vocabulary.mat;
test.names = getImageSet('data/test/all_images') ;
test.histograms = computeHistogramsFromImageList(vocabulary, test.names, 'data/cache') ;
save data/test.mat test;