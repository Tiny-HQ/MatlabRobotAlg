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

%sin??????»®





function [t,j] = sin_sim_cal_param(S,V,A,D,J)

    temp1 = A*pi*A/2/J;
    temp2 = D*pi*D/2/J;
  
    if (V>A*pi*A/2/J)
        t1 = pi*A/2/J;%ok
        t2 = (V-A*pi*A/2/J)/A;
        t3 = t1;
    else
        t1 = (V*pi/2/J)^0.5;
        t2 = 0;
        t3 = t1;
    end
    
    Sa = sin_cal_s_model(t1,t2,t3,J);
    


    
    if (V>D*pi*D/2/J)
        t5 = pi*D/2/J;%ok
        t6 = (V-D*pi*D/2/J)/D;
        t7 = t5;
    else
        t5 = (V*pi/2/J)^0.5;
        t6 = 0;
        t7 = t5;
    end
     Sd = sin_cal_s_model(t5,t6,t7,J);


    if (Sa+Sd<=S)
        t4 = (S-Sa-Sd)/V;    
    else
        temp_A = A;temp_D = D;
        A = min(temp_A,temp_D);
        D = max(temp_A,temp_D);
        
        T1 = pi*A/2/J;T2 = 0.0;T3 = T1;T4 = 0.0;T5 = T1;T6 = 0.0;T7 = T1;
        Sa1 = sin_cal_s_model(T1,T2,T3,J);Sd1 = sin_cal_s_model(T5,T6,T7,J);
        if(Sa1+Sd1 >S)%??????????????
            T1 = ((pi*S)/4/J)^(1/3);T2 = 0.0;T3 = T1;T4 = 0.0;T5 = T1;T6 = 0;T7 = T1;
        else%??????;
            T1 = pi*A/2/J;T5 = pi*D/2/J;T2 = D*T5/A-T1;T3 = T1;T4 = 0.0;T6 = 0.0;T7 = T5;
            Sa2 = sin_cal_s_model(T1,T2,T3,J);Sd2 = sin_cal_s_model(T5,T6,T7,J);
            if (Sa2+Sd2>S)%????????
                a = 2*J^2/(A*pi^2);b = 2*J/pi;c =J*T1/pi;d = 0.0;e = -S;%???;ax^4+bx^3+cx^2+dx+e=0;
                T5 = cal_4_quartic_function(a,b,c,e);%;A(T1+T2) = 2J/pi*T5^2 = V'...V'/2*(2*T1+T2)+V'*T5=S...V'?????????????»µ?V??????????????;
                v = 2*T5*J*T5/pi;   T2 = v/A-T1;T6 = 0.0;T7 = T5;T4 = 0.0;T3=T1;
            else%????????
                T1 = pi*A/2/J;T5 = pi*D/2/J;
                a = (1/A+1/D);b = T1+T5;c = -2*S;
                v = (-b+(b^2-4*a*c)^0.5)/(2*a);
                T2 = v/A-T1;T6 = v/D-T5;T4 = 0.0;T3 = T1;T7=T5;
            end
        end
        if(temp_A<temp_D)
            t1 = T1; t2 = T2; t3 = T3; t4 = T4; t5 = T5; t6 = T6; t7 = T7;
        else
            t1 = T5; t2 = T6; t3 = T7; t4 = T4; t5 = T1; t6 = T2; t7 = T3;
        end
    end
    
    
    t(1) = t1;
    t(2) = t(1)+t2;
    t(3) = t(2)+t3;
    t(4) = t(3)+t4;
    t(5) = t(4)+t5;
    t(6) = t(5)+t6;
    t(7) = t(6)+t7;
    j = J;
end



function [s] = sin_cal_s_model(t1,t2,t3,J)


    delta_t(1) = t1-0.0;
    delta_t(2) = t2;
    delta_t(3) = t3;
    am = 2*delta_t(1)*J/pi;
    DTA = delta_t(1);
    
    v1 = am*delta_t(1)/2;
    v2 = v1+am*delta_t(2);
    v3 = v2+am*delta_t(3)/2;

    s = am/2*DTA^2/pi/pi;
    s1 = -am/2*DTA^2/pi/pi+am*delta_t(1)^2/4;
    s = v3*(delta_t(1)+delta_t(2)+delta_t(3))/2;
end


