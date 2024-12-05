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



function [a,b,c,d] = b_spline_cal_param(t,x,y,z)


    global Ts;
    Ts = 0.004;
    
    t_length = length(t);
    x_length = length(x);
    y_length = length(y);
    z_length = length(z);
    
    if(t_length ~= x_length)||(t_length ~= y_length)||(t_length ~= z_length)
        return;
    end
        
    
    A = 0.0;%loEz�UsC;
    B = 0.0;%�Ola�UsC�l;
    
    n = t_length;
    counts = t(n)/Ts;
    
    
    Tt = zeros(n);

    for i = 1:n-1      
       ht(i) = t(i+1)-t(i);
    end  
        
    Tt(1,1) = 2*ht(1);
    Tt(1,2) = ht(1);
    for i = 2:n-1
       Tt(i,i-1) = ht(i-1);
       Tt(i,i) = 2*(ht(i-1)+ht(i));
       Tt(i,i+1) = ht(i);
    end
    Tt(n,n-1) = ht(n-1);
    Tt(n,n) = 2*ht(n-1);
    
    
        
    Vx = ones(n,1)';   
    Vy = ones(n,1)';
    Vz = ones(n,1)';
    Vx(1) = (x(2)-x(1))/ht(1)-A; 
    Vy(1) = (y(2)-y(1))/ht(1)-A; 
    Vz(1) = (z(2)-z(1))/ht(1)-A; 
    for i = 2:n-1
        Vx(i) = (x(i+1)-x(i))/ht(i)-(x(i)-x(i-1))/ht(i-1);
        Vy(i) = (y(i+1)-y(i))/ht(i)-(y(i)-y(i-1))/ht(i-1);
        Vz(i) = (z(i+1)-z(i))/ht(i)-(z(i)-z(i-1))/ht(i-1);
    end 
    Vx(n) = B-(x(n)-x(n-1))/ht(n-1);
    Vy(n) = B-(y(n)-y(n-1))/ht(n-1);
    Vz(n) = B-(z(n)-z(n-1))/ht(n-1);
    
    Vx = 6*Vx';
    Vy = 6*Vy';
    Vz = 6*Vz';

    tic;
    mx = Tt\Vx;
    my = Tt\Vy;
    mz = Tt\Vz;
    toc;
    
    for i = 1:n-1
       a.ax(i) = x(i);
       b.bx(i) = (x(i+1)-x(i))/ht(i)-1/3*mx(i)*ht(i)-1/6*mx(i+1)*ht(i); 
       c.cx(i) = mx(i)/2;
       d.dx(i) = (mx(i+1)-mx(i))/(6*ht(i));
    end
    
    for i = 1:n-1
       a.ay(i) = y(i);
       b.by(i) = (y(i+1)-y(i))/ht(i)-1/3*my(i)*ht(i)-1/6*my(i+1)*ht(i); 
       c.cy(i) = my(i)/2;
       d.dy(i) = (my(i+1)-my(i))/(6*ht(i));
    end

    for i = 1:n-1
       a.az(i) = z(i);
       b.bz(i) = (z(i+1)-z(i))/ht(i)-1/3*mz(i)*ht(i)-1/6*mz(i+1)*ht(i); 
       c.cz(i) = mz(i)/2;
       d.dz(i) = (mz(i+1)-mz(i))/(6*ht(i));
    end


end
















