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



function J = arm_jacobian(DH,q,opt)

    a1= DH.a(2); a2= DH.a(3); a3= DH.a(4);
    d1 = DH.d(1);d3 = DH.d(3); d4 = DH.d(4);d6 = DH.d(6);

    a0 = 0;a4 =0;a5 = 0;
    d2 = 0;d5 =  DH.d(5);

    if strcmp(opt,'deg')
        q = q*pi/180.0;
    elseif strcmp(opt,'rad') 
       ;
    else
        q = q*pi/180.0;
    end

    if strcmp(opt,'deg')
        alpha= DH.alpha*pi/180.0;
        theta = DH.theta*pi/180.0;
    elseif strcmp(opt,'rad')
        ;
    else
        alpha= DH.alpha*pi/180.0;
        theta = DH.theta*pi/180.0;
    end
    
    q = q+theta;%thetaµÄÆ«²î
    alpha0 = alpha(1); alpha1 = alpha(2); alpha2 = alpha(3);alpha3 = alpha(4);  alpha4 = alpha(5); alpha5 = alpha(6);
        
        
    T01 = create_link(q(1),d1,alpha0,a0,'rad');
    T12 = create_link(q(2),d2,alpha1,a1,'rad');
    T23 = create_link(q(3),d3,alpha2,a2,'rad');
    T34 = create_link(q(4),d4,alpha3,a3,'rad');
    T45 = create_link(q(5),d5,alpha4,a4,'rad');
    T56 = create_link(q(6),d6,alpha5,a5,'rad');

    J = zeros(6,6);
    
    z0 = [0 0 1]';p0 = [0 0 0 1]';
    z1 = splitT_R(T01)*z0;z2 = splitT_R(T01*T12)*z0;z3 = splitT_R(T01*T12*T23)*z0;
    z4 = splitT_R(T01*T12*T23*T34)*z0;z5 = splitT_R(T01*T12*T23*T34*T45)*z0;z6 = splitT_R(T01*T12*T23*T34*T45*T56)*z0;
    p1 = T01*p0; p2 = T01*T12*p0;p3 = T01*T12*T23*p0;p4 = T01*T12*T23*T34*p0;p5 = T01*T12*T23*T34*T45*p0;p6 = T01*T12*T23*T34*T45*T56*p0; 
    p0 = p0(1:3); p1 = p1(1:3);  p2 = p2(1:3);  p3 = p3(1:3);  p4 = p4(1:3);  p5 = p5(1:3);  p6 = p6(1:3);
    
    J(4:6,1) = z1; J(4:6,2) = z2; J(4:6,3) = z3; J(4:6,4) = z4; J(4:6,5) = z5; J(4:6,6) = z6;
    J(1:3,1) = cross(z1,p6-p1);
    J(1:3,2) = cross(z2,p6-p2);
    J(1:3,3) = cross(z3,p6-p3);
    J(1:3,4) = cross(z4,p6-p4);
    J(1:3,5) = cross(z5,p6-p5);
    J(1:3,6) = cross(z6,p6-p6);

end