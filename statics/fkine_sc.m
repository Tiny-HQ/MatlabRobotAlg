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


function T = fkine_sc(sc,T_home,theta)


    [m,n] = size(sc);
    axis_no = n;
    T = eye(4);
    
    for i = 1:axis_no
       T = T*ew(sc(1:3,i)',sc(4:6,i)',theta(i)); 
    end

    T = T*T_home;


end
