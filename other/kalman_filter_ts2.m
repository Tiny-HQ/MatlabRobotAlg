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

N = 100;

Z = (1:N);
noise = randn(1,N);
Z = Z+1.0*noise;

std(noise)

X = [0 0]';
P = [1 0; 0 1];             %?????????;??????????;
F = [1 1;0 1];              %??????;
%Q = [0.001 0;0 0.001];     %?????????;
Q = [0.001 0;0 0.001];      %?????????;  ????????????????,???,??????????,k?,???????;
H = [1 0];                  %????;
R = 1;                      %??????;        ????????????????,???,??????????,k?,???????;



M = linspace(0,0,N);
W = linspace(0,0,N);

for i =1:N



    X_ = F*X;
    P_ = F*P*F'+Q;
    K = P_*H'/(H*P_*H'+R);
    X = X_+K*(Z(i)-H*X_);
    P = (eye(2)-K*H)*P_;
    

    M(i) = X(1);
    W(i) = X(2);
   

end

l = length(Z);
Z(l+1) = Z(l);

plot(M,W,'o')
hold on;
plot(M,diff(Z),'*')











