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


T_home = [1 0 0 2;
    0 1 0 0;
    0 0 1 0;
    0 0 0 1];

theta_0 = [0 0];    %?????;
T_end = [0.453596, -0.8912, 0, 1.4089;
        0.8912, 0.453596, 0, 1.18672;
        0, 0, 1, 0;
        0, 0, 0, 1];    %????;

sc = zeros(6,2);
sc(:,1) = [0 0 1 0 0 0]';
sc(:,2) = [0 0 1 0 -1 0]';


ikine_sc(sc,T_home,theta_0,T_end)

