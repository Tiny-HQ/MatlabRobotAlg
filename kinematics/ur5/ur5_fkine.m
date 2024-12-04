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

function [T] = ur5_fkine(q,DH,q_option)

    
    if strcmp(q_option,'deg')
        q = (q+DH.theta)*pi/180.0;
    elseif strcmp(q_option,'rad')
       ;
    else
        q = (q+DH.theta)*pi/180.0;
    end

    if strcmp(q_option,'deg')
        alpha= DH.alpha*pi/180.0;    
    elseif strcmp(q_option,'rad')
        ;
    else
        alpha= DH.alpha*pi/180.0;
    end

   
    T01 = create_link(q(1),DH.d(1),alpha(1),DH.a(1),'rad');
    T12 = create_link(q(2),DH.d(2),alpha(2),DH.a(2),'rad');
    T23 = create_link(q(3),DH.d(3),alpha(3),DH.a(3),'rad');
    T34 = create_link(q(4),DH.d(4),alpha(4),DH.a(4),'rad');
    T45 = create_link(q(5),DH.d(5),alpha(5),DH.a(5),'rad');
    T56 = create_link(q(6),DH.d(6),alpha(6),DH.a(6),'rad');

    T = T01*T12*T23*T34*T45*T56;
end




