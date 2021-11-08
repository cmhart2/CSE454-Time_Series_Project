% Clear workspace, command window, and close any open plots
clc
clear
close all

data = load('synthetic_control_data.mat'); % load data
data = data.syntheticcontrol;

N = 100;
n = 6;
alphabet_size = 6;
c = 100; % window size
i = 2;

%paa = paagen(c, data);
%paaplot(paa, data, c, i);

%ser = timeseries2symbol(data, N, n, alphabet_size, [2])
subplot(2,1,1);
sax_demo(data);

subplot(2,1,2);
[sax_data, pointers] = timeseries2symbol(data, 100, 6, alphabet_size, 2);
data = [pointers sax_data];
sax_demo();
