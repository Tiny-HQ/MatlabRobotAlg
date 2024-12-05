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


D = -30;
J = 30000;%���� scalar



% for i = 1:100
%     
%     %�������������㷨�Ƿ�ok; Use random numbers to detect whether the algorithm is OK;
%     V = rand(1)*2000-1000 ; 
%     A = rand(1)*2000-1000; A_set = rand(1)*2000;
%   
%    
%     [t] = stop_cal_param_entire(V,A,A_set,J);
% 
%     [p,v,a,jerk] = stop_cal_pvaj_entire(t,J,V,A,D);
%  
%  
%     clf; subplot(4,1,1);plot(p,'b');grid on;hold on;
%     subplot(4,1,2);plot(v,'r');grid on;hold on;
%     subplot(4,1,3);plot(a,'g');grid on;hold on;
%     subplot(4,1,4);plot(jerk,'g');grid on;hold on; pause(1);
% end


%V = -200*sign(rand(1)) ;
V = 1000;
A = 674; 
A_set = 1186;
J = 3183;%����
[t] = stop_cal_param_entire(V,A,A_set,J);

[p,v,a,jerk] = stop_cal_pvaj_entire(t,J,V,A,D);
figure;
subplot(3,2,1);plot(v,'r');grid on;
subplot(3,2,3);plot(a,'g');grid on;
subplot(3,2,5);plot(jerk,'b');grid on;

V = 100;
A = 674; 
A_set = 1186;
J = 3183;%����
[t] = stop_cal_param_entire(V,A,A_set,J);
[p,v,a,jerk] = stop_cal_pvaj_entire(t,J,V,A,D);
subplot(3,2,2);plot(v,'r');grid on;
subplot(3,2,4);plot(a,'g');grid on;
subplot(3,2,6);plot(jerk,'b');grid on;


figure;

V = -20;
A = 674; 
A_set = 1186;
J = 3183;%����
[t] = stop_cal_param_entire(V,A,A_set,J);
[p,v,a,jerk] = stop_cal_pvaj_entire(t,J,V,A,D);
subplot(6,2,1);plot(v,'r');grid on;
subplot(6,2,3);plot(a,'g');grid on;
subplot(6,2,5);plot(jerk,'b');grid on;


V = 500;
A = -1674; 
A_set = 1186;
J = 3183;%����
[t] = stop_cal_param_entire(V,A,A_set,J);
[p,v,a,jerk] = stop_cal_pvaj_entire(t,J,V,A,D);
subplot(6,2,2);plot(v,'r');grid on;
subplot(6,2,4);plot(a,'g');grid on;
subplot(6,2,6);plot(jerk,'b');grid on;


V = -100;
A = 674; 
A_set = 1186;
J = 3183;%����
[t] = stop_cal_param_entire(V,A,A_set,J);
[p,v,a,jerk] = stop_cal_pvaj_entire(t,J,V,A,D);

subplot(6,2,7);plot(v,'r');grid on;
subplot(6,2,9);plot(a,'g');grid on;
subplot(6,2,11);plot(jerk,'b');grid on;

V = -400;
A = 674; 
A_set = 1186;
J = 3183;%����
[t] = stop_cal_param_entire(V,A,A_set,J);
[p,v,a,jerk] = stop_cal_pvaj_entire(t,J,V,A,D);
subplot(6,2,8);plot(v,'r');grid on;
subplot(6,2,10);plot(a,'g');grid on;
subplot(6,2,12);plot(jerk,'b');grid on;



