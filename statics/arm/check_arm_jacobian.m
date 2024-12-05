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
clc;
clear;


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
 

 
% DH.a(1) = 0.0;%????????0??????;matlab??    ??????1????;
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
 
DH.a(1) = 0.0;%????????0??????;matlab??    ??????1????;
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
DH.theta(2) = -0.125;
DH.theta(3) = 0.4568;
DH.theta(4) = 0.10;
DH.theta(5) = 0.17;
DH.theta(6) = 0.0;

Ts = 0.004;
%  ʼ   λ  ;
q = [10 20 -35 15 30 0];
[T,shoulder,elbow,wrist] = arm_fkine_dh(q,DH,'deg','deg');
pos = htr2zyx(T);
vec = [1,1,0];
vec = vec/ sqrt(sum(vec.^2));
vel = 450/1000*Ts;t = 1;


%     ٶ    ɿռ λ õ ;
length = t/Ts;pos_new = zeros(6,length);
for i = 1:3
    for j = 1:length
        pos_new(i,j) = pos(i)+vel*j*vec(i);
        pos_new(4,j)=pos(4);pos_new(5,j)=pos(5);pos_new(6,j)=pos(6);
    end
end

%   ռ ĵ      λ ÷  ⵽ ؽڱ   ;
q1=zeros(6,length);
for i=1:length
   T =cs_define_rpy(pos_new(:,i));
   q1(:,i) = arm_ikine_dh(T,DH,shoulder,elbow,wrist,'deg','deg');
end


% ٶȶ         ؽڵ ÿ  λ ô    ſ˱ȣ       ˿ռ  ٶȵõ  ؽ  ٶ ;
v1=zeros(6,1);v1(1) = vel*vec(1)/Ts;v1(2) = vel*vec(2)/Ts;v1(3) = vel*vec(3)/Ts;
thev=zeros(6,length);
cv=zeros(6,length);
for i=1:length

  %  ʽһ:
  [T1,shoulder,elbow,wrist] = arm_fkine_dh(q1(:,i)',DH,'deg','deg');
  R=[T1(1:3,1:3)  zeros(3,3); zeros(3,3) T1(1:3,1:3)];
  J1 = arm_jacobian_v2(DH,q1(:,i)','deg');% jacob0   R*
  thev(:,i) = pinv(R*J1)*v1;  %pinv
  cv(:,i)=R*J1*thev(:,i);
  
  %  ʽ  :
%   J1 = arm_jacobian(DH,q1(:,i)','deg');
%   thev(:,i) = pinv(J1)*v1;  
%   cv(:,i)=J1*thev(:,i);
end

% ſ˱     ٶ Ȼ    ղ λ ò ֵõ     ͼ      С   ߹̶    Ϳ     Ϊ ſ˱Ⱦ        ȷ;
subplot(2,3,1)
plot(diff(q1(1,:))/Ts);hold on;plot(thev(1,:)*180/pi);
subplot(2,3,2)
plot(diff(q1(2,:))/Ts);hold on;plot(thev(2,:)*180/pi);
subplot(2,3,3)
plot(diff(q1(3,:))/Ts);hold on;plot(thev(3,:)*180/pi);
subplot(2,3,4)
plot(diff(q1(4,:))/Ts);hold on;plot(thev(4,:)*180/pi);
subplot(2,3,5)
plot(diff(q1(5,:))/Ts);hold on;plot(thev(5,:)*180/pi);
subplot(2,3,6)
plot(diff(q1(6,:))/Ts);hold on;plot(thev(6,:)*180/pi);

%   ͼ;
figure(2);
subplot(2,3,1)
plot(diff(q1(1,:))/Ts-thev(1,2:length)*180/pi);
subplot(2,3,2)
plot(diff(q1(2,:))/Ts-thev(2,2:length)*180/pi);
subplot(2,3,3)
plot(diff(q1(3,:))/Ts-thev(3,2:length)*180/pi);
subplot(2,3,4)
plot(diff(q1(4,:))/Ts-thev(4,2:length)*180/pi);
subplot(2,3,5)
plot(diff(q1(5,:))/Ts-thev(5,2:length)*180/pi);
subplot(2,3,6)
plot(diff(q1(6,:))/Ts-thev(6,2:length)*180/pi);

%       ;
figure(3);
subplot(2,3,1)
plot(cv(1,:));
subplot(2,3,2)
plot(cv(2,:));
subplot(2,3,3)
plot(cv(3,:));
subplot(2,3,4)
plot(cv(4,:));
subplot(2,3,5)
plot(cv(5,:));
subplot(2,3,6)
plot(cv(6,:));

