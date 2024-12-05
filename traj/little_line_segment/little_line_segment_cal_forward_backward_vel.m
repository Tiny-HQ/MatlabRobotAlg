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

function [vf,vb] = little_line_segment_cal_forward_backward_vel(P,a,J_max,v_start)

    [m,n] = size(P);
    dis = zeros(1,m-1);
    if (n == 2)
        for i = 1:m-1
           dis(i+1) = sqrt((P(i,1)-P(i+1,1))^2+(P(i,2)-P(i+1,2))^2);
        end
    elseif (n == 3)
        for i = 1:m-1
           dis(i+1) = sqrt((P(i,1)-P(i+1,1))^2+(P(i,2)-P(i+1,2))^2+(P(i,3)-P(i+1,3))^2);
        end
    end

    [vf,vb] = lls_cal_velocity(dis,a,J_max,v_start);
   
end