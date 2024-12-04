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


T1 = hrotz(90)*hrotx(30)*hroty(20);
T2 = hrotz(30)*hrotx(45)*hroty(-45);


Q1 = R_to_quaternion(splitT_R(T1));
Q2 = R_to_quaternion(splitT_R(T2));

Q = zeros(100,4);
T = zeros(4,4,100);


for i = 1:100
    Q(i,:) = slerp(Q1,Q2,i/100);
    T(:,:,i) = eye(4);
    T(1:3,1:3,i) = quaternion_to_R(Q(i,:));
end


plot_coord_data_dynamic(T,10,100);







