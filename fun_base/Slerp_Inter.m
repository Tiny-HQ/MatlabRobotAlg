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
function [q] = Slerp_Inter(q1,q2,lambda)

    cosa = q1(1)*q2(1)+q1(2)*q2(2)+q1(3)*q2(3)+q1(4)*q2(4);
    k0 = 0.0;
    k1 = 0.0;
    
    if(cosa<0)
        cosa = -cosa;
        q2 = -q2;
    end

    if(cosa>(1-eps))
        k0 = 1-lambda;
        k1 = lambda;        
    else
        sina = sqrt(1-cosa*cosa);
        a = atan2(sina,cosa);
        
        k0 = sin((1-lambda)*a)/sina;
        k1 = sin(lambda*a)/sina;
       
    end

    q(1) = k0*q1(1)+k1*q2(1);
    q(2) = k0*q1(2)+k1*q2(2);
    q(3) = k0*q1(3)+k1*q2(3);
    q(4) = k0*q1(4)+k1*q2(4);

end