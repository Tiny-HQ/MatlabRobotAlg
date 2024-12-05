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


function s_curve_cal_traj_disper(Disp,Vel,Acc,Jerk)


    [n,jerk] = s_curve_cal_param_disper(Disp,Vel,Acc,Jerk);
    
    [p,v,a,jerk] = s_curve_cal_pvaj_disper(n,jerk);
    
%     p = p';
%     v = v';
%     a = a';
%     jerk = jerk';
%     
%      ho = [p,v,a,jerk];
% %     
%      save('test.txt','ho','-ascii');
    
%     pp = p(5138:length(p)-1)
%     vv = v(5138:length(p)-1)
%     hold on;
%     
%     format long g
%     display((length(p)));
     figure;
     subplot(4,1,1);
     plot(p);
    subplot(4,1,2);
    plot(v,'b');
    hold on;
    plot(diff(p)/0.004);
    
   subplot(4,1,3);
    plot(a);
    subplot(4,1,4)
    plot(jerk);

end