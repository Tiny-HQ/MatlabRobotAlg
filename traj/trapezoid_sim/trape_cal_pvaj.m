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






function [p,v] = trape_cal_pvaj(t,a,t_int)




    T = 0.0:t_int:t(3);
    sum_no = length(T);
    
    p = linspace(0,0,sum_no+1);
    v = linspace(0,0,sum_no+1);
    
    v1 = t(1)*a;
    v2 = v1;
    p1 = 1/2*a*t(1)^2;
    p2 = p1+v1*(t(2)-t(1));
    
    
    for i = 0:sum_no
        if((i*t_int-t(1))<=0.0000001)
            temp_t = i*t_int;
            v(i+1) = temp_t*a;
            p(i+1) = 1/2*a*temp_t^2;
        elseif (i*t_int-t(2))<=0.0000001
            temp_t = i*t_int-t(1);
            v(i+1) = v1;
            p(i+1) = p1+v1*temp_t;
        elseif (i*t_int-t(3))<=0.0000001
             temp_t = i*t_int-t(2);
             v(i+1) = v2-a*temp_t;
             p(i+1) = p2+1/2*(v2+v(i+1))*temp_t;
        else
            v(i+1) = 0.0;
            p(i+1) = p(i);
         end   
%         if(i*t_int<t(1))
%             temp_t = (i-1)*t_int;
%             v(i) = temp_t*a;
%             p(i) = 1/2*a*temp_t^2;
%         elseif i*t_int <= t(2)
%             temp_t = (i-1)*t_int-t(1);
%             v(i) = v1;
%             p(i) = p1+v1*temp_t;
%             
%         elseif i*t_int <= t(3)
%             temp_t = (i-1)*t_int-t(2);
%             v(i) = v2-a*temp_t;
%             p(i) = p2+1/2*(v2+v(i))*temp_t;
%         else
%             v(i) = 0.0;
%             p(i) = p(i-1);
%          end
    end




end










