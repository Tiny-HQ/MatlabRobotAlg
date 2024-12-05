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


function [t,a] = trape_cal_param(disp,vel,acc)




    t_lim = vel/acc;
    d_lim = t_lim*vel;
    
    if(d_lim>disp)
        
        ta = sqrt(disp/acc);
        tv = 0.0;
        
    else 
        ta = t_lim;
        tv = disp/vel-ta;

    end


    t(1) = ta;
    t(2) = t(1)+tv;
    t(3) = t(2)+ta;
    
    a = acc;


end











