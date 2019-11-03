%% ��Ʊ�۸�GBM���β����˶� s(t) = exp(x(t)) �ķ���
%% ds(t) = s(t) * mu * dt + s(t) * sigma * dW; dW = epsilon * sqrt(dt), dW����ά�ɹ���
clc; %% ������Ļ
clear all; %% �������б���ֵ
close all; %% �ر�����ͼ

%% s(t+dt) = s(t) * exp((mu - sigma^2/2) * dt + sigma * epsilon * sqrt(dt))
s0 = 5;
gbm_mu = 0.1; % ����������
dt = 1/250; % ����һ��
T_gbm = 6; % ��������
N_gbm = T_gbm/dt; % ����T_gbm�������
gbm_sigma = 0.1; % ��������
gbm_epsilon = random('Normal',0,1); %����������ɣ�epsilon���ӱ�׼��̬�ֲ�
s(1) = s0; %���õ�һ��Ĺ�Ʊ�۸�Ϊs0
    
%% ѭ������͸��¹�Ʊ�۸�N_gbm��
for i=1:N_gbm 
    gbm_epsilon = random('Normal',0,1);
    s(i+1) = s(i) * exp((gbm_mu - gbm_sigma^2/2) * dt + gbm_sigma * gbm_epsilon * sqrt(dt)) % ������һ��Ĺ�Ʊ�۸�   
    z(i) = exp(gbm_sigma * gbm_epsilon * sqrt(dt));
end

%% ��ͼ
%% ��Ʊ�۸������ͼ
figure(3);
plot(1:N_gbm, s(1:end-1));
xlabel('������');
ylabel('GBM:��Ʊ�۸�');
title('GBM:��Ʊ�۸����ͼ')

%% �ֽ�ͼ-Ư����
figure(4);
subplot(1,2,1);
plot(1:N_gbm, exp((gbm_mu - gbm_sigma^2/2) * dt) * ones(1, N_gbm));
xlabel('������');
ylabel('GBM:Ư����');
title('GBM����Ʊ�۸�Ư�������ͼ')

%% �ֽ�ͼ-������
subplot(1,2,2);
plot(1:N_gbm, z);
xlabel('������');
ylabel('GBM:������');
title('GBM����Ʊ�۸񲨶������ͼ')

