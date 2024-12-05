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


% pos1 = [329.908 69.296 121.859 0.0 179.5 0.0];
% pos2 = [390.507 63.288 121.859 0.0 179.5 30.733];
% pos3 = [268.706 -123.03 121.859 0.0 179.5 -128.548];

pos1 = [602.000 0.0 602.241 180 178.32 0.0];
pos2 = [554.000 0.0 582.000 0.0 149.267 180];
pos3 = [515.528 0.0 486.317 0.0 68.9483 180];

pos = [pos1(1:3);pos2(1:3);pos3(1:3)];

[Pc,r,theta] = cal_arc_param(pos)

BB = Pc-pos1(1:3);
AA = cs_define_zyzeul(pos1);
V1 = inv(AA(1:3,1:3))*BB';

BB = Pc-pos2(1:3);
AA = rotz(pos2(4))*roty(pos2(5))*rotz(pos2(6));
V2 = inv(AA(1:3,1:3))*BB';

BB = Pc-pos3(1:3);
AA = rotz(pos3(4))*roty(pos3(5))*rotz(pos3(6));
V3 = inv(AA(1:3,1:3))*BB';

Tcs = (V1+V2+V3)/3;
Tcs





