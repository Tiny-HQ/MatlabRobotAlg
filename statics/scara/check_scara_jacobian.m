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
%a?0???5;
%alpha?0???5;
%d?1???6;
%theta?1???6;
%
%+---+-----------+-----------+-----------+-----------+-----------+
%| j |     theta |         d |         a |     alpha |    offset |
%+---+-----------+-----------+-----------+-----------+-----------+
%|  1|         q1|         d1|         a0|     alpha0|          0|
%|  2|         q2|         d2|         a1|     alpha1|          0|
%|  3|          0|         q3|         a2|     alpha2|          0|
%|  4|         q4|         d4|         a3|     alpha3|          0|
%+---+-----------+-----------+-----------+-----------+-----------+

%+---+-----------+-----------+-----------+-----------+-----------+
%| j |     theta |         d |         a |     alpha |    offset |
%+---+-----------+-----------+-----------+-----------+-----------+
%|  1|          0|        0.0|        0.0|        0.0|          0|
%|  2|          0|        0.0|        325|        0.0|          0|
%|  3|          0|        0.0|        275|        0.0|          0|
%|  4|          0|        0.0|        0.0|        0.0|          0|
%+---+-----------+-----------+-----------+-----------+-----------+



DH.a(1) = 0.0;%????0???;matlab?????1??;
DH.a(2) = 225;
DH.a(3) = 175;
DH.a(4) = 0;


DH.alpha(1) = 0.0;%????0???;
DH.alpha(2) = 0.0;
DH.alpha(3) = 0.0;
DH.alpha(4) = 0.0;

DH.d(1) = 0;
DH.d(2) = 0.0;
DH.d(3) = 0.0;
DH.d(4) = 0.0;


DH.theta(1) = 0.0;
DH.theta(2) = 0.0;
DH.theta(3) = 0.0;
DH.theta(4) = 0.0;

Ts = 0.004;
%??????;
q = [10 20 -35 0];
[T,ori] = scara_fkine(q,DH,'deg','deg');
pos = htr2zyx(T);
vec = [1,1,0];
vec = vec/ sqrt(sum(vec.^2));
vel = 200/1000*Ts;t = 1;


%???????????;
length = t/Ts;pos_new = zeros(6,length);
for i = 1:3
    for j = 1:length
        pos_new(i,j) = pos(i)+vel*j*vec(i);
        pos_new(4,j)=pos(4);  
    end
end

%?????????????????;
q1=zeros(4,length);
for i=1:length
   T =cs_define_rpy(pos_new(:,i));
   q1(:,i) = scara_ikine(T,ori,DH,'deg','deg');
end


%?????,?????????????,??????????????;
v1=zeros(6,1);v1(1) = vel*vec(1)/Ts;v1(2) = vel*vec(2)/Ts;v1(3) = vel*vec(3)/Ts;
thev=zeros(4,length);
cv=zeros(6,length);
for i=1:length

  %???:
%   [T1,shoulder,elbow,wrist] = arm_fkine_dh(q1(:,i)',DH,'deg','deg');
%   R=[T1(1:3,1:3)  zeros(3,3); zeros(3,3) T1(1:3,1:3)];
%   J1 = arm_jacobian_v2(DH,q1(:,i)','deg');% jacob0   R*
%   thev(:,i) = pinv(R*J1)*v1;  %pinv
%   cv(:,i)=R*J1*thev(:,i);
  
  %???:
  J1 = scara_jacobian(DH,q1(:,i)','deg');
  pin = pinv(J1);
  thev(:,i) = pin*v1;  
  temp =  pin*v1;
  cv(:,i)=J1*temp;
end

%?????????????????????,????????????????????????;
subplot(2,2,1)
plot(diff(q1(1,:))/Ts);hold on;plot(thev(1,:)*180/pi);
subplot(2,2,2)
plot(diff(q1(2,:))/Ts);hold on;plot(thev(2,:)*180/pi);
subplot(2,2,3)
plot(diff(q1(3,:))/Ts);hold on;plot(thev(3,:)*180/pi);
subplot(2,2,4)
plot(diff(q1(4,:))/Ts);hold on;plot(thev(4,:)*180/pi);


%???;
figure(2);
subplot(2,2,1)
plot(diff(q1(1,:))/Ts-thev(1,2:length)*180/pi);
subplot(2,2,2)
plot(diff(q1(2,:))/Ts-thev(2,2:length)*180/pi);
subplot(2,2,3)
plot(diff(q1(3,:))/Ts-thev(3,2:length)*180/pi);
subplot(2,2,4)
plot(diff(q1(4,:))/Ts-thev(4,2:length)*180/pi);


%????;
figure(3);
subplot(2,2,1)
plot(cv(1,:));
subplot(2,2,2)
plot(cv(2,:));
subplot(2,2,3)
plot(cv(3,:));
subplot(2,2,4)
plot(cv(4,:));


