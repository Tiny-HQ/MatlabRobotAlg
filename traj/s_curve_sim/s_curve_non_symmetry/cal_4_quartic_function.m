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



%��һԪ�Ĵη���; 4th order cal



function [x] = cal_4_quartic_function(a,b,c,e)

    d = 0.0;

    alpha =(-3*b^2)/(8*a^2)+c/a;
    beta = b^3/(8*a^3)-b*c/(2*a^2)+d/a;
    gama = (-3*b^4)/(256*a^4)+(b^2*c)/(16*a^3)-(b*d)/(4*a^2)+e/a;
    
    
    P = -alpha^2/12-gama;
    Q = -alpha^3/108+(alpha*gama)/3-beta^2/8;
    U1 = (Q/2+(Q^2/4+P^3/27)^0.5)^0.3333333;
    U2 = (Q/2-(Q^2/4+P^3/27)^0.5)^0.3333333;
    
    y1 = -5/6*alpha+P/(3*U1)-U1;
    y2 = -5/6*alpha+P/(3*U2)-U2;
    
    if abs(beta)<=0.0000001
        x(1) = -b/(4*a)+((-alpha+(alpha^2-4*gama)^0.5)/2)^0.5;
       return;
    end
    
    x(1) = -b/(4*a)+((alpha+2*y1)^0.5+(-(3*alpha+2*y1+(2*beta/((alpha+2*y1)^0.5))))^0.5)/2;
    %x_ = -b/(4*a)+((alpha+2*y1)^0.5+(-(3*alpha+2*y1+(2*beta/((alpha+2*y1)^0.5))))^0.5)/2
    %x__ = -b/(4*a)+((alpha+2*y1)^0.5-(-(3*alpha+2*y1+(2*beta/((alpha+2*y1)^0.5))))^0.5)/2
    -b/(4*a)+((alpha+2*y2)^0.5+(-(3*alpha+2*y2+(2*beta/((alpha+2*y2)^0.5))))^0.5)/2
   % -b/(4*a)+(-(alpha+2*y1)^0.5-(-(3*alpha+2*y1-(2*beta/((alpha+2*y1)^0.5))))^0.5)/2
   % -b/(4*a)+(-(alpha+2*y2)^0.5-(-(3*alpha+2*y2-(2*beta/((alpha+2*y2)^0.5))))^0.5)/2
%     d = 0.0;
%     P = (c^2+12*a*e-3*b*d)/9;
%     Q = (27*a*d*d+2*c^3+27*b*b*e-72*a*c*e-9*b*c*d)/54;
%     D = (Q^2-P^3)^0.5;
%     if Q+D>Q-D
%         u = (Q+D)^(1/3);
%     else
%         u = (Q-D)^(1/3);
%     end
%     
%     v = P/u;
%     m = 0;
%     S = b^2-8/3*a*c;
%     T = 0;
%     
%     x(1) = (-b-(S-T)^0.5)/(4*a);
%     x(2) = (-b-(S+T)^0.5)/(4*a);


%     D = 0.0;
%     a = B/A;
%     b = C/A;
%     c = D/A;
%     d = E/A;
%     
%     P = (b^2-3*a*c+12*d)/9;
%     Q = (2*b^3-9*a*b*c+27*c^2+27*a*a*d-72*b*d)/54;
%     
%     D= (Q^2-P^3)^0.5;
%     u = (Q+D)^(1/3);
%     v = P/u;
%     m2 = (a^2/4-2/3*b+4*a*(u+v))^0.5;
%     S4 = a^2/2-4/3*b-(u+v);
%     T4 = (-a^3+4*a*b-8*c)/(4*m2);
%     
%     x1 = -a/4-1/2*m2-1/2*(S4-T4)^0.5;
%     x2 = -a/4+1/2*m2-1/2*(S4+T4)^0.5;
%     
%     x(1) = x1;
%     x(2) = x2;
    

%     z = -768*a^3*e^3+384*(a*c*e)^2-432*a*b^2*c*e^2-48*a*c^4*e+81*b^4*e^2+12*b^2*c^3*e;
%     
%     p = z^0.5;
%     q = (-288*a*c*e+108*b^2*e+8*c^3+12*p)^0.3333333;
%     m = a/q*(288*a*e+24*c^2);
%     r = (9*b^2-24*a*c+6*a*q+m)^0.5;
%     
% 
%     s = 18*b^2-48*a*c-6*q*a-m;
%     t = 54/r*(b^3-4*a*b*c);
%     
%     x(1) = (r+(s-t)^0.5-3*b)/(12*a);
%     x(2) = (r-(s-t)^0.5-3*b)/(12*a); 
%     x(3) = (-r-(s+t)^0.5-3*b)/(12*a);
%     x(4) = (-r+(s+t)^0.5-3*b)/(12*a);
    
%     if s<t
%         x(3) = (-r-(s+t)^0.5-3*b)/(12*a);
%         x(4) = (-r+(s+t)^0.5-3*b)/(12*a);
%     end
%     x1 = 0.0;x2 = 0.0;x3 = 0.0;x4 = 0.0;
% 
%     if (s-t)>0.0
%         x1 = (r+(s-t)^0.5-3*b)/(12*a);
%         x2 = (r-(s-t)^0.5-3*b)/(12*a);  
%     end
%     if (s+t)>0.0
%         x3 = (-r-(s+t)^0.5-3*b)/(12*a);
%         x4 = (-r+(s+t)^0.5-3*b)/(12*a);
%     end
% 
%     y = sort([x1,x2,x3,x4]);
% 
%     if y(1)>0
%         x = y(1);
%         return;
%     end
%     
%     for i = 1:3
%         if(y(i)<=0)&&(y(i+1)>0)
%             x = y(i+1);
%             return;
%         end
%     end
    
   







end
