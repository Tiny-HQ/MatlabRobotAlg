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
function N = NURBSBasis(i, p, knotVector, u)
    % 递归计算 NURBS B样条基函数值 Recursively calculates NURBS B-spline basis function values
    if p == 0
        if knotVector(i+1) <= u && u < knotVector(i+2)
            N = 1;
        else
            N = 0;
        end
    else
        denom1 = knotVector(i+p+1) - knotVector(i+1);
        denom2 = knotVector(i+p+2) - knotVector(i+2);

        if denom1 ~= 0
            term1 = (u - knotVector(i+1)) / denom1 * NURBSBasis(i, p-1, knotVector, u);
        else
            term1 = 0;
        end

        if denom2 ~= 0
            term2 = (knotVector(i+p+2) - u) / denom2 * NURBSBasis(i+1, p-1, knotVector, u);
        else
            term2 = 0;
        end

        N = term1 + term2;
    end
end