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
clear
clc
% Acc=load('acceleration.txt');
% Vel=load('Velocity.txt');
% Ang=load('Angle.txt');
% torque=load('torque.txt');

dt=0.01;
t=0:dt:5;
J1=0.4*sin(t);V1=0.4*sin(t+pi/2);A1=0.4*sin(t+pi);

hipAng=J1;hipVel=V1;hipAcc=A1;
J1=0.4*sin(t);V1=0.4*sin(t+pi/2);A1=0.4*sin(t+pi);
kneeAng=1*J1-pi/2;kneeVel=1*V1;kneeAcc=1*A1;
% t=0:0.01:(length(hipAng)-1)*0.01;t=t';

hipAng=1*[t',hipAng'];hipVel=1*[t',hipVel'];hipAcc=1*[t',hipAcc'];
kneeAng=[t',kneeAng'];kneeVel=[t',kneeVel'];kneeAcc=[t',kneeAcc'];

% W=70;H=1.75;
% m1=W*0.0946;m2=W*0.042;
% l1=0.232*H;l2=0.247*H;
m1=1;l1=1;
m2=1;l2=1;

t1=[1/12 0 0
             0   1/12 0
             0   0 0.1/12]';

t2=[0.1/12 0 0
             0   1/12 0
             0   0 1/12]';






% plot(kneeAng(:,end))
% hold on
% plot(ScopeData1.signals.values,'r')