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
function T = S_alg(w)
  	w_r = eye(3);
    A1 = w(1);A2 = w(2);A3 = w(3);
    w_r(1,1) = 0;w_r(1,2) = -A3;w_r(1,3) = A2;%w�ķ��Գƾ���; w's antisymmetric matrix
    w_r(2,1) = A3;w_r(2,2) = 0;w_r(2,3) = -A1;
    w_r(3,1) = -A2;w_r(3,2) = A1;w_r(3,3) = 0;

    T = w_r;

end