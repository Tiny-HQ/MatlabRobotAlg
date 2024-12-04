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



t = 0:0.0001:1;





for c = 5:20
    
    b = -2*c;
    a = c;


    A = a*t.^2+b*t.^3+c*t.^4;
    
    
    J = 2*a*t+3*b*t.^2+4*c*t.^3;


    subplot(2,1,1);
    hold on ;plot(A);
    subplot(2,1,2);
    hold on ;plot(J);









end






