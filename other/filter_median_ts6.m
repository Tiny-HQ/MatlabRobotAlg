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

%?????;



clc;
clear;











Ts = 0.004;

q_l = 35;
coeff = 0.9;

Z = load('enc_pulse.txt');
Z = -Z;
N = length(Z);
V = diff(Z/Ts);
V(N) = V(N-1);


v = linspace(0,0,N-1);

for i = 2:N-1
    
    if i<=q_l
        v_= sort(V(1:i));
    else
        v_ = sort(V(i-q_l:i));
    end
    
    if i<=q_l
        v(i) = v_(ceil(i/2));
    else
         v(i) = v_(ceil(q_l/2));
       %v(i) = coeff*v_(ceil(q_l/2))+(1-coeff)*v_(ceil(q_l/2-1));
    end
     
end


plot(V);
hold on;
plot(v);














