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
function J = arm_jacobian_v2(DH,q,opt)
  a0= DH.a(2); a1= DH.a(3); a2= DH.a(4);
    d1 = DH.d(1);d3 = DH.d(3); d4 = DH.d(4);d6 = DH.d(6);

    a3 = 0;a4 =0;a5 = 0;
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
    
    q = q+theta;%theta¦Ì???2?
    alpha0 = alpha(2); alpha1 = alpha(3); alpha2 = alpha(4);alpha3 = alpha(5);  alpha4 = alpha(6); alpha5 = alpha(1);
        
        

    T01=hrotz(q(1)*180/pi)*htrans(a0,0,d1)*hrotx(alpha0*180/pi);
    T12=hrotz(q(2)*180/pi)*htrans(a1,0,d2)*hrotx(alpha1*180/pi);
    T23=hrotz(q(3)*180/pi)*htrans(a2,0,d3)*hrotx(alpha2*180/pi);
    T34=hrotz(q(4)*180/pi)*htrans(a3,0,d4)*hrotx(alpha3*180/pi);
    T45=hrotz(q(5)*180/pi)*htrans(a4,0,d5)*hrotx(alpha4*180/pi);
    T56=hrotz(q(6)*180/pi)*htrans(a5,0,d6)*hrotx(alpha5*180/pi);
    
    
%     T01 = create_link(q(1),d1,alpha0,a0,'rad');
%     T12 = create_link(q(2),d2,alpha1,a1,'rad');
%     T23 = create_link(q(3),d3,alpha2,a2,'rad');
%     T34 = create_link(q(4),d4,alpha3,a3,'rad');
%     T45 = create_link(q(5),d5,alpha4,a4,'rad');
%     T56 = create_link(q(6),d6,alpha5,a5,'rad');


    T06 = T01*T12*T23*T34*T45*T56;
    T16 = T12*T23*T34*T45*T56;
    T26 = T23*T34*T45*T56;
    T36 = T34*T45*T56;
    T46 = T45*T56;
    
    J = zeros(6,6);
    
   %¦Ì¨²¨°?¨¢D
   J(4:6,1) = T06(3,1:3)';
   n = T06(1:3,1); o = T06(1:3,2); a = T06(1:3,3);p = T06(1:3,4);
   tmp = cross(p,n);J(1,1) = tmp(3);
   tmp = cross(p,o);J(2,1) = tmp(3);
   tmp = cross(p,a);J(3,1) = tmp(3);

   %¦Ì¨²?t¨¢D
   J(4:6,2) = T16(3,1:3)';
   n = T16(1:3,1); o = T16(1:3,2); a = T16(1:3,3);p = T16(1:3,4);
   tmp = cross(p,n);J(1,2) = tmp(3);
   tmp = cross(p,o);J(2,2) = tmp(3);
   tmp = cross(p,a);J(3,2) = tmp(3);
   
   %¦Ì¨²¨¨y¨¢D
   J(4:6,3) = T26(3,1:3)';
   n = T26(1:3,1); o = T26(1:3,2); a = T26(1:3,3);p = T26(1:3,4);
   tmp = cross(p,n);J(1,3) = tmp(3);
   tmp = cross(p,o);J(2,3) = tmp(3);
   tmp = cross(p,a);J(3,3) = tmp(3);
    
      %¦Ì¨²??¨¢D
   J(4:6,4) = T36(3,1:3)';
   n = T36(1:3,1); o = T36(1:3,2); a = T36(1:3,3);p = T36(1:3,4);
   tmp = cross(p,n);J(1,4) = tmp(3);
   tmp = cross(p,o);J(2,4) = tmp(3);
   tmp = cross(p,a);J(3,4) = tmp(3);
   
   %¦Ì¨²??¨¢D
   J(4:6,5) = T46(3,1:3)';
   n = T46(1:3,1); o = T46(1:3,2); a = T46(1:3,3);p = T46(1:3,4);
   tmp = cross(p,n);J(1,5) = tmp(3);
   tmp = cross(p,o);J(2,5) = tmp(3);
   tmp = cross(p,a);J(3,5) = tmp(3);
   
 
   %¦Ì¨²¨¢¨´¨¢D
   J(4:6,6) = T56(3,1:3)';
   n = T56(1:3,1); o = T56(1:3,2); a = T56(1:3,3);p = T56(1:3,4);
   tmp = cross(p,n);J(1,6) = tmp(3);
   tmp = cross(p,o);J(2,6) = tmp(3);
   tmp = cross(p,a);J(3,6) = tmp(3);
end

