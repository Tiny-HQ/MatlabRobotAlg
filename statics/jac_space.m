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


function J = jac_space(sc,theta)

    [m,n] = size(sc);
    J = zeros(m,n);
    T = eye(4);

    for i = 1:n
        T = T*ew(sc(1:3,i)',sc(4:6,i)',theta(i));
        addt = adt(T);
        J(:,i) = addt*sc(:,i);
    end

end

