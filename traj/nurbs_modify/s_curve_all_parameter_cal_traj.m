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




function [s_,v_,a_,jerk_,t_d] = s_curve_all_parameter_cal_traj(t,t_int,j,vs,ss,t_s)

    T = t_s:t_int:t(7);
    sum_no = length(T)-1;
    
    a = linspace(0,0,sum_no);
    v = linspace(0,0,sum_no);
    s = linspace(0,0,sum_no);
    jerk = linspace(0,0,sum_no);

    
    delta_t = linspace(0,0,7);
    delta_t(1) = t(1)-0.0;
    delta_t(2) = t(2)-t(1);
    delta_t(3) = t(3)-t(2);
    delta_t(4) = t(4)-t(3);
    delta_t(5) = t(5)-t(4);
    delta_t(6) = t(6)-t(5);
    delta_t(7) = t(7)-t(6);
    
    %中间过程节点速度;mid point vel
    am = j*t(1);dm = j*delta_t(7);
    v1 = vs+1/2*j*delta_t(1)^2;
    v2 = v1+am*delta_t(2);
    v3 = v2+am*delta_t(3)-1/2*j*delta_t(3)^2;
    v4 = v3;
    v5 = v4-1/2*j*delta_t(5)^2;
    v6 = v5-dm*delta_t(6);
    
    %中间节点位置;mid point position
    s1 = ss+vs*delta_t(1)+1/6*j*delta_t(1)^3;
    s2 = s1+v1*delta_t(2)+1/2*am*delta_t(2)^2;
    s3 = s2+v2*delta_t(3)+1/2*am*delta_t(3)^2-1/6*j*delta_t(3)^3;
    s4 = s3+v3*delta_t(4);
    s5 = s4+v4*delta_t(5)-1/6*j*delta_t(5)^3;
    s6 = s5+v5*delta_t(6)-1/2*dm*delta_t(6)^2;
    
    
    for i = 1:sum_no
    %        abs(i*t_int-t(1))
%         if ((t_s>=0)&&(i==1))
%            temp_t = t_s;
%            jerk(i) = j;
%            a(i) = j*temp_t;
%            v(i) = vs+1/2*j*temp_t^2;
%            s(i) = ss+vs*temp_t+1/6*j*temp_t^3;
%         else
       if (t_s+i*t_int >= 0) && ((t_s+i*t_int-t(1))<=0.0000001)
           temp_t = t_s+i*t_int;
           jerk(i) = j;
           a(i) = j*temp_t;
           v(i) = vs+1/2*j*temp_t^2;
           s(i) = ss+vs*temp_t+1/6*j*temp_t^3;
       elseif (t_s+i*t_int-t(2))<=0.0000001
           temp_t = t_s+i*t_int-t(1);
           jerk(i) = 0;
           a(i) = am;
           v(i) = v1+am*temp_t;
           s(i) = s1+v1*temp_t+1/2*am*temp_t^2;
       elseif (t_s+i*t_int-t(3))<=0.0000001
           temp_t = t_s+i*t_int-t(2);
           jerk(i) = -j;
           a(i) = am-j*temp_t;
           v(i) = v2+am*temp_t-1/2*j*temp_t^2;
           s(i) = s2+v2*temp_t+1/2*am*temp_t^2-1/6*j*temp_t^3;
       elseif (t_s+i*t_int-t(4))<=0.0000001
           temp_t = t_s+i*t_int-t(3);
           jerk(i) = 0;
           a(i) = 0;
           v(i) = v3;
           s(i) = s3+v3*temp_t;
       elseif (t_s+i*t_int-t(5))<=0.0000001
           temp_t = t_s+i*t_int-t(4);
           jerk(i) = -j;
           a(i) = -j*temp_t;
           v(i) = v4-1/2*j*temp_t^2;
           s(i) = s4+v4*temp_t-1/6*j*temp_t^3;
       elseif (t_s+i*t_int-t(6))<=0.0000001
           temp_t = t_s+i*t_int-t(5);
           jerk(i) = 0;
           a(i) = -dm;
           v(i) = v5-dm*temp_t;
           s(i) = s5+v5*temp_t-1/2*dm*temp_t^2;
       elseif (t_s+i*t_int-t(7))<=0.0000001
            temp_t = t_s+i*t_int-t(6);
            jerk(i) = j;
            a(i) = -dm+j*temp_t;
            v(i) = v6-dm*temp_t+1/2*j*temp_t^2;
            s(i) = s6+v6*temp_t-1/2*dm*temp_t^2+1/6*j*temp_t^3;
       else
           %at the end of traj,time should be change to suit next block..  
            temp_t = t(7)-t(6);
%             aa = -dm+j*temp_t;
%             vv = v6-dm*temp_t+1/2*j*temp_t^2;
            %ss = s6+v6*temp_t-1/2*dm*temp_t^2+1/6*j*temp_t^3;
            %t_d = (ss-s(i-1))/v(i-1);
       end 
    end  
    temp_t = t(7)-t(6);
    %ss = s6+v6*temp_t-1/2*dm*temp_t^2+1/6*j*temp_t^3;
    if(sum_no <= 0)
        t_d = 0;
    else
        t_d = t_int-(s6+v6*temp_t-1/2*dm*temp_t^2+1/6*j*temp_t^3-s(sum_no))/v(sum_no);
    end
    
    %            temp_t = t_s;
%            jerk(i) = j;
%            a(i) = j*temp_t;
%            v(i) = vs+1/2*j*temp_t^2;
%            s(i) = ss+vs*temp_t+1/6*j*temp_t^3;
    temp_t = t_s;
    s_ = zeros(1,sum_no+1);s_(1) =  ss+vs*temp_t+1/6*j*temp_t^3;
    v_ = zeros(1,sum_no+1);v_(1) = vs+1/2*j*temp_t^2;
    a_ = zeros(1,sum_no+1);a_(1) = j*temp_t;
    jerk_ = zeros(1,sum_no+1);jerk_(1) = j;
    
    s_(2:sum_no+1) = s;
    v_(2:sum_no+1) = v;
    a_(2:sum_no+1) = a;
    jerk_(2:sum_no+1) = jerk;
    
end
