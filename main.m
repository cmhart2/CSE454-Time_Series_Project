% Clear workspace, command window, and close any open plots
clc
clear
close all

data = load('synthetic_control_data.mat'); % load data
data = data.syntheticcontrol;

% partition the data by class
normal = data(1:100);
cyclic = data(101:200);
incrTrend = data(201:300);
decrTrend = data(301:400);
upShift = data(401:500);
downShift = data(501:600);

% plot original time series
subplot(6,1,1);
data = (normal - mean(normal))/std(normal);
plot(data);

subplot(6,1,2);
data = (cyclic - mean(cyclic))/std(cyclic);
plot(data);

subplot(6,1,3);
data = (incrTrend - mean(incrTrend))/std(incrTrend);
plot(data);

subplot(6,1,4);
data = (decrTrend - mean(decrTrend))/std(decrTrend);
plot(data);

subplot(6,1,5);
data = (upShift - mean(upShift))/std(upShift);
plot(data);

subplot(6,1,6);
data = (downShift - mean(downShift))/std(downShift);
plot(data);

pause;
close all;

subplot(6,1,1);
paa_demo(normal);

subplot(6,1,2);
paa_demo(cyclic);

subplot(6,1,3);
paa_demo(incrTrend);

subplot(6,1,4);
paa_demo(decrTrend);

subplot(6,1,5);
paa_demo(upShift);

subplot(6,1,6);
paa_demo(downShift);

pause;
close all;

subplot(6,1,1);
sax_demo(normal);

subplot(6,1,2);
sax_demo(cyclic);

subplot(6,1,3);
sax_demo(incrTrend);

subplot(6,1,4);
sax_demo(decrTrend);

subplot(6,1,5);
sax_demo(upShift);

subplot(6,1,6);
sax_demo(downShift);