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
function [a,b,c,d,e,f] = five_polynomial(x1,v1,a1,x2,v2,a2,t)

    f = x1;
    e = v1;
    d = a1/2.0;
    
    M1 = x2-d*t^2-e*t-f;
    M2 = v2-2*d*t-e;
    M3 = a2-2*d;
    
    B = [M1;M2;M3];
    A = [t^5 t^4 t^3;
        5*t^4 4*t^3 3*t^2;
        20*t^3 12*t^2 6*t];
    
    TT = A\B;   
    a = TT(1);
    b = TT(2);
    c = TT(3);
end
