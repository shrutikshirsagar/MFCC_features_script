
import os

emoList = {"angry", "happy", "sad", "neutral", "frustrated", "excited", "fearful", "disgusted", "other", "ambiguous", "surprised"}
#
# Code to delete existing feature files in opensmileFeatureOutput folder
# filelist = [f for f in os.listdir("opensmileFeatureOutput")]
# for f in filelist:
#     os.remove("opensmileFeatureOutput/"+f)
csvoutput = '/home/shruti/Documents/opensmile/audio_mfcc/'
if not os.path.exists(csvoutput):
        os.mkdir(csvoutput)
filelist = [f for f in os.listdir("/home/shruti/Documents/opensmile/audio/")]
# Sample Command for LLD: SMILExtract -C opensmile/config/IS11_speaker_state_LLD.conf -I Ses01F_impro03_F026.wav -csvoutput tryopensmile.csv
# Sample Command for HLD: SMILExtract -C opensmile/config/IS11_speaker_state.conf -I Ses01F_impro03_F026.wav -csvoutput tryopensmile.csv

##Code to generate LLDs
for f in filelist:
    os.system("inst/bin/SMILExtract -C config/MFCC12_0_D_A_Z.conf -I /home/shruti/Documents/opensmile/audio/" + f + " -O /home/shruti/Documents/opensmile/audio_mfcc/" + f + "features.htk")

## replace filename
paths = (os.path.join(root, filename)
        for root, _, filenames in os.walk('/home/shruti/Documents/MFCC/')
        for filename in filenames)

for path in paths:
    # the '#' in the example below will be replaced by the '-' in the filenames in the directory
    newname = path.replace('.wavfeatures', '')
    if newname != path:
        os.rename(path, newname)  
