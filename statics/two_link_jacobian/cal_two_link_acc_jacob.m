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
function [dJ] = cal_two_link_acc_jacob(q,dq,DH,opt)


   d1 = DH.d(1);
    d2 = DH.d(2);
    a0 = DH.a(1);
    a1 = DH.a(2);
    a2 = DH.a(3);


    if strcmp(opt,'deg')
        q = q*pi/180.0;
        dq = dq*pi/180.0;
    elseif strcmp(opt,'rad')
       ;
    else
        q = q*pi/180.0;
        dq = dq*pi/180.0;
    end

    %q = q+theta;%theta???
  
    T01 = create_link(q(1),d1,0,a0,'rad');
    T12 = create_link(q(2),d2,0,a1,'rad');
    T23 = create_link(0,0,0,a2,'rad');

    J = zeros(6,2);

    %???????;
    %????????;
    % ddx - dj*dq = J*ddq;
    %J = zeros(6,6);%?????;
    z0 = [0 0 1]';p0 = [0 0 0 1]';
    z1 = splitT_R(T01)*z0;z2 = splitT_R(T01*T12)*z0;z3 = splitT_R(T01*T12*T23)*z0;
    p1 = T01*p0; p2 = T01*T12*p0;p3 = T01*T12*T23*p0;
    p0 = p0(1:3); p1 = p1(1:3);  p2 = p2(1:3);  p3 = p3(1:3); 
    
    J(4:6,1) = z1; J(4:6,2) = z2; 
    J(1:3,1) = cross(z1,p3-p1);
    J(1:3,2) = cross(z2,p3-p2);

    dJ = zeros(6,2);
    w0 = [0 0 0]'; 

    w1 = w0 + dq(1)*z1;
    w2 = w1 + dq(2)*z2;

    
    b1 = cross(z1,p3-p1); 
    b2 = cross(z2,p3-p2);
    v = J*(dq);
    
    db1 = cross(cross(w1,z1),(p3-p1))+cross(z1,b2*dq(2)+b1*dq(1));
    db2 = cross(cross(w2,z2),(p3-p2))+cross(z2,b2*(dq(2)+dq(1)));%????????;?????dh,??dh??;
%     db2 = cross(cross(w2,z2),(p3-p2))+cross(z2,b2*(dq(2)));
    
    dc1 = cross(w1,z1);
    dc2 = cross(w2,z2);

    
    dJ(1:3,1) = db1; dJ(1:3,2) = db2; 
    dJ(4:6,1) = dc1; dJ(4:6,2) = dc2; 

                    
end