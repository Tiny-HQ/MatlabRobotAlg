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



function [flag] = compare_two_points_near(P1,P2,dis_near)

    
    if(abs(P1(1)-P2(1))>dis_near)
        flag = 0;
    elseif (abs(P1(2)-P2(2))>dis_near)
        flag = 0;
    elseif (abs(P1(3)-P2(3))>dis_near)
        flag = 0;
    elseif(sqrt(sum(P1-P2).^2)>dis_near)
        flag = 0;
    else
        flag = 1;
    end

end
