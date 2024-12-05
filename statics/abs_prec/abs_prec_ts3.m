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


%% ������֮������˹�������ϵ֮��֮������; Find the error between the center of the sphere and the tool coordinate system;
clc;
clear;
format long g;

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
error = error';%����Ǵ��˹���֮�������������֮������ This is the error between the center of the sphere and each point with the tool
%��Ҫerror = J*delta_dh���������,delta_dh���Ǳ궨֮���ÿ������ֵ; error = J*delta_dh is required to solve this equation, delta_dh is the error value of each term after calibration;


L1 = 367;L2 = 420.7567;L3 = 46.4259;L4 = 417.6788;L5 = 83.5;L6 = 48.8438;L7 = 0.9755;
d1=L1;a3=L2;a4=L3;d4=L4;d6=L5;a2=L6;d3=L7;
DH.a(1) = 0.0;DH.a(2) = a2;DH.a(3) = a3;DH.a(4) = a4;DH.a(5) = 0.0;DH.a(6) = 0.0;
DH.alpha(1) = 0.0;DH.alpha(2) = 90;DH.alpha(3) = 0.0;DH.alpha(4) = 90;DH.alpha(5) = -90;DH.alpha(6) = 90;
DH.d(1) = d1;DH.d(2) = 0.0;DH.d(3) = d3;DH.d(4) = d4;DH.d(5) = 0.0;DH.d(6) = d6;
DH.theta(1) = 0.0;DH.theta(2) = 0.0;DH.theta(3) = 0.0;DH.theta(4) = 0.0;DH.theta(5) = 0.0;DH.theta(6) = 0.0;

% q = [0 90 0 0 0 0];
% 
% arm_fkine_dh(q,DH,'deg','deg')

for w = 1:20

    q = zeros(N,6);
    
    ori = [1 -1 -1;1 -1 -1;1 -1 -1;1 -1 -1;1 -1 -1;1 -1 -1;1 -1 -1;1 -1 -1;1 -1 -1;1 -1 -1;
        1 -1 -1;1 -1 -1;1 -1 -1;1 -1 -1;1 -1 -1;1 -1 -1;1 -1 -1;1 -1 -1;1 -1 -1;1 -1 -1;];
    for i = 1:N
        T = cs_define_zyzeul(A(i,:));
        q(i,:) = arm_ikine_dh(T,DH,ori(i,1),ori(i,2),ori(i,3),'deg','deg');
        q(i,2) = q(i,2)-90;
    end
    J = zeros(3*N,14);
    for i = 1:N
        J(3*(i-1)+1:3*(i-1)+3,:) = abs_prec_cal_jacobian(DH,q(i,:),tool);
    end

    JJ = J'*J;
    e = pinv(JJ)*(J'*error)

    dq(1) = e(1)*180/pi;dq(2) = e(3)*180/pi;dq(3) = e(5)*180/pi;dq(4) = e(8)*180/pi;dq(5) = e(11)*180/pi;dq(6) = e(12)*180/pi;
    DH.a(2) = DH.a(2)+e(4);DH.a(3) = DH.a(3)+e(6); DH.a(4) = DH.a(4)+e(9); DH.d(1) = DH.d(1)+e(2); DH.d(3) = DH.d(3)+e(7);DH.d(4) = DH.d(4)+e(10);

end

 abs_prec_check(q,tool,DH,dq);



