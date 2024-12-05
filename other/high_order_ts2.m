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


J = 1000;
M = (1/2-3^0.5/6);
DT = ((60*M-180*M^2+120*M^3)/J)^(1/3);



t = 0:0.0001:DT;


j = 60*t/DT^4-180*t.^2/DT^5+120*t.^3/DT^6;
a = 30*t.^2/DT^4-60*t.^3/DT^5+30*t.^4/DT^6;
v = 10*t.^3/DT^4-15*t.^4/DT^5+6*t.^5/DT^6;
s = 2.5*t.^4/DT^4-3*t.^5/DT^5+t.^6/DT^6;

% subplot(4,1,1);
% plot(t,s);
% subplot(4,1,2);
% plot(t,v);%hold on;plot(diff(s)/0.001);
% subplot(4,1,3);
% plot(t,a);%hold on;plot(diff(v)/0.001);
% subplot(4,1,4);
% plot(t,j);%hold on;plot(diff(a)/0.001);

subplot(2,1,1);
plot(a);
subplot(2,1,2);
plot(j);


% j = 32/3*t- 32*t.^2+64/3*t.^3;
% figure;
% plot(j);



am = 30/(16*DT^2);
vm = 1/DT;
sm = J*DT^3/(60*M-180*M^2+120*M^3)




















