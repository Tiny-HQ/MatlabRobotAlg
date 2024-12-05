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
function [pc,r] = cal_sphere_center(p1,p2,p3,p4)



    n1 = p1(1:3)-p2(1:3);
    n2 = p2(1:3)-p3(1:3);
    n3 = p3(1:3)-p4(1:3);

    l = zeros(1,3)';
    l(1) = sum(p2(1:3).^2)-sum(p1(1:3).^2);
    l(2) = sum(p3(1:3).^2)-sum(p2(1:3).^2);
    l(3) = sum(p4(1:3).^2)-sum(p3(1:3).^2);
    
    n = 2*[n1; n2; n3];    
    pc = n\(-l);

    r1 = sqrt(sum((pc-p1(1:3)').^2));
    r2 = sqrt(sum((pc-p2(1:3)').^2));
    r3 = sqrt(sum((pc-p3(1:3)').^2));
    r4 = sqrt(sum((pc-p4(1:3)').^2));

    r = (r1+r2+r3+r4)/4.0;

end


























