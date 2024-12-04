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

syms Ic1xx Ic1xy Ic1xz Ic1yy Ic1yz Ic1zz m1 Pc11x Pc11y Pc11z ;
syms c1 s1;

ic1 = [Ic1xx Ic1xy Ic1xz;
    -Ic1xy Ic1yy Ic1yz;
    -Ic1xz -Ic1yz Ic1zz];

PC11 = [Pc11x Pc11y Pc11z]';

Ii1 = IC11+m1*(PC11'*PC11*eye(3)-PC11*PC11');

R01 = [c1 -s1 0;
        s1 c1 0;
        0 0 1];






























