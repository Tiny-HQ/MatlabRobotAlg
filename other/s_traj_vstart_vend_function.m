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
%% Testscript for DoubleSTrajectory Planner

%
%

%% Initialize Workspace
clc;
clear;

%% Calculate the Trajectory by Function calling
%
[q, qp, qpp, qppp] = s_traj_vs_ve( 0.001, -10, 30, 10, -50, 200, -250, 60, -90, 120, -120 );

%% Drawing the Trajectory in Plots
%

% create a subplot with 4 drawings and draw position, speed, acceleration and jerk
figure(1)
subplot(2,2,1);
plot(q);
title('Position');
subplot(2,2,2);
plot(qp);
title('Speed');
subplot(2,2,3);
plot(qpp);
title('Acceleration');
subplot(2,2,4);
plot(qppp);
title('Jerk');
