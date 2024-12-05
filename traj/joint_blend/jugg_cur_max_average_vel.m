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

function [t,v] = jugg_cur_max_average_vel(i,n,p1,p2,Vel,Acc,Jerk,t_int)

    t = [0 0 0];
    dis = abs(p1-p2);

    [t1,jerk]= s_curve_cal_param_con(dis,Vel,Acc,Jerk);
    [s1,v1,a1,jerk1] = s_curve_cal_pvaj_con(t1,jerk,t_int);     %���ﲻ��Ҫȫ�������ֻ��Ҫ���м�t/2ʱ���ٶȼ���;Here you don't need to find it all, just ask for the speed at the middle t/2;
    t_mid = t1(7)/2;
    v = sign(p2-p1)*v1(ceil(t_mid/t_int));
    t_ = dis/abs(v);
    n1 = ceil(t_/t_int);
    v = sign(p2-p1)*dis/(n1*t_int);
    if(i == 1)
        t(1) = t1(3);
        t(2) = t1(4);
        t(3) = t1(7);
    elseif(i == n)
        t(1) = t1(3);
        t(2) = t1(4);
        t(3) = t1(7);
    else
        t_acc = t1(3);
        t_dec = t1(7)-t1(4);

        if(t_acc+t_dec>t_)      %��Ȼt�����٣�����Ҳ�ֳ����Σ�ԭ���ļ��٣����ٶ�ʱ�䱣��; Although t is a constant velocity, it is also divided into three stages, and the original acceleration and deceleration periods are retained;
            t(1) = t_/2.0;
            t(2) = t(1);
            t(3) = t(2)+t_/2.0;
        else
            t(1) = t_acc;
            t(2) = t_-t_dec;
            t(3) = t_;
        end

    end


end
