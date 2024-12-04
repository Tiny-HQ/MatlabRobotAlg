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
function plot_cylinder(T,r,h,color,cl_fi)

    n = 300;
    
    if(nargin == 3)
        color = 4;
        cl_fi = 'hold';     %如果为clear就要重新绘制，否则就保留上一次画的内容; If it is clear, it must be redrawn, otherwise the content of the last drawing will be retained;
    elseif(nargin == 4)
        cl_fi = 'hold';
    end
    
    [x,y,z]=cylinder(r,n);%生成标准的100个面的圆柱数据，半径为r，高为1，底面圆心0，0；Generate standard cylindrical data of 100 faces, with a radius of r, a height of 1, and a bottom circle center of 0,0;
    z1=[z(1,:);z(2,:)*h];%圆柱高增高，变为高h The height of the cylinder increases and becomes high h
    %为变成实心封顶添加数据 Add data to become a solid cap
    z2=[z(1,:);z1;z1(2,:)];
    x2=[zeros(1,n+1);x;zeros(1,n+1)];
    y2=[zeros(1,n+1);y;zeros(1,n+1)];

    z3=[z1(1,:);z1(1,:)];
    x3=[x(1,:);x(1,:)];
    y3=[y(1,:);y(1,:)];
    z4=[z1(2,:);z1(2,:)];
    
    X = zeros(2,n+1);Y = zeros(2,n+1);Z = zeros(2,n+1);
    X3 = zeros(2,n+1);Y3 = zeros(2,n+1);Z3 = zeros(2,n+1);
    X4 = zeros(2,n+1);Y4 = zeros(2,n+1);Z4 = zeros(2,n+1);
    
    X2 = zeros(4,n+1); Y2 = zeros(4,n+1); Z2 = zeros(4,n+1);
    
    for i = 1:n
        %外表面; outer surface;
        tmp = T*[x(1,i);y(1,i);z1(1,i);1];
        X(1,i) = tmp(1);Y(1,i) = tmp(2);Z(1,i) = tmp(3);
        tmp = T*[x(2,i);y(2,i);z1(2,i);1];
        X(2,i) = tmp(1);Y(2,i) = tmp(2);Z(2,i) = tmp(3);
        
        %下面的圆轮廓; Circular profile below;
        tmp = T*[x3(1,i);y3(1,i);z3(1,i);1];
        X3(1,i) = tmp(1);Y3(1,i) = tmp(2);Z3(1,i) = tmp(3);
        tmp = T*[x3(2,i);y3(2,i);z3(2,i);1];
        X3(2,i) = tmp(1);Y3(2,i) = tmp(2);Z3(2,i) = tmp(3);
        %上面的圆轮廓; the circular outline above;
        tmp = T*[x3(1,i);y3(1,i);z4(1,i);1];
        X4(1,i) = tmp(1);Y4(1,i) = tmp(2);Z4(1,i) = tmp(3);
        tmp = T*[x3(2,i);y3(2,i);z4(2,i);1];
        X4(2,i) = tmp(1);Y4(2,i) = tmp(2);Z4(2,i) = tmp(3);
        
        %填充圆;Fill the circle;
        tmp = T*[x2(1,i);y2(1,i);z2(1,i);1];
        X2(1,i) = tmp(1);Y2(1,i) = tmp(2);Z2(1,i) = tmp(3);
        tmp = T*[x2(2,i);y2(2,i);z2(2,i);1];
        X2(2,i) = tmp(1);Y2(2,i) = tmp(2);Z2(2,i) = tmp(3);
        tmp = T*[x2(3,i);y2(3,i);z2(3,i);1];
        X2(3,i) = tmp(1);Y2(3,i) = tmp(2);Z2(3,i) = tmp(3);
        tmp = T*[x2(4,i);y2(4,i);z2(4,i);1];
        X2(4,i) = tmp(1);Y2(4,i) = tmp(2);Z2(4,i) = tmp(3);
        
    end
    %收尾相接起来，否则中间有个缝隙; Finish together, otherwise there is a gap in the middle;
    X(1,n+1) = X(1,1);X(2,n+1) = X(2,1);
    Y(1,n+1) = Y(1,1);Y(2,n+1) = Y(2,1);
    Z(1,n+1) = Z(1,1);Z(2,n+1) = Z(2,1);
    
    X3(1,n+1) = X3(1,1);X3(2,n+1) = X3(2,1);
    Y3(1,n+1) = Y3(1,1);Y3(2,n+1) = Y3(2,1);
    Z3(1,n+1) = Z3(1,1);Z3(2,n+1) = Z3(2,1);
    X4(1,n+1) = X4(1,1);X4(2,n+1) = X4(2,1);
    Y4(1,n+1) = Y4(1,1);Y4(2,n+1) = Y4(2,1);
    Z4(1,n+1) = Z4(1,1);Z4(2,n+1) = Z4(2,1);
    
    X2(1,n+1) = X2(1,1);X2(2,n+1) = X2(2,1);X2(3,n+1) = X2(3,1);X2(4,n+1) = X2(4,1);
    Y2(1,n+1) = Y2(1,1);Y2(2,n+1) = Y2(2,1);Y2(3,n+1) = Y2(3,1);Y2(4,n+1) = Y2(4,1);
    Z2(1,n+1) = Z2(1,1);Z2(2,n+1) = Z2(2,1);Z2(3,n+1) = Z2(3,1);Z2(4,n+1) = Z2(4,1);
    
    %mesh(x,y,z);
    %surf(x,y,z,'FaceColor',[1,0,0],'LineStyle','none');
    %mesh(X2,Y2,Z2);
    if(strcmp(cl_fi,'clear') == 1)  
        clf;
    end
    view([1,1,1]);
    hold on;
    surf(X,Y,Z,'LineStyle','none');
    %mesh(X,Y,Z);
    map=jet(360);
    if(color>=360)
        color = 360;
    elseif (color<=0)
        color = 1;
    end
    map1=map(color,:);%bgr,分成360份，一个数字一种颜色 Divided into 360 parts, one number and one color
    colormap(map1)
    %hold on
    surf(X2,Y2,Z2,'LineStyle','none');  %画填充的圆形; Draw a circle of fills;
    surf(X3,Y3,Z3); %画圆,并没有画实心; Draw a circle, not a solid one;
    surf(X4,Y4,Z4); %画圆,并没有画实心;Draw a circle, not a solid one;
    alpha(.8)%调节透明度(0-1) Adjust Transparency (0-1)
    plot_coord(T,r,3);        %在圆柱底部画一个坐标系; Draw a coordinate system at the bottom of the cylinder;
    axis equal;


end

