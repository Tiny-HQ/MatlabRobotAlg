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


%????;
P = [0 0 100];%z????;

R = [0.0474 0.9989 0.0027;
    -0.9989 0.0474 -0.0072;
    -0.0071 0.0030 0.99997];

P_BU = [1188 309.7 448.8]';



T = R*P'+P_BU



%?:
a = -87.282*(pi/180);
b = 0.405 *(pi/180);
c = -8.8939*(pi/180);

ca = cos(a);sa = sin(a);
cb = cos(b);sb = sin(b);
cc = cos(c);sc = sin(c);

R_BU = [ca*cb ca*sb*sc-sa*cc ca*sb*cc+sa*sc;
        sa*cb sa*sb*sc+ca*cc sa*sb*cc-ca*sc;
        -sb cb*sc cb*cc];

det(R_BU)

T = R_BU*P'+P_BU


%?;
% pb1 = [1188.0 309.7 448.8];
% pb2 = [1210.8 -170.7 445.4];
% pb3 = [1118.4 72.2 446.9];

pb1 = [865.0 0.0 540.0];
pb2 = [965.0 100.0 540.1];
pb3 = [865.0 100.0 540.2];

x = pb2-pb1;
sqrt(sum(x.^2))%pb1?pb2?????,???????x??????,?????pb2?;
x = x/sqrt(sum(x.^2));

temp = pb3-pb1;
temp = temp/sqrt(sum(temp.^2));

z = cross(x,temp);
z = z/sqrt(sum(z.^2));

y = cross(z,x);

R_ =[x;
    y;
    z;]'

T = R_*P'+P_BU















