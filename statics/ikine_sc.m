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


function theta1 = ikine_sc(sc,T_home,theta_0,T_end)

    omg = 0.001;        %姿态误差容忍度; oritation error tolerance;
    ov = 0.001;         %位置误差容忍度; Position error tolerance;
    iter_max = 20;      %最大的迭代次数; Maximum number of iterations
    iter = 0;
    theta = theta_0;
    error_flag = 1;

    while((1 == error_flag)&&(iter<iter_max))

        %第一步求伴随空间的距离; The first step is to find the distance of the accompanying space;
        T = fkine_sc(sc,T_home,theta);  %正解; forward solution
        T_trans = inv(T)*T_end;         %从当前位姿到目标位姿之间的差值; the difference between the current pose and the target pose;
        T_se = SE3_to_se3(T_trans);     %转到李代数下; Go under Lie algebra;
        v = se3_to_v(T_se);             %转到李代数下; Go under Lie algebra;
        adtt = adt(T);                  %求当前位姿下的伴随; Find the concomitant in the current pose;
        v = adtt*v';                    %将v矢量转到伴随空间; Turn the v vector to the Adjoint space;
        error_flag = (sqrt(sum(v(1:3).^2))>= ov ||sqrt(sum(v(4:6).^2)) >= omg);%如果伴随空间的距离为0; If the distance of the Adjoint space is 0;

        %第二步求角度的偏差; The second step is to find the deviation of the angle;
        J = jac_space(sc,theta);        %这里是根据伴随空间求的雅克比矩阵; Here is the Jacobian matrix based on the adjoint space
        delta = pinv(J)*v;              %算到角度差值; Calculate the angle difference
        theta = theta+delta';           %算出需要叠加的项叠加到初始位姿; Calculate the items that need to be stacked to the initial pose;
        %theta(2) = theta(3)*0.5       %如果是冗余，需要固定某种关系; If it's redundant, you need to fix some kind of relationship;
        iter = iter+1;
    end

    if(iter<iter_max)
        theta1 = theta;
    else
        theta1 = theta_0;
    end
    iter
end