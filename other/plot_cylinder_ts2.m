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




clc;
clear;

ms = 1000;%ms

 for i = 1:100
    
    clf;
    T = htrans(100*sin(i*pi/180),100*cos(i*pi/180),i)*hrotx(i)*hroty(i)*hrotz(-i);

    plot_cylinder(T,5,100,i,'hold');
    
  
    T = htrans(100*sin(-i*pi/180),100*cos(-i*pi/180),100-i)*hrotx(i);
  
    hold on;
    plot_cylinder(T,5,100,i,'hold');
      pause(ms/1000);


 end




