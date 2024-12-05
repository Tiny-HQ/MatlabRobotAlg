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

pos1 = [357.1 65 966.1 -170.9 34.6 173.4];
pos2 = [637.5 -197.5 929.5 166.6 -14.1 135.8];
pos3 = [401.4 376.7 948.2 -179.8 30.8 -153.9];
pos4 = [308.3 448.7 808.6 -132.3 -1.8 -121];





%??????;
Pc = cal_sphere_center(pos1,pos2,pos3,pos4)



%???????xyz;
BB = Pc-pos1(1:3)';
%sqrt(sum(BB.^2))%??????
AA = eye(4);
AA = rotz(pos1(4))*roty(pos1(5))*rotx(pos1(6));
V = inv(AA(1:3,1:3))*BB
%??:
AA(1:3,4) = pos1(1:3)';
T = eye(4);
T(1:3,4) = V;
AA*T
%?????p????????


%???????xyz;
BB = Pc-pos2(1:3)';
%sqrt(sum(BB.^2))%??????
AA = rotz(pos2(4))*roty(pos2(5))*rotx(pos2(6));
V = inv(AA(1:3,1:3))*BB
%??:
AA(1:3,4) = pos2(1:3)';
T = eye(4);
T(1:3,4) = V;
AA*T
%?????p????????


%???????xyz;
BB = Pc-pos3(1:3)';
%sqrt(sum(BB.^2))%??????
AA = rotz(pos3(4))*roty(pos3(5))*rotx(pos3(6));
V = inv(AA(1:3,1:3))*BB
%??:
AA(1:3,4) = pos3(1:3)';
T = eye(4);
T(1:3,4) = V;
AA*T
%?????p????????

%???????xyz;
BB = Pc-pos4(1:3)';
%sqrt(sum(BB.^2))%??????
AA =rotz(pos4(4))*roty(pos4(5))*rotx(pos4(6));
V = inv(AA(1:3,1:3))*BB
%??:
AA(1:3,4) = pos4(1:3)';
T = eye(4);
T(1:3,4) = V;
AA*T
%?????p????????






