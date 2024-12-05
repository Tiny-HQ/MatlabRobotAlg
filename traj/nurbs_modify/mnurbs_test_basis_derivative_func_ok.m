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

clc;
clear;

Ts = 0.001;

last_value = 15;

u = 0:Ts:last_value;
  
 
Px = [0 ;1;2;3;5;0 ;1;2;3;5;]; % ���Ƶ�����  control point coodinate
W = [1 ;2;3;4;5;6 ;1 ;2;3;4;5;6 ]; % Ȩ��  weight

k = 3; % ���߶���  degree
[m,n] = size(Px);
u_vec = mnurbs_cal_knot_ext(k,m,last_value);
 
dNik = zeros(1,length(u));
Cu = zeros(1,10000);

        
degree = 3;%degree cannot be zero,when degree equals to 3, this figure is the same as showed in book,(The Nurbs Book,2nd edition, page 63)
for index = 1:length(u_vec)
    for j = 1:length(u)-1
            dNik(j) = mnurbs_cal_basis_functions_derivative(u(j),index,degree,u_vec);
    end
    pause(0.1);
    plot(dNik);hold on;
end






