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




function Acc = cal_two_link_acc_jacobian_handle_v2(q,DH,opt,dq,ddq)



    L1 = DH.a(2);
    L2 = DH.a(3);

    if strcmp(opt,'deg')
        q = q*pi/180.0;
    elseif strcmp(opt,'rad')
       ;
    else
        q = q*pi/180.0;
    end
    Acc = zeros(2,1);
    
    Acc(1) = -(L1*cos(q(1))+L2*cos(q(1)+q(2)))*dq(1)*dq(1) ...
    -2*(L2*cos(q(1)+q(2)))*dq(1)*dq(2)...
    -(L1*sin(q(1))+L2*sin(q(1)+q(2)))*ddq(1)...
    -L2*cos(q(1)+q(2))*dq(2)*dq(2)...
    -L2*sin(q(1)+q(2))*ddq(2);


     Acc(2) = (-L1*sin(q(1))-L2*sin(q(1)+q(2)))*dq(1)*dq(1) ...
         -2*L2*sin(q(1)+q(2))*dq(1)*dq(2)...
         +(L1*cos(q(1))+L2*cos(q(1)+q(2)))*ddq(1)...
         -L2*sin(q(1)+q(2))*dq(2)*dq(2)...
         +L2*cos(q(1)+q(2))*ddq(2);
     
     


end