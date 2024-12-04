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



%???s???
clc;
clear;

S = 100.0;
V = 50.0;
A = 100.0;
D = 200.0;
J = 1000.0;
% 
% S = 5;
% V = 20;
% A = 100;
% D = 200;
% J = 1000;

S = 450.0;
V = 450.0;
A = 100;
D = 450.0;
J = 1000.0;

for A = 100:450
    V = V-1;S = S-0.5;D = D-0.3;
    [t] = s_curve_cal_param_non_symmetry(S,V,A,D,J);
    [p,v,a,j] = s_curve_cal_pvaj_non_symmetry(t,J,0.004);

    subplot(4,1,1);
    plot(p,'g');
    subplot(4,1,2);
    plot(v,'b');
    subplot(4,1,3);
    plot(a,'r');
    subplot(4,1,4);
    plot(j,'y');
    
    pause(0.05);

end 