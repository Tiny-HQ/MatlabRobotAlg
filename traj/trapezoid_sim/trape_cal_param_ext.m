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




%?????????;

function [t,a,d] = trape_cal_param_ext(disp,vel,acc,dec)

    
    ta = vel/acc;
    td = vel/dec;
    
    sa = 0.5*acc*ta^2;
    sd = 0.5*dec*td^2;
    
    if(sa+sd>disp)
        t2 = 0;
        v = sqrt(2*disp/(1.0/acc+1.0/dec));
        t1 = v/acc;
        t3 = v/dec; 
    else
        t1 = ta;
        t3 = td;
        t2 = (disp-sa-sd)/vel;
    end
   
    t(1) = t1;
    t(2) = t(1)+t2;
    t(3) = t(2)+t3;
    
    a = acc;
    d = dec;

end














