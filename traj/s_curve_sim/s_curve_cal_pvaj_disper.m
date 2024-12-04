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
% 离散型，积分求解，有误差； Discrete, integral solving, with errors;
%t t1~8数组；arrary
%j 为jerk；
%t_int 时间间隔  Time interval



function [p,v,a,jerk] = s_curve_cal_pvaj_disper(n,j)


    sum_no = n(7);
    global Ts;
    
    if j<=0
        return;
    end
    
%     a(1) = 0.0;
%     v(1) = 0.0;
%     p(1) = 0.0;

%     p = zeros(sum_no);
%     v = zeros(sum_no);
%     a = zeros(sum_no);
    p = linspace(0,0,sum_no);
    v = linspace(0,0,sum_no);
    a = linspace(0,0,sum_no);
    jerk = linspace(0,0,sum_no);

    for i = 1:sum_no
       if (i<=n(1))
           newj = j;
       elseif i <= n(2)
           newj = 0;
       elseif i <= n(3)
           newj = -j;
       elseif i <= n(4)
           newj = 0;
       elseif i <= n(5)
           newj = -j;
       elseif i <= n(6)
           newj = 0;
       elseif i <= n(7)
           newj = j;
       else
           newj = 0;
       end
       %积分
       jerk(i+1) = newj;
       a(i+1) = a(i) + Ts*newj;
       v(i+1) = v(i) + a(i+1)*Ts;
       p(i+1) = p(i) + v(i+1)*Ts;
    end

end

















