import os

label = ['building', 'cars', 'face', 'flower', 'shoes']
d = {'building' : 1, 'cars':2, 'face':3, 'flower':4, 'shoes':5}
hast = dict()

files = []

for folder in label:
    files = files + os.listdir(folder)
    for x in os.listdir(folder):
        hast[x] = d[folder]
        

files = sorted(files)

for x in files:
    fp = open('labels.txt', "a")
    fp.write(x+' '+str(hast[x])+'\n')
    fp.close()


