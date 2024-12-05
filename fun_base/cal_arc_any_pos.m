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
function [x] = cal_arc_any_pos(C,A,B,r,theta_c)


    Ac = A-C; AB = B-A;
    n = normal(Ac); z = cross(Ac,AB);a =normal(z);
    o = cross(a,n);
    T = eye(4);
    T(1:3,1) = n';T(1:3,2) = o';T(1:3,3) = a';T(1:3,4) = C';

    P_c = [cos(theta_c)*r sin(theta_c)*r 0 1];
    Temp = T*P_c';
    x = Temp(1:3);


end
