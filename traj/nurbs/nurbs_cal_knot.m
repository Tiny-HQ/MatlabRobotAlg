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
%p - degree
%n - number of points
%last_value - value of last index of data.

function vector = nurbs_cal_knot(k,n,last_value)


    m = n + k+1 + k+1; 
    vector = zeros(1, m); 
    for i = 1:m  
        if i <= k+1  
            vector(i) = 0;  
        elseif i > n+k+1  
            vector(i) = last_value;  
        else  
            vector(i) = ((i-k-1) ) / (n/last_value);  
        end  
    end
end