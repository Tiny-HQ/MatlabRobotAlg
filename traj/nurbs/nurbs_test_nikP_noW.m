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


  
Q = [0 10 1;
    1 12 -5;
    5 2 9;
    6 33 -11;
    10 55 15 ;
    20 20 -17;
    25 -11 20;
    28 -23 -25;
    39 33 28;
    45 50 36;]; 
[n ,m] = size(Q);
u_vec = nurbs_cal_knot(k,n,last_value);

Cux= zeros(length(u),1);
Cuy= zeros(length(u),1);
Cuz= zeros(length(u),1);


for i = 1:length(u)
    [Nik,dNik,ddNik] = nurbs_cal_basis_func_matrix(u(i),k,u_vec);
    if (i == 500)
        i = 500;
    end
    if (i == 999)
        i = 999;
    end
    Cux(i) = Nik'*Q(:,1);
    Cuy(i) = Nik'*Q(:,2);
    Cuz(i) = Nik'*Q(:,3);
end
 plot3(Q(:,1),Q(:,2),Q(:,3));hold on;
plot3(Cux,Cuy,Cuz,'g'); 

