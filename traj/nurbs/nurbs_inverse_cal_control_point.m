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
%plot 3d figure use nurbs...

clc;
clear;
Ts = 0.001;
last_value = 1;
u = 0:Ts:last_value;
k = 3;%degree;

n = 8;
Pc = zeros(n,3);
  
Q = [0 10 1;
    1 12 -5;
    5 2 9;
    6 33 -11;
    10 55 15 ;
    20 20 -17;
    25 -11 20;
    28 -23 -25;
    39 33 28;
    45 50 36;]; % ???;  

[mm,nn] = size(Q);
Q_n = Q(2:mm-1,:);

% u_vec1 = nurbs_cal_knot(k,n,last_value);


le = zeros(mm-1,1);
for i = 1:mm-1
    tmp1 = Q(i,:);
    tmp2 = Q(i+1,:);
    le(i) = sqrt(sum(tmp1-tmp2).^2);
end
u_ = zeros(mm,1);
le_sum = sum(le);
le_ = 0;
for i = 2:mm
    le_ = le_+le(i-1);
   u_(i) = le_/le_sum;   
end

u_vec = nurbs_inverse_cal_control_point_vector(n,mm,k,u_);
T = zeros(mm-2,n-2);
T1 = zeros(mm,n);
for i = 1:mm-2
   [Nik,dNik,ddNik] = nurbs_cal_basis_func_matrix(u_(i+1),k,u_vec);
      %  T(i,:) = nurbs_cal_basis_functions(u_(i+1),j+k-1,k,u_vec);
   T(i,:) = Nik(2:n-1)';
   T1(i,:) = Nik';
   Q_n(i,1) = Q_n(i,1)-Q(1,1)*Nik(1)-Q(mm,1)*Nik(length(Nik));
   Q_n(i,2) = Q_n(i,2)-Q(1,2)*Nik(1)-Q(mm,2)*Nik(length(Nik));
   Q_n(i,3) = Q_n(i,3)-Q(1,3)*Nik(1)-Q(mm,3)*Nik(length(Nik));
end

Pc(1,1) = Q(1,1);Pc(1,2) = Q(1,2);Pc(1,3) = Q(1,3);
Pc(2:n-1,1) = inv(T'*T)*T'*Q_n(:,1);
Pc(2:n-1,2) = inv(T'*T)*T'*Q_n(:,2);
Pc(2:n-1,3) = inv(T'*T)*T'*Q_n(:,3);
Pc(n,1) = Q(mm,1);Pc(n,2) = Q(mm,2);Pc(n,3) = Q(mm,3);

Cux= zeros(length(u),1);
Cuy= zeros(length(u),1);
Cuz= zeros(length(u),1);

cuxx = zeros(length(u),1);
cuyy = zeros(length(u),1);
cuzz = zeros(length(u),1);

for i = 1:length(u)
    [Nik,dNik,ddNik] = nurbs_cal_basis_func_matrix(u(i),k,u_vec);
    cuxx(i) = nurbs_cal_cu_matrix(u(i),k,u_vec,Pc(:,1),ones(n,1));
    cuyy(i) = nurbs_cal_cu_matrix(u(i),k,u_vec,Pc(:,2),ones(n,1));
    cuzz(i) = nurbs_cal_cu_matrix(u(i),k,u_vec,Pc(:,3),ones(n,1));
    Cux(i) = Nik'*Pc(:,1);
    Cuy(i) = Nik'*Pc(:,2);
    Cuz(i) = Nik'*Pc(:,3);
end
 plot3(Q(:,1),Q(:,2),Q(:,3));hold on;
plot3(Pc(:,1),Pc(:,2),Pc(:,3));hold on;
plot3(Cux,Cuy,Cuz,'o'); 


