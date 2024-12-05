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

%????,???????????,???;
%????,scara_dy_fir_test?????????????;

clear;
clc;

global Ts ;
Ts = 0.01;


total_time = 20.0;
t = 0:Ts:total_time;

pos1 = 0.4*sin(t)*180.0/pi; vel1 = 0.4*sin(t+pi/2)*180.0/pi; acc1 = 0.4*sin(t+pi)*180.0/pi;
pos2 = 1.2*pos1; vel2 = 1.2*vel1; acc2 = 1.2*acc1;
pos3 = -1.5*pos1; vel3 = -1.5*vel1; acc3 = -1.5*acc1;
pos4 = 2.0*pos1; vel4 = 2.0*vel1; acc4 = 2.0*acc1;



q1 = [t',pos1']; dq1 = [t',vel1']; ddq1 = [t',acc1'];
q2 = [t',pos2']; dq2 = [t',vel2']; ddq2 = [t',acc2'];
d3 = [t',pos3']; dd3 = [t',vel3']; ddd3 = [t',acc3'];
q4 = [t',pos4']; dq4 = [t',vel4']; ddq4 = [t',acc4'];





global g a1 a2 d4 m1 m2 m3 m4;
global ic1xx ic1xy ic1xz ic1yy ic1yz ic1zz ic2xx ic2xy ic2xz ic2yy ic2yz ic2zz ic3xx ic3xy ic3xz ic3yy ic3yz ic3zz ic4xx ic4xy ic4xz ic4yy ic4yz ic4zz;
global pc1x pc1y pc1z pc2x pc2y pc2z pc3x pc3y pc3z pc4x pc4y pc4z;
global ic1 ic2 ic3 ic4;
global Pc11 Pc22 Pc33 Pc44;


g = 9.80665;
a1 = 0.5;%m
a2 = 0.5;
m1 = 8.2529202e01;  m2 = 7.8510002e01;  m3 = 2.4257629e01;  m4 = 8.4095723e00;
ic1xx = 3.0267348e-01; ic1xy = 5.6767540e-06; ic1xz = 0.0; ic1yy = 3.0534128e+00; ic1yz = 0.0; ic1zz = 3.2680551e+00;
ic2xx = 2.9838633e-01; ic2xy = 5.6767540e-06; ic2xz = 0.0; ic2yy = 2.7850659e+00; ic2yz = 0.0; ic2zz = 2.9997082e+00;
ic3xx = 4.4419709e-01; ic3xy = 0.0; ic3xz = 0.0; ic3yy = 4.4419708e-01; ic3yz = 0.0; ic3zz = 3.3140314e-02;
 ic4xx = 1.5463060e-02; ic4xy = 0.0; ic4xz = 0.0; ic4yy = 1.5463047e-02; ic4yz = 0.0; ic4zz = 1.6697070e-02;
pc1x = 2.5000000e-01; pc1y = 0.0; pc1z = -4.0000000e-02;
pc2x = 2.3720163e-01; pc2y = 0.0; pc2z = 4.0000000e-02;
pc3x = 0.00; pc3y = 0.0; pc3z = 1.6311469e-01;
pc4x = 0.00; pc4y = 0.0; pc4z = -7.0483871e-02;
Pc11 = [pc1x pc1y pc1z]';Pc22 = [pc2x pc2y pc2z]';Pc33 = [pc3x pc3y pc3z]';Pc44 = [pc4x pc4y pc4z]';
d4 = pc4z;

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




