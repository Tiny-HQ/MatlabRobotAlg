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
%example2.7
clc
clear
%轨迹定义条件 The trajectory defines the condition
t_array=[0,2,4,8,10];
q_array=[10,20,0,30,40];
v_array=[0,-10,10,3,0];
%计算轨迹 Calculate trajectories
%初始位置 Initial position
t=t_array(1);
q=q_array(1);
v=v_array(1);
%计算各段轨迹 Calculate the trajectories of each segment
for k=1:length(t_array)-1
    %计算各段多项式的系数 Calculate the coefficients for each segment polynomial
    h(k)=q_array(k+1)-q_array(k);
    T(k)=t_array(k+1)-t_array(k);
    a0(k)=q_array(k);
    a1(k)=v_array(k);
    a2(k)=(3*h(k)-(2*v_array(k)+v_array(k+1))*T(k))/(T(k)*T(k));
    a3(k)=(-2*h(k)+(v_array(k)+v_array(k+1))*T(k))/(T(k)*T(k)*T(k));

    %生成各段轨迹密化的数据点 Generate data points for each segment of the trajectory densification
    %局部时间坐标 Local time coordinates
    tau=t_array(k):T(k)/100:t_array(k+1);
    %全局时间坐标，由局部时间坐标组成 Global time coordinates, which consist of local time coordinates
    t=[t,tau(2:end)];
    %局部位置坐标 Local location coordinates
    qk=a0(k)+a1(k)*power(tau-tau(k),1)+a2(k)*power(tau-tau(k),2)+a3(k)*power(tau-tau(k),3);
    %全局位置坐标 Global location coordinates
    q=[q,qk(2:end)];
    %速度 vel
    vk=a1(k)+2*a2(k)*power(tau-tau(k),1)+3*a3(k)*power(tau-tau(k),2);
    v=[v,vk(2:end)];
    %加速度 acc
    acck=2*a2(k)+6*a3(k)*power(tau-tau(k),1);
    if(k==1)
        acc=2*a2(k);
    end
    acc=[acc,acck(2:end)];
end
%绘图 plot
subplot(3,1,1);
h1=plot(t,q,'-r');
legend(h1,'第一种方式')
hold on;
plot(t_array,q_array,'or');
axis([0,10,-5,45]);
ylabel('position')
grid on;
subplot(3,1,2);
plot(t_array,v_array,'ob');
hold on;
plot(t,v,'b');
axis([0,10,-20,15]);
ylabel('velocity')
grid on;
subplot(3,1,3);
plot(t,acc,'g');
hold on
axis([0,10,-45,45]);
ylabel('acceleration')
grid on;
