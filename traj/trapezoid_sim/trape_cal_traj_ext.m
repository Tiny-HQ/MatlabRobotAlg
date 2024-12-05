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



function trape_cal_traj_ext(disp,vel,acc,dec)

    global Ts;
    Ts = 0.004;

    [t,a,d] = trape_cal_param_ext(disp,vel,acc,dec);
    [p,v,A] = trape_cal_pvaj_ext(t,acc,dec,Ts);
    
    display(length(p));
    
    

    figure;
    subplot(3,1,1);
    plot(p);
    subplot(3,1,2);
    plot(v);%hold on;plot(diff(p)/Ts);
    subplot(3,1,3);
    plot(A);%hold on;plot(diff(v)/Ts);
    

end
