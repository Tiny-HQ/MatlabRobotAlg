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
%large interval;
function [s] = nurbs_simpson_cal_length(u1,u2,u_vec,k,px,wx,py,wy,pz,wz)

    u12 = (u1+u2)/2;
    ds1 = 0.0; ds2 = 0.0; ds12 = 0.0;
    if nargin == 6
        ds1 = nurbs_simpson_cal_single_length(u1,u12,u_vec,k,px,wx);
        ds2 = nurbs_simpson_cal_single_length(u12,u2,u_vec,k,px,wx);
        ds12 = nurbs_simpson_cal_single_length(u1,u2,u_vec,k,px,wx);
    elseif nargin == 8
        ds1 = nurbs_simpson_cal_single_length(u1,u12,u_vec,k,px,wx,py,wy);
        ds2 = nurbs_simpson_cal_single_length(u12,u2,u_vec,k,px,wx,py,wy);
        ds12 = nurbs_simpson_cal_single_length(u1,u2,u_vec,k,px,wx,py,wy);
    elseif nargin == 10
        ds1 = nurbs_simpson_cal_single_length(u1,u12,u_vec,k,px,wx,py,wy,pz,wz);
        ds2 = nurbs_simpson_cal_single_length(u12,u2,u_vec,k,px,wx,py,wy,pz,wz);
        ds12 = nurbs_simpson_cal_single_length(u1,u2,u_vec,k,px,wx,py,wy,pz,wz);
    end
    
    if (abs(ds1+ds2-ds12)<0.001)
        s = ds12+(ds1+ds2-ds12)/5;
    else
        if nargin == 6
             s = nurbs_simpson_cal_length(u1,u12,u_vec,k,px,wx)+nurbs_simpson_cal_length(u12,u2,u_vec,k,px,wx);  
        elseif nargin == 8
             s = nurbs_simpson_cal_length(u1,u12,u_vec,k,px,wx,py,wy)+nurbs_simpson_cal_length(u12,u2,u_vec,k,px,wx,py,wy);  
        elseif nargin == 10
            s = nurbs_simpson_cal_length(u1,u12,u_vec,k,px,wx,py,wy,pz,wz)+nurbs_simpson_cal_length(u12,u2,u_vec,k,px,wx,py,wy,pz,wz);  
        end
    end  

end

%small interval;
function ds = nurbs_simpson_cal_single_length(u1,u2,u_vec,k,px,wx,py,wy,pz,wz)

    if nargin == 6
        dcu1 = nurbs_cal_single_point_derivative(u1,u_vec,k,px,wx);
        dcu2 = nurbs_cal_single_point_derivative(u2,u_vec,k,px,wx);
        dcu3 = nurbs_cal_single_point_derivative((u1+u2)/2.0,u_vec,k,px,wx);
        ds = (dcu1+4*dcu3+dcu2)*(u2-u1)/6.0;
    elseif nargin == 8
        dcu1 = nurbs_cal_single_point_derivative(u1,u_vec,k,px,wx,py,wy);
        dcu2 = nurbs_cal_single_point_derivative(u2,u_vec,k,px,wx,py,wy);
        dcu3 = nurbs_cal_single_point_derivative((u1+u2)/2.0,u_vec,k,px,wx,py,wy);
        ds = (dcu1+4*dcu3+dcu2)*(u2-u1)/6.0;
    elseif nargin == 10
        dcu1 = nurbs_cal_single_point_derivative(u1,u_vec,k,px,wx,py,wy,pz,wz);
        dcu2 = nurbs_cal_single_point_derivative(u2,u_vec,k,px,wx,py,wy,pz,wz);
        dcu3 = nurbs_cal_single_point_derivative((u1+u2)/2.0,u_vec,k,px,wx,py,wy,pz,wz);
        ds = (dcu1+4*dcu3+dcu2)*(u2-u1)/6.0;
    end

end
function dcu = nurbs_cal_single_point_derivative(u,u_vec,k,px,wx,py,wy,pz,wz)
    
    if nargin == 5
        [c,dcux] = nurbs_cal_dcu_derivative(u,k,u_vec,px,wx);
        dcu = dcux;
    elseif nargin == 7
        [c,dcux] = nurbs_cal_dcu_derivative(u,k,u_vec,px,wx);
        [c,dcuy] = nurbs_cal_dcu_derivative(u,k,u_vec,py,wy);
        dcu = sqrt(dcux^2+dcuy^2);
    elseif nargin == 9
        [c,dcux] = nurbs_cal_dcu_derivative(u,k,u_vec,px,wx);
        [c,dcuy] = nurbs_cal_dcu_derivative(u,k,u_vec,py,wy);
        [c,dcuz] = nurbs_cal_dcu_derivative(u,k,u_vec,pz,wz);
        dcu = sqrt(dcux^2+dcuy^2+dcuz^2); 
    end
end