% -------------------------------------------------------------------------
% Author: [Tiny][YuZhi]                      
% Contact: [tiny_h@163.com] 
% GitHub: [https://github.com/Tredin] 
% Zhihu:[https://www.zhihu.com/people/tiny_hq]
% Copyright (c) [2024] [Tiny][YuZhi]. All rights reserved.
% 
% This code is for academic, educational, and non-commercial use only.
% Unauthorized use, reproduction, or distribution is prohibited.
% 
% Disclaimer: This code is provided "as is" without any warranties. Use at your own risk.
% The author is not responsible for any robot or machine safety-related issues arising from the use of this code.
% -------------------------------------------------------------------------
clc;
clear;

format long g;
%a??0??????5;
%alpha??0??????5;
%d??1??????6;
%theta??1??????6;
%
%+---+-----------+-----------+-----------+-----------+-----------+
%| j |     theta |         d |         a |     alpha |    offset |
%+---+-----------+-----------+-----------+-----------+-----------+
%|  1|         q1|         d1|         a0|     alpha0|          0|
%|  2|         q2|         d2|         a1|     alpha1|          0|
%|  3|         q3|         d3|         a2|     alpha2|          0|
%|  4|         q4|         d4|         a3|     alpha3|          0|
%|  5|         q5|         d5|         a4|     alpha4|          0|
%|  6|         q6|         d6|         a5|     alpha5|          0|
%+---+-----------+-----------+-----------+-----------+-----------+
 
%+---+-----------+-----------+-----------+-----------+-----------+
%| j |     theta |         d |         a |     alpha |    offset |
%+---+-----------+-----------+-----------+-----------+-----------+
%|  1|          0|       0.43|        0.0|        0.0|          0|
%|  2|         90|        0.0|   0.163655|         90|          0|
%|  3|          0|  -0.001279|   0.550739|        0.0|          0|
%|  4|          0|   0.700029|   0.208847|         90|          0|
%|  5|          0|        0.0|        0.0|        -90|          0|
%|  6|          0|      0.115|        0.0|         90|          0|
%+---+-----------+-----------+-----------+-----------+-----------+
 

 
% DH.a(1) = 0.0;%????????0??????;matlab??б┴иж??????1????;
% DH.a(2) = 0.163655;
% DH.a(3) = 0.550739;
% DH.a(4) = 0.208847;
% DH.a(5) = 0.0;
% DH.a(6) = 0.0;
% 
% DH.alpha(1) = 0.0;%????????0??????;
% DH.alpha(2) = 90;
% DH.alpha(3) = 0.0;
% DH.alpha(4) = 90;
% DH.alpha(5) = -90;
% DH.alpha(6) = 90;
% 
% DH.d(1) = 0.43;
% DH.d(2) = 0.0;
% DH.d(3) = -0.001279;
% DH.d(4) = 0.700029;
% DH.d(5) = 0.0;
% DH.d(6) = 0.115;
 
DH.a(1) = 0.0;%????????0??????;matlab??б┴иж??????1????;
DH.a(2) = 0.163655;
DH.a(3) = 0.550739;
DH.a(4) = 0.208847;
DH.a(5) = 0.0;
DH.a(6) = 0.0;
 
DH.alpha(1) = 0.0;%????????0??????;
DH.alpha(2) = 90;
DH.alpha(3) = 0.0;
DH.alpha(4) = 90;
DH.alpha(5) = -90;
DH.alpha(6) = 90;
 
DH.d(1) = 0.43;
DH.d(2) = 0.0;
DH.d(3) = -0.001279;
DH.d(4) = 0.700029;
DH.d(5) = 0.0;
DH.d(6) = 0.115;
 
DH.theta(1) = 0.0;
DH.theta(2) = 0.0;
DH.theta(3) = 0.0;
DH.theta(4) = 0.0;
DH.theta(5) = 0.0;
DH.theta(6) = 0.0;

Ts = 0.001;
qs = [10 20 -35 15 30 0];
seq = 0:Ts:pi/2;
sinq = 30*sin(seq);


lengthq = length(seq);
q = zeros(6,lengthq);
dq = 30*sin(seq+pi/2);
ddq = 30*sin(seq+pi);

for i = 1:lengthq   
    q(1,i) = qs(1)+sinq(i);
    q(2,i) = qs(2)+sinq(i);
    q(3,i) = qs(3)+sinq(i);
    q(4,i) = qs(4)+sinq(i);
    q(5,i) = qs(5)+sinq(i);
    q(6,i) = qs(6)+sinq(i);
end

v = zeros(6,lengthq);
dv = zeros(6,lengthq);

p = zeros(6,lengthq);

for i = 1:lengthq
    
   J =  arm_jacobian(DH,q(:,i)','deg');
   dJ  = cal_arm_acc_jacob(q(:,i)',dq(i)*[1 1 1 1 1 1]',DH,'deg');%cause the dq is the same; they are always not equal;
   
   v(:,i) = J*(dq(i)*pi/180*[1 1 1 1 1 1])';
   dv(:,i) = J*(ddq(i)*pi/180*[1 1 1 1 1 1])'+dJ*((dq(i)*pi/180*[1 1 1 1 1 1])');
    
   [T,shoulder,elbow,wrist] = arm_fkine_dh(q(:,i)',DH,'deg','deg');
   p(:,i) = (htr2zyx(T))';   
   
end


% 
% x = p(1,:);
% y = p(2,:);
% z = p(3,:);
% plot3(x,y,z);

if 0
    figure;
    subplot(3,1,1);
    plot(v(1,:),'r');hold on;plot(diff(p(1,:))/Ts);
    subplot(3,1,2);
    plot(v(2,:),'r');hold on;plot(diff(p(2,:))/Ts);
    subplot(3,1,3);
    plot(v(3,:),'r');hold on;plot(diff(p(3,:))/Ts);

end


if 1  
    figure;
    subplot(3,1,1);
    plot(dv(1,:),'r');hold on;plot(diff(diff(p(1,:))/Ts)/Ts);
    subplot(3,1,2);
    plot(dv(2,:),'r');hold on;plot(diff(diff(p(2,:))/Ts)/Ts);
    subplot(3,1,3);
    plot(dv(3,:),'r');hold on;plot(diff(diff(p(3,:))/Ts)/Ts);   
    
end

if 1
    figure;
    subplot(3,1,1);
    plot(dv(1,2:lengthq-1)-(diff(diff(p(1,:))/Ts)/Ts),'r');
    subplot(3,1,2);
    plot(dv(2,2:lengthq-1)-(diff(diff(p(2,:))/Ts)/Ts),'r');
    subplot(3,1,3);
    plot(dv(3,2:lengthq-1)-(diff(diff(p(3,:))/Ts)/Ts),'r');
     
end




