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

%% ���ڽ��������ڼ��ٶȵ��������⣬ʵ�ʹ��̲�����ã����������ɢ������������ٶȼ��ٶȵ�����;
% ����ע����������ں�λ��ʱ���߽����⣬�����ܵ�����1��1����,��Ҫ�������;
% �����ʱ���ںϰ뾶�Ǽ��ٶȶΣ���û�����ںϰ뾶�������Ҫ�ںϰ뾶�ķ����Ļ�Ҳ�Ƚ����ף�����ͨ�������ٶ�ʱ����ںϰ뾶r����������Ҳ��Ҫ��ɢ�������Ǹ����»������������Ǳ���;
% Due to the problem of continuity of acceleration in the analytical method, the actual engineering is not adopted, and the discrete method is used here to obtain the continuity of velocity acceleration.
% It should also be noted that when the two sections are fused at the position, the boundary problem, as well as the total number of points plus 1 minus 1, need to be carefully debugged;
%In addition, the fusion radius at this time is the deceleration segment, and there is no fusion radius, if you need a fusion radius method, it is also easier, that is, by processing the deceleration time with the fusion radius r, and it also needs to be discrete, otherwise it is still a driver or an error at high speed;
clc;
clear;
Ts = 0.004;             %��ɢ����; Discrete periods
J = [0 -30 50 -20];     %�ؽڽǶ�; Joint angles
Vel = [20 20 20 ];      %�ؽ��ٶȣ�����; joint velocity, positive;
Acc = [100 100 100 ];    %�ؽڼ��ٶȣ�����; joint acceleration, positive;
Jerk = [1000 1000 1000 ];
n = 3;                      %��ĸ�����һ��˵�����⣬����Ҫ��ô���; The number of points minus one illustrates the problem, and there is no need for so many points;



%% ��һ��δ�ں�; The first segment is not fused;
P = zeros(1,10000);
[t1,jerk]= s_curve_cal_param_con(abs(J(1)-J(2)),Vel(1),Acc(1),Jerk(1));
[s1,v1,a1,jerk1] = s_curve_cal_pvaj_con(t1,jerk,Ts); 
n1 = ceil(t1(4)/Ts);
P_dec1 = sign(J(2)-J(1))*s1(n1)+J(1);           
V_dec1 = sign(J(2)-J(1))*v1(n1);
A_dec1 = sign(J(2)-J(1))*a1(n1);
t_mix_d1 = t1(7) - t1(4);

for i = 1:n1-1
    P(i) = sign(J(2)-J(1))*s1(i)+J(1);
end


%% ��һ�θ��ڶ����ں��󣬵ڶ�������; The first section is fused with the second section, and the second section is at a constant speed;
 [t_temp2,v_temp2] = jugg_cur_max_average_vel(2,n,J(2),J(3),Vel(2),Acc(2),Jerk(2),Ts);     
t_mix_a2 = t_temp2(1);
t_mix_1 = t_mix_d1+t_mix_a2;
n_mix_1 = ceil(t_mix_1/Ts);   t_mix_1 = n_mix_1*Ts; %��ʱ��滮Ϊ������Ts������һ�����֮����ٶȻ��Ǹ�������ʱ��һ������; The time is planned as an integer multiple Ts, otherwise the acceleration after a certain difference is still the same as that of the analytic method;

%��һ���ں�ϵ��; % Fusion coefficient of the first segment;
[P_acc2,P_dec2] = cal_single_seg_acc_dec(J(2),J(3),t_temp2,Ts);
[a1,b1,c1,d1,e1,f1] = five_polynomial(P_dec1,V_dec1,A_dec1,P_acc2,v_temp2,0.0,t_mix_1); %������������ʱ��ȥ��ϵ���������������߽� Use positive multiples of the period time to find the coefficients, otherwise you will still encounter the boundary
%�ںϹ켣; fusion trajectories;
for i = 1:n_mix_1+1     %��ͷ��Ҫȡ;Take both ends;
    x = (i-1)*Ts;       %�ڵ�һ��ʱ��δȡ ���һ��ֵ; The last value is not taken in the first paragraph;
    P(i+n1-1)  = a1*x^5+b1*x^4+c1*x^3+d1*x^2+e1*x+f1;
    V_acc2 = 5*a1*x^4+4*b1*x^3+3*c1*x^2+2*d1*x+e1;
end
P_acc2 = P(n1+n_mix_1); 
%�ڶ������ٹ켣; % of the second stage of the constant trajectory;
t_vel2 = t_temp2(2)-t_temp2(1);n_vel2 = ceil(t_vel2/Ts);t_vel2 = n_vel2*Ts;
for i = 1:n_vel2
    x = i*Ts;
    P(i+n1+n_mix_1) = P_acc2+sign(J(3)-J(2))*V_acc2*x;
end
P_dec2 = P(n1+n_mix_1+n_vel2);V_dec2 = V_acc2;

%% �ڶ��θ��������ںϽ׶�; the second and third stages of fusion;

[t2,jerk]= s_curve_cal_param_con(abs(J(4)-J(3)),Vel(3),Acc(3),Jerk(3));
[s2,v2,a2,jerk2] = s_curve_cal_pvaj_con(t2,jerk,Ts); 
n2 = ceil(t2(4)/Ts);
P_acc3 = sign(J(3)-J(4))*s2(n2)+J(4); 
V_acc3 = sign(J(4)-J(3))*v2(n2);
A_acc3 = sign(J(4)-J(3))*a2(n2);
t_mix_2 = t1(3)+t_temp2(3)-t_temp2(2);
n_mix_2 = ceil(t_mix_2/Ts); t_mix_2 = n_mix_2*Ts;

%�ںϹ켣; fusion trajectories;
[a1,b1,c1,d1,e1,f1] = five_polynomial(P_dec2,V_dec2,0.0,P_acc3,V_acc3,A_acc3,t_mix_2);
for i = 1:n_mix_2     %��ͷ��Ҫȡ; Take both ends;
    x = i*Ts;         %�ڵ�һ��ʱ��δȡ���һ��ֵ; The last value is not taken in the first paragraph;
    P(i+n1+n_mix_1+n_vel2) = a1*x^5+b1*x^4+c1*x^3+d1*x^2+e1*x+f1;
end

%���һ��; The last paragraph;
for i = 2:n2
   P(i+n1+n_mix_1+n_vel2+n_mix_2-1) = sign(J(3)-J(4))*s2(n2-i+1)+J(4);
end

JJ = P(1:n2+n1+n_mix_1+n_vel2+n_mix_2-1);

N = zeros(1,n+1);
N(1) = 0; N(2) = n1+ceil(n_mix_1/2);N(3) = n1+n_mix_1+n_vel2+ceil(n_mix_2/2);N(4) =n2+n1+n_mix_1+n_vel2+n_mix_2-1;

figure;
subplot(4,1,1);
plot(JJ);hold on;plot(N,J,'*');
VV = diff(JJ)/Ts;
subplot(4,1,2);
plot(VV);
AA = diff(VV)/Ts;
subplot(4,1,3);
plot(AA);
Jerk = diff(AA)/Ts;
subplot(4,1,4);
plot(Jerk);
figure;
plot(JJ);hold on;plot(N,J,'*');


