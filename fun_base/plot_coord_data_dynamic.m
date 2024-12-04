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
function plot_coord_data_dynamic(T,scale,ms,Ts)

    if (nargin == 3) 
        [a,b,l] = size(T);
        for i = 1:l
            temp = T(:,:,i);
            plot_coord(temp,scale);
            pause(ms/1000);
        end
        
    elseif(nargin == 4)
        [a,b,l] = size(T);
        for i = 1:Ts:l
            temp = T(:,:,i);
            plot_coord(temp,scale);
            pause(ms/1000);
        end
    end

end