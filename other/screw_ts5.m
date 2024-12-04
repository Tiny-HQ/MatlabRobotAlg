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
%ok;实际建模跟理论对应; Practical modeling corresponds to theory;


%
%
%
%           |                        |
%        ?U |------------------------|??
%           |                        |
%
%
%   ?UE莟u譺aeDlLZ?谖t諥有C鲂S轴Lt
%   旋羫求??
%   Tl奈t諥E噶z覵窤蜸[0 l 0]'
%   N橹ね?
%   姿EZ覵窤N?E莝詌?
%





clc;
clear;

syms l s1 s2 s3 c1 c2 c3 real;




q1 = [0 l 0];
q2 = [0 0 0];
q3 = [0 l 0];


w1 = [1 0 0];
w2 = [0 1 0];
w3 = [0 0 1];


v1 = -cross(w1,q1);
v2 = -cross(w2,q2);
v3 = -cross(w3,q3);


w_r = eye(3);
a1 = w1(1);a2 = w1(2);a3 = w1(3);
w_r(1,1) = 0;w_r(1,2) = -a3;w_r(1,3) = a2;%wl?磗詌C濺O?
w_r(2,1) = a3;w_r(2,2) = 0;w_r(2,3) = -a1;
w_r(3,1) = -a2;w_r(3,2) = a1;w_r(3,3) = 0;
w_r;
ew = eye(3)+w_r*s1+w_r*w_r*(1-c1);%指E齮龤TE?;
I = eye(3);
x = cross(w1,v1);
p1 = (I-ew)*x';
T1 = sym(eye(4));
T1(1:3,1:3) = ew;T1(1,4) = p1(1);T1(2,4) = p1(2);T1(3,4) = p1(3);
T1

w_r = eye(3);
a1 = w2(1);a2 = w2(2);a3 = w2(3);
w_r(1,1) = 0;w_r(1,2) = -a3;w_r(1,3) = a2;%wl?磗詌C濺O?
w_r(2,1) = a3;w_r(2,2) = 0;w_r(2,3) = -a1;
w_r(3,1) = -a2;w_r(3,2) = a1;w_r(3,3) = 0;
w_r;
ew = eye(3)+w_r*s2+w_r*w_r*(1-c2);%指E齮龤TE?;
I = eye(3);
x = cross(w2,v2);
p2 = (I-ew)*x';
T2 = sym(eye(4));
T2(1:3,1:3) = ew;T2(1,4) = p2(1);T2(2,4) = p2(2);T2(3,4) = p2(3);
T2

w_r = eye(3);
a1 = w3(1);a2 = w3(2);a3 = w3(3);
w_r(1,1) = 0;w_r(1,2) = -a3;w_r(1,3) = a2;%wl?磗詌C濺O?
w_r(2,1) = a3;w_r(2,2) = 0;w_r(2,3) = -a1;
w_r(3,1) = -a2;w_r(3,2) = a1;w_r(3,3) = 0;
w_r;
ew = eye(3)+w_r*s3+w_r*w_r*(1-c3);%指E齮龤TE?;
I = eye(3);
x = cross(w3,v3);
p3 = (I-ew)*x';
T3 = sym(eye(4));
T3(1:3,1:3) = ew;T3(1,4) = p3(1);T3(2,4) = p3(2);T3(3,4) = p3(3);
T3


T0 = [1 0 0 0;
    0 1 0 l;
    0 0 1 0;
    0 0 0 1;];

T1*T2*T3*T0


















