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




function [s,v,a,jerk] = s_curve_all_param_cal_pvaj(t,w,t_int)

    T = 0.0:t_int:t(3);
    sum_no = length(T);

    a = linspace(0,0,sum_no);
    v = linspace(0,0,sum_no);
    s = linspace(0,0,sum_no-1);
    jerk = linspace(0,0,sum_no);

    delta_t = linspace(0,0,6);
    delta_t(1) = t(1)-0.0;
    delta_t(2) = t(2)-t(1);
    delta_t(3) = t(3)-t(2);
    
    delta_t(4) = t(4);
    delta_t(5) = t(5)-t(4);
    delta_t(6) = t(6)-t(5);
    s1 = w(1)+w(2)*delta_t(4)+w(3)*delta_t(4)^2+w(4)*delta_t(4)^3+w(5)*delta_t(4)^4;
    v1 = w(2)+2*w(3)*delta_t(4)+3*w(4)*delta_t(4)^2+4*w(5)*delta_t(4)^3;
    v5 = w(7);
    a5 = 2*w(8);
    j5 = 6*w(9);  
    s2 = w(6)+w(7)*delta_t(6)+w(8)*delta_t(6)^2+w(9)*delta_t(6)^3+w(10)*delta_t(6)^4;
    
    tmp1 = w(2)*delta_t(4)+w(3)*delta_t(4)^2+w(4)*delta_t(4)^3+w(5)*delta_t(4)^4;
    tmp2 = w(7)*delta_t(6)+w(8)*delta_t(6)^2+w(9)*delta_t(6)^3+w(10)*delta_t(6)^4;
    
    if(w(11) == 0)%s0<s5;
         for i = 1:sum_no
             if (i*t_int >= 0) && ((i*t_int-t(1))<=0.0000001)
                   temp_t = i*t_int;
                   if(delta_t(4)<0)
                       temp_t = -temp_t;
                   end
                   jerk(i) = 6*w(4)+24*w(5)*temp_t;
                   a(i) = 2*w(3)+6*w(4)*temp_t+12*w(5)*temp_t^2;
                   v(i) = w(2)+2*w(3)*temp_t+3*w(4)*temp_t^2+4*w(5)*temp_t^3;
                   s(i) = w(1)+w(2)*temp_t+w(3)*temp_t^2+w(4)*temp_t^3+w(5)*temp_t^4;
               elseif (i*t_int-t(2))<=0.0000001
                   temp_t = i*t_int-t(1);
                   if(delta_t(5)<0)
                       temp_t = -temp_t;
                   end
                   jerk(i) = 0;
                   a(i) = 0.0;
                   v(i) = v1;
                   s(i) = s1+v1*temp_t;         
               elseif (i*t_int-t(3))<=0.0000001
                   temp_t = i*t_int-t(2);
                   temp_t = delta_t(3)-temp_t;
                   if(delta_t(6)<0)
                       temp_t = -temp_t;
                   end
                   jerk(i) = 6*w(9)+24*w(10)*temp_t;
                   a(i) = 2*w(8)+6*w(9)*temp_t+12*w(10)*temp_t^2;
                   v(i) = w(7)+2*w(8)*temp_t+3*w(9)*temp_t^2+4*w(10)*temp_t^3;
                   ww = w(6)+w(7)*temp_t+w(8)*temp_t^2+w(9)*temp_t^3+w(10)*temp_t^4;
                   s(i) =2*w(6)-ww;     %这里需要注意的是：在计算参数的时候，假如前面图像计算y是从1到5，那么这里是-3到1的，图像关于y=1对称； It should be noted here that when calculating the parameters, if the previous image calculates y from 1 to 5, then here it is -3 to 1, and the image is symmetrical with respect to y=1;
                                        %图像是关于y=w(6)对称，y1+y2 = 2*w(6)的，所以 The image is about y=w(6) symmetry, y1+y2 = 2*w(6), so
                                        %求另一个的时候y1 = 2*w(6)-y2;替换得到s(i) =2*w(6)-ww;    When finding the other, y1 = 2*w(6)-y2; substitution yields s(i) =2*w(6)-ww;   

             else
                    jerk(i) = j5;
                    a(i) = a5;
                    v(i) = v5;
                    s(i) = w(6);
             end 

         end 
    else %s0>s5;
        for i = 1:sum_no+1
            j = sum_no-i+1;
            if (j*t_int >= 0) && ((j*t_int-t(1))<=0.0000001)
                   temp_t = j*t_int;
                   if(delta_t(4)<0)
                       temp_t = -temp_t;
                   end
                   jerk(i) = 6*w(4)+24*w(5)*temp_t;
                   a(i) = (2*w(3)+6*w(4)*temp_t+12*w(5)*temp_t^2);
                   v(i) = w(2)+2*w(3)*temp_t+3*w(4)*temp_t^2+4*w(5)*temp_t^3;
                   s(i) = w(1)+w(2)*temp_t+w(3)*temp_t^2+w(4)*temp_t^3+w(5)*temp_t^4;
                   %s(i) =2*w(1)-ww;  
               elseif (j*t_int-t(2))<=0.0000001
                   temp_t = j*t_int-t(1);
                   if(delta_t(5)<0)
                       temp_t = -temp_t;
                   end
                   jerk(i) = 0;
                   a(i) = 0.0;
                   v(i) = v1;
                   s(i) = s1+v1*temp_t;         
               elseif (j*t_int-t(3))<=0.0000001
                   temp_t = j*t_int-t(2);
                   temp_t = delta_t(3)-temp_t;
                   if(delta_t(6)<0)
                       temp_t = -temp_t;
                   end
                   jerk(i) = 6*w(9)+24*w(10)*temp_t;
                   a(i) = 2*w(8)+6*w(9)*temp_t+12*w(10)*temp_t^2;
                   v(i) = w(7)+2*w(8)*temp_t+3*w(9)*temp_t^2+4*w(10)*temp_t^3;
                   ww = w(6)+w(7)*temp_t+w(8)*temp_t^2+w(9)*temp_t^3+w(10)*temp_t^4;
                   s(i) =2*w(6)-ww;     %这里需要注意的是：在计算参数的时候，假如前面图像计算y是从1到5，那么这里是-3到1的，图像关于y=1对称； It should be noted here that when calculating the parameters, if the previous image calculates y from 1 to 5, then here it is -3 to 1, and the image is symmetrical with respect to y=1;
                                        %图像是关于y=w(6)对称，y1+y2 = 2*w(6)的，所以 The image is about y=w(6) symmetry, y1+y2 = 2*w(6), so
                                        %求另一个的时候y1 = 2*w(6)-y2;替换得到s(i) =2*w(6)-ww;    When finding the other, y1 = 2*w(6)-y2; substitution yields s(i) =2*w(6)-ww;   


              elseif(j*t_int <= 0)
                    jerk(i) = j5;
                    a(i) = a5;
                    v(i) = w(2);
                    s(i) = w(1);
            else
                   jerk(i) = j5;
                    a(i) = a5;
                    v(i) = v5;
                    s(i) = w(6);
             end 
            
            
        end    
        
    end


    

end




