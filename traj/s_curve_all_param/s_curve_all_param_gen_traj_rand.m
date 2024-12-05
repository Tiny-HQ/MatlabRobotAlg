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


clc;clear;


 t_int = 0.001;

% %��ʼ�ٶȡ����ٶȶ��Ǵ������; The starting velocity and acceleration are all directional;
% s0 = 1000;
% s5 = 100;
% v0 = -50;
% v5 = -100;
% a0 = -100;
% a5 = 20;
% 
% 
% %�ٶȡ����ٶȡ����ٶ�������Ӱ�죬�ڲ��Ѿ����˴�����Ϊ�˷�����Σ��Է��������������������;% velocity, acceleration, deceleration have no positive and negative effects, and have been processed internally, in order to facilitate the filling of parameters, in case there is a problem with the positive and negative calculation of parameters;
% v = 7200;
% a = 2000;
% d = 5000;
% % 
% [t,w] = s_curve_all_param_cal_param(s0,s5,v0,v5,a0,a5,v,a,d);
% [s,v,a,jerk] = s_curve_all_param_cal_pvaj(t,w,t_int);
% subplot(4,1,1);
% plot(s,'g');
% subplot(4,1,2);
% plot(v,'b');
% subplot(4,1,3);
% plot(a,'r');
% subplot(4,1,4);
% plot(jerk,'m');




for i = 1:100


    s0 = (rand(1)-0.5)*2000;
    s5 = (rand(1)-0.5)*2000;
    v0 = (rand(1)-0.5)*1000;
    v5 = (rand(1)-0.5)*1000;
%     v0 = 0.0;
%     v5 = 0.0;
    a0 = (rand(1)-0.5)*10000;
    a5 = (rand(1)-0.5)*10000;
    
    v = rand(1)*1000;
    a = rand(1)*10000;
    d = rand(1)*10000;
    
    if((4*a+a0)<0)
        continue;
    end
    if((4*d+a5)<0)
        continue;
    end
    
    
    [t,w] = s_curve_all_param_cal_param(s0,s5,v0,v5,a0,a5,v,a,d);
    [s,v1,a1,jerk] = s_curve_all_param_cal_pvaj(t,w,t_int);
    subplot(4,1,1);
    plot(s,'g');
    subplot(4,1,2);
%     plot(v1,'b');hold on;
    plot(diff(s)/t_int);
    subplot(4,1,3);
    plot(a1,'r');
    subplot(4,1,4);
    plot(jerk,'m');

     
    pause(2);

end























