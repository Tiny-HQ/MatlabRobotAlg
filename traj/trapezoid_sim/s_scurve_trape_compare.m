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





function s_scurve_trape_compare(disp,vel,acc,jerk)


    global Ts;
    Ts = 0.004;

    format long g;


    [t,jerk] = s_curve_cal_param_con(disp,vel,acc,jerk);
    [p,v,a] = s_curve_cal_pvaj_con(t,jerk,Ts);
    
    display((length(p)));


    figure;
    plot(v,'r');




    [t1,a1] = trape_cal_param(disp,vel,acc);
    [p1,v1] = trape_cal_pvaj(t1,a1,Ts);
    display(length(p1));
    
    
    hold on ;
    plot(v1,'m');
    
    figure;
    plot(p,'b');
    hold on;
    plot(p1,'g');
    
%     v11 = diff(p1)/Ts;
%     figure;
%     plot(v11);


end











