%(1)���������ϵ�Cֵ���Ƚ��Լ��Ĵ��������blsprice�����������Ƿ�һ�£�
S_0 = 10;%stock price
r = 0.03;%rate
my_sigma = 0.2;
time = 1;
K = 11; %strike

d1 = (log(S_0/K) + (r + 0.5 * my_sigma^2)*time)/(my_sigma * sqrt(time));
d2 = (log(S_0/K) + (r - 0.5 * my_sigma^2)*time)/(my_sigma * sqrt(time));

C = S_0 * normcdf(d1) - K * exp(-r * time) * normcdf(d2)

%blsprice����������
Price = blsprice(S_0,K,r,time,my_sigma)


%hw4
figure(2);
plot(10:20,blsprice(10:20,K,r,time,my_sigma))
xlabel('��ʼ�۸�');
ylabel('��Ʊ�۸�');
%tt = 1;

figure(3);
plot(10:100,blsprice(S_0,10:100,r,time,my_sigma))
xlabel('�ö��۸�');
ylabel('��Ʊ�۸�');
tt = 1;

figure(4);
plot(0.02:1,blsprice(S_0,K,0:01:1,time,my_sigma))
xlabel('rate');
ylabel('��Ʊ�۸�');
tt = 1;

figure(5);
plot(1:10,blsprice(S_0,K,r,1:10,my_sigma))
xlabel('time');
ylabel('��Ʊ�۸�');
tt = 1;

figure(6);
plot(0.1:2,blsprice(S_0,K,r,time,0.1:1))
xlabel('rate');
ylabel('��Ʊ�۸�');
tt = 1;


%(2)��Monte Carlo������Cֵ
S0 = 10;%stock price
r = 0.03;%rate
my_sigma = 0.2;
K = 11; %strike
tau=1;
N=100;
dt=tau/N;
Npaths = 10;%%·������
S = S0 * ones(Npaths,1);

for i = 1:N
    my_epsilon = random('Normal',0,1,Npaths,1);%ͬʱ����Npaths�������    
    S(:,i+1)=S(:,i)+r*dt+my_sigma*my_epsilon 
end
C1 = exp(-r*tau) * mean(max(0, S(:,end) - K))


%figure(1);
%plot(1:N, S(:,1:end-1));
%xlabel('������');
%ylabel('��Ʊ�۸�');
%tt = 1;


