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
function [x] = cal_4_order_func(a,b,c,d,e)
    p1 = 2*c^3-9*b*c*d+27*a*d^2+27*b^2*e-72*a*c*e;
    p2 = p1+sqrt(-4*(c^2-3*b*d+12*a*e)^3+p1^2);
    p3 = (c^2-3*b*d+12*a*e)/(3*a*(0.5*p2)^(1/3))+(0.5*p2)^(1/3)/(3*a);
    p4 = sqrt(b^2/(4*a^2)-2*c/(3*a)+p3);
    p5 = b^2/(2*a^2)-4*c/(3*a)-p3;  
    p6 = (-b^3/a^3+4*b*c/a^2-8*d/a)/(4*p4);
   x = zeros(1,4);
   x(1) = -b/(4*a)-p4/2-(p5-p6)^0.5/2;
   x(2) = -b/(4*a)-p4/2+(p5-p6)^0.5/2;
   x(3) = -b/(4*a)+p4/2-(p5+p6)^0.5/2;
   x(4) = -b/(4*a)+p4/2+(p5+p6)^0.5/2;
end


