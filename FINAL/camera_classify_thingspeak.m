clear all
if exist('mObj')
    clear mbj
end
mObj = mobiledev;
c = camera(mObj,'back');
net = load('/MATLAB Drive/Project/myNet30.mat');

img = snapshot(c,'manual');
[label,score] = classify(net.myNet,imresize(img,[400,400]));

image(img);
title({char(label),num2str(max(score),2)});

points = score(1,2)*100;

if label=="true" && points >80
    web('https://api.thingspeak.com/update?api_key=8FTVCQ65UPHI8IOM&field2=1')
    pause(20)
    Data = timetable(datetime,points);
    thingSpeakWrite(1735704,Data,'WriteKey','8FTVCQ65UPHI8IOM'); 
    
    
else
    web('https://api.thingspeak.com/update?api_key=8FTVCQ65UPHI8IOM&field2=0')
end
