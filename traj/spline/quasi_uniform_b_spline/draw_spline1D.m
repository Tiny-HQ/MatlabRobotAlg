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

% 1???;
% draw_spline.m??
function [x] = draw_spline1D(n, k, P, NodeVector,Ts)
    Nik = zeros(n+1, 1);
    T = 0 : Ts : 1-Ts;
    x = zeros(1,length(T));
    counts = 1;
    for u = 0 : Ts : 1-Ts
        for i = 0 : 1 : n
             Nik(i+1, 1) = base_function(i, k , u, NodeVector);
        end
        if(counts == 100)
            a = 10;
        end
        p_u = P * Nik;
        if u == 0
            tempx = p_u(1,1);
            x(counts) = tempx;
        
        else
            tempx = p_u(1,1);
            x(counts) = tempx;
        end
        counts = counts+1;    
    end

end