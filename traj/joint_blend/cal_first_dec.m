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



function [p,v,a,n] = cal_first_dec(P1,P2,Vel,Acc,Jerk,Ts)



    [t1,jerk]= s_curve_cal_param_con(abs(P1-P2),Vel,Acc,Jerk);
    [s1,v1,a1,jerk1] = s_curve_cal_pvaj_con(t1,jerk,Ts); 


    n = ceil(t1(4)/Ts);
    p = sign(P2-P1)*s1(n)+P1;
    v = sign(P2-P1)*v1(n);
    a = sign(P2-P1)*a1(n);











end












