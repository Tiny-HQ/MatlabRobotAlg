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




%ori��ʾ���ֻ�������; ori indicates whether it is left or right;
%�˴���scara������ʽ;��������װ; The scara here is desktop; Lifting is not included;
function [T,ori] = scara_fkine(q,DH,q_option,a_t_option)


    a1= DH.a(2); a2= DH.a(3);a3 = DH.a(4);
    d1 = DH.d(1);d3 = q(3)+DH.d(3); d4 = DH.d(4);
    a0 = 0;
    d2 = 0;
    
    
    if strcmp(q_option,'deg')
        q = q*pi/180.0;
    elseif strcmp(q_option,'rad')
       ;
    else
        q = q*pi/180.0;
    end

    
    if strcmp(a_t_option,'deg')
        alpha= DH.alpha*pi/180.0;
        theta = DH.theta*pi/180.0;
    elseif strcmp(alpha_theta_option,'rad')
        ;
    else
        alpha= DH.alpha*pi/180.0;
        theta = DH.theta*pi/180.0;
    end


    q = q+theta;%theta��ƫ�� offset
    alpha0 = alpha(1); alpha1 = alpha(2); alpha2 = alpha(3);alpha3 = alpha(4);  
    
    T01 = create_link(q(1),d1,alpha0,a0,'rad');
    T12 = create_link(q(2),d2,alpha1,a1,'rad');
    T23 = create_link(0.0,d3,alpha2,a2,'rad');
    T34 = create_link(q(4),d4,alpha3,a3,'rad');
    T = T01*T12*T23*T34;

    %q2�ķ�Χ��-180��+180 Q2 ranges from -180 to +180
    if abs(q(2))<eps
        ori = 0;
    elseif q(2)>0
        ori = 1;
    else
        ori = -1;
    end
        

end









