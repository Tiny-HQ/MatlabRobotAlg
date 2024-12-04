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


clc;
clear;



pos = [100.0 0.0 0.0;
      0.0 100.0 0.0;
      -100 0.0 0.0];
    
 thetaa = 0.0;
 
 global Pi;
 Pi = 3.1415926;
 
t_inter = 0.2;


[pc,r,theta] = cal_arc_param(pos);

x = linspace(0,0,theta/t_inter+1);
y = linspace(0,0,theta/t_inter+1);
z = linspace(0,0,theta/t_inter+1);
j = 1;
for i = 0:t_inter:theta  
   [p,dir] = cal_arc_acc_pos(i,pc,r,pos);
   x(j) = p(1);
   y(j) = p(2);
   z(j) = p(3);
   j = j+1;
end
plot3(x,y,z);

thet = 60;
[p,dir] = cal_arc_acc_pos(thet,pc,r,pos);
pos1 = pos;
pos1(1,:) = p;
[pc1,r1,theta1] = cal_arc_param(pos1);
theta1 = 360-theta1;

x1 = linspace(0,0,(thet-theta1)/t_inter+1);
y1 = linspace(0,0,(thet-theta1)/t_inter+1);
z1 = linspace(0,0,(thet-theta1)/t_inter+1);

j = 1;
i = thet;
for i = thet:t_inter:theta  
  [p,dir] = cal_arc_acc_pos(i,pc1,r1,pos);
   x1(j) = p(1);
   y1(j) = p(2);
   z1(j) = p(3);
   j = j+1;
end
figure;
plot3(x1,y1,z1);



