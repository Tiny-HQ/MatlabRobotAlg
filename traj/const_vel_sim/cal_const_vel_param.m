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
%% 求两条直线，以中间点为圆心距离r位置求相切圆，不是很好描述。。。。。 Finding two straight lines, taking the middle point as the center of the circle and the distance r position to find the tangent circle, is not very well described
%P1起点，P2中间点，P3终点，r是到P1P2之间、P2P3之间到P2的两点到P2的距离; The starting point of P1, the middle point of P2, the end point of P3, r is the distance from two points to P2 to P1P2 and between P2P3 and P2;
%A为圆弧起点，B为圆弧终点； A is the starting point of the arc, and B is the end point of the arc;



function [A,B,c,new_r,theta_c] = cal_const_vel_param(P1,P2,P3,r,draw_circle)



    Pos1 = P1(1:3);
    Pos2 = P2(1:3);
    Pos3 = P3(1:3);
    
    P23 = Pos3 - Pos2;
    P21 = Pos1 - Pos2;
    
    l23 = sqrt(sum(P23.^2));l21 = sqrt(sum(P21.^2));
    theta =acos(sum(P23.*P21)/(l23*l21));

    new_r = r*tan(theta/2);
    wA = [r 0 0 1];                         %A???;
    wB = [cos(theta)*r sin(theta)*r 0 1];   %B???;
    wC = [r new_r 0 1];                     %????;
    
    theta_c = pi-theta;

    n = P21/l21; va = cross(P21,P23);
    a = va/sqrt(sum(va.^2));
    o = cross(a,n);
    
    T = eye(4);
    T(1:3,1) = n';T(1:3,2) = o';T(1:3,3) = a';
    T(1:3,4) = Pos2';

    A = T*wA';
    B = T*wB';
    c = T*wC';

    x0 = wC(1);y0 = wC(2);
    if(1 == draw_circle)
        x = linspace(x0-new_r,x0+new_r,1000);
        y1 = zeros(1,length(x));y2 = zeros(1,length(x));
        for i = 1:length(x)
            y1(i) = (new_r^2-(x(i)-x0)^2)^0.5+y0;
            y2(i) = -(new_r^2-(x(i)-x0)^2)^0.5+y0;
        end
        C1 = zeros(length(x),3);C2 = zeros(length(x),3);
        for i = 1:length(x)
            temp = T*[x(i) y1(i) 0 1]';
            C1(i,:) = temp(1:3)';
            temp = T*[x(i) y2(i) 0 1]';
            C2(i,:) = temp(1:3)';
        end
        %?????;
        P = cal_arc_any_pos(c(1:3),A(1:3),B(1:3),new_r,theta_c/2);
        %figure;
        fi = zeros(3,3);
        fi(1,:) = Pos1;fi(2,:) = Pos2;fi(3,:) = Pos3;
        plot3(fi(:,1),fi(:,2),fi(:,3));hold on;plot3(fi(:,1),fi(:,2),fi(:,3),'o');
        hold on;
        plot3(real(C1(:,1)),real(C1(:,2)),real(C1(:,3)));
        hold on;
        plot3(real(C2(:,1)),real(C2(:,2)),real(C2(:,3)));
        hold on;
        plot3(A(1),A(2),A(3),'*');
        hold on;
        plot3(B(1),B(2),B(3),'*');
        hold on;
        plot3(c(1),c(2),c(3),'o');
        hold on;
        plot3(P(1),P(2),P(3),'*');
    end

end




