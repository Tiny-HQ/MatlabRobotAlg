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





%scara ����ѧ���;


clc;
clear;


format long g;

syms a1 a2 d4 real;             %dh����; DH parameters
syms d3_c real;                 %3������; 3-axis centroid
syms q1 q2 d3 q4 real;          %�ؽڽǶ��Լ��ؽ��ƶ���;Joint angle and the amount of joint movement
syms g real;                    %�������ٶ� Gravitational acceleration
syms m1 m2 m3 m4 real;          %����;mass


syms ic1xx ic1xy ic1xz ic1yy ic1yz ic1zz real;    %����;inertia
syms ic2xx ic2xy ic2xz ic2yy ic2yz ic2zz real;    %����;inertia
syms ic3xx ic3xy ic3xz ic3yy ic3yz ic3zz real;    %����;inertia
syms ic4xx ic4xy ic4xz ic4yy ic4yz ic4zz real;    %����;inertia

syms pc1x pc1y pc1z pc2x pc2y pc2z pc3x pc3y pc3z pc4x pc4y pc4z real;

syms dq1 ddq1 dq2 ddq2 dd3 ddd3 dq4 ddq4 real;     %�ٶȡ����ٶ�;vel acc

ic1=[ic1xx -ic1xy -ic1xz;
     -ic1xy ic1yy -ic1yz;
     -ic1xz -ic1yz ic1zz];              %�������� inertia matrix

ic2=[ic2xx -ic2xy -ic2xz;
     -ic2xy ic2yy -ic2yz;
     -ic2xz -ic2yz ic2zz];              %�������� inertia matrix

ic3=[ic3xx -ic3xy -ic3xz;
     -ic3xy ic3yy -ic3yz;
     -ic3xz -ic3yz ic3zz];              %�������� inertia matrix
 
 ic4=[ic4xx -ic4xy -ic4xz;
     -ic4xy ic4yy -ic4yz;
     -ic4xz -ic4yz ic4zz];              %�������� inertia matrix
 
 R01 = [cos(q1) -sin(q1) 0 ;
     sin(q1) cos(q1) 0;
     0 0 1];
 R10 = R01';

 R12 = [cos(q2) -sin(q2) 0 ;
     sin(q2) cos(q2) 0;
     0 0 1];
 R21 = R12';
 
 R23 = [1 0 0;
        0 1 0;
        0 0 1];
 R32 = R23';
 
 R34 = [cos(q4) -sin(q4) 0 ;
        sin(q4) cos(q4) 0;
        0 0 1];
 R43 = R34';
 R45 = [1 0 0;0 1 0;0 0 1];R54 = R45';
 
Z11 = [0 0 1]'; Z22 = [0 0 1]'; Z33 = [0 0 1]'; Z44 = [0 0 1]'; 
P10 = [0 0 0]'; P21 = [a1 0 0]';P32 = [a2 0 d3]';P43 = [0 0 -d4]';P54 = [0 0 0]';      %p43����д��[0 0 0]',���﷽����simulink��Ӧ; %p43 can be written as [0 0 0]', which is convenient for simulink correspondence;
% Pc11 = [a1/2 0 0]';Pc22 = [a2/2 0 0]';Pc33 = [0 0 d3_c]';Pc44 = [0 0 0]';
Pc11 = [pc1x pc1y pc1z]';Pc22 = [pc2x pc2y pc2z]';Pc33 = [pc3x pc3y pc3z]';Pc44 = [pc4x pc4y pc4z]';
 
w00 = [0 0 0]';     dw00 = [0 0 0]';     v00 = [0 0 0]';    dv00 = [0 0 g]';
 
%1->4.c
w11 = R10*w00+dq1*Z11;
dw11 = R10*dw00+cross(R10*w00,dq1*Z11)+ddq1*Z11;
dv11 = R10*(cross(dw00,P10)+cross(w00,cross(w00,P10))+dv00);
dvc11 = cross(dw11,Pc11)+cross(w11,cross(w11,Pc11))+dv11;
F11 = m1*dvc11;
N11 = ic1*dw11+cross(w11,ic1*w11);


w22 = R21*w11+dq2*Z22;
dw22 = R21*dw11+cross(R21*w11,dq2*Z22)+ddq2*Z22;
dv22 = R21*(cross(dw11,P21)+cross(w11,cross(w11,P21))+dv11);
dvc22 = cross(dw22,Pc22)+cross(w22,cross(w22,Pc22))+dv22;
F22 = m2*dvc22;
N22 = ic2*dw22+cross(w22,ic2*w22);


w33 = R32*w22;
dw33 = R32*dw22;
dv33 = R32*(cross(dw22,P32)+cross(w22,cross(w22,P32))+dv22)+2*cross(w33,-dd3*Z33)+ddd3*Z33;
dvc33 = cross(dw33,Pc33)+cross(w33,cross(w33,Pc33))+dv33;
F33 = m3*dvc33;
N33 = ic3*dw33+cross(w33,ic3*w33);

w44 = R43*w33+dq4*Z44;
dw44 = R43*dw33+cross(R43*w33,dq4*Z44)+ddq4*Z44;
dv44 = R43*(cross(dw33,P43)+cross(w33,cross(w33,P43))+dv33);
dvc44 = cross(dw44,Pc44)+cross(w44,cross(w44,Pc44))+dv44;
F44 = m4*dvc44;
N44 = ic4*dw44+cross(w44,ic4*w44);


%5->1
f55 = [0 0 0]';n55 = [0 0 0]';

f44 = R45*f55+F44;
n44 = N44+R45*n55+cross(Pc44,F44)+cross(P54,R45*f55);

f33 = R34*f44+F33;
n33 = N33+R34*n44+cross(Pc33,F33)+cross(P43,R34*f44);

f22 = R23*f33+F33;
n22 = N22+R23*n33+cross(Pc22,F22)+cross(P32,R23*f33);

f11 = R12*f22+F22;
n11 = N11+R12*n22+cross(Pc11,F11)+cross(P21,R12*f22);



tao1 = n11(3)
tao2 = n22(3)
tao3 = f33(3)
tao4 = n44(3)



