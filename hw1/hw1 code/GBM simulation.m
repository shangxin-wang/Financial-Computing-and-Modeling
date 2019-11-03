%% 股票价格：GBM几何布朗运动 s(t) = exp(x(t)) 的仿真
%% ds(t) = s(t) * mu * dt + s(t) * sigma * dW; dW = epsilon * sqrt(dt), dW代表维纳过程
clc; %% 清理屏幕
clear all; %% 清理所有变量值
close all; %% 关闭所有图

%% s(t+dt) = s(t) * exp((mu - sigma^2/2) * dt + sigma * epsilon * sqrt(dt))
s0 = 5;
gbm_mu = 0.1; % 代表收益率
dt = 1/250; % 代表一天
T_gbm = 6; % 代表年数
N_gbm = T_gbm/dt; % 代表T_gbm年的天数
gbm_sigma = 0.1; % 代表波动率
gbm_epsilon = random('Normal',0,1); %随机数的生成，epsilon服从标准正态分布
s(1) = s0; %设置第一天的股票价格为s0
    
%% 循环计算和更新股票价格N_gbm天
for i=1:N_gbm 
    gbm_epsilon = random('Normal',0,1);
    s(i+1) = s(i) * exp((gbm_mu - gbm_sigma^2/2) * dt + gbm_sigma * gbm_epsilon * sqrt(dt)) % 更新下一天的股票价格   
    z(i) = exp(gbm_sigma * gbm_epsilon * sqrt(dt));
end

%% 画图
%% 股票价格仿真总图
figure(3);
plot(1:N_gbm, s(1:end-1));
xlabel('交易日');
ylabel('GBM:股票价格');
title('GBM:股票价格仿真图')

%% 分解图-漂移项
figure(4);
subplot(1,2,1);
plot(1:N_gbm, exp((gbm_mu - gbm_sigma^2/2) * dt) * ones(1, N_gbm));
xlabel('交易日');
ylabel('GBM:漂移项');
title('GBM：股票价格漂移项仿真图')

%% 分解图-波动项
subplot(1,2,2);
plot(1:N_gbm, z);
xlabel('交易日');
ylabel('GBM:波动项');
title('GBM：股票价格波动项仿真图')

