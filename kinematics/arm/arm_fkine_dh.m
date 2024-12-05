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





%����������Ӧ�û�Ӧ�ü�һ��tool�� There should also be a tool added to the forward and backward solutions




function [T,shoulder,elbow,wrist] = arm_fkine_dh(q,DH,q_option,alpha_theta_option)

 
    a1= DH.a(2); a2= DH.a(3); a3= DH.a(4);
    d1 = DH.d(1);d3 = DH.d(3); d4 = DH.d(4);d6 = DH.d(6);

    a0 = 0;a4 =0;a5 = 0;
    d2 = 0;d5 =  DH.d(5);

    if strcmp(q_option,'deg')
        q = q*pi/180.0;
    elseif strcmp(q_option,'rad')
       ;
    else
        q = q*pi/180.0;
    end

    if strcmp(alpha_theta_option,'deg')
        alpha= DH.alpha*pi/180.0;
        theta = DH.theta*pi/180.0;
    elseif strcmp(alpha_theta_option,'rad')
        ;
    else
        alpha= DH.alpha*pi/180.0;
        theta = DH.theta*pi/180.0;
    end
    
    q = q+theta;%theta��ƫ�� offset
    
    alpha0 = alpha(1); alpha1 = alpha(2); alpha2 = alpha(3);alpha3 = alpha(4);  alpha4 = alpha(5); alpha5 = alpha(6);
    T01 = create_link(q(1),d1,alpha0,a0,'rad');
    T12 = create_link(q(2),d2,alpha1,a1,'rad');
    T23 = create_link(q(3),d3,alpha2,a2,'rad');
    T34 = create_link(q(4),d4,alpha3,a3,'rad');
    T45 = create_link(q(5),d5,alpha4,a4,'rad');
    T56 = create_link(q(6),d6,alpha5,a5,'rad');



    T = T01*T12*T23*T34*T45*T56;

    T_temp = T12*T23*T34;
 
    
    if abs(T_temp(1,4))<eps
        shoulder = 0;     
    elseif (T_temp(1,4))
        shoulder = 1;
    else 
        shoulder = -1;
    end
    
    
    if abs(tan(q(3))-d4/a3)<eps
        elbow = 0;
    elseif(tan(q(3))>d4/a3)||(q(3)>pi/2)
        elbow = 1;
    else
        elbow = -1;       
    end
    
    if abs(q(5))<eps
        wrist = 0;
    elseif(q(5)>0)
        wrist = 1;
    else
        wrist = -1;
    end

end








