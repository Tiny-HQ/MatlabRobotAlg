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


Ts = 0.004;

s = [0 30 60 20 -20 60];
t = [0 10 15 20 25 30];

v = [0 30 -60 -80 40 0];



counts = length(s);
ts = zeros(1,counts-1);
a =  zeros(1,counts-1);
b =  zeros(1,counts-1);
c =  zeros(1,counts-1);
d =  zeros(1,counts-1);

for i = 1:counts-1
    
    ts(i) = t(i+1)-t(i);
    a(i) = ((v(i)+v(i+1))*ts(i)+2*(s(i)-s(i+1)))/(ts(i)^3);
    b(i) = (3*(s(i+1)-s(i))-(2*v(i)+v(i+1))*ts(i))/(ts(i)^2);
    c(i) = v(i);
    d(i) = s(i);

end

si = [0:Ts:t(counts)];
len_s = 0;
for i = 1:counts-1

    
    ti = [0:Ts:t(i+1)-t(i)];
    s_t = a(i)*ti.^3+b(i)*ti.^2+c(i)*ti+d(i)*ones(1,length(ti));
    len = length(s_t);
    
    for j = 1:len
        si(len_s+j) = s_t(j); 
    end
    len_s = len_s+len;
end

plot(si);
hold on;
plot(t/Ts,s,'o');


[a1,b1,c1,d1] = c_spline_prm_calc_v2(t,s,0);
[x_] = c_spline_point_calc(a1,b1,c1,d1,t,Ts);

plot(x_);
plot(diff(diff(x_/Ts))/Ts)











