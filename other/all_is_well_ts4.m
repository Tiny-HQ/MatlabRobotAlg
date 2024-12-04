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

N = 1000;
u = pi/180;
L1 = 225;
L2 = 175;


for i1 = 1:12:360
    for i2 = 1:1:360
        x(i1,i2) = L1*cos(i1*u)+L2*cos((i1+i2)*u);
        y(i1,i2) = L1*sin(i1*u)+L2*sin((i1+i2)*u);
        
        
    end
    plot(x(i1,:),y(i1,:),'r');hold on;
end


% 
% for i = 1:N
%     i1 = rand()*360;
%     i2 = rand()*360;
% 
%     x(i) = L1*cos(i1*u)+L2*cos((i1+i2)*u);
%     y(i) = L1*sin(i1*u)+L2*sin((i1+i2)*u);
% 
% end






