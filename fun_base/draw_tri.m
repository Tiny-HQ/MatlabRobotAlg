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
function [P1,P2,P3] = draw_tri(L,T)

    P1 = T*[L/2 L/2*tan(pi/6) 0 1]';
    P2 = T*[-L/2 L/2*tan(pi/6) 0 1]';
    P3 = T*[0 -L/2*(tan(pi/3)-tan(pi/6)) 0 1]';
    
%     line([P1(1),P2(1)],[P1(2),P2(2)]);
%     line([P2(1),P4(1)],[P2(2),P4(2)]);
%     line([P4(1),P3(1)],[P4(2),P3(2)]);
%     line([P3(1),P1(1)],[P3(2),P1(2)]);

    P = zeros(4,3);
    P(1,:) = P1(1:3,1)';
    P(2,:) = P2(1:3,1)';
    P(3,:) = P3(1:3,1)';
    P(4,:) = P1(1:3,1)';

    hold on;
    plot3(P(:,1),P(:,2),P(:,3));
    plot_coord(T,10,2);
    axis equal;

end