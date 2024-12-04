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
clc;
clear;

Disp = 10;
Vel = 600;
Acc = 3354;
Jerk = 33540;



    [t,jerk] = s_curve_cal_param_con(Disp,Vel,Acc,Jerk);
%     [p,v,a,jerk] = s_curve_cal_pvaj_con(t,jerk,0.004);


    
    [p,v,a,jerk] = s_curve_cal_pvaj_con_ext(t,jerk,0.004);




    figure;
    subplot(4,1,1);
    plot(p);

    subplot(4,1,2);
    plot(v);



    subplot(4,1,3);
    plot(a);

    subplot(4,1,4);
    plot(jerk);











