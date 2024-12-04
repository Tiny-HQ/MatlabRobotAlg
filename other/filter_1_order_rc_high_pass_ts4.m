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
%一阶高通滤波; First-order high-pass filtering
%不适合我们; Not for us

clc;
clear;


Ts = 0.004;

Z = load('enc_pulse.txt');
Z = -Z;
N = length(Z);
V = diff(Z/Ts);
V(N) = V(N-1);


v = linspace(0,0,N-1);

fc = 100;
rc = 1/(2*pi*fc);


for i =2:N-1
    
    v(i) = (V(i)-V(i-1)+v(i-1))*rc/(rc+Ts);
    
end




plot(V,'g');
hold on;
plot(v,'m');











