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
function x = htr2zyx(T)


    x(1) = T(1,4);
    x(2) = T(2,4);
    x(3) = T(3,4);

    m = T;
    Angle = linspace(0,0,3);
    if (abs(m(1,1)) < eps && abs(m(2,1)) < eps)
        % singularity
        if (abs(m(3, 1) - 1) < eps)
            Angle(1) = 0.0;
            Angle(2) = -pi / 2.0;
            Angle(3) = -atan2(m(1, 2), m(2, 2));
        else
            Angle(1) = 0.0;
            Angle(2) = pi / 2.0;
            Angle(3) = atan2(m(1, 2), m(2, 2));
        end
    else
        Angle(2) = atan2(-m(3, 1), sqrt(m(1, 1)*m(1, 1) + m(2, 1)*m(2, 1)));
        beta = Angle(2);
        Angle(1) = atan2(m(2, 1) / cos(beta), m(1, 1) / cos(beta));
        Angle(3) = atan2(m(3, 2) / cos(beta), m(3, 3) / cos(beta));
    end

    x(4) = Angle(1)*180/pi;
    x(5) = Angle(2)*180/pi;
    x(6) = Angle(3)*180/pi;




end



