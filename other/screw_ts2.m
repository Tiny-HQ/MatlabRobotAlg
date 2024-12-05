
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
%standford ��е����������;absolutely correct!! Standford manipulator spin positive solution; absolutely correct!!



clc;
clear;

syms l0 l1 l2 real;
syms s1 s2 s3 s4 s5 s6 c1 c2 c3 c4 c5 c6 real;


kc1 = [0 0 0 0 0 1];
kc2 = [0 -l0 0 -1 0 0];
kc3 = [0 -l0 l1 -1 0 0];
kc4 = [l1+l2 0 0 0 0 1];
kc5 = [0 -l0 l1+l2 -1 0 0];
kc6 = [-l0 0 0 0 1 0];


R1 = sym(eye(3));
w1 = kc1(4:6);v1 = kc1(1:3);
a1 = kc1(4);a2 = kc1(5);a3 = kc1(6);
R1(1,1) = 0;R1(1,2) = -a3;R1(1,3) = a2;
R1(2,1) = a3;R1(2,2) = 0;R1(2,3) = -a1;
R1(3,1) = -a2;R1(3,2) = a1;R1(3,3) = 0;
R1_ = eye(3)+R1*s1+R1*R1*(1-c1);%?????;
p1 = (eye(3)-R1_)*(cross(w1,v1))';
T1 = sym(eye(4));
T1(1:3,1:3) = R1_;
T1(1,4) = p1(1);T1(2,4) = p1(2);T1(3,4) = p1(3);
T1
% 
R2 = sym(eye(3));
w2 = kc2(4:6);v2 = kc2(1:3);
a1 = kc2(4);a2 = kc2(5);a3 = kc2(6);
R2(1,1) = 0;R2(1,2) = -a3;R2(1,3) = a2;
R2(2,1) = a3;R2(2,2) = 0;R2(2,3) = -a1;
R2(3,1) = -a2;R2(3,2) = a1;R2(3,3) = 0;
R2_ = eye(3)+R2*s2+R2*R2*(1-c2);%?????;
p2 = (eye(3)-R2_)*(cross(w2,v2))';
T2 = sym(eye(4));
T2(1:3,1:3) = R2_;
T2(1,4) = p2(1);T2(2,4) = p2(2);T2(3,4) = p2(3);
T2
% 
% 

R3 = sym(eye(3));
w3 = kc3(4:6);v3 = kc3(1:3);
a1 = kc3(4);a2 = kc3(5);a3 = kc3(6);
R3(1,1) = 0;R3(1,2) = -a3;R3(1,3) = a2;
R3(2,1) = a3;R3(2,2) = 0;R3(2,3) = -a1;
R3(3,1) = -a2;R3(3,2) = a1;R3(3,3) = 0;
R3_ = eye(3)+R3*s3+R3*R3*(1-c3);%?????;
p3 = (eye(3)-R3_)*(cross(w3,v3))';
T3 = sym(eye(4));
T3(1:3,1:3) = R3_;
T3(1,4) = p3(1);T3(2,4) = p3(2);T3(3,4) = p3(3);
T3
% 
% 
R4 = sym(eye(3));
w4 = kc4(4:6);v4 = kc4(1:3);
a1 = kc4(4);a2 = kc4(5);a3 = kc4(6);
R4(1,1) = 0;R4(1,2) = -a3;R4(1,3) = a2;
R4(2,1) = a3;R4(2,2) = 0;R4(2,3) = -a1;
R4(3,1) = -a2;R4(3,2) = a1;R4(3,3) = 0;
R4_ = eye(3)+R4*s4+R4*R4*(1-c4);%?????;
p4 = (eye(3)-R4_)*(cross(w4,v4))';
T4 = sym(eye(4));
T4(1:3,1:3) = R4_;
T4(1,4) = p4(1);T4(2,4) = p4(2);T4(3,4) = p4(3);
T4
% 

R5 = sym(eye(3));
w5 = kc5(4:6);v5 = kc5(1:3);
a1 = kc5(4);a2 = kc5(5);a3 = kc5(6);
R5(1,1) = 0;R5(1,2) = -a3;R5(1,3) = a2;
R5(2,1) = a3;R5(2,2) = 0;R5(2,3) = -a1;
R5(3,1) = -a2;R5(3,2) = a1;R5(3,3) = 0;
R5_ = eye(3)+R5*s5+R5*R5*(1-c5);%?????;
p5 = (eye(3)-R5_)*(cross(w5,v5))';
T5 = sym(eye(4));
T5(1:3,1:3) = R5_;
T5(1,4) = p5(1);T5(2,4) = p5(2);T5(3,4) = p5(3);
T5
% 
% 
R6 = sym(eye(3));
w6 = kc6(4:6);v6 = kc6(1:3);
a1 = kc6(4);a2 = kc6(5);a3 = kc6(6);
R6(1,1) = 0;R6(1,2) = -a3;R6(1,3) = a2;
R6(2,1) = a3;R6(2,2) = 0;R6(2,3) = -a1;
R6(3,1) = -a2;R6(3,2) = a1;R6(3,3) = 0;
R6_ = eye(3)+R6*s6+R6*R6*(1-c6);%?????;
p6 = (eye(3)-R6_)*(cross(w6,v6))';
T6 = sym(eye(4));
T6(1:3,1:3) = R6_;
T6(1,4) = p6(1);T6(2,4) = p6(2);T6(3,4) = p6(3);
T6
% 
T0 = sym(eye(4));
T0(2,4) = l1+l2;
T0(3,4) = l0;
T0


%????????,4 5 6????????????;
T1*T2*T3*T4*T5*T6*T0



















