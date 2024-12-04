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

%����ָ����




function T = ew(w,v,theta)


    s1 = sin(theta);c1 = cos(theta);
    w_r = eye(3);
    A1 = w(1);A2 = w(2);A3 = w(3);
    
    w_r(1,1) = 0;w_r(1,2) = -A3;w_r(1,3) = A2;%w�ķ��Գƾ���;
    w_r(2,1) = A3;w_r(2,2) = 0;w_r(2,3) = -A1;
    w_r(3,1) = -A2;w_r(3,2) = A1;w_r(3,3) = 0;
    ew = eye(3)+w_r*s1+w_r*w_r*(1-c1);%ָ������ʽ;
    I = eye(3);
    x = cross(w,v);
    p1 = (I-ew)*x';
    T1 = eye(4);
    T1(1:3,1:3) = ew;T1(1,4) = p1(1);T1(2,4) = p1(2);T1(3,4) = p1(3);
    
    T = T1;

end