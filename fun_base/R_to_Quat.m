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
function [q] = R_to_Quat(T)

    [m,n] = size(T);
    if((m == 4)&&(n == 4))
        R = T(1:3,1:3);
    else
        R = T;
    end
    q = zeros(1,4);
    w = (htrace(R)+1)^0.5/2;
    if(abs(w)<eps)  
        x = (R(1,1)-R(2,2)-R(3,3)+1)^0.5/2;
        y = (-R(1,1)+R(2,2)-R(3,3)+1)^0.5/2;
        z = (-R(1,1)-R(2,2)+R(3,3)+1)^0.5/2;
    else
        x = (R(3,2) - R(2,3))/(4*w);
        y = (R(1,3) - R(3,1))/(4*w);
        z = (R(2,1) - R(1,2))/(4*w);
    end
    q(1) = w;
    q(2) = x;
    q(3) = y;
    q(4) = z;
end