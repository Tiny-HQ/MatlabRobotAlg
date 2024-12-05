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
function [point] = c_spline_point_calc(a,b,c,d,t,Ts)
    
    n = length(t);
    counts = (t(n)-t(1))/Ts;
    
    
    for i = 1:counts
       for j = 1:n-1
            if(t(j)<i*Ts)&&(i*Ts<=t(j+1))
                point(i) = d(j) + c(j)*(i*Ts-t(j))+b(j)*(i*Ts-t(j))^2 + a(j)*(i*Ts-t(j))^3;
            end
        end
        
        
    end
end