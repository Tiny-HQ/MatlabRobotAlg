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
function [P1,P2,P3,P4] = draw_rect_dynamic(L,W,T,ms,axis_range)

   [m,n,z] = size(T);
    P1 = zeros(z,4);
    P2 = zeros(z,4);
    P3 = zeros(z,4);
    P4 = zeros(z,4);
    for i = 1:z
        
        clf;
        % 如果不需要，直接注释; If not, comment directly;
        % plot一些定点位置; plot some fixed-point positions;
        const_pos = [200 300 0 0 0 0];
        plot(const_pos(1),const_pos(2),'*');
        % plot一些定点位置; plot some fixed-point positions;
        
        [P11,P22,P33,P44] = draw_rect(L,W,T(:,:,i))  ;
        axis(axis_range);
        P1(i,:) = P11'; 
        P2(i,:) = P22';
        P3(i,:) = P33';
        P4(i,:) = P44';
        
        % 画矩阵中心点轨迹;Draw the trajectory of the center point of the matrix;
        TTT = zeros(i,3);
        for j = 1:i
           TTT(j,:) = T(1:3,4,j)';       
        end
        hold on;
        plot3(TTT(:,1),TTT(:,2),TTT(:,3),'b');
      

        pause(ms/1000);
    end



end
