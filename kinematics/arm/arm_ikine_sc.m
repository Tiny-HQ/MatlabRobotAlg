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
%旋量反解; screw inverse solution
%实在是太难了... It's just too hard


function q = arm_ikine_sc(T,DH,shoulder,elbow,wrist,alpha_theta_option,option)

    
    
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


    V65 = [0 0 -d6 1]';
    V05 = T*V65;%从第0号坐标系到五号坐标系的位置转换，或者说到第四号坐标系的位置转换；根据最后的姿态来确定V65的坐标;最后姿态是z轴朝外的，所以坐标是[0 0 -d6];Position conversion from coordinate system 0 to coordinate system 5, or position conversion to coordinate system 4; The coordinates of V65 are determined according to the final attitude; The last attitude is that the z-axis is facing outward, so the coordinates are [0 0 -d6];
    pe_x = V05(1);pe_y = V05(2);pe_z = V05(3); 
    
    pe = [pe_x pe_y pe_z 1]';

    %!!!!!!重点!!!!!! important
    %ps起始位置; pos start
    %exp(w1*θ1)*exp(w2*θ2)*exp(w3*θ3)*ps = pe;
    %设exp(w1*θ1)*pa = pe;  pe已知[pe_x pe_y pe_z];求pa;                              Let exp(w1*θ1)*pa = pe;  PE is known [pe_x pe_y pe_z]; Seek pa;
    %pa是以w1为轴，半径是√(pe_x^2+pe_y^2)的圆c上一点(比较难理解(现在还没有证明)，但确实是这样);  pa is a point on the circle c with w1 as the axis and radius √ (pe_x^2+pe_y^2) (which is difficult to understand (it has not been proven yet), but it is);
    %这一点是ps（起始点）经过exp(w2*θ2)*exp(w3*θ3)映射到圆c上的点，这个映射后的点y坐标是-d3;   This point is the point where ps(start point) is mapped to the point on circle c by exp(w2*θ2)*exp(w3*θ3), and the mapped point y coordinate is -d3;
    %相当于exp(w2*θ2)*exp(w3*θ3)*ps = pa;                           It is equivalent to exp(w2*θ2)*exp(w3*θ3)*ps = pa;
    %也可以通过点到轴上某一点距离相等来求解pa，结果相同;                      It is also possible to solve for PA by having an equal distance from a point to a point on the axis, with the same result;
    %||exp(w2*θ2)*exp(w3*θ3)*ps-p1|| = ||pe-p1||,(p1 = [0 0 1]);
    %||exp(w2*θ2)*exp(w3*θ3)*ps-p0|| = ||pe-p0||,(p1 = [0 0 0]);
    %只能解出z=pe_z;  only can resolve the z=pe_z
    pa(1) = sqrt(pe_x^2+pe_y^2-d3^2);pa(2) = -d3;pa(3) = pe_z;pa(4) = 1;
    
    %第一轴; first axes
    if shoulder == -1
        q(1) = atan2(pe_y,pe_x)+atan2(pa(2),pa(1));
        if q(1)>0 
            q(1) = q(1)-pi;
        elseif q(1)<0
            q(1) = q(1)+pi;
        end
    elseif shoulder == 1
        q(1) = atan2(pe_y,pe_x)-atan2(pa(2),pa(1));
    elseif shoulder == 0
          %shoulder 奇异,也是前后奇异;
          return;
    end

    %第二轴、第三轴; second and third axes 
    %因为d3的原因，要把ps的y值简化成0;  Because of d3, the y value of ps should be simplified to 0;
    %pa_的值就是前面求第一轴时候，以终点画的圆上一点，d3的关系，把pa_的y值写成0，但是并不是取x轴上一点，就是pa_的x值是不变，y值写成0，但不是取x轴上与圆相交的那一点;
    % The value of the pa_ is the relationship between the point on the circle drawn at the end point and d3 when the first axis is found before, and the y value of the pa_ is written as 0, but it is not taken as a point on the x-axis, that is, the x-value of the pa_ is unchanged, and the y-value is written as 0, but not the point on the x-axis that intersects the circle;
    %旋转过程是从ps到pa'再到pa_;alp和beta是pa'到轴2上一点（P2）和轴3上一点（P3），与p2p3之间的夹角; The rotation process is from PS to PA' to pa_; alp and beta are the angles between pa' to a point on axis 2 (P2) and a point on axis 3 (P3), and P2P3;
    w1 = [0 0 1]; q1 = [0 0 0]; v1 = -cross(w1,q1); T01 = ew(w1,v1,q(1));  w2 = [0 -1 0]; w3 = [0 -1 0];
    pa_ = inv(T01)*pe;pa_ = pa_(1:3)';pa_(2) = 0.0;%这里必须化成0，跟ps一样，y坐标必须化成0，y的值会影响二三轴的值;Here it must be reduced to 0, as with ps, the y coordinate must be reduced to 0, and the value of y will affect the value of the second and third axes;
    P2 = [a1 0 d1];P3 = [a1 0 d1+a2];ps = [a1+d4 0.0 d1+a2+a3];
    u = ps-P3;v = pa_-P2;r23 = P2-P3; r32 = P3-P2;
    theta02 = atan2(w2*(cross(r32,v))',r32*v');
    theta03 = atan2(w3*(cross(u,r23))',u*r23');
    alp = acos((sum(v.^2)+sum(r32.^2)-sum(u.^2))/(2*sqrt(sum(v.^2))*sqrt(sum(r32.^2))));
    beta = acos((sum(u.^2)+sum(r32.^2)-sum(v.^2))/(2*sqrt(sum(u.^2))*sqrt(sum(r32.^2))));
    
     if(elbow == -1)
        q(2) = theta02+alp;
        q(3) = theta03+beta;

        q(2) =pi/2+q(2);
       
     elseif (elbow == 1)
        q(2) = theta02-alp;
        q(3) = theta03-beta;
        
        q(2) = q(2)+pi/2;
        if (q(3)<0)
            q(3) = q(3)+2*pi;
        end
     else
         %奇异;
     end
     if q(2)>2*pi
         q(2) = q(2)-2*pi;
     end
    
    %经典的旋量方法求456轴太过于复杂，没有从姿态考虑求解，可以考虑等效欧拉角方法求解; The classical screw method is too complicated to find the 456 axis, and the solution is not considered from the attitude consideration, and the equivalent Euler angle method can be considered.
    %欧拉角的xyx就刚好等效对应456轴; The xyx of the Euler angle corresponds to exactly the 456 axis;
    w1 = [0 0 1];w2 = [0 -1 0];w3 = [0 -1 0];
    q1 = [0 0 0];q2 = [a1 0 d1];q3 = [a1 d3 d1+a2];
    v1 = -cross(w1,q1);v2 = -cross(w2,q2);v3 = -cross(w3,q3);
    T01 = ew(w1,v1,q(1)) ;
    T12 = ew(w2,v2,q(2)-pi/2); 
    T23 = ew(w3,v3,q(3));
    T0 = [0 0 1 a1+d4+d6;
    0 -1 0 d3;
    1 0 0 d1+a2+a3;
    0 0 0 1];

    T456 = (T01*T12*T23)\T/T0;
    if wrist == 1
        q(5) = atan2(sqrt(T456(1,2)^2+T456(1,3)^2),T456(1,1));
        q(4) = -atan2(T456(2,1)/sin(q(5)),T456(3,1)/sin(q(5)));
        q(6) = -atan2(T456(1,2)/sin(q(5)),-T456(1,3)/sin(q(5)));
    elseif wrist == -1
        q(5) = -atan2(sqrt(T456(1,2)^2+T456(1,3)^2),T456(1,1));
        q(4) = -atan2(T456(2,1)/sin(q(5)),T456(3,1)/sin(q(5)));
        q(6) = -atan2(T456(1,2)/sin(q(5)),-T456(1,3)/sin(q(5)));
    else
        %这里要重新处理;要记录上一次的值，然后过奇异点的时候保持其中q(4)或者q(6)不变; Here it needs to be reprocessed; The last value should be recorded, and then q(4) or q(6) should be kept unchanged when passing the singularity;
        %就是五轴发指令的时候，不要发角度为0这个指令;  That is, when the five axes send instructions, do not send the command with an angle of 0; 
        q(5) = 0;
        theta46 = atan2(T456(3,2),T456(2,2));
        q(4) = 0;
        q(6) = theta46;
    end

    



     if strcmp(option,'deg')
         q = q*180/pi-theta*180/pi;
     else
         q = q-theta;
     end
     


end

