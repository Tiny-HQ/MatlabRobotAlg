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

function [S,V,A] = trape_ext_cal_pvaj(t,a,vs,v,ve,t_int)

   T = 0.0:t_int:t(3);
   sum_no = length(T);
    
    A = linspace(0,0,sum_no+1);
    V = linspace(0,0,sum_no+1);
    S = linspace(0,0,sum_no+1);
    
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


  for i = 0:sum_no
    if (i*t_int >= 0) && ((i*t_int-t(1))<=0.00001)
        temp_t = i*t_int;
        if(v>vs)
            A(i+1) = a;
        else
            A(i+1) = -a;
        end
        
        V(i+1) = vs+A(i+1)*temp_t;
        S(i+1) = vs*temp_t+1/2*A(i+1)*temp_t^2;
    elseif (i*t_int-t(2))<=0.00001
        temp_t = i*t_int-t(1);
        A(i+1) = 0.0;
        V(i+1) = v2;
        S(i+1) = s1+v2*temp_t;
    elseif(i*t_int-t(3))<=0.0000001
        temp_t = i*t_int-t(2);
        if(v<ve)
            A(i+1) = a;
        else
            A(i+1) = -a;
        end
       V(i+1) = v2+A(i+1)*temp_t; 
       S(i+1) = s2+0.5*(V(i+1)+v2)*temp_t;
    else
         v(i+1) = 0.0;
         S(i+1) = S(i);
        
    end
      
  end


end







