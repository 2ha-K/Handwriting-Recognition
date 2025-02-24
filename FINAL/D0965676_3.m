%Training myNet for classify true and fake.
cd C:\Users\kevin\Desktop\ProjectSignature\test
allData=imageDatastore('test400x400','IncludeSubfolders',true,'LabelSource','foldernames');
load('C:\Users\kevin\Desktop\ProjectSignature\layer\matlab2.mat')%res-101net
[imds60,imds40]=splitEachLabel(allData,0.6,'randomized');%separate train and test picture.
opts=trainingOptions('adam','InitialLearnRate',0.00025,'MaxEpochs',50,'MiniBatchSize',16,'Plots','training-progress',...
'ValidationData',imds40,'ExecutionEnvironment','gpu');%optimizer setting
myNet=trainNetwork(imds60,lgraph_1,opts);

%Accuracy & ConfMat & F1
desiredLabel=imds40.Labels;
predictedLabel=classify(myNet,imds40);
accuracy=mean(desiredLabel==predictedLabel)
confMat = confusionmat(desiredLabel,predictedLabel)
for i = 1:size(confMat,1)
    precision(i)=confMat(i,i)/sum(confMat(i,:));
end
for i = 1:size(confMat,1)
    recall(i)=confMat(i,i)/sum(confMat(:,i));
end
F1 = (2.*precision.*recall)/(precision+recall)




