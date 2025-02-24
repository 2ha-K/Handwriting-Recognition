clear all

cam = webcam(1)
preview(cam)
pause(10)
img = snapshot(cam)
img = imresize(img,[400,400]);
imwrite(img,'C:\Users\kevin\Desktop\ProjectSignature\pic\segment.jpg')%store into a folder
net = load('C:\Users\kevin\Desktop\ProjectSignature\Net\myNetres280098.mat');

[label,score] = classify(net.myNet,img);
image(img);
title({char(label),num2str(max(score),2)});
points = max(score)*100;

fname = 'C:\Users\kevin\Desktop\ProjectSignature\excel';
saveas(gcf, fullfile(fname, 'test'), 'jpg');

folder = 'C:\Users\kevin\Desktop\ProjectSignature\excel';
excelFileName = 'Certification.xlsx';
fullFileName = fullfile(folder, excelFileName);

data = xlsread(fullFileName, "工作表1");
cellarray = num2cell(data);
accuracy = strcat(num2str(points), "%");
cellarray{1,1} = accuracy;
xlswrite(fullFileName,cellarray,"工作表1")

myNet1 = load('C:\Users\kevin\Desktop\ProjectSignature\segnet\myNet30965.mat')
testImage = imageDatastore('C:\Users\kevin\Desktop\ProjectSignature\pic\');
prediced = semanticseg(testImage,myNet1.myNet2);
N = 1;
x = labeloverlay(readimage(testImage, N),readimage(prediced,N));
figure,imshowpair(x,img,'montage')
% 
% if label=="true" && points >80
% 
%     if ~exist(fullFileName, 'file')
%   message = sprintf('Existing Excel workbook not found"\n%s', fullFileName);
%   uiwait(errordlg(message));
%   return;
% end
% objExcel = actxserver('Excel.Application');
% objExcel.Visible = true;
% ExcelWorkbook = objExcel.Workbooks.Open(fullFileName);
% oSheet = objExcel.ActiveSheet;
% imageFolder = 'C:\Users\kevin\Desktop\ProjectSignature\excel'
% imageFullFileName = fullfile(imageFolder, 'test.jpg')
% Shapes = oSheet.Shapes;
% Shapes.AddPicture(imageFullFileName, 0, 1, 18, 36, 400, 400);
% objExcel.DisplayAlerts = false;
% 
%     web('https://api.thingspeak.com/update?api_key=8FTVCQ65UPHI8IOM&field2=1')
%     pause(20)
%     Data = timetable(datetime,points);
%     thingSpeakWrite(1735704,Data,'WriteKey','8FTVCQ65UPHI8IOM'); 
%     
%     
% else
%     web('https://api.thingspeak.com/update?api_key=8FTVCQ65UPHI8IOM&field2=0')
% end