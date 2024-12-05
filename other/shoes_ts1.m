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


v_fcs = load('bug.txt');
v_tcs = [38.3034 -54.4562 191.767 0 0 0];

[m,n] = size(v_fcs);

T_fcs = zeros(4,4,m);
T_wcs = zeros(4,4,m);
v_wcs = zeros(m,n);
for i = 1:m
    T_fcs(:,:,i) = cs_define_zyzeul(v_fcs(i,:));
    T_wcs(:,:,i) = T_fcs(:,:,i)*cs_define_zyzeul(v_tcs);
    v_wcs(i,:) = htr2zyz(T_wcs(:,:,i));
end

figure;

plot_coord_data_dynamic(T_wcs,10,10);
hold on;
plot3(v_wcs(:,1),v_wcs(:,2),v_wcs(:,3));

figure;
v_tcs = [-38.3034 54.4562 191.767 0 0 0];
for i = 1:m
    T_fcs(:,:,i) = cs_define_zyzeul(v_fcs(i,:));
    T_wcs(:,:,i) = T_fcs(:,:,i)*cs_define_zyzeul(v_tcs);
     v_wcs(i,:) = htr2zyz(T_wcs(:,:,i));
end
plot_coord_data_dynamic(T_wcs,10,10);
plot3(v_wcs(:,1),v_wcs(:,2),v_wcs(:,3));
