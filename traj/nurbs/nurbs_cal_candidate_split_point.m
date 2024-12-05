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

function [k] = nurbs_cal_candidate_split_point(V_max,A_max,J_max,k_c)

    kv = A_max/V_max^2;
    ka = sqrt(J_max/V_max^3);
    k_t = zeros(1,1000);
    count = 1;
    for i = 1:length(k_c)-2
        if ((k_c(i+1)>=k_c(i))&&(k_c(i+1)>=k_c(i+2)))
            if((k_c(i+1)>=kv)&&(k_c(i+1)>=ka)&&(i~=length(k_c)-2))
                k_t(count) = (i+1);
                count = count+1;
            end
        end
    end
    k = zeros(1,count-1);
    k(1:count-1) = k_t(1:count-1);
end