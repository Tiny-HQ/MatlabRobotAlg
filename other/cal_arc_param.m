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





function [pc,r,theta] = cal_arc_param(pos)

    p1=pos(1,:);
    p2=pos(2,:);
    p3=pos(3,:);

    p1p2=p2-p1;
    u1=p1p2/sum(p1p2.^2);

    p2p3=p3-p2;
    u2=unitVec(p2p3);

    normal=cross(p1p2,p2p3);
    normal=unitVec(normal);

    per2=cross(normal,u2);
    per2=unitVec(per2);

    mid1=(p1+p2)/2;
    mid2=(p2+p3)/2;
    dis2=sqrt(sum(p2p3.^2));
    L=(vecDot(mid1,u1)-vecDot(mid2,u1))/vecDot(per2,u1);

    r=sqrt(L^2+1.0/4*dis2^2);

    pc=mid2+L*per2;

    %Ô²ÐÄ½Ç  center of circle corners
    vec1=p1-pc;
    vec1=unitVec(vec1);
    vec2=p3-pc;
    vec2=unitVec(vec2);
    theta=vecDot(vec1,vec2);
    normal2=cross(vec1,vec2);
    theta=acos(theta);
   if vecDot(normal,p3-p1)>0
        ;
    else
        theta = 2*pi-theta;
    end

    theta = theta*180.0/pi;



end


function z=vecDot(x,y)
z=sum(x.*y);
end

function vector=unitVec(vec)
vector=vec/sqrt(sum(vec.^2));
end



