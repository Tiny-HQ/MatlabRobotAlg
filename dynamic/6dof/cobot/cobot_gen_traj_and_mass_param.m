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

%+---+-----------+-----------+-----------+-----------+-----------+
%| j |     theta |         d |         a |     alpha |    offset |
%+---+-----------+-----------+-----------+-----------+-----------+
%|  1|          0|         d1|        0.0|        0.0|          0|
%|  2|        180|        0.0|        0.0|         90|          0|
%|  3|          0|        0.0|         a3|        0.0|          0|
%|  4|          0|         d4|         a4|        0.0|          0|
%|  5|          0|         d5|        0.0|        -90|          0|
%|  6|        180|         d6|        0.0|         90|          0|
%+---+-----------+-----------+-----------+-----------+-----------+

%+---+-----------+-----------+-----------+-----------+-----------+
%| j |     theta |         d |         a |     alpha |    offset |
%+---+-----------+-----------+-----------+-----------+-----------+
%|  1|          0|      162.5|        0.0|        0.0|          0|
%|  2|        180|        0.0|        0.0|         90|          0|
%|  3|          0|        0.0|      425.0|        0.0|          0|
%|  4|          0|      133.3|     392.25|        0.0|          0|
%|  5|          0|       99.7|        0.0|        -90|          0|
%|  6|        180|       99.6|        0.0|         90|          0|
%+---+-----------+-----------+-----------+-----------+-----------+


clc;
clear;

global Ts ;
Ts = 0.01;
total_time = 10.0;
t = 0:Ts:total_time;
le = length(t);
zero = zeros(1,le);
format long g;

pos1 = 0.4*sin(t)*180.0/pi; vel1 = 0.4*sin(t+pi/2)*180.0/pi; acc1 = 0.4*sin(t+pi)*180.0/pi;
pos2 = 1.2*pos1; vel2 = 1.2*vel1; acc2 = 1.2*acc1;
pos3 = 1.5*pos1; vel3 = 1.5*vel1; acc3 = 1.5*acc1;
pos4 = 2.0*pos1; vel4 = 2.0*vel1; acc4 = 2.0*acc1;
pos5 = -2.0*pos1; vel5 = -2.0*vel1; acc5 = -2.0*acc1;
pos6 = 2.5*pos1; vel6 = 2.5*vel1; acc6 = 2.5*acc1;


q1 = [t',pos1']; dq1 = [t',vel1']; ddq1 = [t',acc1'];
q2 = [t',pos2']; dq2 = [t',vel2']; ddq2 = [t',acc2'];
q3 = [t',pos3']; dq3 = [t',vel3']; ddq3 = [t',acc3'];
q4 = [t',pos4']; dq4 = [t',vel4']; ddq4 = [t',acc4'];
q5 = [t',pos5']; dq5 = [t',vel5']; ddq5 = [t',acc5'];
q6 = [t',pos6']; dq6 = [t',vel6']; ddq6 = [t',acc6'];

%q1 = [zero',zero']; dq1 = [zero',zero']; ddq1 = [zero',zero'];
% q2 = [zero',zero']; dq2 = [zero',zero']; ddq2 = [zero',zero'];
% q3 = [zero',zero']; dq3 = [zero',zero']; ddq3 = [zero',zero'];
% q4 = [zero',zero']; dq4 = [zero',zero']; ddq4 = [zero',zero'];
%  q5 = [zero',zero']; dq5 = [zero',zero']; ddq5 = [zero',zero'];
% q6 = [zero',zero']; dq6 = [zero',zero']; ddq6 = [zero',zero'];

%生成质量参数;
global g m1 m2 m3 m4 m5 m6;
global a3 a4 d1 d4 d5 d6;
global ic1xx ic1xy ic1xz ic1yy ic1yz ic1zz ic2xx ic2xy ic2xz ic2yy ic2yz ic2zz ic3xx ic3xy ic3xz ic3yy ic3yz ic3zz;
global ic4xx ic4xy ic4xz ic4yy ic4yz ic4zz ic5xx ic5xy ic5xz ic5yy ic5yz ic5zz ic6xx ic6xy ic6xz ic6yy ic6yz ic6zz;
global pc1x pc1y pc1z pc2x pc2y pc2z pc3x pc3y pc3z pc4x pc4y pc4z pc5x pc5y pc5z pc6x pc6y pc6z;
global ic1 ic2 ic3 ic4 ic5 ic6;
global Pc111 Pc222 Pc333 Pc444 Pc555 Pc666;
global P001 P112 P223 P334 P445 P556 P667;

global ii1 ii2 ii3 ii4 ii5 ii6 U_r;


g = 9.8065;
a3 = 425.0/1000.0;
a4 = 392.430/1000.0;
d1 = 89.2/1000.0;
d4 = 109/1000.0;
d5 = 93.650/1000.0;
d6 = 82.0/1000.0;

