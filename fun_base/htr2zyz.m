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
function x = htr2zyz(R)

    [m,n] = size(R);
    x = zeros(1,6);
    if((m == 3)&&(n == 3))
        x(1) = 0.0;
        x(2) = 0.0;
        x(3) = 0.0;
    elseif((m == 4)&&(n == 4))
        x(1) = R(1,4);
        x(2) = R(2,4);
        x(3) = R(3,4);
    end

    if ((abs(R(1, 3)) < eps) && (abs(R(2, 3)) < eps))
        % singularity
        x(4) = 0;
        sp = 0;
        cp = 1;
        x(5) = atan2(cp*R(1, 3) + sp*R(2, 3), R(3, 3));
        x(6) = atan2(-sp * R(1, 1) + cp * R(2, 1), -sp*R(1, 2) + cp*R(2, 2));
    else
 
        x(4) = atan2(R(2, 3), R(1, 3));
        sp = sin(x(4));
        cp = cos(x(4));
        x(5) = atan2(cp*R(1, 3) + sp*R(2, 3), R(3, 3));
        x(6) = atan2(-sp * R(1, 1) + cp * R(2, 1), -sp*R(1, 2) + cp*R(2, 2));

    end

        x(4) = x(4)*180/pi;
        x(5) = x(5)*180/pi;
        x(6) = x(6)*180/pi;

end



