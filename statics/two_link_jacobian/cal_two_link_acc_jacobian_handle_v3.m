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




function Acc = cal_two_link_acc_jacobian_handle_v3(q,DH,opt,dq,ddq)

   d1 = DH.d(1);
    d2 = DH.d(2);
    a0 = DH.a(1);
    a1 = DH.a(2);
    a2 = DH.a(3);

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
    T01 = create_link(q(1),d1,0,a0,'rad');
    T12 = create_link(q(2),d2,0,a1,'rad');
    T23 = create_link(0,0,0,a2,'rad');

    J = zeros(6,2);
%     Acc(1) = -(L1*cos(q(1))+L2*cos(q(1)+q(2)))*dq(1)*dq(1) ...
%     -2*(L2*cos(q(1)+q(2)))*dq(1)*dq(2)...
%     -(L1*sin(q(1))+L2*sin(q(1)+q(2)))*ddq(1)...
%     -L2*cos(q(1)+q(2))*dq(2)*dq(2)...
%     -L2*sin(q(1)+q(2))*ddq(2);
% 
% 
%      Acc(2) = (-L1*sin(q(1))-L2*sin(q(1)+q(2)))*dq(1)*dq(1) ...
%          -2*L2*sin(q(1)+q(2))*dq(1)*dq(2)...
%          +(L1*cos(q(1))+L2*cos(q(1)+q(2)))*ddq(1)...
%          -L2*sin(q(1)+q(2))*dq(2)*dq(2)...
%          +L2*cos(q(1)+q(2))*ddq(2);


    z0 = [0 0 1]';p0 = [0 0 0 1]';
    z1 = splitT_R(T01)*z0;z2 = splitT_R(T01*T12)*z0;z3 = splitT_R(T01*T12*T23)*z0;
    p1 = T01*p0; p2 = T01*T12*p0;p3 = T01*T12*T23*p0;
    p0 = p0(1:3); p1 = p1(1:3);  p2 = p2(1:3);  p3 = p3(1:3); 
    
    J(4:6,1) = z1; J(4:6,2) = z2; 
    J(1:3,1) = cross(z1,p3-p1);
    J(1:3,2) = cross(z2,p3-p2);

    dJ = zeros(6,2);

    b1 = cross(z1,p3-p1); 
    b2 = cross(z2,p3-p2);
    
    c1 = cos(q(1));s1 = sin(q(1));
    s12 = sin(q(1)+q(2));c12 = cos(q(1)+q(2));
    
    dJ(1,1) = -(L1*c1*dq(1)+c12*L2*(dq(1)+dq(2)));  dJ(1,2) = -L2*c12*(dq(1)+dq(2));
    dJ(2,1) = -L1*s1*dq(1)-L2*s12*(dq(1)+dq(2));    dJ(2,2) = -L2*s12*(dq(1)+dq(2));
    T =dJ*[dq(1);dq(2)]+J*[ddq(1);ddq(2)];
    
    Acc = T(1:2)';
     


end