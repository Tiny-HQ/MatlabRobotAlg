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
function [a,b,c,d] = three_polynomial(x1,v1,x2,v2,t)

    d = x1;
    c = v1;
    
    w1 = x2-c*t-d;
    w2 = v2-c;
    
    m1 = t^3; n1 = t^2;
    m2 = 3*t^2;n2 = 2*t;
    
    w = [w1 w2]';
    T = [m1 n1;m2 n2];
    
    U = T\w;
    a = U(1);
    b = U(2);
end
