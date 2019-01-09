clc
clear all
close all
tic
n = 10;    % 数据点数
x = 1:n;    % 横坐标
y1 = randi(10, 1, n); % 纵坐标
y2 = randi(10, 1, n); % 纵坐标
figure(1)
plot(x, y1);
figure(1)    % 想要看hold on的效果，请将改行注释掉，并取消下一行的注释
% hold on
plot(x, y2, 'r');
toc