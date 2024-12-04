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
function [t1,t2] = fcn(q1,q2,dq1,dq2,ddq1,ddq2)
%连杆1质心惯性张量
L_1xx = 0.471239;
L_1xy = 0;
L_1xz = 0;
L_1yy = 70.9215;
L_1yz = 0;
L_1zz = 70.9215;
m_1 = 9424.78;
L_1c = [L_1xx 0 0;0 L_1yy 0;0 0 L_1zz];
%连杆2质心惯性张量
L_2xx = 0.628319;
L_2xy = 0;
L_2xz = 0;
L_2yy = 42.2021;
L_2yz = 0;
L_2zz = 42.2021;
m_2 = 12566.4;
L_2c = [L_2xx 0 0;0 L_2yy 0;0 0 L_2zz];
%连杆长度
l1 = 0.3;
l2 = 0.2;
%质心坐标
l_1x = l1 / 2;
l_1y = 0;
l_1z = 0;
pc1 = [l_1x l_1y l_1z]';
l_2x = l2 / 2;
l_2y = 0;
l_2z = 0;
pc2 = [l_2x l_2y l_2z]';
%平行轴定理，旋转轴处的惯性张量
I3 = eye(3);
L_1 = L_1c + m_1*(pc1'*pc1*I3 - pc1*pc1');
L_2 = L_2c + m_2*(pc2'*pc2*I3 - pc2*pc2');

% 地杆角速度
w_0_0 = [0;0;0];
% 地杆线速度速度
v_0_0 = [0;0;0];
% angular acceleration of base link
alpha_0_0 = [0; 0; 0];
% 考虑重力
a_0_0 = [0; 9.81; 0];
% a_0_0 = [0; 0; 0];

dh = [0, 0, 0, q1;
      0, l1, 0, q2];

w = cell(1, size(dh, 1));
v = cell(1, size(dh, 1));
alpha = cell(1, size(dh, 1));
a = cell(1, size(dh, 1));
ac = cell(1, size(dh, 1));
l = cell(1, size(dh, 1));
T = cell(1, size(dh, 1) + 1);
R = cell(1, size(dh, 1) + 1);
r = cell(1, size(dh, 1) + 1);
I = cell(1, size(dh, 1));
T_e = cell(1, size(dh, 1) + 1);
t_e_pre = eye(4);
for i = 1:size(dh, 1)
    trx = [1 0 0 0; 
           0 cos(dh(i, 1)) -sin(dh(i, 1)) 0;
           0 sin(dh(i, 1)) cos(dh(i, 1))  0;
           0 0 0 1];
    tl = [1 0 0 dh(i, 2);
          0 1 0 0;
          0 0 1 dh(i, 3);
          0 0 0 1];
    trz = [cos(dh(i, 4)) -sin(dh(i, 4)) 0 0;
           sin(dh(i, 4)) cos(dh(i, 4))  0 0;
           0 0 1 0;
           0 0 0 1];
    T{i} = trx * tl * trz;%trotx(dh(i, 1))*transl([dh(i, 2), 0, dh(i, 3)])*trotz(dh(i, 4));
    R{i} = T{i}(1:3, 1:3);
    r{i} = T{i}(1:3, 4);
    T_e{i} = t_e_pre * T{i};
    t_e_pre = T_e{i};
end
T{i+1} = eye(3);
R{i+1} = eye(3);
r{i+1} = [l2, 0, 0];
T_e{i+1} = T_e{i} * [1 0 0 l2; 0 1 0 0; 0 0 1 0; 0 0 0 1];%T_e{i} * transl([l2, 0, 0]);
q = [q1 q2];
dq = [dq1 dq2];
ddq = [ddq1 ddq2];
l{1} = [l_1x; l_1y; l_1z];
l{2} = [l_2x; l_2y; l_2z];

pre_w = w_0_0;
pre_v = v_0_0;
pre_alpha = alpha_0_0;
pre_a = a_0_0;
% 外推
for i = 1:2
    t = R{i}';
    w_i_i = t * pre_w + dq(i) * [0;0;1];
    v_i_i = t * (pre_v + cross(pre_w, r{i}));
    alpha_i_i = t * pre_alpha + cross((t * pre_w), dq(i) * [0;0;1]) + ddq(i) * [0;0;1];
    a_i_i = t * (pre_a + cross(pre_alpha, r{i}) + cross(pre_w, cross(pre_w, r{i})));
    ac_i_i = a_i_i + cross(alpha_i_i, l{i}) + cross(w_i_i, cross(w_i_i, l{i}));
    w{i} = w_i_i;
    v{i} = v_i_i;
    alpha{i} = alpha_i_i;
    a{i} = a_i_i;
    ac{i} = ac_i_i;
    
    pre_w = w_i_i;
    pre_v = v_i_i;
    pre_alpha = alpha_i_i;
    pre_a = a_i_i;
end

%参数分离参数
A1 = zeros(6,10);
A2 = zeros(6,10);
A1(1:3,1) = a{1};
A1(1:3,2:4) = S_alg(alpha{1})+S_alg(w{1})*S_alg(w{1});
A1(4:6,2:4) = -S_alg(a{1});
A1(4:6,5:10) = K_alg(alpha{1})+S_alg(w{1})*K_alg(w{1});
A2(1:3,1) = a{2};
A2(1:3,2:4) = S_alg(alpha{2})+S_alg(w{2})*S_alg(w{2});
A2(4:6,2:4) = -S_alg(a{2});
A2(4:6,5:10) = K_alg(alpha{2})+S_alg(w{2})*K_alg(w{2});

R21 = R{2};
P21 = r{2};
Q12 = [R21 zeros(3,3);S_alg(P21)*R21 R21];
U11 = A1;
U12 = Q12*A2;
U22 = A2; 
U1 = [U11 U12;
zeros(6,10) U22]; 
U = [U1(6,:);
 U1(12,:);]; 
%     
fi1 = [m_1 m_1*l_1x m_1*l_1y m_1*l_1z L_1(1,1) -L_1(1,2) -L_1(1,3) L_1(2,2) -L_1(2,3) L_1(3,3)]';
fi2  = [m_2 m_2*l_2x m_2*l_2y m_2*l_2z L_2(1,1) -L_2(1,2) -L_2(1,3) L_2(2,2) -L_2(2,3) L_2(3,3)]';
fi = [fi1;fi2]; %线性分离的  
f = U1*fi;
t1 = f(6);
t2 = f(12);
end

function T = K_alg(w)
 wx = w(1);wy = w(2);wz = w(3);
 T = zeros(3,6);
 T(1,1) = wx;T(1,2) = wy;T(1,3) = wz;
 T(2,2) = wx;T(2,4) = wy;T(2,5) = wz;
 T(3,3) = wx;T(3,5) = wy;T(3,6) = wz;
end

function T = S_alg(w)
 w_r = eye(3);
 A1 = w(1);A2 = w(2);A3 = w(3);
 w_r(1,1) = 0;w_r(1,2) = -A3;w_r(1,3) = A2;
 w_r(2,1) = A3;w_r(2,2) = 0;w_r(2,3) = -A1;
 w_r(3,1) = -A2;w_r(3,2) = A1;w_r(3,3) = 0;
 T = w_r;
end


