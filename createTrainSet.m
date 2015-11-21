clear;clc;
names_train = getImageSet('data/train/all_images');
save data/names_train.mat names_train;

vocabulary = computeVocabularyFromImageList(names_train);
save data/vocabulary.mat vocabulary;

building_train.names = getImageSet('data/train/building') ;
building_train.histograms = computeHistogramsFromImageList(vocabulary, building_train.names, 'data/cache') ;

cars_train.names = getImageSet('data/train/cars') ;
cars_train.histograms = computeHistogramsFromImageList(vocabulary, cars_train.names, 'data/cache') ;

flower_train.names = getImageSet('data/train/flower') ;
flower_train.histograms = computeHistogramsFromImageList(vocabulary, flower_train.names, 'data/cache') ;

face_train.names = getImageSet('data/train/face') ;
face_train.histograms = computeHistogramsFromImageList(vocabulary, face_train.names, 'data/cache') ;

shoes_train.names = getImageSet('data/train/shoes') ;
shoes_train.histograms = computeHistogramsFromImageList(vocabulary, shoes_train.names, 'data/cache') ;

save data/building_train.mat building_train;
save data/cars_train.mat cars_train;
save data/flower_train.mat flower_train;
save data/face_train.mat face_train;
save data/shoes_train.mat shoes_train;
save data/train.mat building_train flower_train face_train shoes_train cars_train names_train;