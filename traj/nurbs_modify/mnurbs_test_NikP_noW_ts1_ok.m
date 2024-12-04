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
clc;
clear;
Ts = 0.001;
last_value = 1;
u = 0:Ts:last_value;
k = 3;%degree;
  
P = [0 10;
    1 12;
    5 2;
    6 33;
    10 55;
    20 20;
    25 -11;
    28 -23;
    39 33;
    45 50;]; % ;  
% P  = [
%     0.0000, 0.0000;
%     0.2718, 0.2685;
%     0.5539, 0.5260;
%     0.8581, 0.7566;
%     1.1971, 0.9310;
%     1.5708, 1.0000;
%     1.9445, 0.9310;
%     2.2835, 0.7566;
%     2.5877, 0.5260;
%     2.8698, 0.2685;
%     3.1416, 0.0000;
%     3.4134, -0.2685;
%     3.6955, -0.5260;
%     3.9997, -0.7566;
%     4.3387, -0.9310;
%     4.7124, -1.0000;
%     5.0861, -0.9310;
%     5.4251, -0.7566;
%     5.7293, -0.5260;
%     6.0114, -0.2685;
%     6.2832, -0.0000
% ];


% Px = [-5 ;1 ;5;6;10;20 ;25;28;39;45;]; % ?????  
% Py = [10 ;12;2;33;55;20 ;-11;-23;33;52;]; % ?????  
% P = [Px,Py];

  
% ??? NURBS ??????  

[m,nn] = size(P);

u_vec = mnurbs_cal_knot_ext(k,m,last_value);

Cu = zeros(length(u),nn);


Nik = zeros(m,1);


for j = 1:length(u)

    %i = floor(u(j)/Ts);%determin index of knot vector;
    %[Nik,dNik,ddNik] = nurbs_cal_basis_func_matrix(u(j),k,u_vec);
    for i = 1:m

       Nik(i) = mnurbs_cal_basis_functions(u(j),i,k,u_vec);
    end
    Cu(j,1) = Nik'*P(:,1);
    Cu(j,2) = Nik'*P(:,2);
end
Cu(length(u),1) = P(m,1);Cu(length(u),2) = P(m,2);
plot(Cu(:,1),Cu(:,2));hold on;
plot(P(:,1),P(:,2));
























