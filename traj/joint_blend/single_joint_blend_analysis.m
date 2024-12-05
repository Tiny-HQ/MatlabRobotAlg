% -------------------------------------------------------------------------
% Author: [Tiny][YuZhi]                      
% Contact: [tiny_h@163.com] 
% GitHub: [https://github.com/Tiny-HQ] 
% Zhihu:[https://www.zhihu.com/people/tiny_hq]
% Copyright (c) [2024] [Tiny][YuZhi]. All rights reserved.
% 
% This code is for academic, educational, and non-commercial use only.
% Unauthorized use, reproduction, or distribution is prohibited.
% 
% Disclaimer: This code is provided "as is" without any warranties. Use at your own risk.
% The author is not responsible for any robot or machine safety-related issues arising from the use of this code.
% -------------------------------------------------------------------------

%% ���Գ�֮Ϊ����������ʵ�������ڼ��ٶȵ�ԭ��һ�㲻����ã���������������������ɶ�Ķ��ᱨ��,�������������е�ͨ��;
%It can be called an analytical method, but in fact, due to the reason of acceleration, it is generally not used, and when it runs at high speed, the driver will alarm or something, but it works in theory;
clear;

Ts = 0.004;
J = [0 -30 60 20 70 -100];    %�ؽڽǶ�;
Vel = [10 55 20 30 10];      %�ؽ��ٶ�;
Acc = [100 50 200 300 100]; 
Jerk = [500 250 1000 1500 500];
n = 5;                      %��ĸ�����һ;


%% ��ÿһ���������ܴﵽ���ٶȣ���ʱ��������õ��ٶȵ�����; Find the speed that can be achieved by each section of constant speed, sometimes the speed may not be set;
v = zeros(1,n);t = zeros(1,n-1);
t_total = zeros(n,3);
for i = 1:n
    [t_total(i,:),v(i)] = jugg_cur_max_average_vel(i,n,J(i),J(i+1),Vel(i),Acc(i),Jerk(i),Ts);     
end
for i = 1:n-1
   t(i) =  t_total(i,3)-t_total(i,2)+t_total(i+1,1);
end


%% ��blend�ζ���ʽ����ϵ��; Find the polynomial parameter coefficients of the blend segment;
P_acc = zeros(1,n);
P_dec = zeros(1,n);
a = zeros(1,n-1);b = zeros(1,n-1);c = zeros(1,n-1);d = zeros(1,n-1);e = zeros(1,n-1);f = zeros(1,n-1);  %ϵ��;
for i = 1:n
    [P_acc(i),P_dec(i)] = cal_single_seg_acc_dec(J(i),J(i+1),t_total(i,:),Ts);
end

[P_dec(1),v(1),aa,nmm] = cal_first_dec(J(1),J(2),Vel(1),Acc(1),Jerk(1),Ts);
[P_acc(n),v(n)] = cal_last_acc(J(n),J(n+1),Vel(n),Acc(n),Jerk(n),Ts);

for i = 1:n-1
    [a(i),b(i),c(i),d(i),e(i),f(i)] = five_polynomial(P_dec(i),v(i),0.0,P_acc(i+1),v(i+1),0.0,t(i));
end



%% ������׶ε�λ����;Generate points at each stage;
%��һ��; The first paragraph;
[P1,V1,n] = cal_seg_pos(1,J(1),J(2),Vel(1),Acc(1),Jerk(1),Ts,t_total(1,2));
%�ںϽ׶�; Fusion stage;
n1 = ceil(t(1)/Ts);n2 = ceil(t(2)/Ts);n3 = ceil(t(3)/Ts);n4 = ceil(t(4)/Ts);
R1 = zeros(1,n1);R2 = zeros(1,n2);R3 = zeros(1,n3);R4 = zeros(1,n4);
for i =1:n1
    x = (i-1)*Ts;
    R1(i) = a(1)*x^5+b(1)*x^4+c(1)*x^3+d(1)*x^2+e(1)*x+f(1);
end
for i =1:n2
    x = (i-1)*Ts;
    R2(i) = a(2)*x^5+b(2)*x^4+c(2)*x^3+d(2)*x^2+e(2)*x+f(2);
end
for i =1:n3
    x = (i-1)*Ts;
    R3(i) = a(3)*x^5+b(3)*x^4+c(3)*x^3+d(3)*x^2+e(3)*x+f(3);
end
for i =1:n4
    x = (i-1)*Ts;
    R4(i) = a(4)*x^5+b(4)*x^4+c(4)*x^3+d(4)*x^2+e(4)*x+f(4);
end

%���ٽ׶�;% constant velocity phase;
t_cv1 = t_total(2,2)-t_total(2,1);t_cv2 = t_total(3,2)-t_total(3,1);t_cv3 = t_total(4,2)-t_total(4,1);
n_cv1 = ceil(t_cv1/Ts);n_cv2 = ceil(t_cv2/Ts);n_cv3 = ceil(t_cv3/Ts);
CV1 = zeros(1,n_cv1);CV2 = zeros(1,n_cv2);CV3 = zeros(1,n_cv3);
for i = 1:n_cv1
   temp = i*Ts;
   CV1(i) = temp*v(2)+P_acc(2);
end
for i = 1:n_cv2
   temp = i*Ts;
   CV2(i) = temp*v(3)+P_acc(3);
end
for i = 1:n_cv3
   temp = i*Ts;
   CV3(i) = temp*v(4)+P_acc(4);
end

%���һ��; % last paragraph;
[P6,V6,n6] = cal_seg_pos(0,J(5),J(6),Vel(5),Acc(5),Jerk(5),Ts,t_total(5,1));

%% �����еĹ켣����һ��; %% Integrate all the trajectories together;
n_total = n+n1+n2+n3+n4+n_cv1+n_cv2+n_cv3+n6;
JJ = zeros(1,n_total);

for i = 1:n
    JJ(i) = P1(i);
end

for i = 1:n1
    JJ(i+n) = R1(i);
end

for i = 1:n_cv1
    JJ(i+n+n1) = CV1(i);
end

for i = 1:n2
    JJ(i+n+n1+n_cv1) = R2(i);
end

for i = 1:n_cv2
    JJ(i+n+n1+n_cv1+n2) = CV2(i);
end

for i = 1:n3
    JJ(i+n+n1+n_cv1+n2+n_cv2) = R3(i);
end

for i = 1:n_cv3
    JJ(i+n+n1+n_cv1+n2+n_cv2+n3) = CV3(i);
end

for i = 1:n4
    JJ(i+n+n1+n_cv1+n2+n_cv2+n3+n_cv3) = R4(i);
end

for i = 1:n6
    JJ(i+n+n1+n_cv1+n2+n_cv2+n3+n_cv3+n4) = P6(i);
end

figure;
subplot(3,1,1);
plot(JJ);
subplot(3,1,2);
vv = diff(JJ)/Ts;
plot(vv);
subplot(3,1,3);
plot(diff(vv)/Ts)


figure;
plot(JJ)


