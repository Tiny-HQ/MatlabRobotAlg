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




function [ss,s,v,a,jerk] = sin_sim_cal_pvaj(t,J,t_int)


    T = 0.0:t_int:t(7);
    sum_no = length(T);
    
    a = linspace(0,0,sum_no);
    v = linspace(0,0,sum_no);
    s = linspace(0,0,sum_no-1);
    ss = linspace(0,0,sum_no-1);
    jerk = linspace(0,0,sum_no);
    
    

    delta_t = linspace(0,0,7);
    delta_t(1) = t(1)-0.0;
    delta_t(2) = t(2)-t(1);
    delta_t(3) = t(3)-t(2);
    delta_t(4) = t(4)-t(3);
    delta_t(5) = t(5)-t(4);
    delta_t(6) = t(6)-t(5);
    delta_t(7) = t(7)-t(6);




    am = 2*delta_t(1)*J/pi;
    dm = 2*delta_t(7)*J/pi;
    v1 = am*delta_t(1)/2;
    v2 = v1+am*delta_t(2);
    v3 = v2+am*delta_t(3)/2;
    v4 = v3;
    v5 = v4-dm*delta_t(5)/2;
    v6 = v5-dm*delta_t(6);
    
    DTA = delta_t(1);
    DTD = delta_t(7);
    
    s0 = am/2*DTA^2/pi/pi;s5_ = dm/2*DTD^2/pi^2;
    s1= -am/2*DTA^2/pi/pi*sin(pi/DTA*delta_t(1)-pi/2)+am*delta_t(1)^2/4;
    s2 = s1+v1*delta_t(2)+1/2*am*delta_t(2)^2;
    s3 = v3*(delta_t(1)+delta_t(2)+delta_t(3))/2;
    s4 = s3+v3*delta_t(4)+s5_;
    s5 = s4+v4*delta_t(5)-(-dm/2*DTD^2/pi/pi*sin(pi/DTD*delta_t(5)-pi/2)+dm*delta_t(5)^2/4);
    s6 = s5+v5*delta_t(6)-1/2*dm*delta_t(6)^2;

    for i = 1:sum_no
        
      if (i*t_int >= 0) && ((i*t_int-t(1))<=0.0000001)
           temp_t = i*t_int;
           jerk(i) = pi*am/2/DTA*cos(pi/DTA*temp_t-pi/2);
           a(i) = am/2*sin(pi/DTA*temp_t-pi/2)+am/2;
           v(i) = -am/2*DTA/pi*cos(pi/DTA*temp_t-pi/2)+am/2*temp_t;
           s(i) = -am/2*DTA^2/pi/pi*sin(pi/DTA*temp_t-pi/2)+am*temp_t^2/4-s0;
           ss(i+1) =  ss(i)+ t_int*v(i);
       elseif (i*t_int-t(2))<=0.0000001
           temp_t = i*t_int-t(1);
           jerk(i) = 0;
           a(i) = am;
           v(i) = v1+am*temp_t;
           s(i) = s1+v1*temp_t+1/2*am*temp_t^2-s0;
           ss(i+1) = ss(i)+ t_int*v(i);
       elseif (i*t_int-t(3))<=0.0000001
           temp_t = i*t_int-t(2);temp_t = temp_t+DTA;
           jerk(i) = pi*am/2/DTA*cos(pi/DTA*temp_t-pi/2);
           a(i) = am/2*sin(pi/DTA*temp_t-pi/2)+am/2;
           v(i) = v2+(-am/2*DTA/pi*cos(pi/DTA*temp_t-pi/2)+am/2*(temp_t-DTA));
           s(i) = s2+v2*(temp_t-DTA)+(-am/2*DTA^2/pi/pi*sin(pi/DTA*temp_t-pi/2)+am*(temp_t-DTA)^2/4);
           ss(i+1) = ss(i)+ t_int*v(i);
       elseif (i*t_int-t(4))<=0.0000001
           temp_t = i*t_int-t(3);
           jerk(i) = 0;
           a(i) = 0;
           v(i) = v3;
           s(i) = s3+v3*temp_t;
           ss(i+1) = ss(i)+ t_int*v(i);
       elseif (i*t_int-t(5))<=0.0000001
           temp_t = i*t_int-t(4);
           jerk(i) = -pi*dm/2/DTD*cos(pi/DTD*temp_t-pi/2);
           a(i) = -(dm/2*sin(pi/DTD*temp_t-pi/2)+dm/2);
           v(i) = v4-(-dm/2*DTD/pi*cos(pi/DTD*temp_t-pi/2)+dm/2*temp_t);
           s(i) = s4+v4*temp_t-(-dm/2*DTD^2/pi/pi*sin(pi/DTD*temp_t-pi/2)+dm*temp_t^2/4);
           ss(i+1) = ss(i)+ t_int*v(i);
       elseif (i*t_int-t(6))<=0.0000001
           temp_t = i*t_int-t(5);
           jerk(i) = 0;
           a(i) = -dm;
           v(i) = v5-dm*temp_t;
           s(i) = s5+v5*temp_t-1/2*dm*temp_t^2;
           ss(i+1) = ss(i)+ t_int*v(i);
       elseif (i*t_int-t(7))<=0.0000001
            temp_t = i*t_int-t(6);temp_t = temp_t+DTD;
            jerk(i) = -pi*dm/2/DTD*cos(pi/DTD*temp_t-pi/2);
            a(i) = -(dm/2*sin(pi/DTD*temp_t-pi/2)+dm/2);
            v(i) = v6-(-dm/2*DTD/pi*cos(pi/DTD*temp_t-pi/2)+dm/2*(temp_t-DTD));
            s(i) = s6+v6*(temp_t-DTD)-(-dm/2*DTD^2/pi/pi*sin(pi/DTD*temp_t-pi/2)+dm*(temp_t-DTD)^2/4)-s5_;
            ss(i+1) = ss(i)+ t_int*v(i);
       else
            temp_t = t(7)-t(6);temp_t = temp_t+DTD;
            a(i) = 0;
            v(i) = 0;
            s(i) =s6+v6*(temp_t-DTD)-(-dm/2*DTD^2/pi/pi*sin(pi/DTD*temp_t-pi/2)+dm*(temp_t-DTD)^2/4)-s5_;
       end 
              
    end
 

end





