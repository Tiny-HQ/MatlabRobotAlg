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

%??????;


clc;
clear;

a = 0.9;




Z = load('enc_pulse.txt');
Z = -Z;
N = length(Z);


V = diff(Z/0.004);
v = linspace(0,0,N-1);


for i = 2:N-1
   v(i) = (1-a)* V(i)+a*v(i-1);
   
    
end



hold on;
plot(V,'g');
hold on;
plot(v,'m');



















