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


%2???;
% draw_spline.m??
function [x,y] = draw_spline2D(n, k, P, NodeVector,Ts)

% ??n+1?????P(i), k?B??,P?2*(n+1)?????????, ????NodeVector
%     figure;
%     plot(P(1, 1:n+1), P(2, 1:n+1),...
%                         'o','LineWidth',1,...
%                         'MarkerEdgeColor','k',...
%                         'MarkerFaceColor','g',...
%                         'MarkerSize',6);
%     line(P(1, 1:n+1), P(2, 1:n+1));
    Nik = zeros(n+1, 1);
    T = 0 : Ts : 1-Ts;
    x = zeros(1,length(T));y = zeros(1,length(T));
    counts = 1;
    for u = 0 : Ts : 1-Ts
        for i = 0 : 1 : n
            Nik(i+1, 1) = base_function(i, k , u, NodeVector);
        end
        p_u = P * Nik;
        
        if(counts == 100)
            a = 10;
        end
        
        if u == 0
            tempx = p_u(1,1);
            tempy = p_u(2,1);
%             line([tempx p_u(1,1)], [tempy p_u(2,1)],...
%                 'Marker','.','LineStyle','-', 'Color',[.3 .6 .9], 'LineWidth',3);
            x(counts) = tempx;
            y(counts) = tempy;
        else
%             line([tempx p_u(1,1)], [tempy p_u(2,1)],...
%                 'Marker','.','LineStyle','-', 'Color',[.3 .6 .9], 'LineWidth',3);
            tempx = p_u(1,1);
            tempy = p_u(2,1);
            x(counts) = tempx;
            y(counts) = tempy;
        end
        counts = counts+1;
     
    end
   % hold on;
   % plot(x,y,'*')
end