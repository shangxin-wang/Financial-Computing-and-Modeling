%% 普通布朗运动 dx = mu * dt + sigma * dW
%% 股票价格布朗运动的仿真 
clc; %% 清理屏幕
clear all; %% 清理所有变量值
close all; %% 关闭所有图

%% x(t + dt) = x(t) + mu * dt + sigma * epsilon * sqrt(dt);
%% 需要知道以下值：
%% (1) x(t) = ?
%% (2) mu = ?
%% (3) dt = ?
%% (4) sigma = ?
%% (5)epsilon = ? 

%% 设置各参数初始值
x0 = 5;
my_mu = 0.1; % 代表收益率
dt = 1/250; % 代表一天
T = 6; % 代表10年
N = T/dt; % 代表T年的天数
my_sigma = 0.1; % 代表波动率
epsilon = random('Normal',0,1); %随机数的生成，epsilon服从标准正态分布
x(1) = x0; % 设置第一天的股票价格为x0

%% 循环计算和更新股票价格N天
for i=1:N 
    epsilon = random('Normal',0,1);
    x(i+1) = x(i) + my_mu * dt + my_sigma * epsilon * sqrt(dt); % 更新下一天的股票价格   
    y(i) = my_sigma * epsilon * sqrt(dt);
    if x(i+1)<0
        x(i+1) = x(i)
    end   
end

%% 画图
%% 股票价格仿真总图
figure(1);
plot(1:N, x(1:end-1));
xlabel('交易日');
ylabel('股票价格');
title('股票价格仿真图')
%% 分解图-漂移项
figure(2);
subplot(1,2,1);
plot(1:N, my_mu * dt * ones(1, N));
xlabel('交易日');
ylabel('漂移项');
ylim([0,0.001]);
title('股票价格漂移项分解图')
%% 分解图-波动项
subplot(1,2,2);
plot(1:N, y);
xlabel('交易日');
ylabel('波动项');
title('股票价格波动项分解图')











