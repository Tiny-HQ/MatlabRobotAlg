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

function T = K_alg(w)

    wx = w(1);wy = w(2);wz = w(3);

    T = zeros(3,6);
    T(1,1) = wx;T(1,2) = wy;T(1,3) = wz;
    T(2,2) = wx;T(2,4) = wy;T(2,5) = wz;
    T(3,3) = wx;T(3,5) = wy;T(3,6) = wz;

end