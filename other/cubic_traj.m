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
%example2.7
clc
clear
%�켣�������� The trajectory defines the condition
t_array=[0,2,4,8,10];
q_array=[10,20,0,30,40];
v_array=[0,-10,10,3,0];
%����켣 Calculate trajectories
%��ʼλ�� Initial position
t=t_array(1);
q=q_array(1);
v=v_array(1);
%������ι켣 Calculate the trajectories of each segment
for k=1:length(t_array)-1
    %������ζ���ʽ��ϵ�� Calculate the coefficients for each segment polynomial
    h(k)=q_array(k+1)-q_array(k);
    T(k)=t_array(k+1)-t_array(k);
    a0(k)=q_array(k);
    a1(k)=v_array(k);
    a2(k)=(3*h(k)-(2*v_array(k)+v_array(k+1))*T(k))/(T(k)*T(k));
    a3(k)=(-2*h(k)+(v_array(k)+v_array(k+1))*T(k))/(T(k)*T(k)*T(k));

    %���ɸ��ι켣�ܻ������ݵ� Generate data points for each segment of the trajectory densification
    %�ֲ�ʱ������ Local time coordinates
    tau=t_array(k):T(k)/100:t_array(k+1);
    %ȫ��ʱ�����꣬�ɾֲ�ʱ��������� Global time coordinates, which consist of local time coordinates
    t=[t,tau(2:end)];
    %�ֲ�λ������ Local location coordinates
    qk=a0(k)+a1(k)*power(tau-tau(k),1)+a2(k)*power(tau-tau(k),2)+a3(k)*power(tau-tau(k),3);
    %ȫ��λ������ Global location coordinates
    q=[q,qk(2:end)];
    %�ٶ� vel
    vk=a1(k)+2*a2(k)*power(tau-tau(k),1)+3*a3(k)*power(tau-tau(k),2);
    v=[v,vk(2:end)];
    %���ٶ� acc
    acck=2*a2(k)+6*a3(k)*power(tau-tau(k),1);
    if(k==1)
        acc=2*a2(k);
    end
    acc=[acc,acck(2:end)];
end
%��ͼ plot
subplot(3,1,1);
h1=plot(t,q,'-r');
legend(h1,'��һ�ַ�ʽ')
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
