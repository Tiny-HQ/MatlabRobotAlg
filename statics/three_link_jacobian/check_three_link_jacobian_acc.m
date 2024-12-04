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

%+---+-----------+-----------+-----------+-----------+-----------+
%| j |     theta |         d |         a |     alpha |    offset |
%+---+-----------+-----------+-----------+-----------+-----------+
%|  1|         q1|         d1|         a0|     alpha0|          0|
%|  2|         q2|         d2|         a1|     alpha1|          0|
%|  3|         q3|         d3|         a2|     alpha2|          0|
%+---+-----------+-----------+-----------+-----------+-----------+

%+---+-----------+-----------+-----------+-----------+-----------+
%| j |     theta |         d |         a |     alpha |    offset |
%+---+-----------+-----------+-----------+-----------+-----------+
%|  1|          0|          0|          0|        0.0|          0|
%|  2|          0|          0|         L1|        0.0|          0|
%|  3|          0|          0|         L2|        0.0|          0|
%|  3|          0|          0|         L3|        0.0|          0|
%+---+-----------+-----------+-----------+-----------+-----------+


clc;
clear;



L1 = 1.0;
L2 = 2.0;
L3 = 3.0;

DH.d(1) = 0;DH.d(2) = 0;DH.d(3) = 0;DH.d(4) = 0;
DH.a(1) = 0;DH.a(2) = L1;DH.a(3) = L2;DH.a(4) = L3;
DH.alpha(1) = 0;DH.alpha(2) = 0;DH.alpha(3) = 0;DH.alpha(4) = 0;

Ts = 0.001;
qs = [10 20 -35 15 30 0];
seq = 0:Ts:pi;
sinq = 30*sin(seq);


lengthq = length(seq);
q = zeros(3,lengthq);
dq = 30*sin(seq+pi/2);
ddq = 30*sin(seq+pi);

for i = 1:lengthq   
    q(1,i) = qs(1)+sinq(i);
    q(2,i) = qs(2)+sinq(i);
    q(3,i) = qs(2)+sinq(i);
end


v = zeros(6,lengthq);
dv = zeros(6,lengthq);

v_h = zeros(6,lengthq);
dv_h = zeros(6,lengthq);



p = zeros(6,lengthq);

for i = 1:lengthq
    

 
    J =  cal_three_link_jacobian(DH,q(:,i)','deg');
    dJ  = cal_three_link_acc_jacob(q(:,i)',dq(i)*[1 1 1]',DH,'deg');
    dv_h(:,i) = J*ddq(i)*pi/180*[1 1 1]'+dJ*dq(i)*pi/180*[1 1 1]';
     
   [T] = three_link_fkine(DH,q(:,i)','deg');
   p(:,i) = (htr2zyx(T))';   
   
end

if 1  
    figure;
    subplot(2,1,1);
    plot(dv_h(1,:),'r');hold on;plot(diff(diff(p(1,:))/Ts)/Ts);
    subplot(2,1,2);
    plot(dv_h(2,:),'r');hold on;plot(diff(diff(p(2,:))/Ts)/Ts);
%     subplot(3,1,3);
%     plot(dv_h(3,:),'r');hold on;plot(diff(diff(p(3,:))/Ts)/Ts);   
    
end










