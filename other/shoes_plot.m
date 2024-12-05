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


[num] = load('shoes_data.mat');
x = num.shoes_data(:,1);y = num.shoes_data(:,2);


clf;
subplot(2,2,1);
plot(x,y,'*');

new_x =  linspace(0,0,length(x)/10+1);
new_y =  linspace(0,0,length(y)/10+1);

counts = 1;
for i = 1:length(x)
    if(mod(i,10)==1)
        new_x(counts) = x(i);
        new_y(counts) = y(i);
        counts = counts+1;
    end
end
subplot(2,2,2);
plot(new_x,new_y,'*');

%��һȦ
counts = 311;
new_x1 = new_x(1:counts);new_x2 = new_x(counts+1:length(new_x)-1);
new_y1 = new_y(1:counts);new_y2 = new_y(counts+1:length(new_y)-1);
t = linspace(0,20,counts);
[ax1,bx1,cx1,dx1]=c_spline_prm_calc_v3(t,new_x1,0);
pointx1 = c_spline_point_calc(ax1,bx1,cx1,dx1,t,0.004);
[ay1,by1,cy1,dy1]=c_spline_prm_calc_v3(t,new_y1,0);
pointy1 = c_spline_point_calc(ay1,by1,cy1,dy1,t,0.004);
subplot(2,2,3)
plot(pointx1,pointy1,'o');


counts = length(new_x)-counts-1;
t = linspace(0,20,counts-1);
[ax2,bx2,cx2,dx2]=c_spline_prm_calc_v3(t,new_x2,0);
pointx2 = c_spline_point_calc(ax2,bx2,cx2,dx2,t,0.004);
[ay2,by2,cy2,dy2]=c_spline_prm_calc_v3(t,new_y2,0);
pointy2 = c_spline_point_calc(ay2,by2,cy2,dy2,t,0.004);
hold on;
plot(pointx2,pointy2,'*');


subplot(2,2,4)
plot(x,y,'*');hold on;
plot(pointx1,pointy1,'yo');hold on;plot(pointx2,pointy2,'yo');

figure;
plot(x,y,'*');hold on;
plot(pointx1,pointy1,'yo');hold on;plot(pointx2,pointy2,'yo');



