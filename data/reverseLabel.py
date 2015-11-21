import os
import shutil

inFileName = 'scores.txt'

imageDir = './test/all_images'

inputFile = open(inFileName,'r')

label = ['building', 'cars', 'face', 'flower', 'shoes']

os.mkdir('outputCategorised')
os.mkdir('outputCategorised/notClassified')

for name in label:
    os.mkdir('outputCategorised/'+name)
    
files = os.listdir(imageDir)
count = 1

for line in inputFile.readlines():
    line = line.lstrip(' \n').rstrip(' \n')
    tmp = line.split(' ')
    maxIndex = 0
    maxValue = float(tmp[0])
    for i in xrange(1,5):
        if float(tmp[i]) > maxValue:
            maxValue = float(tmp[i])
            maxIndex = i
    if maxValue < 0:
        noclass += 1
        arr = []
        for i in xrange(0,5):
            arr.append(float(tmp[i]))
        mean = 0.0
        for i in xrange(0,5):
            mean += arr[i]
        for i in xrange(0,5):
            arr[i] -= mean
        maxIndex = 0
        maxValue = tmp[0]
        for i in xrange(1,5):
            if tmp[i] < maxValue:
                maxValue = tmp[i]
                maxIndex = i
        if maxValue < 0:
            continue
            #shutil.copy(imageDir + '/' + files[count-1], 'outputCategorised/notClassified')
        else:
            shutil.copy(imageDir + '/' + files[count-1], 'outputCategorised/'+label[maxIndex])
    else:
        outputFile = open(outFileName,'a')
        outputFile.write('%d - %s %d\n' % (count, label[maxIndex], maxIndex + 1))
        outputFile.close()
        shutil.copy(imageDir + '/' + files[count-1], 'outputCategorised/'+label[maxIndex])
    count += 1

