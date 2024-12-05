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
function [R] = Quat_to_R(q)

    %q = w+xi+yj+zk;
    %||q|| = x^2+y^2+z^2+w^2 = 1;   
    w = q(1);
    x = q(2);
    y = q(3);
    z = q(4);
   
    R = zeros(3,3);
    R(1,1) = 1-2*y^2-2*z^2;     R(1,2) = 2*x*y-2*z*w;       R(1,3) = 2*x*z+2*y*w;
    R(2,1) = 2*x*y+2*z*w;       R(2,2) = 1-2*x^2-2*z^2;     R(2,3) = 2*y*z-2*x*w;
    R(3,1) = 2*x*z-2*y*w;       R(3,2) = 2*y*z+2*x*w;       R(3,3) = 1-2*x^2-2*y^2;

end

