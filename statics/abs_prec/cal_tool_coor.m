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



function [tool] = cal_tool_coor(sp_pc,Points,N,eul)


    T = zeros(4,4,N);
    
    if(strcmp(eul,'zyz')==1)
        for i = 1:N
           T(1:4,1:4,i) = cs_define_zyzeul(Points(i,:));
        end
    elseif(strcmp(eul,'rpy'))
        for i = 1:N
           T(1:4,1:4,i) = cs_define_rpy(Points(i,:)); 
        end
    end

    tool_N = zeros(N,4);
    for i = 1:N
        tool_N(i,:) = (T(:,:,i)\[sp_pc 1]')';
    end

    tool = linspace(0,0,3);
    for i = 1:N
        tool(1) = tool(1)+tool_N(i,1);
        tool(2) = tool(2)+tool_N(i,2);
        tool(3) = tool(3)+tool_N(i,3);
    end

    tool = tool/N;

end
