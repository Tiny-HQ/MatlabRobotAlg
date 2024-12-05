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



%��Ƥ���ٶ��˲�;kalman_filter; Filtering of belt speed
%�о���Ŀǰ��õ������˲��㷨��; It feels like the best linear filtering algorithm at the moment


clc;
clear;


Z = load('enc_pulse.txt');
%Z = load('enc_pulse_2200_2290.m');
%Z = load('enc_pulse_3815.m');
Z = -Z;
N = length(Z);


%std(Z)



X = [0 0]';
P = [1 0; 0 1];             %��ʼ״̬Э�������;��ʼ��ʱ���Ǻ���Ҫ;�����ǻ�Ӱ������ʱ��  initial state covariance matrix; It's not very important at first; It seems to affect the convergence time
F = [1 0.004;0 1];          %״̬ת�ƾ���;  State transition matrix
%Q = [0.001 0;0 0.001];     %״̬ת��Э�������; State Transition Covariance Matrix
Q = [0.001 0;0 0.001];      %״̬ת��Э�������;  ֱ�۵�����ΪԤ������������Ŷ��٣�ֵԽ��˵��Խ������Ԥ���ֵ��k�У�Ԥ��ı���ԽС; state transfer covariance matrix;  The intuitive understanding is how much you believe in the predicted data, the larger the value, the less you believe in the predicted value, and the smaller the proportion of the prediction in k;
H = [1 0];                  %�۲����; Observation matrix
R = 1.0;                    %�۲���������;        ֱ�۵�����Ϊ�۲�����������Ŷ��٣�ֵԽ��˵��Խ�����Ź۲��ֵ��k�У��۲�ı���ԽС; observed noise variance;        The intuitive understanding is how much you believe in the observed data, the larger the value, the less you believe in the observed value, and the smaller the proportion of the observation in k;

 

M = linspace(0,0,N);
W = linspace(0,0,N);


for i =1:N



    X_ = F*X;
    P_ = F*P*F'+Q;
    K =( P_*H')/(H*P_*H'+R);
    X = X_+K*(Z(i)-H*X_);
    P = (eye(2)-K*H)*P_;
    

    M(i) = X(1);
    W(i) = X(2);
   

end


Z(N+1) = Z(N);

figure;

 plot(Z,'o');
 
%plot(W)

 hold on;
 plot(M,'*')
%  plot(diff(Z)/0.004,'*')
 


% hold on;
% v__= smooth(diff(Z)/0.004);
%plot(v__)













