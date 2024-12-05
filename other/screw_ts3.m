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


%��������ת�����������; Calculation matrix of rotational spinor for a single axis;


clc;


syms c1 s1 l0 l1 l2;


%kc1 = [0 0 0 0 0 1];
% kc1 = [0 -l0 0 -1 0 0];
% kc1 = [0 -l0 l1 -1 0 0];
% kc1 = [l1+l2 0 0 0 0 1];
% kc1 = [0 -l0 l1+l2 -1 0 0];
 kc1 = [-l0 0 0 0 0 1];


w = kc1(4:6);
v = kc1(1:3);

w_r = eye(3);
a1 = w(1);a2 = w(2);a3 = w(3);
w_r(1,1) = 0;w_r(1,2) = -a3;w_r(1,3) = a2;%w�ķ��Գƾ���; w's antisymmetric matrix;
w_r(2,1) = a3;w_r(2,2) = 0;w_r(2,3) = -a1;
w_r(3,1) = -a2;w_r(3,2) = a1;w_r(3,3) = 0;
w_r;
ew = eye(3)+w_r*s1+w_r*w_r*(1-c1);%ָ������ʽ; exponential product formula;

I = eye(3);
x = cross(w,v);
p1 = (I-ew)*x';
T1 = sym(eye(4));
T1(1:3,1:3) = ew;T1(1,4) = p1(1);T1(2,4) = p1(2);T1(3,4) = p1(3);
T1



























