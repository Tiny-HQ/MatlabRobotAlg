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





function T = three_link_fkine(DH,q,opt)


    d1 = DH.d(1);
    d2 = DH.d(2);
    a0 = DH.a(1);
    a1 = DH.a(2);
    a2 = DH.a(3);
    a3 = DH.a(4);


    if strcmp(opt,'deg')
        q = q*pi/180.0;
    elseif strcmp(opt,'rad')
       ;
    else
        q = q*pi/180.0;
    end

    %q = q+theta;%theta��ƫ��
  
    T01 = create_link(q(1),d1,0,a0,'rad');
    T12 = create_link(q(2),d2,0,a1,'rad');
    T23 = create_link(q(3),0,0,a2,'rad');
    T34 = create_link(0,0,0,a3,'rad');

    T =T01*T12*T23*T34;
end