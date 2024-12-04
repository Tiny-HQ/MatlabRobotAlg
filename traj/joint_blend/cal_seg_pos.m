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



function [P,V,n] = cal_seg_pos(is_front,P1,P2,Vel,Acc,Jerk,Ts,tt)

    [t1,jerk]= s_curve_cal_param_con(abs(P1-P2),Vel(1),Acc(1),Jerk(1));
    [s1,v1,a1,jerk1] = s_curve_cal_pvaj_con(t1,jerk,Ts); 

%??tt?????tt????????;
    if(1 == is_front)

        
        n = floor(tt/Ts);
        P = zeros(1,n);
        for i = 1:n
           P(i) = sign(P2-P1)*s1(i)+P1; 
        end
        V = sign(P2-P1)*v1(n);
        
    elseif(0 == is_front)
        
        temp = ceil(tt/Ts);
        n = ceil((t1(7)-tt)/Ts);
        P = zeros(1,n);
        for i = 1:n
           P(i) = sign(P2-P1)*s1(temp+i)+P1; 
        end
         V = sign(P2-P1)*v1(temp+n);
    end











end





