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
function plot_coord(T,scale,line_width)

    if(nargin <= 2)
        line_width = 1;
    end

    X = [scale 0 0 1];
    Y = [0 scale 0 1];
    Z = [0 0 scale 1];

    wX = T*X';
    wY = T*Y';
    wZ = T*Z';
    
    pos = zeros(2,3);
    pos(1,:) = T(1:3,4)';
    pos(2,:) = wX(1:3)';
    hold on;
    plot3(pos(:,1),pos(:,2),pos(:,3),'r','linewidth',line_width);
    
    pos = zeros(2,3);
    pos(1,:) = T(1:3,4)';
    pos(2,:) = wY(1:3)';
    hold on;
    plot3(pos(:,1),pos(:,2),pos(:,3),'g','linewidth',line_width);

    
    pos = zeros(2,3);
    pos(1,:) = T(1:3,4)';
    pos(2,:) = wZ(1:3)';
    hold on;
    plot3(pos(:,1),pos(:,2),pos(:,3),'b','linewidth',line_width);

    
end



