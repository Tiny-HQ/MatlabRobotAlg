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


%??rc????; rc filter




clc;
 clear;


Ts = 0.004;

 Z = load('enc_pulse.txt');
% Z = -Z;
%Z = ic1;
N = length(Z);

V = diff(Z/Ts);

V(N) = V(N-1);
V = -V;

fc = 5;
rc = 1/(2*pi*fc);

v = linspace(0,0,N-1);

for i = 2:N-1
    
    v(i) = (V(i)+rc*v(i-1)/Ts)/(1+rc/Ts);
     
end


plot(V,'g');
hold on;
plot(v,'m');


% figure;
% len = 20;
% V1 = linspace(0,0,N-len);
% 
% 
% for i = 1:N-len
% 
% V1(i) = (V(i+len)-V(i))/(10*Ts);
% 
% 
% 
% end
% 
% plot(V1)



