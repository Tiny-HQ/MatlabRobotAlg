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

%?????????;
%?????????;

function [dJ] = cal_arm_acc_jacob(q,dq,DH,opt)


    a1= DH.a(2); a2= DH.a(3); a3= DH.a(4);
    d1 = DH.d(1);d3 = DH.d(3); d4 = DH.d(4);d6 = DH.d(6);

    a0 = 0;a4 =0;a5 = 0;
    d2 = 0;d5 =  DH.d(5);

    if strcmp(opt,'deg')
        q = q*pi/180.0;
        dq = dq*pi/180;
    elseif strcmp(opt,'rad') 
       ;
    else
        q = q*pi/180.0;
        dq = dq*pi/180;
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

    %???????;
    %????????;
    % ddx - dj*dq = J*ddq;
    %J = zeros(6,6);%?????;
    z0 = [0 0 1]';p0 = [0 0 0 1]';
    z1 = splitT_R(T01)*z0;z2 = splitT_R(T01*T12)*z0;z3 = splitT_R(T01*T12*T23)*z0;
    z4 = splitT_R(T01*T12*T23*T34)*z0;z5 = splitT_R(T01*T12*T23*T34*T45)*z0;z6 = splitT_R(T01*T12*T23*T34*T45*T56)*z0;
    p1 = T01*p0; p2 = T01*T12*p0;p3 = T01*T12*T23*p0;p4 = T01*T12*T23*T34*p0;p5 = T01*T12*T23*T34*T45*p0;p6 = T01*T12*T23*T34*T45*T56*p0; 
    p0 = p0(1:3); p1 = p1(1:3);  p2 = p2(1:3);  p3 = p3(1:3);  p4 = p4(1:3);  p5 = p5(1:3);  p6 = p6(1:3);
    
%     J(4:6,1) = z1; J(4:6,2) = z2; J(4:6,3) = z3; J(4:6,4) = z4; J(4:6,5) = z5; J(4:6,6) = z6;
%     J(1:3,1) = cross(z1,p6-p1);
%     J(1:3,2) = cross(z2,p6-p2); 
%     J(1:3,3) = cross(z3,p6-p3);
%     J(1:3,4) = cross(z4,p6-p4);
%     J(1:3,5) = cross(z5,p6-p5);
%     J(1:3,6) = cross(z6,p6-p6);

    % ??????dJ
    dJ = zeros(6,6);
    %?w;
    w0 = [0 0 0]'; 
%     w1 = splitT_R(T01)*w0 + dq(1)*z0;
%     w2 = splitT_R(T12)*w1 + dq(2)*z0;
%     w3 = splitT_R(T23)*w2 + dq(3)*z0;
%     w4 = splitT_R(T34)*w3 + dq(4)*z0;
%     w5 = splitT_R(T45)*w4 + dq(5)*z0;
%     w6 = splitT_R(T56)*w5 + dq(6)*z0;

    w1 = w0 + dq(1)*z1;
    w2 = w1 + dq(2)*z2;
    w3 = w2 + dq(3)*z3;
    w4 = w3 + dq(4)*z4;
    w5 = w4 + dq(5)*z5;
    w6 = w5 + dq(6)*z6;
    
    b1 = cross(z1,p6-p1); 
    b2 = cross(z2,p6-p2);
    b3 = cross(z3,p6-p3); 
    b4 = cross(z4,p6-p4); 
    b5 = cross(z5,p6-p5);
    b6 = cross(z6,p6-p6);
    
    T00 = eye(4);
    T00_ = zeros(4,4);
    T02 = T01*T12;
    T03 = T01*T12*T23;
    T04 = T01*T12*T23*T34;
    T05 = T01*T12*T23*T34*T45;
    T06 = T01*T12*T23*T34*T45*T56;
    
    Q = zeros(4,4);
    Q(1:3,1:3) = S_alg([0 0 1]);
    T01_ = T00_*T01+T01*Q*dq(1);
    T02_ = T01_*T12+T02*Q*dq(2);
    T03_ = T02_*T23+T03*Q*dq(3);
    T04_ = T03_*T34+T04*Q*dq(4);
    T05_ = T04_*T45+T05*Q*dq(5);
    T06_ = T05_*T56+T06*Q*dq(6);
    Vn = T06_(1:3,4);V1 = T01_(1:3,4); V2 = T02_(1:3,4);V3 = T03_(1:3,4);V4 = T04_(1:3,4);V5 = T05_(1:3,4);V6 = T06_(1:3,4);
    
   

    db1 = cross(cross(w1,z1),(p6-p1))+cross(z1,Vn-V1);
    db2 = cross(cross(w2,z2),(p6-p2))+cross(z2,Vn-V2);
    db3 = cross(cross(w3,z3),(p6-p3))+cross(z3,Vn-V3);    
    db4 = cross(cross(w4,z4),(p6-p4))+cross(z4,Vn-V4);   
    db5 = cross(cross(w5,z5),(p6-p5))+cross(z5,Vn-V5);
    db6 = cross(cross(w6,z6),(p6-p6))+cross(z6,Vn-V6);

