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












ccd = [1439;879.99;0; 1];

x9 = [2094.746 1440.256 747.2 706.104 1408.757 2066.643 2036.782 1372.927 681.606];
y9 = [1585.9 1584.107 1586.106 902.765 871.129 826.134 188.52 209.764 203.629];

xw9 = [-211.699946 -187.699927 -162.620209 -161.300051 -186.79997 -210.600176 -209.599926 -185.499952 -160.40004];
yw9 = [348.699818 348.299993 348.000094 323.39995 322.499792 321.199618 297.999989 298.700057 297.900032];

disp_ratio_ccd_l = ((x9(1)-x9(9))^2+ (y9(1)-y9(9))^2)^0.5;
disp_ratio_wcs_l = ((xw9(1)-xw9(9))^2+ (yw9(1)-yw9(9))^2)^0.5;


disp_ratio = disp_ratio_wcs_l/disp_ratio_ccd_l;
%x9 = x9*disp_ratio
%y9 = y9*disp_ratio



T3 = [sum(x9.^2) sum(x9.*y9) sum(x9);
     sum(x9.*y9) sum(y9.^2) sum(y9);
     sum(x9) sum(y9) 9];
 
T23 = [sum(x9.*xw9) sum(x9.*yw9);
    sum(y9.*xw9)  sum(y9.*yw9);
    sum(xw9) sum(yw9)];


T_all = inv(T3)*T23

% T_trans = [-0.036317347190735 9.82533828568349e-05 0 -135.670782898054;0.00047438451912265 0.0361831709441968 0  290.310645237243;0 0 1 -116.4;0 0 0 1]

T_trans = eye(4);

T_trans(1,1) = T_all(1,1);
T_trans(1,2) = T_all(2,1);

T_trans(2,1) = T_all(1,2);
T_trans(2,2) = T_all(2,2);

T_trans(1,4) = T_all(3,1);
T_trans(2,4) = T_all(3,2);

ccd1 = [1439.678 879.999 0 1]';
ccd2 = [1824.031 889.223 0 1]';
ccd3 = [1922.676 895.076 0 1]';
T_trans
% ccd1 = ccd1*disp_ratio;ccd1(4) = 1.0;
% ccd2 = ccd2*disp_ratio;ccd2(4) = 1.0;
% ccd3 = ccd3*disp_ratio;ccd3(4) = 1.0;
ccd1 = ccd1;ccd1(4) = 1.0;
ccd2 = ccd2;ccd2(4) = 1.0;
ccd3 = ccd3;ccd3(4) = 1.0;

T_trans*ccd1

T_trans*ccd2

T_trans*ccd3





