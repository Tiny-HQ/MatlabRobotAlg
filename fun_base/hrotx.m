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
function x = hrotx(a)


    x = eye(4);

    x(1,1) = 1.0;                x(1,2) = 0.0;                x(1,3) = 0.0;                x(1,4) = 0.0;
    x(2,1) = 0.0;                x(2,2) = cos(a*pi/180);      x(2,3) = -sin(a*pi/180);   x(2,4) = 0.0;
    x(3,1) = 0.0;                x(3,2) = sin(a*pi/180);      x(3,3) = cos(a*pi/180);    x(3,4) = 0.0;
    x(4,1) = 0.0;                x(4,2) = 0.0;                x(4,3) = 0.0;                x(4,4) = 1.0;

    
   for i = 1:4
        for j = 1:4
            if abs(x(i,j))<eps
                x(i,j) = 0.0;
            end
        end
    end


end

