load('C:\Users\kevin\Desktop\ProjectSignature\gtruth\train\train_gTruth.mat')
option = trainingOptions('adam','MaxEpochs', 50,'MiniBatchSize', 16,'InitialLearnRate',0.00025,'ExecutionEnvironment','gpu');
layers = deeplabv3plusLayers([400 400], 3,"resnet18");
trainData = pixelLabelImageDatastore(gTruth);
myNet2 = trainNetwork(trainData, layers, option);

testImage = imageDatastore('C:\Users\kevin\Desktop\ProjectSignature\test\test400x400_seg_testing\');
test_data = load('C:\Users\kevin\Desktop\ProjectSignature\gtruth\test\test_gTruth.mat');
desired = pixelLabelDatastore(test_data.gTruth);
prediced = semanticseg(testImage,myNet2);

metrics = evaluateSemanticSegmentation(prediced,desired);
metrics.ClassMetrics
metrics.ConfusionMatrix
heatmap(["true" "fake" "back"], ["true" "fake" "back"],metrics.ConfusionMatrix.Variables )

N = 63;
x = labeloverlay(readimage(testImage, N),readimage(prediced,N));
y = readimage(desired,N) == 'bad';
figure,imshowpair(x,y,'montage')
