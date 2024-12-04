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

%??????????????????????????????????????????;



function [t] = s_curve_cal_param_non_symmetry(S,V,A,D,J)
    if(V>A^2/J)
        t1 = A/J;
        t2 = V/A-t1;
        t3 = t1;
    else
        t1 = (V/J)^0.5;
        t2 = 0;
        t3 = t1;
    end
    Sa = cal_s_moudle(t1,t2,J);
    
    if(V>D^2/J)
        t5 = D/J;
        t6 = V/D-t5;
        t7 = t5;
    else
        t5 = (V/J)^0.5;
        t6 = 0;
        t7 = t5;
    end
    Sd = cal_s_moudle(t5,t6,J);
    
    if Sa+Sd<=S%???????
        t4 = (S-Sa-Sd)/V;
    else %???????
        t4 = 0.0;
        temp_A = A;
        temp_D = D;
        A = min(temp_A,temp_D);
        D = max(temp_A,temp_D);
       
        T1 = A/J;T2 = 0.0;T3 = T1;T4 = 0.0;T5 = T1;T6 = 0.0;T7 = T1;
        Sa1 = cal_s_moudle(T1,T2,J);Sd1 = cal_s_moudle(T5,T6,J);
        if Sa1+Sd1 >S%????????????????????xin
            T1 = (S/(2*J))^0.333333333;T2 = 0.0;T3 = T1;T4 = 0.0;T5 = T1;T6 = 0.0;T7 = T1;            
        else%????????
            T1 = A/J;
            T5 = D/J;T2 = J*T5^2/A-T1;T3 = T1;T6 = 0.0;T7 = T5;%(???????????D???
            Sa2 = cal_s_moudle(T1,T2,J);Sd2 = cal_s_moudle(T5,T6,J);
            if Sa2+Sd2>=S%????????
                a = J^2/(2*A);b = J;c = J*T1/2;d = 0.0;e = -S;%???;ax^4+bx^3+cx^2+dx+e=0;
                %T5 = cal_4_fun_ts2(a,b,c,d,e);
                %T5 = cal_4_quartic_function(a,b,c,e);%;A(T1+T2) = J*T5^2 = V'...V'/2*(2*T1+T2)+V'*T5=S...V'?????????????»µ?V??????????????;
                T5 = roots([a,b,c,d,e]);T5 = T5(4);
                
                T2 = J*T5^2/A-T1;
                T3 = T1;T4 = 0.0;T6 = 0.0;T7 = T5;
            else%????????
                a = (1/A+1/D);b = T1+T5;c = -2*S;
                v = (-b+(b^2-4*a*c)^0.5)/(2*a);T2 = v/A-T1;T6 = v/D-T5;
                T3 = T1;T4 = 0.0;T7 = T5;
            end
        end
        if(temp_A<temp_D)
            t1 = T1; t2 = T2; t3 = T3; t4 = T4; t5 = T5; t6 = T6; t7 = T7;
        else
            t1 = T5; t2 = T6; t3 = T5; t4 = T4; t5 = T1; t6 = T2; t7 = T1;
        end
    end

    t(1) = t1;
    t(2) = t(1)+t2;
    t(3) = t(2)+t3;
    t(4) = t(3)+t4;
    t(5) = t(4)+t5;
    t(6) = t(5)+t6;
    t(7) = t(6)+t7;

end
