Tagme Machine Learning Contest
==============================

CONTENTS
--------

The package contains the following MATLAB functions:

standardizeImage.m :
Rescale an image to a standard size.

computeFeatures.m :
Compute dense SIFT keypoints and descriptors.
  
quantizeDescriptors.m :
Quantize visual descriptors into visual words.
  
computeHistogram.m :
Compute a spatial histogram of visual words (starting from the features).

removeSpatialInformation :
Reduce a spatial histogram to a simple one.

computeHistogramFromImage.m :
Compute a histogram of visual words (starting from an image).

computeHistogramsFromImageList.m :
Applies computeHistogramFromImage to a list of images.

trainLinearSVM.m :
Learn a linear support vector machine.
  
displayRankedImagelist.m :
Visualize a subset of a ranked list of images.

getImageSet.m :
Scan a directory for images.
  
main.m :
Main script to run. This will call other scripts as required.
￼
createOutput.m :
loads the test data and the models saved and computer the scores for each model and saves the scores in data/scores/mat.
  
createTestSet.m :
creates histograms for test data for files stored in data/train and stores it in data/test.mat

calcOptC.m :
calculates the optimal C value (from 1 to 200) for all 5 SVM

createTrainSet.m :
creates histograms for train data for files stored in data/train and stores it in data/test.mat

createValidSet.m :
creates histograms for validation data fro file stored in data/valid and stores it in data/valid.mat

predict.m :
takes input as scores (mx1) matrix and creates output as matrix(mx1) of values 1/­1 as value is postive/negative.

octaveSaveFile.m
creates the ascii file of scores.mat to be read by the python program
  
predictAll.m :
calls the building, cars, face, flower and shoes and stores each one’s model in W and Bias and saves the total model in data/wMatrix.mat

data/createNewTrainSet.py
creates modified training set from the original training set in /data/trainSet directory and saves in /data/train directory


INSTALLATION
------------

Please install the following software before running the code
 * Opencv 2.4.6
 * Python 2.7
 * Matlab
 * Octave
 * vl_feat (already included in the source)


RUNNING INSTRUCTIONS
--------------------

* copy Original Training Set (buidling, shoes, cars, face & flower folder only) to /data/trainSet folder
* run createNewTrainSet.py script
* Create all_images directory in /data/test directory and copy all the test images in /data/test/all_images directory
* Open MATLAB and run main.m
* run octaveSaveFile.m
* open data/scores.txt and remove the comment lines manually which are not a part of data
* run the /data/reverseLabel.py to create categorisedOutput folder which contains the test set categorised output
* run /data/createLabels.py to create the labels.txt file which contains the labels


CAUTION
-------

* Do not change or modify any directory when running the above scripts
* The images to be tested should be kept in data/test/all_images
* The comment lines which are not a part of data are removed manually from scores.txt
