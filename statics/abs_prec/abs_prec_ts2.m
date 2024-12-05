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


%% ????????????????????;
clc;
clear;

N = 20;
A = load('abs_prec_data1.txt');
%[sp_pc] = abs_prec_data_deal('abs_prec_data1.txt')
sp_pc = [751.135186689086 71.1993537987017 84.0193128922772];
tool = cal_tool_coor(sp_pc,A,N,'zyz')


error = linspace(0,0,3*N);
T6 = zeros(4,4,N);
for i = 1:N
   T6(:,:,i) = cs_define_zyzeul(A(i,:)); 
   C = T6(:,:,i)*[tool 1]' ;
   er = C(1:3)'-sp_pc;
   error((i-1)*3+1) = er(1);
   error((i-1)*3+2) = er(2);
   error((i-1)*3+3) = er(3);
end
error = error';%?????????,???????????
%??error = J*delta_dh?????,delta_dh?????????????;


L1 = 367;L2 = 420.7567;L3 = 46.4259;L4 = 417.6788;L5 = 83.5;L6 = 48.8438;L7 = 0.9755;
d1=L1;a3=L2;a4=L3;d4=L4;d6=L5;a2=L6;d3=L7;
DH.a(1) = 0.0;DH.a(2) = a2;DH.a(3) = a3;DH.a(4) = a4;DH.a(5) = 0.0;DH.a(6) = 0.0;
DH.alpha(1) = 0.0;DH.alpha(2) = 90;DH.alpha(3) = 0.0;DH.alpha(4) = 90;DH.alpha(5) = -90;DH.alpha(6) = 90;
DH.d(1) = d1;DH.d(2) = 0.0;DH.d(3) = d3;DH.d(4) = d4;DH.d(5) = 0.0;DH.d(6) = d6;
DH.theta(1) = 0.0;DH.theta(2) = 0.0;DH.theta(3) = 0.0;DH.theta(4) = 0.0;DH.theta(5) = 0.0;DH.theta(6) = 0.0;

% q = [0 90 0 0 0 0];
% 
% arm_fkine_dh(q,DH,'deg','deg')

q = zeros(N,6);
ori = [1 -1 -1;
    1 -1 -1;
    1 -1 -1;
    1 -1 -1;
    1 -1 -1;
    1 -1 -1;
    1 -1 -1;
    1 -1 -1;
    1 -1 -1;
    1 -1 -1;
    1 -1 -1;
    1 -1 -1;
    1 -1 -1;
    1 -1 -1;
    1 -1 -1;
    1 -1 -1;
    1 -1 -1;
    1 -1 -1;
    1 -1 -1;
    1 -1 -1;];
for i = 1:N
    T = cs_define_zyzeul(A(i,:));
    q(i,:) = arm_ikine_dh(T,DH,ori(i,1),ori(i,2),ori(i,3),'deg','deg');
 
end

J = zeros(3*N,14);
for i = 1:N
    J(3*(i-1)+1:3*(i-1)+3,:) = abs_prec_cal_jacobian(DH,q(i,:),tool);
end

cond(J)

JJ = J'*J;
e = pinv(JJ)*(J'*error)

dL1 = -0.735988234335893;
dL2 = 1.33030895110287;
dL3 = -1.58206181903630;
dL4 = -3.48807813823148;
dL5 = -1.31567929519073;
dL6 = 5.76006464717575;
dL7 = 0.0716247655397499;
dd1=dL1;da3=dL2;da4=dL3;dd4=dL4;dd6=dL5;da2=dL6;dd3=dL7;

dq = linspace(0,0,6);
dq(1) = 0.00538087709692747;
dq(2) = -0.00174706140123083;
dq(3) = -0.00240322623388571;
dq(4) = -0.0155364937023286;
dq(5) = -0.00175763923790997;
dq(6) = 0.00286340918389765;
dq = dq*180/pi;
% dq(1) = e(1);dq(2) = e(3);dq(3) = e(5);dq(4) = e(8);dq(5) = e(11);dq(6) = e(12);
% DH.a(2) = DH.a(2)+e(4);
% DH.a(3) = DH.a(3)+e(6);
% DH.a(4) = DH.a(4)+e(9);
% DH.d(1) = DH.d(1)+e(2);
% DH.d(3) = DH.d(3)+e(7);
% DH.d(4) = DH.d(4)+e(10);
DH.a(2) = DH.a(2)+da2;
DH.a(3) = DH.a(3)+da3;
DH.a(4) = DH.a(4)+da4;
DH.d(1) = DH.d(1)+dd1;
DH.d(3) = DH.d(3)+dd3;
DH.d(4) = DH.d(4)+dd4;

abs_prec_check(q,tool,DH,dq);



