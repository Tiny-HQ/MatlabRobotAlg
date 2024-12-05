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

function [S,V,A,t_d,sum_no] = lls_trape_ext_cal_pvaj(t,a,vs,v,ve,t_int,t_s)

   T = t_s:t_int:t(3);
   sum_no = length(T)-1;
    
    A = linspace(0,0,sum_no);
    V = linspace(0,0,sum_no);
    S = linspace(0,0,sum_no);
    
    delta_t = linspace(0,0,3);
    delta_t(1) = t(1)-0.0;
    delta_t(2) = t(2)-t(1);
    delta_t(3) = t(3)-t(2);

    
    if(v>vs)
        v1 = vs+a*delta_t(1);
        s1 = vs*delta_t(1)+1/2*a*delta_t(1)^2;
    else
        v1 = vs-a*delta_t(1);
        s1 = vs*delta_t(1)-1/2*a*delta_t(1)^2;
    end
    
    v2 = v1;
    s2 = s1+v1*delta_t(2);

    temp_t =0;
  for i = 1:sum_no
    if (t_s+i*t_int >= 0) && ((t_s+i*t_int-t(1))<=0.00001)
        temp_t = t_s+i*t_int;
        if(v>vs)
            A(i) = a;
        else
            A(i) = -a;
        end       
        V(i) = vs+A(i)*temp_t;
        S(i) = vs*temp_t+1/2*A(i)*temp_t^2;
    elseif (t_s+i*t_int-t(2))<=0.00001
        temp_t = t_s+i*t_int-t(1);
        A(i) = 0.0;
        V(i) = v2;
        S(i) = s1+v2*temp_t;
    elseif (t_s+i*t_int-t(3))<=0.00001
        temp_t = t_s+i*t_int-t(2);
        if(v<ve)
            A(i) = a;
        else
            A(i) = -a;
        end
       V(i) = v2+A(i)*temp_t; 
       S(i) = s2+v2*temp_t+1/2*A(i)*temp_t^2;
    else  
       temp_t = t(3)-t(2);
    end
      
  end
    temp_t = t_s+sum_no*t_int-t(2);
    if(sum_no <= 0)
        t_d = 0;
    else
        t_d = t_int-(s2+v2*temp_t+1/2*A(i)*temp_t^2-S(sum_no))/V(sum_no);
    end

end







