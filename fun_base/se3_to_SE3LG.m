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
function [T] = se3_to_SE3LG(V)

    [m,n] = size(V);
    
    V_se3 = zeros(1,6);
    if(((m == 6)&&(n == 1))||((m == 1)&&(n == 6))) %输入的是李代数下的矢量;前三位是姿态矢量;The input is a vector in Lie algebra; The first three are pose vectors;
        V_se3 = V;
    elseif ((m == 4)&&(n == 4))     %输入的是se3下的值; The value under SE3 is entered;
        V_se3 = se3_to_v(V);
    end
    Ori = V_se3(1:3);
    theta = sqrt(sum(Ori.^2));
    n = Ori/theta;
    T = eye(4);
    T(1:3,1:3) = ew_r(n,theta);
    J = sin(theta)/theta*eye(3)+(1-sin(theta)/theta)*n'*n+((1-cos(theta))/theta)*S_alg(n);
    T(1:3,4) = J*V_se3(4:6)';
end

