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
function [q] = Quat_Exp(lnq)       
    
    limit = 0.0001;
    [m,n] = size(lnq);
    if((m == 3)||(n == 3))
        theta = sqrt(lnq(1)^2+lnq(2)^2+lnq(3)^2);
        if(abs(theta)<eps)
            theta = 0.001;
        end
        q = [0 0 0 0];
        n = lnq/theta;
        q(1) = cos(theta/2);     
        q(2) = n(1)*sin(theta/2); q(3) = n(2)*sin(theta/2); q(4) = n(3)*sin(theta/2);   
    elseif((m == 4)||(n == 4))
        if(abs(lnq(1))>limit)
            q = [0 0 0 0];
        else
            theta = sqrt(lnq(2)^2+lnq(3)^2+lnq(4)^2);

        if(abs(theta)<eps)
            theta = 0.001;
        end

        q = [0 0 0 0];
        n = lnq/theta;
        q(1) = cos(theta/2);

        q(2) = n(2)*sin(theta/2); q(3) = n(3)*sin(theta/2); q(4) = n(4)*sin(theta/2);

        end
    end
end