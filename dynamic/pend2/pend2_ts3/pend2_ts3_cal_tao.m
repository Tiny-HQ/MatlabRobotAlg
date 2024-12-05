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


%0????????????tao?,??????pend2_tor.slx????;


Izz2 = 1.0;
Izz1 = 0.208;
ddq1 = 0.0;
ddq2 = 0.0;
g = 9.81;
s1 = 0.0;
c1 = 1.0;
s2 = 0.0;
c2 = 1.0;
dq1 = 0.0;
dq2 = 0.0;


m1 = 2.409;
m2 = 1.0;
L1 = 1.0;
L2 = 2.0;







tao2 = Izz2*(ddq1 + ddq2) + (L2*m2*(c2*(L1*ddq1 + c1*g) + (L2*(ddq1 + ddq2))/2 - s2*(- L1*dq1^2 + g*s1)))/2
tao1 =Izz1*ddq1 + L1*(m2*s2*(s2*(L1*ddq1 + c1*g) - (L2*(dq1 + dq2)^2)/2 + c2*(- L1*dq1^2 + g*s1)) + c2*m2*(c2*(L1*ddq1 + c1*g) + ...
    (L2*(ddq1 + ddq2))/2 - s2*(- L1*dq1^2 + g*s1))) + Izz2*(ddq1 + ddq2) + (L2*m2*(c2*(L1*ddq1 + c1*g) + (L2*(ddq1 + ddq2))/2 - s2*(- L1*dq1^2 + g*s1)))/2 + (L1*m1*((L1*ddq1)/2 + c1*g))/2



