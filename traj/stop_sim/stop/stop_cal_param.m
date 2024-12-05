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


%��ʱ��A��Ϊ����Ϊ����A_set��ʾ������A_set��ʾ������ٶȴ�С; In this case, A can be positive or negative, A_set represents a scalar quantity, and A_set represents the magnitude of reverse deceleration.
%�ɼ�����ٶΡ����ٶΡ����ٶ�; It can calculate the acceleration section, constant speed section and deceleration section;
%stop_ext��stop_standard���ٶ�û��������; stop_ext. The stop_standard deceleration section has not been treated;


function [t,j] = stop_cal_param(V,A,A_set,J)



    if(abs(A) <= 0.01)  %���ٶ�; Constant velocity section
        t(1) = 0.0;

        t_vel = abs((V/J)^0.5);
        t_acc = abs(A_set/J);

        if(t_vel>t_acc)
            t2 = t_acc;
            t3 = V/A_set-t2;
        else
            t2 = t_vel;
            t3 = 0.0;
        end
        t(2) = t(1)+t2;
        t(3) = t(2)+t3;
        t(4) = t(3)+t2;
        
    elseif (A>0)        %���ٶ�;acc
        t(1) = abs(A/J);%�ٽ�ֵ;limit
        v_max = 1/2.0*A*t(1)+V;  
        t_vel = sqrt(v_max/J);%�ٽ�ֵ;limit
        t_acc = abs(A_set/J);
        
        if t_acc<t_vel
            t1 = t_acc;
            t2 = v_max/A_set-t1; 
            t(2) = t(1)+t1;
            t(3) = t(2)+t2;
            t(4) = t(3)+t1;
        else
            t2 = (v_max/J)^0.5;
            t(2) = t(1)+t2;
            t(3) = t(2);
            t(4) = t(3)+t2;
        end
    else         %���ٶ� dec
        
        t_ = abs(A/J);
        if(abs(V-1/2*abs(A)*t_)<0.001 )
            t1 = 0.0;
            t2 = 0.0;
            t3 = t_;
            t4 = 0.0;
            t5 = 0.0;
        elseif ((V-1/2*abs(A)*t_)<0)
            v = V-1/2*abs(A)*t_;
            t1 = 0.0;
            t2 = 0.0;
            t3 = t_;
            t4 = sqrt(abs(v)/J);
            t5 = sqrt(abs(v)/J);
        else
            t4 = 0.0;
            t5 = 0.0;
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
        
    end

    j = J;

end










