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



function abs_prec_check(q,tool,DH,dq)

    [m,n] = size(q);

    T06 = zeros(4,4,m);
    Tcp = zeros(4,1,m);
    DH_ = DH;
    
    for i = 1:m
        q_ = q(i,:)+dq;
        [T06(:,:,i),f,e,w] = arm_fkine_dh(q_,DH_,'deg','deg');
        Tcp(:,:,i) = T06(:,:,i)*[tool 1]';
    end

    ci_p = zeros(m,3);
    for i = 1:m
       ci_p(i,:) = Tcp(1:3,1,i)'; 
    end

   hold on;
    plot3(ci_p(:,1),ci_p(:,2),ci_p(:,3),'o');



end





