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

%�����ɶ���������;forward solution of six-degree-of-freedom screw;
%Ӧ������ȷ�ģ���dh����Ľ����ͬ������ĽǶ����90��dh�ж���90�ȶ�Ӧ�����0��; It should be correct, the same as the result of DH calculation, the angle difference of the two axes is 90, and the 90 degrees of the two axes in DH correspond to 0 degrees here;



clc;
clear;

% 
% syms d1 d3 d4 a1 a2 a3 d6 real;
% 
% syms theta1 theta2 theta3 theta4 theta5 theta6 real;
% 
% syms s1 s2 s3 s4 s5 s6 s7 c1 c2 c3 c4 c5 c6 c7 real;

alpha0 = 0;         a0 = 0;         theta1 = 130;     d1 = 0.43;
alpha1 = 90;        a1 = 0.163655;  theta2 = -65;     d2 = 0;
alpha2 = 0;         a2 = 0.550739;  theta3 = 156;     d3 = -0.001279;
alpha3 = 90;        a3 = 0.208847;  theta4 = -40;     d4 = 0.700029;
alpha4 = -90;       a4 =0;          theta5 = 20;     d5 = 0;
alpha5 = 90;        a5 = 0;         theta6 = -90;     d6 = 0.115;

d3 = -d3;

c1 = cos(theta1*pi/180);s1 = sin(theta1*pi/180);
c2 = cos(theta2*pi/180);s2 = sin(theta2*pi/180);
c3 = cos(theta3*pi/180);s3 = sin(theta3*pi/180);
c4 = cos(theta4*pi/180);s4 = sin(theta4*pi/180);
c5 = cos(theta5*pi/180);s5 = sin(theta5*pi/180);
c6 = cos(theta6*pi/180);s6 = sin(theta6*pi/180);



w1 = [0 0 1];
w2 = [0 -1 0];
w3 = [0 -1 0];
w4 = [1 0 0];
w5 = [0 -1 0];
w6 = [1 0 0];



q1 = [0 0 0];
q2 = [a1 0 d1];
q3 = [a1 d3 d1+a2];
q4 = [0 d3 d1+a2+a3];
q5 = [a1+d4 0 d1+a2+a3];
q6 = [0 d3 d1+a2+a3];


v1 = -cross(w1,q1);
v2 = -cross(w2,q2);
v3 = -cross(w3,q3);
v4 = -cross(w4,q4);
v5 = -cross(w5,q5);
v6 = -cross(w6,q6);




w_r = eye(3);
A1 = w1(1);A2 = w1(2);A3 = w1(3);
w_r(1,1) = 0;w_r(1,2) = -A3;w_r(1,3) = A2;%w�ķ��Գƾ���; w's antisymmetric matrix;
w_r(2,1) = A3;w_r(2,2) = 0;w_r(2,3) = -A1;
w_r(3,1) = -A2;w_r(3,2) = A1;w_r(3,3) = 0;
ew = eye(3)+w_r*s1+w_r*w_r*(1-c1);%ָ������ʽ; exponential product formula;
I = eye(3);
x = cross(w1,v1);
p1 = (I-ew)*x';
T1 = sym(eye(4));
T1(1:3,1:3) = ew;T1(1,4) = p1(1);T1(2,4) = p1(2);T1(3,4) = p1(3);
vpa(T1,3)

w_r = eye(3);
A1 = w2(1);A2 = w2(2);A3 = w2(3);
w_r(1,1) = 0;w_r(1,2) = -A3;w_r(1,3) = A2;%w�ķ��Գƾ���; w's antisymmetric matrix;
w_r(2,1) = A3;w_r(2,2) = 0;w_r(2,3) = -A1;
w_r(3,1) = -A2;w_r(3,2) = A1;w_r(3,3) = 0;
ew = eye(3)+w_r*s2+w_r*w_r*(1-c2);%ָ������ʽ; exponential product formula;
I = eye(3);
x = cross(w2,v2);
p2 = (I-ew)*x';
T2 = sym(eye(4));
T2(1:3,1:3) = ew;T2(1,4) = p2(1);T2(2,4) = p2(2);T2(3,4) = p2(3);
vpa(T2,3)


