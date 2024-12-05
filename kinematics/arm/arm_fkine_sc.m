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

%�������������ɶȻ�е��; screw forward solution six-degree-of-freedom manipulator;



function [T,shoulder,elbow,wrist] = arm_fkine_sc(q,DH,q_option,alpha_theta_option)


    a1= DH.a(2); a2= DH.a(3); a3= DH.a(4);
    d1 = DH.d(1);d3 = -DH.d(3); d4 = DH.d(4);d6 = DH.d(6);


    if strcmp(q_option,'deg')
        q = q*pi/180.0;
    elseif strcmp(q_option,'rad')
       ;
    else
        q = q*pi/180.0;
    end

  
    if strcmp(alpha_theta_option,'deg')       
        theta = DH.theta*pi/180.0;
    elseif strcmp(alpha_theta_option,'rad')
        ;
    else
        theta = DH.theta*pi/180.0;
    end
    
    q_ = q+theta;%theta��ƫ�� offset


    w1 = [0 0 1];
    w2 = [0 -1 0];
    w3 = [0 -1 0];
    w4 = [1 0 0];
    w5 = [0 -1 0];
    w6 = [1 0 0];


    q1 = [0 0 0];
    q2 = [a1 0 d1];
    q3 = [a1 d3 d1+a2];
    q4 = [0 d3 d1+a2+a3];
    q5 = [a1+d4 0 d1+a2+a3];
    q6 = [0 d3 d1+a2+a3];


    v1 = -cross(w1,q1);
    v2 = -cross(w2,q2);
    v3 = -cross(w3,q3);
    v4 = -cross(w4,q4);
    v5 = -cross(w5,q5);
    v6 = -cross(w6,q6);


    T01 = ew(w1,v1,q_(1));
    T12 = ew(w2,v2,q_(2));
    T23 = ew(w3,v3,q_(3));
    T34 = ew(w4,v4,q_(4));
    T45 = ew(w5,v5,q_(5));
    T56 = ew(w6,v6,q_(6));


    T0 = [0 0 1 a1+d4+d6;
    0 -1 0 d3;
    1 0 0 d1+a2+a3;
    0 0 0 1];


    T = T01*T12*T23*T34*T45*T56*T0;
    
    c2 = cos(q_(2)+pi/2);s2 = sin(q_(2)+pi/2);%��Ϊ����ı����ж��Ǹ���dhģ���������ģ���������Ķ�����λ��0��;����Ҫ����90��; Because the arm shape judgment here is based on the DH model, the two-axis zero position in the screw is 0 degrees; So add 90 degrees;
    c3 = cos(q_(3));s3 = sin(q_(3));
    
    if abs(a1 + a2*c2 + a3*(c2*c3 - s2*s3) + d4*(c2*s3 + c3*s2))<eps%�����ǰ�ۺ����T12*T23*T34����456���������1�������ϵ�е�x��ֵ��0�жϵó���;Here the forearm and the rear arm are T12*T23*T34, which is judged by the value of x and 0 in the coordinate system of the 1 axis of the center of the 456 axis;
        shoulder = 0;     
    elseif (a1 + a2*c2 + a3*(c2*c3 - s2*s3) + d4*(c2*s3 + c3*s2)>0)
        shoulder = 1;
    else 
        shoulder = -1;
    end

    
    if abs(tan(q_(3))-d4/a3)<eps
        elbow = 0;
    elseif(tan(q_(3))>d4/a3)||(q_(3)>pi/2)
        elbow = 1;
    else
        elbow = -1;       
    end


    if abs(q_(5))<eps
        wrist = 0;
    elseif(q_(5)>0)
        wrist = 1;
    else
        wrist = -1;
    end

end
















