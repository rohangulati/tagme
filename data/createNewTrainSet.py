__author__ = 'rohan'

import cv2
import os

MAX_IMAGE_PIXEL = 239
OUT_IMAGE_SIZE = 180

cropParamaters = [((MAX_IMAGE_PIXEL-OUT_IMAGE_SIZE+1)/2-1, (MAX_IMAGE_PIXEL-OUT_IMAGE_SIZE+1)/2-1)]
imageDir = ['building', 'cars', 'flower', 'face', 'shoes']

oldRootDir = 'trainSet'
newRootDir = 'train'

os.mkdir(newRootDir)
os.mkdir('./%s/%s' % (newRootDir, 'all_images'))
for folder in imageDir:
    os.mkdir('./%s/%s' % (newRootDir, folder))

for curDir in imageDir:
    outDirPath = './%s/%s' % (newRootDir, curDir)
    inDirPath = './%s/%s' % (oldRootDir, curDir)
    for imageFile in os.listdir(inDirPath):
        imageName = imageFile.split('.')[0]
        img = cv2.imread(inDirPath+'/'+imageFile)
        newFileName = '%s/%s.jpg' % (outDirPath, imageName)
        cv2.imwrite(newFileName, img)
        cv2.imwrite("./%s/%s/%s.jpg" % (newRootDir, "all_images", imageName), img)
        count = 1
        for (x, y) in cropParamaters:
            croppedImg = img[y:y+OUT_IMAGE_SIZE, x:x+OUT_IMAGE_SIZE]
            newFileName = '%s/%s-%d.jpg' % (outDirPath, imageName, count)
            cv2.imwrite(newFileName, croppedImg)
            cv2.imwrite("./%s/%s/%s-%d.jpg" % (newRootDir, "all_images", imageName, count), croppedImg)
            count += 1
