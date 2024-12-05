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


function [p,v,a,jerk] = stop_cal_pvaj_ext(t,j,V,A,D,Ts)

    %Ts = 0.001;
    
    T = 0.0:Ts:t(4);
    sum_no = length(T);
    

    p = linspace(0,0,sum_no);
    v = linspace(0,0,sum_no);
    a = linspace(0,0,sum_no);
    jerk = linspace(0,0,sum_no);

    A1 = A-j*t(1);
    V1 = V+A*t(1)-1/2*j*t(1)^2;
    P1 =  D+V*t(1)+1/2*A*t(1)^2-1/6*j*t(1)^3;

    A2 = j*(t(2)-t(1));
    V2 = V1-1/2.0*j*(t(2)-t(1))^2;
    P2 =  V1*(t(2)-t(1))-1/6*j*(t(2)-t(1))^3+P1;
    
    A3 = -A2;
    V3 = V2-A2*(t(3)-t(2));
    P3 =  P2+V2*(t(3)-t(2))-1/2*A2*(t(3)-t(2))^2;
    for i = 1:sum_no
        
        if (((i*Ts)>=0)&&((i*Ts-t(1))<=0.0000001))
            temp_t = i*Ts;
            jerk(i) = -j;
            a(i) = A-j*temp_t;
            v(i) = V+A*temp_t-1/2*j*temp_t^2;
            p(i) = D+V*temp_t+1/2*A*temp_t^2-1/6*j*temp_t^3;
        elseif(((i*Ts-t(2))<=0.0000001))
            temp_t = i*Ts-t(1);
            jerk(i) = -j;
            a(i) = -j*temp_t;
            v(i) = V1-1/2.0*j*temp_t^2;
            p(i) = V1*temp_t-1/6*j*temp_t^3+P1;
        elseif((i*Ts-t(3))<=0.0000001)
            temp_t = i*Ts-t(2);
            jerk(i) = 0;
            a(i) = -A2;
            v(i) = V2-A2*temp_t;
            p(i) = P2+V2*temp_t-1/2*A2*temp_t^2;
        elseif((i*Ts-t(4))<=0.0000001)
             temp_t = i*Ts-t(3);
             jerk(i) = j;
             a(i) = A3+j*temp_t;
             v(i) = V3+A3*temp_t+1/2*j*temp_t^2;
             p(i) = P3+V3*temp_t+1/2*A3*temp_t^2+1/6*j*temp_t^3;
        else
            jerk(i) = 0;
            a(i) = 0;
            v(i) = 0;
            if(i == 1)
                p(i) = D;
            else
                p(i) = p(i-1);
            end
            
            
        end
        
    end









end






















