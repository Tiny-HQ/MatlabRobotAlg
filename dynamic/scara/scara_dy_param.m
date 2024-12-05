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
g= 9.80665;

q=[ q1 q2 0 q4 ];
al=[ 0 0 0 0 ];
a1=0.5;   a2=0.5;    % ��λ����

P001 = [0; 0; 0];
P112 = [a1; 0; 0];
P223 = [a2; 0; d3];
P334 = [0; 0; 0];

W000=[0;0;0];   dW000=[0;0;0]; 
dV000=[0;0;g]; 
Z111=[0;0;1];   Z222=[0;0;1];  Z333=[0;0;1];  Z444=[0;0;1]; 

m1 = 8.2529202e01;  m2 = 7.8510002e01;  m3 = 2.4257629e01;  m4 = 8.4095723e00;

Pc111 = [2.5000000e-01  0.0000000e+00   -4.0000000e-02]';
Pc222 = [2.3720163e-01  0.0000000e+00	4.0000000e-02]';
Pc333 = [0.0000000e+00	0.0000000e+00	1.6311469e-01]';
Pc444 = [0.0000000e+00	0.0000000e+00	-7.0483871e-02]';


Ic1 = [ 3.0267348e-01  5.6767540e-06  0.0000000e+00;
         5.6767540e-06  3.0534128e+00  0.0000000e+00;
         0.0000000e+00  0.0000000e+00  3.2680551e+00 ];
Ic2 = [ 2.9838633e-01  5.6767540e-06  0.0000000e+00;
        5.6767540e-06  2.7850659e+00  0.0000000e+00;
      0.0000000e+00  0.0000000e+00  2.9997082e+00];
    
Ic3 = [4.4419709e-01  0.0000000e+00  0.0000000e+00;
 0.0000000e+00  4.4419708e-01  0.0000000e+00;
 0.0000000e+00  0.0000000e+00  3.3140314e-02];  %%
    
Ic4 = [ 1.5463060e-02  0.0000000e+00  0.0000000e+00;
  0.0000000e+00  1.5463047e-02  0.0000000e+00;
  0.0000000e+00  0.0000000e+00  1.6697070e-02];