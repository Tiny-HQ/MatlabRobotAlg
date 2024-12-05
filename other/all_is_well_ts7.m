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
clear;
clc;

Ts = 0.001;

A = load('1.txt');

L = length(A);
V = zeros(L+1,1);
S = zeros(L+2,1);

for i = 1:L
   A(i) = A(i)-9.8; 
end

for i = 300:L
   V(i+1) = V(i)+(A(i))*Ts;  
end

for i = 300:L+1
    
   S(i+1) = S(i)+V(i) *Ts;
end


subplot(3,1,1);
plot(A);
subplot(3,1,2);
plot(V);
subplot(3,1,3);
plot(S);
figure;
plot(V);