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
function T = SO3_to_so3(R)
    acosinput = (R(1,1) + R(2,2) + R(3,3) - 1.0) / 2.0;
    if(abs(acosinput)<eps)
        T = zeros(3,3);
    elseif (acosinput<=-1)
        if ((1.0+R(3,3))>= eps)
			omg(1) = 1.0 / sqrt(2 * (1.0 + R(3,3)))*R(1,3);
			omg(2) = 1.0 / sqrt(2 * (1.0 + R(3,3)))*R(2,3);
			omg(3) = 1.0 / sqrt(2 * (1.0 + R(3,3)))*(1.0 + R(3,3));
        elseif ((1.0+R(2,2))>= eps)
			omg(1) = 1.0 / sqrt(2 * (1.0 + R(2,2))*R(1,2));
			omg(2) = 1.0 / sqrt(2 * (1.0 + R(2,2)))*(1.0 + R(2,2));
			omg(3) = 1.0 / sqrt(2 * (1.0 + R(2,2)))*R(3,2);
		else 
			omg(1) = 1.0 / sqrt(2 * (1.0 + R(1,1)))*(1.0 + R(1,1));
			omg(2) = 1.0 / sqrt(2 * (1.0 + R(1,1)))*R(2,1);
			omg(3) = 1.0 / sqrt(2 * (1.0 + R(1,1)))*R(3,1);
        end
		
        omg = omg*pi;
        T = S_alg(omg);
    else
        theta = acos(acosinput);
        T = 1.0 / (2.0*sin(theta))*(R - R')*theta;
    end

end