w_r = eye(3);
A1 = w3(1);A2 = w3(2);A3 = w3(3);
w_r(1,1) = 0;w_r(1,2) = -A3;w_r(1,3) = A2;%w�ķ��Գƾ���;w's antisymmetric matrix;
w_r(2,1) = A3;w_r(2,2) = 0;w_r(2,3) = -A1;
w_r(3,1) = -A2;w_r(3,2) = A1;w_r(3,3) = 0;
ew = eye(3)+w_r*s3+w_r*w_r*(1-c3);%ָ������ʽ;exponential product formula;
I = eye(3);
x = cross(w3,v3);
p3 = (I-ew)*x';
T3 = sym(eye(4));
T3(1:3,1:3) = ew;T3(1,4) = p3(1);T3(2,4) = p3(2);T3(3,4) = p3(3);
vpa(T3,3)


w_r = eye(3);
A1 = w4(1);A2 = w4(2);A3 = w4(3);
w_r(1,1) = 0;w_r(1,2) = -A3;w_r(1,3) = A2;%w�ķ��Գƾ���; w's antisymmetric matrix;
w_r(2,1) = A3;w_r(2,2) = 0;w_r(2,3) = -A1;
w_r(3,1) = -A2;w_r(3,2) = A1;w_r(3,3) = 0;
ew = eye(3)+w_r*s4+w_r*w_r*(1-c4);%ָ������ʽ; exponential product formula;
I = eye(3);
x = cross(w4,v4);
p4 = (I-ew)*x';
T4 = sym(eye(4));
T4(1:3,1:3) = ew;T4(1,4) = p4(1);T4(2,4) = p4(2);T4(3,4) = p4(3);
vpa(T4,3)



w_r = eye(3);
A1 = w5(1);A2 = w5(2);A3 = w5(3);
w_r(1,1) = 0;w_r(1,2) = -A3;w_r(1,3) = A2;%w�ķ��Գƾ���; w's antisymmetric matrix;
w_r(2,1) = A3;w_r(2,2) = 0;w_r(2,3) = -A1;
w_r(3,1) = -A2;w_r(3,2) = A1;w_r(3,3) = 0;
ew = eye(3)+w_r*s5+w_r*w_r*(1-c5);%ָ������ʽ; exponential product formula;
I = eye(3);
x = cross(w5,v5);
p5 = (I-ew)*x';
T5 = sym(eye(4));
T5(1:3,1:3) = ew;T5(1,4) = p5(1);T5(2,4) = p5(2);T5(3,4) = p5(3);
vpa(T5,3)



w_r = eye(3);
A1 = w6(1);A2 = w6(2);A3 = w6(3);
w_r(1,1) = 0;w_r(1,2) = -A3;w_r(1,3) = A2;%w�ķ��Գƾ���;w's antisymmetric matrix;
w_r(2,1) = A3;w_r(2,2) = 0;w_r(2,3) = -A1;
w_r(3,1) = -A2;w_r(3,2) = A1;w_r(3,3) = 0;
ew = eye(3)+w_r*s6+w_r*w_r*(1-c6);%ָ������ʽ;exponential product formula;
I = eye(3);
x = cross(w6,v6);
p6 = (I-ew)*x';
T6 = sym(eye(4));
T6(1:3,1:3) = ew;T6(1,4) = p6(1);T6(2,4) = p6(2);T6(3,4) = p6(3);
vpa(T6,3)





T0 = [0 0 1 a1+d4+d6;
    0 -1 0 d3;
    1 0 0 d1+a2+a3;
    0 0 0 1];

vpa(T1*T2*T3*T4*T5*T6*T0,3)

vpa(T1*T2*T3)

vpa(T4*T5*T6)

