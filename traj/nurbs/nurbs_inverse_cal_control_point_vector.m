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

function [nvec] = nurbs_inverse_cal_control_point_vector(n,m,p,u)

    nvec = zeros(1,n+2*p+2);
    d = (m-1)/(n-1);
     for j = 1:n
        i = floor(j*d-0.000001);
        alp = j*d-i;
        if(i+1>m)
            i = m-1;
            alp = 0;
        end
        nvec(j+p+1) = (1-alp)*u(i+1)+alp*u(i);
     end
    for i = 1:p+1
       nvec(p+n+i+1) = 1; 
    end


end
