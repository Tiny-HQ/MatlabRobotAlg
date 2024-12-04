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

%??????;????





clc;
clear;

x = [0 0.5 1.0];
y = [0.0 125 1000];

Ts = 0.004;
counts = x(3)/Ts;


h0 = x(2)-x(1);
h1 = x(3)-x(2);

y0 = y(1);
y1 = y(2);
y2 = y(3);

A = 0.0;
B = 0.0;

T = [2*h0 h0 0;h0 2*(h0+h1) h1;0 h1 2*h1];
V = 6*[(y1-y0)/h0-A;(y2-y1)/h1-(y1-y0)/h0;B-(y2-y1)/h1];

m = T\V;


a0 = y0;
b0 = (y1-y0)/h0-1/3*m(1)*h0-1/6*m(2)*h0;
c0 = m(1)/2;
d0 = (m(2)-m(1))/(6*h0);


a1 = y1;
b1 = (y2-y1)/h1-1/3*m(2)*h1-1/6*m(3)*h1;
c1 = m(2)/2;
d1 = (m(3)-m(2))/(6*h1);


for i = 1:counts

    if (i*Ts>x(1))&&(i*Ts<=x(2))
        t(i) = i;
        s(i) = a0+b0*(i*Ts-x(1))+c0*(i*Ts-x(1))^2+d0*((i*Ts-x(1))^3);
    elseif i*Ts<=x(3)
        t(i) = i;
        s(i) = a1+b1*(i*Ts-x(2))+c1*(i*Ts-x(2))^2+d1*((i*Ts-x(2))^3);
    end
end

x1 = 250*x;
figure;
plot(t,s,x1,y,'o');
figure;
plot(diff(s)/Ts);

figure;
plot(diff(diff(s)/Ts)/Ts);




