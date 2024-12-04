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
% 1. 定义样本点
Q = [0, 0; 1, 2; 2, 2; 3, 1.5; 4, 0.5; 5, 0; 9,10; 6,9;]; % 样本点坐标
numDataPoints = size(Q, 1); % 样本点数量

% 2. ??NURBS??
degree = 3; % NURBS?????
numCtrlPoints = 10; % ???????

% 3. ??????(?????)
knotVector = [zeros(1, degree+1), linspace(0, 1, numCtrlPoints - degree + 1), ones(1, degree+1)];

% 4. ??????????? u
u = linspace(0, 1, numDataPoints); % ???????

% 5. ??????? A,???????
A = zeros(numDataPoints, numCtrlPoints); 
for i = 1:numDataPoints
    for j = 1:numCtrlPoints
        A(i, j) = NURBSBasis(j-1, degree, knotVector, u(i));
    end
end

% ?????????????
A(1, :) = 0; A(1, 1) = 1;
A(end, :) = 0; A(end, end) = 1;
Q_adjusted = Q;
Q_adjusted(1, :) = Q(1, :); % ????
Q_adjusted(end, :) = Q(end, :); % ????

% 6. ??????????
Px = A \ Q_adjusted(:, 1); % ????x??
Py = A \ Q_adjusted(:, 2); % ????y??

% ?????
P = [Px, Py];

% 7. ????
% ???????
plot(Q(:, 1), Q(:, 2), 'ro', 'DisplayName', 'Sample Points'); hold on;

% ??????NURBS??
u_fine = linspace(0, 1, 100); % ?????????????
curvePoints = zeros(length(u_fine), 2);
for i = 1:length(u_fine)
    Cx = 0; Cy = 0;
    for j = 1:numCtrlPoints
        B = NURBSBasis(j-1, degree, knotVector, u_fine(i));
        Cx = Cx + B * Px(j);
        Cy = Cy + B * Py(j);
    end
    curvePoints(i, :) = [Cx, Cy];
end
plot(curvePoints(:, 1), curvePoints(:, 2), 'b-', 'DisplayName', 'Fitted NURBS Curve');

% ?????
plot(P(:, 1), P(:, 2), 'g--o', 'DisplayName', 'Control Points');
legend;
title('NURBS Curve Fitting with End Constraints');
hold off;

% ??????