m1 = 4.43412756;  m2 = 16.84660904;  m3 = 4.60251258;  m4 = 0.47079045;m5 = 0.07740646;m6 = 0.00343612;

ic1xx = 27327.74254539/1e6;  ic1xy = 0.01004954/1e6;        ic1xz = -0.00779330/1e6;        ic1yy = 13316.18396352/1e6;      ic1yz = 278.53998863/1e6;       ic1zz = 27164.17826539/1e6;
ic2xx = 97229.72023998/1e6;  ic2xy = 7.88590602/1e6;        ic2xz = 4347.46076297/1e6;      ic2yy = 596573.36974102/1e6;     ic2yz = 48.38291302/1e6;        ic2zz = 659758.11150989/1e6;
ic3xx = 82615.26803540/1e6;  ic3xy = -0.48370451/1e6;       ic3xz = -0.36529045/1e6;        ic3yy = 9191.62918392/1e6;       ic3yz = -2.27394513/1e6;        ic3zz = 87354.59533550/1e6;
ic4xx = 772.88609433/1e6;    ic4xy = 0.0;                   ic4xz = 0.0;                    ic4yy = 737.71865597/1e6;        ic4yz = 0.0;                    ic4zz = 466.83449961/1e6;
ic5xx = 43.03191218/1e6;     ic5xy = 0.00000113/1e6;        ic5xz = -0.00001206/1e6;        ic5yy = 16.96626524/1e6;         ic5yz = 0.0;                    ic5zz = 45.41353352/1e6;
ic6xx = 0.16156936/1e6;      ic6xy = -0.00000078/1e6;       ic6xz = 0.00002638/1e6;         ic6yy = 0.16156919/1e6;          ic6yz = -0.00003322/1e6;        ic6zz = 0.13635579/1e6;
pc1x = 0.0;                  pc1y = 22.50469351/1e3;        pc1z = -2.79144309/1e3;
pc2x = 82.73652456/1e3;      pc2y = -0.04677543/1e3;        pc2z = 75.58039753/1e3;
pc3x = -0.00117880/1e3;      pc3y = 88.77417776/1e3;        pc3z = -10.15843771/1e3;
pc4x = 0.00;                 pc4y = 0.0;                    pc4z = -32.40904555/1e3;
pc5x = 0.00;                 pc5y = 10.97413693/1e3;        pc5z = 0.0;
pc6x = -0.00143273/1e3;      pc6y = 0.00162829/1e3;         pc6z = -1.68591556/1e3;
Pc111 = [pc1x pc1y pc1z]';Pc222 = [pc2x pc2y pc2z]';Pc333 = [pc3x pc3y pc3z]';Pc444 = [pc4x pc4y pc4z]';Pc555 = [pc5x pc5y pc5z]';Pc666 = [pc6x pc6y pc6z]';

P001 = [0 0 d1]';P112 = [0 0 0]';P223 = [a3 0 0]';P334 = [a4 0 d4]';P445 = [0 d5 0]';P556 = [0 -d6 0]';  P667 = [0 0 0]';        

ic1=[ic1xx -ic1xy -ic1xz;
 -ic1xy ic1yy -ic1yz;
 -ic1xz -ic1yz ic1zz];  

ic2=[ic2xx -ic2xy -ic2xz;
 -ic2xy ic2yy -ic2yz;
 -ic2xz -ic2yz ic2zz];

ic3=[ic3xx -ic3xy -ic3xz;
 -ic3xy ic3yy -ic3yz;
 -ic3xz -ic3yz ic3zz];   

ic4=[ic4xx -ic4xy -ic4xz;
 -ic4xy ic4yy -ic4yz;
 -ic4xz -ic4yz ic4zz];


ic5=[ic5xx -ic5xy -ic5xz;
 -ic5xy ic5yy -ic5yz;
 -ic5xz -ic5yz ic5zz];

ic6=[ic6xx -ic6xy -ic6xz;
 -ic6xy ic6yy -ic6yz;
 -ic6xz -ic6yz ic6zz];


 ii1 = ic1+m1*(Pc111'*Pc111*eye(3)-Pc111*Pc111');
 ii2 = ic2+m2*(Pc222'*Pc222*eye(3)-Pc222*Pc222');
 ii3 = ic3+m3*(Pc333'*Pc333*eye(3)-Pc333*Pc333');
 ii4 = ic4+m4*(Pc444'*Pc444*eye(3)-Pc444*Pc444');
 ii5 = ic5+m5*(Pc555'*Pc555*eye(3)-Pc555*Pc555');
 ii6 = ic6+m6*(Pc666'*Pc666*eye(3)-Pc666*Pc666');













