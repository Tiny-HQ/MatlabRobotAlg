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
%AΪ��ǰ���ٶ�;
%������дһ�棬�ṩĿ����ٶ�;
%A is the current acceleration;
% can also write a version that provides target deceleration;


function [t,jerk] = stop_cal_param_sim_standard(V,A,J)

    
    %A?J???0;
    %???????;
    
    if(A == 0)
        t(1) = 0.0;
        t2 = abs((V/J)^0.5);
        t(2) = t(1)+t2;
        t(3) = t(2);
        t(4) = t(3)+t2;
       
        
    else
        
        t_acc = abs(A/J);%???;
        
        v_max = V+1/2.0*A*t_acc;
        t_vel = sqrt(v_max/J);%???;
        
        if t_acc<t_vel
            t1 = t_acc;
            t2 = V/A-1/2.0*t1;

            t(1) = t1;
            t(2) = t(1)+t1;
            t(3) = t(2)+t2;
            t(4) = t(3)+t1;
        else
           t1 =t_acc;
           V_ = V+1/2.0*A*t1;
           t2 = (V_/J)^0.5;

           t(1) = t1;
           t(2) = t(1)+t2;
           t(3) = t(2);
           t(4) = t(3)+t2;
        end
    end
    

   
    jerk = J;


end




















