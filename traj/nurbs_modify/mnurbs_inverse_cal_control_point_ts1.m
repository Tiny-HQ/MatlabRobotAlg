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
%plot 3d figure use nurbs...

clc;
clear;
Ts = 0.001;
last_value = 1;
u = 0:Ts:last_value;
k = 3;%degree;

n =16;
Pc = zeros(n,3);

Q  = [
    0.0000, 0.0000;
    0.2718, 0.2685;
    0.5539, 0.5260;
    0.8581, 0.7566;
    1.1971, 0.9310;
    1.5708, 1.0000;
    1.9445, 0.9310;
    2.2835, 0.7566;
    2.5877, 0.5260;
    2.8698, 0.2685;
    3.1416, 0.0000;
    3.4134, -0.2685;
    3.6955, -0.5260;
    3.9997, -0.7566;
    4.3387, -0.9310;
    4.7124, -1.0000;
    5.0861, -0.9310;
    5.4251, -0.7566;
    5.7293, -0.5260;
    6.0114, -0.2685;
    6.2832, -0.0000
];



% Q = [0, 1; 
%     1, 2; 
%     3, 1; 
%     4, 1; 
%     5, 5; 
%     6, 4; 
%     7, 2; 
%     8, 1; 
%     9,3];  % ???????? 

[mm,nn] = size(Q);
R_n = Q(2:mm-1,:);

% u_vec1 = nurbs_cal_knot(k,n,last_value);


le = zeros(mm-1,1);
for i = 1:mm-1
    tmp1 = Q(i,:);
    tmp2 = Q(i+1,:);
    le(i) = sqrt(sum((tmp1(1)-tmp2(1))^2+(tmp1(2)-tmp2(2))^2));
end
u_ = zeros(mm,1);
le_sum = sum(le);
le_ = 0;
for i = 2:mm
    le_ = le_+le(i-1);
   u_(i) = le_/le_sum;   
end

u_vec = mnurbs_inverse_cal_control_point_vector(n,mm,k,u_);
T = zeros(mm-2,n-2);
T1 = zeros(mm,n);
for i = 1:mm-2
   [Nik,dNik,ddNik] = mnurbs_cal_basis_func_matrix(u_(i+1),k,u_vec);
      %  T(i,:) = nurbs_cal_basis_functions(u_(i+1),j+k-1,k,u_vec);
   T(i,:) = Nik(2:n-1)';
   T1(i,:) = Nik';
   R_n(i,1) = R_n(i,1)-Q(1,1)*Nik(1)-Q(mm,1)*Nik(length(Nik));
   R_n(i,2) = R_n(i,2)-Q(1,2)*Nik(1)-Q(mm,2)*Nik(length(Nik));
   %R_n(i,3) = R_n(i,3)-Q(1,3)*Nik(1)-Q(mm,3)*Nik(length(Nik));
end

R = zeros(n-2,nn);

for i = 1:n-2
    R(i,1) = T(:,i)'*R_n(:,1);
    R(i,2) = T(:,i)'*R_n(:,2);
    %R(i,3) = T(:,i)'*R_n(:,3);
end
Pc(1,1) = Q(1,1);Pc(1,2) = Q(1,2);
Pc(2:n-1,1) = inv(T'*T)*R(:,1);
Pc(2:n-1,2) = inv(T'*T)*R(:,2);
Pc(n,1) = Q(mm,1);Pc(n,2) = Q(mm,2);

Cux= zeros(length(u),1);
Cuy= zeros(length(u),1);
cuxx = zeros(length(u),1);
cuyy = zeros(length(u),1);

 %u_vec = mnurbs_cal_knot_ext(k,n,1);
 wx = ones(n,1);
 wy = ones(n,1);
 % can manually adjust the weight.
for i = 1:length(u)
    [Nik,dNik,ddNik] = mnurbs_cal_basis_func_matrix(u(i),k,u_vec);
    cuxx(i) = mnurbs_cal_cu_matrix(u(i),k,u_vec,Pc(:,1),wx);
    cuyy(i) = mnurbs_cal_cu_matrix(u(i),k,u_vec,Pc(:,2),wy);
    Cux(i) = Nik'*Pc(:,1);
    Cuy(i) = Nik'*Pc(:,2);
end
Cux(length(u),1) = Pc(n,1);Cuy(length(u),1) = Pc(n,2);
cuxx(length(u),1) = Pc(n,1);cuyy(length(u),1) = Pc(n,2);
plot(Q(:,1),Q(:,2), 'bo-', 'MarkerFaceColor', 'b');hold on;
plot(Pc(:,1),Pc(:,2), 'bo-', 'MarkerFaceColor', 'r');hold on;
plot(Cux,Cuy, 'g-', 'LineWidth', 2); hold on;
plot(cuxx,cuyy, 'y-', 'LineWidth', 2);
xlabel('X');
ylabel('Y');
grid on;



