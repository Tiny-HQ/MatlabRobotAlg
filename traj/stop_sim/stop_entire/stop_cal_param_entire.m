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

%A_set值一直为标量; A_set values are always scalar;

function [t] = stop_cal_param_entire(V,A,A_set,J)


    
    if(V*A>0)%速度跟加速度同向; Velocity is in the same direction as acceleration;
        V=abs(V);A = abs(A);%取同向计算时间，不分两者某一项是负的; The calculation time in the same direction is negative regardless of whether one of the two is negative;
        t(1) = abs(A/J);%临界值;limit
        v_max = 1/2.0*A*t(1)+V;  
        t_vel = sqrt(v_max/J);%临界值;limit
        t_acc = abs(A_set/J);
        
        if t_acc<t_vel
            t1 = t_acc;
            t2 = v_max/abs(A_set)-t1; 
            t(2) = t(1)+t1;
            t(3) = t(2)+t2;
            t(4) = t(3)+t1;
        else
            t2 = (v_max/J)^0.5;
            t(2) = t(1)+t2;
            t(3) = t(2);
            t(4) = t(3)+t2;
        end

    elseif(V*A<0)%速度和加速度异向; velocity and acceleration redirection;
        V = abs(V);A = -abs(A);
         t_ = abs(A/J);
        if ((V-1/2*abs(A)*t_)<0)
            v = V-1/2*abs(A)*t_;
            t1 = 0.0;
            t2 = 0.0;
            t3 = t_;
            t4 = sqrt(abs(v)/J);
            t5 = sqrt(abs(v)/J);
        else
            t4 = 0.0;
            t5 = 0.0;
            A_set = abs(A_set);
            if (abs(A)>abs(A_set))
                v = V-1/2*abs(A)*t_;
                t1 = 0.0;
                t2 = v/abs(A);
                t3 = t_;
            else
                t1 = (abs(A_set)-abs(A))/J;
                t_ = abs(A_set/J);
               
                if((abs(A_set)+abs(A))*t1*0.5+1/2*abs(A_set)*t_>V)
                    t2 = 0.0;
                    t3 = sqrt(V/J+A^2/(2*J^2));
                    t1 = t3-abs(A)/J;
                else
                    t1 = (A_set-abs(A))/J;
                    t3 = A_set/J;
                    t2 = (V-((abs(A_set)+abs(A))*t1*0.5)-1/2*A_set*t3)/A_set;
                end
            end
            
        end

        t(1) = t1;
        t(2) = t(1)+t2;
        t(3) = t(2)+t3;
        t(4) = t(3)+t4;
        t(5) = t(4)+t5;

    else%速度、加速度其中有一项为0; One of the velocity and acceleration is 0;
        if(abs(A)<eps)
            t(1) = abs(A/J);%临界值;limit
            v_max = abs(1/2.0*A*t(1)+V);  
            t_vel = sqrt(abs(v_max)/J);%临界值;limit
            t_acc = abs(A_set/J);

            if t_acc<t_vel
                t1 = t_acc;
                t2 = abs(v_max/A_set)-t1; 
                t(2) = t(1)+t1;
                t(3) = t(2)+t2;
                t(4) = t(3)+t1;
            else
                t2 = (v_max/J)^0.5;
                t(2) = t(1)+t2;
                t(3) = t(2);
                t(4) = t(3)+t2;
            end
        elseif(abs(V)<eps)
            t(1) = 0.0;
            t(2) = 0.0;
            t(3) = 0.0;
            t(4) = 0.0;
            t(5) = 0.0;
        end
        
    end





end
