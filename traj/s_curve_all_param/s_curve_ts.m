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

s0 = 10;
v0 = -100;
v2 = -150;
a0 = -100;
a2 = 0;
a1 = 10;


t02 = 6*(v2-v0)/(4*a1+a2+a0)
%t02 = abs(t02);
w0 = s0;
w1 = v0;
w2 = a0/2;
w3 = (4*a1-a2-3*a0)/6/t02;
w4 = (a0-2*a1+a2)/6/t02^2;
%     t02 = abs(t02);

w1*t02+w2*t02^2+w3*t02^3+w4*t02^4

   t_int = 0.001;
  
    T = 0.0:t_int:abs(t02);
    sum_no = length(T);
    a = linspace(0,0,sum_no);
    v = linspace(0,0,sum_no);
    s = linspace(0,0,sum_no-1);
    jerk = linspace(0,0,sum_no);
    for i = 1:sum_no
        temp_t = i*t_int;
        jerk(i) =( 6*w3+24*w4*temp_t);
        a(i) =( 2*w2+6*w3*temp_t+12*w4*temp_t^2);
        v(i) = w1+2*w2*temp_t+3*w3*temp_t^2+4*w4*temp_t^3;
        ss = w0+w1*temp_t+w2*temp_t^2+w3*temp_t^3+w4*temp_t^4;  
        %s(i) = 2*w0 - ss;
        s(i) = ss;
    end
      figure;
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








