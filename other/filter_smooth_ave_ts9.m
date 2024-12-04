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


%??????
clc;
clear;


last = 0.4;
mid = 0.2;
new = 1- last- mid;


Ts = 0.004;

Z = load('enc_pulse.txt');
Z = -Z;
N = length(Z);
V = diff(Z/Ts);
V(N) = V(N-1);


v = linspace(0,0,N-1);

for i = 3:N-1
    
    v(i) =  last* V(i-2)+mid*V(i-1)+new*V(i);


end




plot(V,'g');
hold on;
plot(v,'m');