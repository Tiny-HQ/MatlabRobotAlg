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





function q = arm_ikine_dh(T,DH,shoulder,elbow,wrist,alpha_theta_option,option)


    a1= DH.a(2); a2= DH.a(3); a3= DH.a(4);
    d1 = DH.d(1);d3 = DH.d(3); d4 = DH.d(4);d6 = DH.d(6);
    if strcmp(alpha_theta_option,'deg')
        alpha = DH.alpha*pi/180.0; 
        theta = DH.theta*pi/180;
    elseif strcmp(alpha_theta_option,'rad')
        ;
    else
        alpha = DH.alpha*pi/180.0; 
        theta = DH.theta*pi/180;
    end
    alpha0 = alpha(1); alpha1 = alpha(2); alpha2 = alpha(3);alpha3 = alpha(4);  alpha4 = alpha(5); alpha5 = alpha(6);
    a0 = 0;a4 =0;a5 = 0;
    d2 = 0;d5 =  0;


    V65 = [0 0 -d6 1]';
    V05 = T*V65;%�ӵ�0������ϵ���������ϵ��λ��ת��������˵�����ĺ�����ϵ��λ��ת���� Position conversion from coordinate system 0 to coordinate system 5, or position conversion to coordinate system 4;
    xp = V05(1);yp = V05(2);zp = V05(3);
    
    if shoulder == -1
        q(1) = atan2(yp,xp)+atan2(-d3,sqrt(xp^2+yp^2-d3^2));
        if q(1)>0 
            q(1) = q(1)-pi;
        elseif q(1)<0
            q(1) = q(1)+pi;
        end
    elseif shoulder == 1
        q(1) = atan2(yp,xp)-atan2(-d3,sqrt(xp^2+yp^2-d3^2));
    elseif shoulder == 0
          %shoulder ����,Ҳ��ǰ������; shoulder is singularty, but also singularty before and after;
          return;
    end


    xp_1 = xp + d3*sin(q(1));
	yp_1 = yp - d3*cos(q(1));
    
    xp1=xp_1*cos(q(1))-a1+yp_1*sin(q(1));%��1������ϵ�£���ؽ�Ҳ����4�š��������ϵ��λ��; In the No. 1 coordinate system, the wrist joint is also the position of the No. 4 and No. 5 coordinate systems;
    yp1=zp-d1;
    
    o1p=sqrt(xp1^2+yp1^2);
    o1o2=a2;
    o2p=sqrt(a3^2+d4^2);
     
    if(elbow == -1)
        q(2) = acos((o1o2^2+o1p^2-o2p^2)/(2*o1o2*o1p))+atan2(yp1,xp1);
    elseif elbow == 1
        q(2) = atan2(yp1,xp1)-acos((o1o2^2+o1p^2-o2p^2)/(2*o1o2*o1p));
    else 
        %elbow���죬Ҳ�Ǳ߽�����;Elbow is singular, but also borderline singular;
        return;
    end
    if q(2)>pi
        q(2)= q(2)-2*pi;
    elseif q(2)<-pi
        q(2) = q(2)+2*pi;
    end
    
    thetac=pi-atan(d4/a3);
    if(elbow == -1)
        q(3) = acos((o1o2^2+o2p^2-o1p^2)/(2*o1o2*o2p))-thetac;
    elseif elbow == 1
        q(3) = 2*pi-acos((o1o2^2+o2p^2-o1p^2)/(2*o1o2*o2p))-thetac;
    elseif elbow == 0
        q(3) = atan2(d4,a3);
    end

    T01 = create_link(q(1),d1,alpha0,a0,'rad');
    T12 = create_link(q(2),d2,alpha1,a1,'rad');
    T23 = create_link(q(3),d3,alpha2,a2,'rad');

    T_46 = inv(T01*T12*T23)*T;


    if wrist == 1
        s5 = (T_46(1,3)^2+T_46(3,3)^2)^0.5;
        c5 = -T_46(2,3);    
        q(5) = atan2(s5,c5);
        q(4) = atan2(T_46(3,3)/sin(q(5)),T_46(1,3)/sin(q(5)));
        q(6) = atan2(T_46(2,2)/(-sin(q(5))),T_46(2,1)/sin(q(5)));
    elseif wrist == -1
        s5 = -(T_46(1,3)^2+T_46(3,3)^2)^0.5;
        c5 = -T_46(2,3);
        q(5) = atan2(s5,c5);
        q(4) = atan2(T_46(3,3)/sin(q(5)),T_46(1,3)/sin(q(5)));
        q(6) = atan2(T_46(2,2)/(-sin(q(5))),T_46(2,1)/sin(q(5)));
    else
        %����Ҫ���´���;Ҫ��¼��һ�ε�ֵ��Ȼ���������ʱ�򱣳�����q(4)����q(6)����; Here it needs to be reprocessed; The last value should be recorded, and then q(4) or q(6) should be kept unchanged when passing the singularity;
        %�������ָᷢ���ʱ�򣬲�Ҫ���Ƕ�Ϊ0���ָ��; That is, when the five axes send instructions, do not send the command with an angle of 0;
        q(5) = 0;
        theta46 = atan2(T_46(3,1),T_46(1,1));
        q(4) = 0;
        q(6) = theta46;
    end
    
     if strcmp(option,'deg')
         q = q*180/pi-theta*180/pi;
     else
         q = q-theta;
     end
     

         
    

end










