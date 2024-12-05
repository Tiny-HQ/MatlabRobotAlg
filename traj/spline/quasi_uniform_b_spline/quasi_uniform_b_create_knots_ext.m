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





% U_quasi_uniform.m�ļ�
function NodeVector = quasi_uniform_b_create_knots_ext(n, k)
% ׼����B�����Ľڵ��������㣬��n+1�����ƶ��㣬k��B����
    NodeVector = zeros(1, n+k+2);
    piecewise = n - k + 1;       % ���ߵĶ���
    if piecewise == 1       % ֻ��һ������ʱ��n = k
        for i = n+2 : n+k+2
            NodeVector(1, i) = 1;
        end
    else
        flag = 1;       % ��ֹһ������ʱ
        while flag ~= piecewise
            NodeVector(1, k+1+flag) = NodeVector(1, k + flag) + 1/piecewise;
            flag = flag + 1;
        end
        NodeVector(1, n+2 : n+k+2) = 1;
    end
end