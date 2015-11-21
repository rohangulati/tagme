clear;clc;
names_valid = getImageSet('data/valid/all_images');
save data/names_valid.mat names_valid;

load data/vocabulary.mat;

valid.names = getImageSet('data/valid/all_images') ;
valid.histograms = computeHistogramsFromImageList(vocabulary, building_valid.names, 'data/cache') ;

%building_valid.names = getImageSet('data/valid/building') ;
%building_valid.histograms = computeHistogramsFromImageList(vocabulary, building_valid.names, 'data/cache') ;

%cars_valid.names = getImageSet('data/valid/cars') ;
%cars_valid.histograms = computeHistogramsFromImageList(vocabulary, cars_valid.names, 'data/cache') ;

%flower_valid.names = getImageSet('data/valid/flower') ;
%flower_valid.histograms = computeHistogramsFromImageList(vocabulary, flower_valid.names, 'data/cache') ;

%face_valid.names = getImageSet('data/valid/face') ;
%face_valid.histograms = computeHistogramsFromImageList(vocabulary, face_valid.names, 'data/cache') ;

%shoes_valid.names = getImageSet('data/valid/shoes') ;
%shoes_valid.histograms = computeHistogramsFromImageList(vocabulary, shoes_valid.names, 'data/cache') ;

%save data/building_valid.mat building_valid;
%save data/cars_valid.mat cars_valid;
%save data/flower_valid.mat flower_valid;
%save data/face_valid.mat face_valid;
%save data/shoes_valid.mat shoes_valid;
%save data/valid.mat building_valid flower_valid face_valid shoes_valid cars_valid names_valid;
save valid.mat valid;