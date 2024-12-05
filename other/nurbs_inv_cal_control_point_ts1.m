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
% 1. ������Ƶ�
P = [0, 0; 1, 3; 3, 1; 5, 3; 6, 0]; % ���Ƶ����� Control point coordinates
degree = 3; % ���ߵĽ��� The degree of the curve

% 2. ����ڵ����� Define the node vector
% ���Ƶ� 2 �� 3 ��Ӱ�췶Χ��С��ʹ�þֲ��ڵ����� Control points 2 and 3 have a reduced sphere of influence, using local node vectors
knotVector = [0 0 0 0 0.2 0.4 0.6 0.8 1 1 1 1];

% 3. ����ͻ������� Calculate and plot curves
u_fine = linspace(0, 1, 100); % ���߻��Ƶ�ϸ�� u ���� The subdivision u parameter of the curve drawing
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

% 4. ���ƽ�� Plot the results
% ���ƿ��Ƶ� Draw control points
plot(P(:, 1), P(:, 2), 'g--o', 'DisplayName', 'Control Points'); hold on;

% ����NURBS���� Plot NURBS curves
plot(curvePoints(:, 1), curvePoints(:, 2), 'b-', 'DisplayName', 'Local NURBS Curve');

legend;
title('Local NURBS Curve');
hold off;

