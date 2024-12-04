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


%???B??,????;

function [knots_value,knots_muti] = quasi_uniform_b_create_knots(n,k)


    inter = 1.0/(n-k);

    ui = 0;
    
    knots_value = zeros(1,n-k);
    knots_muti = zeros(1,n-k);

    for i = 0:n-k
        knots_value(i+1) = ui;
        knots_muti(i+1) = 1.0;
        ui = ui+inter;   
    end

    knots_muti(1) = k+1;
    knots_muti(n-k+1) = k+1;




end
