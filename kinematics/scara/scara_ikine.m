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





function [q] = scara_ikine(T,ori,DH,q_option,alpha_theta_option)

    q = [0 0 0 0];
    a1= DH.a(2); a2= DH.a(3);a0 = DH.a(1);
    d1 = DH.d(1);d2 = DH.d(2);d3 = q(3)-DH.d(3);


    if strcmp(alpha_theta_option,'deg')
        alpha = DH.alpha*pi/180;
        theta = DH.theta*pi/180;
    elseif strcmp(alpha_theta_option,'rad')
        ;
    else
        theta = DH.theta*pi/180;
        alpha = DH.alpha*pi/180;
    end

    px = T(1,4);py = T(2,4);
    pxy2 = px^2+py^2;
    
    c2 = (pxy2-a1^2-a2^2)/(2*a1*a2);
    
    if ori == 1
        q(2) = acos(c2);%-cos(180-theta2)
    elseif ori == -1 
        q(2) = -acos(c2);%cos(180-theta2)
    elseif ori == 0
        q(2) = 0;
    end
    
    
    theta1 = atan2(py,px);
    theta2 = acos((a2^2-a1^2-pxy2)/(2*a1*pxy2^0.5));%这里需要注意的是如果(a2^2-a1^2-pxy2)<0，acos的范围是[0,180]; It should be noted here that if (a2^2-a1^2-pxy2) < 0, the range of ACOS is [0,180];
    if (a2^2-a1^2-pxy2)<0
        theta2 = pi-theta2;%acos自己加了pi，所以要减掉; %acos adds pi itself, so subtract it;
    end
    
    if ori == 1
        q(1) = theta1-theta2;
        
    elseif ori == -1
        q(1) = theta1+theta2;
    elseif ori ==0
        q(1) = theta1;
    end

    q(3) = T(3,4);
    
    alpha0 = alpha(1); alpha1 = alpha(2); alpha2 = alpha(3);
    T01 = create_link(q(1),d1,alpha0,a0,'rad');
    T12 = create_link(q(2),d2,alpha1,a1,'rad');
    T23 = create_link(0.0,d3,alpha2,a2,'rad');

    T_temp = inv(T01*T12*T23)*T;
    c4 = T_temp(1,1);
    s4 = T_temp(2,1);
    
    q(4) = atan2(s4,c4);

    q = q-theta;
    
    
    if strcmp(q_option,'deg')
         q(1) = q(1)*180/pi;
         q(2) = q(2)*180/pi;
         q(4) = q(4)*180/pi;
     else
        ;
     end
     
    

end




