%% ��ҵ���ݣ�
%% ��֪��dx(t) = a(t) * x(t) * dt + b(t0 * x(t) * dZ(t);
%% y(t) = ln x(t);
%% Ӧ��Ito������y(t), �õ���dy(t) = (a(t) - 1/2 * b(t) ^ 2) * dt + b * dZ(t);
%% x(t + dt) = x(t) + a * x(t) * dt + b * x(t) * epsilon * sqrt(dt);
%% 1) Monte Carlo���棨��ӣ�������dx������y(t)������Ϊy1(t);
%% 2) Monte Carlo���棨ֱ�ӣ���ֱ������dy(t)���y(t)������Ϊy2(t);
%% 3) ����y1(t)��y2(t);

clc; %% ������Ļ
clear all; %% �������б���ֵ
close all; %% �ر�����ͼ


%% ���ø�������ʼֵ
x0 = 10;
dt = 1/250; % ����һ��
T = 6; % ����10��
N = T/dt; % ����T�������

my_epsilon = random('Normal',0,1); %����������ɣ�my_epsilon���ӱ�׼��̬�ֲ�

x(1) = x0; 
y2(1) = log(x(1));% y(t) = ln x(t)
a = -0.05;
b = 0.2;
y_mu = a - 0.5 * b^2;
y_sigma = b;

%% ��Ӻ�ֱ�Ӽ��㣺ѭ������͸��¹�Ʊ�۸�N��
for i=1:N 
    my_epsilon = random('Normal',0,1);
    x(i+1) = x(i) + a * x(i) * dt + b * x(i) * my_epsilon * sqrt(dt); % ������һ��Ĺ�Ʊ�۸�   
    u(i) = b * x(i) * my_epsilon * sqrt(dt)
    if x(i+1)<0
       x(i+1) = x(i);
    end   
    y1(i+1) = log(x(i+1)); % Monte Carlo ���� X����ӵõ�Y
    y2(i+1) = y2(i) + y_mu * dt + y_sigma * my_epsilon * sqrt(dt);% ֱ����Monte Carlo����õ�Y
    v(i) = y_sigma * my_epsilon * sqrt(dt); % ��Ϊy2������
    
end

%% ��ͼ: Monte Carlo ���� X����ӵõ�Y
%% ��Ʊ�۸������ͼ
figure(1);
plot(1:N, y1(1:end-1));
xlabel('������');
ylabel('��Ʊ�۸�Y1(t)');
title('��Ʊ�۸����ͼY1(t)');
% �ֽ�ͼ-������
figure(2);
subplot(1,2,2);
plot(1:N, u);
xlabel('������');
ylabel('Y1(t)������');
title('Y1(t)������ֽ�ͼ');


%% ��ͼ: ֱ����Monte Carlo����õ�Y
%% ��Ʊ�۸������ͼ
figure(3);
plot(1:N, y2(1:end-1));
xlabel('������');
ylabel('��Ʊ�۸�Y2(t)');
title('��Ʊ�۸����ͼY2(t)��');
%% �ֽ�ͼ-Ư����
figure(4);
subplot(1,2,1);
plot(1:N, y_mu * dt);
xlabel('������');
ylabel('Y2(t)Ư����');
ylim([0,0.001]);
title('Y2(t)Ư����ֽ�ͼ');
%% �ֽ�ͼ-������
subplot(1,2,2);
plot(1:N, v);
xlabel('������');
ylabel('Y2(t)������');
title('Y2(t)������ֽ�ͼ��ֱ�ӣ�');








