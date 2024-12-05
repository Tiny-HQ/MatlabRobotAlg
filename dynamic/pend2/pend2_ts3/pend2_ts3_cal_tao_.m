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

%����ʱ�� λ�� �ٶ� ���ٶ���õ�taoֵ;The tao value obtained from the position velocity acceleration at any time;




function [tao1,tao2] = pend2_ts3_cal_tao_(q11,dq11,ddq11,q22,dq22,ddq22)


global  g m1 m2 Izz2 Izz1 L1 L2;
    
%     s1 = sin(q1*Pi/180.0);
%     s2 = sin(q2*Pi/180.0);
%     c1 = cos(q1*Pi/180.0);
%     c2 = cos(q2*Pi/180.0);
%     dq1 = dq1*pi/180;
%     dq2 = dq2*pi/180;
%     ddq1 = ddq1*pi/180;
%     ddq2 = ddq2*pi/180;
for i = 1:1:1000
     s1 = sin(q11(i)*pi/180.0);
    s2 = sin(q22(i)*pi/180.0);
    c1 = cos(q11(i)*pi/180.0);
    c2 = cos(q22(i)*pi/180.0);
    dq1 = dq11(i)*pi/180;
    dq2 = dq22(i)*pi/180;
    ddq1 = ddq11(i)*pi/180;
    ddq2 = ddq22(i)*pi/180;
    
 %    tao2(i) = Izz2*(ddq1 + ddq2) + (L2*m2*(c2*(L1*ddq1 - c1*g) + (L2*(ddq1 + ddq2))/2 + s2*(L1*dq1^2 + g*s1)))/2;
%     
%     
  %   tao1(i) = Izz1*ddq1 - L1*(m2*s2*((L2*(dq1 + dq2)^2)/2 - s2*(L1*ddq1 - c1*g) + c2*(L1*dq1^2 + g*s1)) - c2*m2*(c2*(L1*ddq1 - c1*g) + (L2*(ddq1 + ddq2))/2 + s2*(L1*dq1^2 + g*s1))) + Izz2*(ddq1 + ddq2) + (L2*m2*(c2*(L1*ddq1 - c1*g) + (L2*(ddq1 + ddq2))/2 + s2*(L1*dq1^2 + g*s1)))/2 + (L1*m1*((L1*ddq1)/2 - c1*g))/2;
    tao2(i) = Izz2*(ddq1 + ddq2) + (L2*m2*(c2*(L1*ddq1 + c1*g) + (L2*(ddq1 + ddq2))/2 - s2*(- L1*dq1^2 + g*s1)))/2;
     tao1(i) = Izz1*ddq1 + L1*(m2*s2*(s2*(L1*ddq1 + c1*g) - (L2*(dq1 + dq2)^2)/2 + c2*(- L1*dq1^2 + g*s1)) + c2*m2*(c2*(L1*ddq1 + c1*g) + (L2*(ddq1 + ddq2))/2 - s2*(- L1*dq1^2 + g*s1))) + Izz2*(ddq1 + ddq2) + (L2*m2*(c2*(L1*ddq1 + c1*g) + (L2*(ddq1 + ddq2))/2 - s2*(- L1*dq1^2 + g*s1)))/2 + (L1*m1*((L1*ddq1)/2 + c1*g))/2;



end

end








