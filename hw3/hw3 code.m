%(1)计算理论上的C值；比较自己的代码输出与blsprice函数命令结果是否一致？
S_0 = 10;%stock price
r = 0.03;%rate
my_sigma = 0.2;
time = 1;
K = 11; %strike

d1 = (log(S_0/K) + (r + 0.5 * my_sigma^2)*time)/(my_sigma * sqrt(time));
d2 = (log(S_0/K) + (r - 0.5 * my_sigma^2)*time)/(my_sigma * sqrt(time));

C = S_0 * normcdf(d1) - K * exp(-r * time) * normcdf(d2)

%blsprice函数计算结果
Price = blsprice(S_0,K,r,time,my_sigma)



%(2)用Monte Carlo方法求C值
S0 = 10;%stock price
r = 0.03;%rate
my_sigma = 0.2;
K = 11; %strike
tau=1;
N=100;
dt=tau/N;
Npaths = 10^4;%%路径数量
S = S0 * ones(Npaths,1);

for i = 1:N
    my_epsilon = random('Normal',0,1,Npaths,1);%同时生成Npaths个随机数
    S(:,i+1)=S(:,i)+r*dt+my_sigma*my_epsilon               
end
C1 = exp(-r*tau) * mean(max(0, S(:,end) - K))

figure(1);
plot(1:N, S(:,1:end-1));
xlabel('交易日');
ylabel('股票价格');
tt = 1;


