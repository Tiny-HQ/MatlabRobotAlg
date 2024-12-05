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
function [q] = slerp(q1,q2,t)

    eeps = 0.001;
    cosa = sum(q1.*q2);
    
    k0 = 0.0;
    k1 = 0.0;
    
    if(cosa<eeps)
       q2 = -q2; 
    end
    
    if(cosa>1-eeps)
        k0 = 1-t;
        k1 = t;
        
    else
        sina = sqrt(1-cosa*cosa);
        a = atan2(sina,cosa);
        k0 = sin((1-t)*a)/sina;
        k1 = sin(t*a)/sina;
    end

    q = k0*q1+k1*q2;




end



