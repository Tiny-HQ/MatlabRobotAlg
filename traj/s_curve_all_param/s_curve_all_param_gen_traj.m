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


clc;clear;


 t_int = 0.001;

%起始速度、加速度都是带方向的; The starting velocity and acceleration are all directional;
% s0 =  912.642766770674;
% s5 =  595.367420078564;
% v0 =  486.763908416897;
% v5 =  -63.307587037453;
% a0 =  -1553.76843155755;
% a5 =  -4511.464494904067;
s0 =  -90;
s5 =  90;
v0 =  0;
v5 =  0;
a0 =  900;
a5 =  -900;


%速度、加速度、减速度正反无影响，内部已经做了处理，为了方便填参，以防参数正反计算出现问题;Velocity, acceleration, deceleration have no positive and negative effects, and have been processed internally, in order to facilitate the filling of parameters, in case there is a problem with the positive and negative calculation of parameters;
v =  360;
a =  1800;
d =  1800;
% 
[t,w] = s_curve_all_param_cal_param(s0,s5,v0,v5,a0,a5,v,a,d);
[s,v,a,jerk] = s_curve_all_param_cal_pvaj(t,w,t_int);
subplot(4,1,1);
plot(s,'g');
subplot(4,1,2);
plot(diff(s)/t_int);hold on;
plot(v,'b');
subplot(4,1,3);
plot(diff(v)/t_int);hold on;
plot(a,'r');
subplot(4,1,4);
plot(diff(a)/t_int);hold on;
plot(jerk,'m');


% figure;
% plot(s);
% hold on ;
% plot(diff(s/t_int));
% 
% for i = 1:100
% 
%     S = rand(1)*100;
%     V = rand(1)*100;
%     A = rand(1)*100;
%     J = rand(1)*1000;
%     
%     
%     [t,j] = s_curve_4order_cal_param(S,V,A,J);
%     [s,v,a,jerk,dj] = s_curve_4order_cal_pvaj(t,j,t_int);
%     subplot(5,1,1);
%     plot(s,'g');
%     subplot(5,1,2);
%     plot(v,'b');
%     subplot(5,1,3);
%     plot(a,'r');
%     subplot(5,1,4);
%     plot(jerk,'bl');
%     subplot(5,1,5);
%     plot(dj,'y');  
%     
%         
%     pause(0.5);
% 
% end























