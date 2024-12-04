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

%6Î¬»­Ïß;
% draw_spline.mÎÄ¼þ
function [X] = draw_spline6D_adv(n, k, P, NodeVector,Ts)
    Nik = zeros(n+1, 1);
    T = 0 : Ts : 1-Ts;
    X = zeros(6,length(T));
    counts = 1;
    for u = 0 : Ts : 1-Ts
%         for i = 0 : 1 : n
%             Nik(i+1, 1) = base_function(i, k , u, NodeVector);
%         end
        Nik = zeros(n+1, 1);
        w =floor( u/(1/( n - k + 1)));
        if(i == 12)
            a = 10;
        end

        Nik(w+1,1) = base_function(w, k , u, NodeVector);
        Nik(w+2,1) = base_function(w+1, k , u, NodeVector);
        Nik(w+3,1) = base_function(w+2, k , u, NodeVector);
        Nik(w+4,1) = base_function(w+3, k , u, NodeVector);
        p_u = P' * Nik;

         X(:,counts) = p_u;

        counts = counts+1;
     
    end

end



