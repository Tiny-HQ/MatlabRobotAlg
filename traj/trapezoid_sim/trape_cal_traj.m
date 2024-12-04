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





function trape_cal_traj(disp,vel,acc)


    global Ts;
    Ts = 0.004;

    [t,a] = trape_cal_param(disp,vel,acc);
    [p,v] = trape_cal_pvaj(t,a,Ts);
    
    t(1)
    t(2)
    t(3)
 
    
    display(length(p));
    
    
%     figure;
%     plot(p);
    figure;
    plot(v,'r');hold on ;

    
    v1 = diff(p)/Ts;
    
    hold on;
    plot(v1,'b');

    
    a1 = diff(v)/Ts;
%     figure;
    hold on;
    plot(a1);




end


















