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

% �����ͣ���ʽ���㣬���� Continuous, formula calculation, no error;
%t t1~8���飻 arrary
%j Ϊjerk��
%t_int ʱ����  Time interval 
%�޸��ж���������4ms��������£���ֵ�Ĵ�С���޽ӽ������������ Modify the judgment condition, in the case of 4ms divisible, the magnitude of the values is infinitely close, but not equal



function [s,v,a,jerk] = s_curve_cal_pvaj_con_ext(t,j,t_int)

    T = 0.0:t_int:t(7);
    sum_no = length(T);
    
    a = linspace(0,0,sum_no);
    v = linspace(0,0,sum_no);
    s = linspace(0,0,sum_no-1);
    jerk = linspace(0,0,sum_no);

    
    delta_t = linspace(0,0,7);
    delta_t(1) = t(1)-0.0;
    delta_t(2) = t(2)-t(1);
    delta_t(3) = t(3)-t(2);
    delta_t(4) = t(4)-t(3);
    delta_t(5) = t(5)-t(4);
    delta_t(6) = t(6)-t(5);
    delta_t(7) = t(7)-t(6);
    
    %�м���̽ڵ��ٶ�; mid point vel
    am = j*t(1);
    v1 = 1/2*j*delta_t(1)^2;
    v2 = v1+am*delta_t(2);
    v3 = v2+am*delta_t(3)-1/2*j*delta_t(3)^2;
    v4 = v3;
    v5 = v4-1/2*j*delta_t(5)^2;
    v6 = v5-am*delta_t(6);
    
    %�м�ڵ�λ��; mid pooint position
    s1 = 1/6*j*delta_t(1)^3;
    s2 = s1+v1*delta_t(2)+1/2*am*delta_t(2)^2;
    s3 = s2+v2*delta_t(3)+1/2*am*delta_t(3)^2-1/6*j*delta_t(3)^3;
    s4 = s3+v3*delta_t(4);
    s5 = s4+v4*delta_t(5)-1/6*j*delta_t(5)^3;
    s6 = s5+v5*delta_t(6)-1/2*am*delta_t(6)^2;
    
    
    for i = 1:sum_no
%        abs(i*t_int-t(1))
       if (i*t_int >= 0) && ((i*t_int-t(1))<=0.0000001)
           temp_t = i*t_int;
           jerk(i) = j;
           a(i) = j*temp_t;
           v(i) = 1/2*j*temp_t^2;
           s(i) = 1/6*j*temp_t^3;
       elseif (i*t_int-t(2))<=0.0000001
           temp_t = i*t_int-t(1);
           jerk(i) = 0;
           a(i) = am;
           v(i) = v1+am*temp_t;
           s(i) = s1+v1*temp_t+1/2*am*temp_t^2;
       elseif (i*t_int-t(3))<=0.0000001
           temp_t = i*t_int-t(2);
           jerk(i) = -j;
           a(i) = am-j*temp_t;
           v(i) = v2+am*temp_t-1/2*j*temp_t^2;
           s(i) = s2+v2*temp_t+1/2*am*temp_t^2-1/6*j*temp_t^3;
       elseif (i*t_int-t(4))<=0.0000001
           temp_t = i*t_int-t(3);
           jerk(i) = 0;
           a(i) = 0;
           v(i) = v3;
           s(i) = s3+v3*temp_t;
       elseif (i*t_int-t(5))<=0.0000001
           temp_t = i*t_int-t(4);
           jerk(i) = -j;
           a(i) = -j*temp_t;
           v(i) = v4-1/2*j*temp_t^2;
           s(i) = s4+v4*temp_t-1/6*j*temp_t^3;
       elseif (i*t_int-t(6))<=0.0000001
           temp_t = i*t_int-t(5);
           jerk(i) = 0;
           a(i) = -am;
           v(i) = v5-am*temp_t;
           s(i) = s5+v5*temp_t-1/2*am*temp_t^2;
       elseif (i*t_int-t(7))<=0.0000001
            temp_t = i*t_int-t(6);
            jerk(i) = j;
            a(i) = -am+j*temp_t;
            v(i) = v6-am*temp_t+1/2*j*temp_t^2;
            s(i) = s6+v6*temp_t-1/2*am*temp_t^2+1/6*j*temp_t^3;
       else
            temp_t = t(7)-t(6);
            jerk(i) = 0;
            a(i) = 0;
            v(i) = 0;
            s(i) = s6+v6*temp_t-1/2*am*temp_t^2+1/6*j*temp_t^3;
       end 
    end  

end





