%% ��ͨ�����˶� dx = mu * dt + sigma * dW
%% ��Ʊ�۸����˶��ķ��� 
clc; %% ������Ļ
clear all; %% �������б���ֵ
close all; %% �ر�����ͼ

%% x(t + dt) = x(t) + mu * dt + sigma * epsilon * sqrt(dt);
%% ��Ҫ֪������ֵ��
%% (1) x(t) = ?
%% (2) mu = ?
%% (3) dt = ?
%% (4) sigma = ?
%% (5)epsilon = ? 

%% ���ø�������ʼֵ
x0 = 10;
my_mu = 0.1; % ����������
dt = 1/250; % ����һ��
T = 6; % ����10��
N = T/dt; % ����T�������

my_sigma = 0.1; % ��������
my_epsilon = random('Normal',0,1); %����������ɣ�my_epsilon���ӱ�׼��̬�ֲ�

x(1) = x0; % ���õ�һ��Ĺ�Ʊ�۸�Ϊx0
y2(1) = exp(x(1))
a = -0.05;
b = 0.2;
y_mu = a - 0.5 * b^2
y_sigma = b

%% ��Ӻ�ֱ�Ӽ��㣺ѭ������͸��¹�Ʊ�۸�N��
for i=1:N 
    my_epsilon = random('Normal',0,1);
    x(i+1) = x(i) + my_mu * dt + my_sigma * my_epsilon * sqrt(dt); % ������һ��Ĺ�Ʊ�۸�   
    u(i) = my_sigma * my_epsilon * sqrt(dt);
    y1(i+1) = exp(x(i+1)); % Monte Carlo ���� X����ӵõ�Y
    y2(i+1) = y2(i) + y_mu * dt + y_sigma * my_epsilon * sqrt(dt); % ֱ����Monte Carlo����õ�Y
    if x(i+1)<0
        x(i+1) = x(i)
    end   
end

%% ��ͼ??Monte Carlo ���� X����ӵõ�Y
%% ��Ʊ�۸������ͼ
figure(1);
plot(1:N, y1(1:end-1));
xlabel('������');
ylabel('��Ʊ�۸�');
title('��Ʊ�۸����ͼ')
%% �ֽ�ͼ-Ư����
figure(2);
subplot(1,2,1);
plot(1:N, exp(my_mu * dt * ones(1, N)));
xlabel('������');
ylabel('Ư����');
ylim([0,0.001]);
title('��Ʊ�۸�Ư����ֽ�ͼ')
%% �ֽ�ͼ-������
subplot(1,2,2);
plot(1:N, exp(u));
xlabel('������');
ylabel('������');
title('��Ʊ�۸񲨶���ֽ�ͼ')











