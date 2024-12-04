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
function T1 = SE3_to_se3(T)

    T1 = eye(4);

    R = T(1:3,1:3);
    p = T(1:3,4);
    so3 = SO3_to_so3(R);
    theta = acos((R(1,1) + R(2,2) + R(3,3) - 1.0) / 2.0);
    T1(1:3,1:3) = so3;
    temp = so3*so3;
    invg = eye(3) - 0.5*so3+(1/theta-0.5/tan(0.5*theta))*temp/theta;
    v = invg*p;
    T1(1:3,4) = v;

end