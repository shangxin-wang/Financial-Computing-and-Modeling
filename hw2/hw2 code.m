%% 作业内容；
%% 已知：dx(t) = a(t) * x(t) * dt + b(t0 * x(t) * dZ(t);
%% y(t) = ln x(t);
%% 应用Ito引理与y(t), 得到：dy(t) = (a(t) - 1/2 * b(t) ^ 2) * dt + b * dZ(t);
%% x(t + dt) = x(t) + a * x(t) * dt + b * x(t) * epsilon * sqrt(dt);
%% 1) Monte Carlo仿真（间接）：利用dx间接求出y(t)，命名为y1(t);
%% 2) Monte Carlo仿真（直接）：直接利用dy(t)求得y(t)，命名为y2(t);
%% 3) 检验y1(t)和y2(t);

clc; %% 清理屏幕
clear all; %% 清理所有变量值
close all; %% 关闭所有图


%% 设置各参数初始值
x0 = 10;
dt = 1/250; % 代表一天
T = 6; % 代表10年
N = T/dt; % 代表T年的天数

my_epsilon = random('Normal',0,1); %随机数的生成，my_epsilon服从标准正态分布

x(1) = x0; 
y2(1) = log(x(1));% y(t) = ln x(t)
a = -0.05;
b = 0.2;
y_mu = a - 0.5 * b^2;
y_sigma = b;

%% 间接和直接计算：循环计算和更新股票价格N天
for i=1:N 
    my_epsilon = random('Normal',0,1);
    x(i+1) = x(i) + a * x(i) * dt + b * x(i) * my_epsilon * sqrt(dt); % 更新下一天的股票价格   
    u(i) = b * x(i) * my_epsilon * sqrt(dt)
    if x(i+1)<0
       x(i+1) = x(i);
    end   
    y1(i+1) = log(x(i+1)); % Monte Carlo 仿真 X，间接得到Y
    y2(i+1) = y2(i) + y_mu * dt + y_sigma * my_epsilon * sqrt(dt);% 直接用Monte Carlo仿真得到Y
    v(i) = y_sigma * my_epsilon * sqrt(dt); % 此为y2波动项
    
end

%% 画图: Monte Carlo 仿真 X，间接得到Y
%% 股票价格仿真总图
figure(1);
plot(1:N, y1(1:end-1));
xlabel('交易日');
ylabel('股票价格Y1(t)');
title('股票价格仿真图Y1(t)');
% 分解图-波动项
figure(2);
subplot(1,2,2);
plot(1:N, u);
xlabel('交易日');
ylabel('Y1(t)波动项');
title('Y1(t)波动项分解图');


%% 画图: 直接用Monte Carlo仿真得到Y
%% 股票价格仿真总图
figure(3);
plot(1:N, y2(1:end-1));
xlabel('交易日');
ylabel('股票价格Y2(t)');
title('股票价格仿真图Y2(t)）');
%% 分解图-漂移项
figure(4);
subplot(1,2,1);
plot(1:N, y_mu * dt);
xlabel('交易日');
ylabel('Y2(t)漂移项');
ylim([0,0.001]);
title('Y2(t)漂移项分解图');
%% 分解图-波动项
subplot(1,2,2);
plot(1:N, v);
xlabel('交易日');
ylabel('Y2(t)波动项');
title('Y2(t)波动项分解图（直接）');








