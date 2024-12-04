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
% 1. 定义控制点
P = [0, 0; 1, 3; 3, 1; 5, 3; 6, 0]; % 控制点坐标 Control point coordinates
degree = 3; % 曲线的阶数 The degree of the curve

% 2. 定义节点向量 Define the node vector
% 控制点 2 和 3 的影响范围缩小，使用局部节点向量 Control points 2 and 3 have a reduced sphere of influence, using local node vectors
knotVector = [0 0 0 0 0.2 0.4 0.6 0.8 1 1 1 1];

% 3. 计算和绘制曲线 Calculate and plot curves
u_fine = linspace(0, 1, 100); % 曲线绘制的细分 u 参数 The subdivision u parameter of the curve drawing
curvePoints = zeros(length(u_fine), 2);
numCtrlPoints = size(P, 1);

for i = 1:length(u_fine)
    Cx = 0; Cy = 0;
    for j = 1:numCtrlPoints
        B = NURBSBasis(j-1, degree, knotVector, u_fine(i));
        Cx = Cx + B * P(j, 1);
        Cy = Cy + B * P(j, 2);
    end
    curvePoints(i, :) = [Cx, Cy];
end

% 4. 绘制结果 Plot the results
% 绘制控制点 Draw control points
plot(P(:, 1), P(:, 2), 'g--o', 'DisplayName', 'Control Points'); hold on;

% 绘制NURBS曲线 Plot NURBS curves
plot(curvePoints(:, 1), curvePoints(:, 2), 'b-', 'DisplayName', 'Local NURBS Curve');

legend;
title('Local NURBS Curve');
hold off;

