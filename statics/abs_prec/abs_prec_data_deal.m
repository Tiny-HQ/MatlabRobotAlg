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

%??N?????,???????;
%????,???????????,????????,???????????????


function [sp_pc] = abs_prec_data_deal(file)

    twenty_points = load(file);
    [m,n] = size(twenty_points);
    Pos = zeros(m,3);
    Pos = twenty_points(1:m,1:3);
    N = 500;
    pc = zeros(N,3);
    r = linspace(0,0,N);
    dis_near = 5;

    W = 20;
    PC = zeros(W,3);
    for w = 1:W
        for j = 1:N
            rn = randperm(m);
            [pc(j,:),r(j)] = cal_sphere_center(Pos(rn(1),:),Pos(rn(2),:),Pos(rn(3),:),Pos(rn(4),:));
        end
        counts = linspace(0,0,N);
        flag = zeros(N,N);
        for i = 1:N
            k = 0;
            for j = 1:N
                flag(i,j) = compare_two_points_near(pc(i,:),pc(j,:),dis_near);
                if(flag(i,j) == 1)
                    k = k+1;
                end
            end
            counts(i) = k;
        end
        j = 1;ma = 0.0;
        for i = 1:N
            if(counts(i)>ma)
                ma = counts(i);
                j = i;
            end
        end
    %     j
    %     display(pc(j,:));
        PC(w,:) = pc(j,:);
    end

    sum = linspace(0,0,3);
    for i = 1:W
        sum(1) = sum(1)+PC(i,1);
        sum(2) = sum(2)+PC(i,2);
        sum(3) = sum(3)+PC(i,3);
    end

    display(sum/W);
    sp_pc = sum/W;
    figure;
    
    %plot_sphere(pc(1,:),r(1),0.01);
    hold on;
    plot3(pc(:,1),pc(:,2),pc(:,3),'*');
    hold on;
    plot3(Pos(:,1),Pos(:,2),Pos(:,3),'o');
    hold on;
    plot3(sp_pc(1),sp_pc(2),sp_pc(3),'o');
    
end