%     db1 = cross(cross(w1,z1),(p3-p1))+cross(z1,b3*dq(3)+b2*dq(2)+b1*dq(1));
%     db2 = cross(cross(w2,z2),(p3-p2))+cross(z2,b3*dq(3)+b2*(dq(1)+dq(2)));
%     db3 = cross(cross(w3,z3),(p3-p3))+cross(z3,b3*(dq(3)+dq(2)+dq(1)));
    
%     db1 = cross(cross(w1,z1),(p6-p1))+cross(z1,b1*dq(1)+b2*dq(2)+b3*dq(3)+b4*dq(4)+b5*dq(5)+b6*dq(6));
%     db2 = cross(cross(w2,z2),(p6-p2))+cross(z2,b2*(dq(2)+dq(1))+b3*dq(3)+b4*dq(4)+b5*dq(5)+b6*dq(6));
%     db3 = cross(cross(w3,z3),(p6-p3))+cross(z3,b3*(dq(3)+dq(2)+dq(1))+b4*dq(4)+b5*dq(5)+b6*dq(6));    
%     db4 = cross(cross(w4,z4),(p6-p4))+cross(z4,b4*(dq(4)+dq(3)+dq(2)+dq(1))+b5*dq(5)+b6*dq(6));   
%     db5 = cross(cross(w5,z5),(p6-p5))+cross(z5,b5*(dq(5)+dq(4)+dq(3)+dq(2)+dq(1))+b6*dq(6));
%     db6 = cross(cross(w6,z6),(p6-p6))+cross(z6,b6*(dq(6)+dq(5)+dq(4)+dq(3)+dq(2)+dq(1)));
    
%     db1 = cross(cross(w0,z0),(p6-p0))+cross(z0,b1*dq(1)+b2*dq(2)+b3*dq(3)+b4*dq(4)+b5*dq(5)+b6*dq(6));
%     db2 = cross(cross(w1,z1),(p6-p1))+cross(z1,b2*dq(2)+b3*dq(3)+b4*dq(4)+b5*dq(5)+b6*dq(6));
%     db3 = cross(cross(w2,z2),(p6-p2))+cross(z2,b3*dq(3)+b4*dq(4)+b5*dq(5)+b6*dq(6));    
%     db4 = cross(cross(w3,z3),(p6-p3))+cross(z3,b4*dq(4)+b5*dq(5)+b6*dq(6));   
%     db5 = cross(cross(w4,z4),(p6-p4))+cross(z4,b5*dq(5)+b6*dq(6));
%     db6 = cross(cross(w5,z5),(p6-p5))+cross(z5,b6*dq(6));

    
    dc1 = cross(w1,z1);
    dc2 = cross(w2,z2);
    dc3 = cross(w3,z3);
    dc4 = cross(w4,z4);
    dc5 = cross(w5,z5);
    dc6 = cross(w6,z6);
    
    dJ(1:3,1) = db1; dJ(1:3,2) = db2; dJ(1:3,3) = db3; dJ(1:3,4) = db4; dJ(1:3,5) = db5; dJ(1:3,6) = db6;
    dJ(4:6,1) = dc1; dJ(4:6,2) = dc2; dJ(4:6,3) = dc3; dJ(4:6,4) = dc4; dJ(4:6,5) = dc5; dJ(4:6,6) = dc6;

                    
end

