clc
clear all
close all
tic
n = 10;    % ���ݵ���
x = 1:n;    % ������
y1 = randi(10, 1, n); % ������
y2 = randi(10, 1, n); % ������
figure(1)
plot(x, y1);
figure(1)    % ��Ҫ��hold on��Ч�����뽫����ע�͵�����ȡ����һ�е�ע��
% hold on
plot(x, y2, 'r');
toc