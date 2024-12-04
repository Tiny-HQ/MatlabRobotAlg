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


function J = cal_two_link_jacobian_handle(DH,q,opt)



    L1 = DH.a(2);
    L2 = DH.a(3);


    if strcmp(opt,'deg')
        q = q*pi/180.0;
    elseif strcmp(opt,'rad')
       ;
    else
        q = q*pi/180.0;
    end


    J11 = -L1*sin(q(1))-L2*sin(q(1)+q(2));J12 = -L2*sin(q(1)+q(2));
    J21 = L1*cos(q(1))+L2*cos(q(1)+q(2));J22 = L2*cos(q(1)+q(2));

    J = [J11 J12;J21 J22];


end