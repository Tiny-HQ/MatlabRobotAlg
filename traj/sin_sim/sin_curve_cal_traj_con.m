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


function sin_curve_cal_traj_con(Disp,Vel,Acc,Jerk)
    %clc; 

    [t,jerk] = sin_sim_cal_param(Disp,Vel,Acc,Acc,Jerk);
%     [p,v,a,jerk] = s_curve_cal_pvaj_con(t,jerk,0.004);
    t(7)
    [p,v,a,jerk] = sin_sim_cal_pvaj(t,jerk,0.004);
    
    %plot(v(2:length(v))-diff(p)/0.004,'r');
    
%     display((length(p)));
%     figure;
%     plot(p,'g');
%     hold on;
    %v1(1) = 0.0;
%     v1 = v(1:length(v)-1);
%      plot(v1,'r');
%   
%      hold on;
%     plot(a,'b');
%     hold on;
%     plot(jerk)
%     figure;
%     plot(a);

%      plot(diff(p)/0.004);
    

%     p = p';
%     v = v';
%     a = a';
%     jerk = jerk';
%     
%     
%     ho = [p,v,a,jerk];
%     
%     save('test.txt','ho','-ascii');
    
    
    figure;
    subplot(4,1,1);
    plot(p);
%     ylabel('pos');
%     pp = p(5138:length(p)-1)
%     vv = v(5138:length(p)-1)
%     hold on;
%     plot(v,'r');


%     T = 0.0:0.004:t(7);
%     sum_no = length(T);
%     
%     v_ = diff(p)/0.004;
    
%     v_ = linspace(0,0,sum_no-2);
%     for i = 1:sum_no-2
%        v_(i) = p(i+1)-p(i); 
%     end
%     plot(v_(1:sum_no-2));
    hold on;
    subplot(4,1,2);
    plot(v);
%     ylabel('vel');
%     
% %     figure;
    subplot(4,1,3);
    plot(a);
%     ylabel('acc');
%     
%     j = diff(a)/0.004;
    subplot(4,1,4);
    plot(jerk);
%     xlabel('t');
%     ylabel('jerk');
%    figure;
%     plot(v);
%     ylabel('vel');

    
%     figure;
%     subplot(2,1,1)
%     plot(v);
%     ylabel('vel');
%     
%     subplot(2,1,2);
%     plot(a);
%     ylabel('acc');

end














