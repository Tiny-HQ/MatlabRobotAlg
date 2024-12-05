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




% theta = 0:0.5:360;
% 
% 
% l = length(theta);
% scale = 100;
% 
% T = zeros(4,4,l);
% 
% for i = 1:l
%     T(:,:,i) = hrotx(theta(i))*hroty(theta(i))*hrotz(theta(i))*htrans(-i,i,i);
% end
% 
% plot_coord_data(T,scale);


theta = 0:130:360;
l = length(theta);
scale = 100;

T = zeros(4,4,l);

for i = 1:l
    T(:,:,i) = hrotx(theta(i))*hroty(theta(i))*hrotz(theta(i))*htrans(-i,i,i);
end

plot_coord_data(T,scale);