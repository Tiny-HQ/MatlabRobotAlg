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

function [x_,y_,z_] = threep_spline_cal_traj(a,b,c,d,t,Ts)

    
    n = length(t);
    counts = t(n)/Ts;
    
    
    for i = 1:counts
       for j = 1:n-1
            if(t(j)<i*Ts)&&(i*Ts<=t(j+1))
                x_(i) = a.ax(j)+b.bx(j)*(i*Ts-t(j))+c.cx(j)*(i*Ts-t(j))^2+d.dx(j)*(i*Ts-t(j))^3;
                y_(i) = a.ay(j)+b.by(j)*(i*Ts-t(j))+c.cy(j)*(i*Ts-t(j))^2+d.dy(j)*(i*Ts-t(j))^3;
                z_(i) = a.az(j)+b.bz(j)*(i*Ts-t(j))+c.cz(j)*(i*Ts-t(j))^2+d.dz(j)*(i*Ts-t(j))^3;
            end
        end
        
        
    end
    


end















