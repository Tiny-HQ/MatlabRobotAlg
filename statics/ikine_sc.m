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


function theta1 = ikine_sc(sc,T_home,theta_0,T_end)

    omg = 0.001;        %��̬������̶�; oritation error tolerance;
    ov = 0.001;         %λ��������̶�; Position error tolerance;
    iter_max = 20;      %���ĵ�������; Maximum number of iterations
    iter = 0;
    theta = theta_0;
    error_flag = 1;

    while((1 == error_flag)&&(iter<iter_max))

        %��һ�������ռ�ľ���; The first step is to find the distance of the accompanying space;
        T = fkine_sc(sc,T_home,theta);  %����; forward solution
        T_trans = inv(T)*T_end;         %�ӵ�ǰλ�˵�Ŀ��λ��֮��Ĳ�ֵ; the difference between the current pose and the target pose;
        T_se = SE3_to_se3(T_trans);     %ת���������; Go under Lie algebra;
        v = se3_to_v(T_se);             %ת���������; Go under Lie algebra;
        adtt = adt(T);                  %��ǰλ���µİ���; Find the concomitant in the current pose;
        v = adtt*v';                    %��vʸ��ת������ռ�; Turn the v vector to the Adjoint space;
        error_flag = (sqrt(sum(v(1:3).^2))>= ov ||sqrt(sum(v(4:6).^2)) >= omg);%�������ռ�ľ���Ϊ0; If the distance of the Adjoint space is 0;

        %�ڶ�����Ƕȵ�ƫ��; The second step is to find the deviation of the angle;
        J = jac_space(sc,theta);        %�����Ǹ��ݰ���ռ�����ſ˱Ⱦ���; Here is the Jacobian matrix based on the adjoint space
        delta = pinv(J)*v;              %�㵽�ǶȲ�ֵ; Calculate the angle difference
        theta = theta+delta';           %�����Ҫ���ӵ�����ӵ���ʼλ��; Calculate the items that need to be stacked to the initial pose;
        %theta(2) = theta(3)*0.5       %��������࣬��Ҫ�̶�ĳ�ֹ�ϵ; If it's redundant, you need to fix some kind of relationship;
        iter = iter+1;
    end

    if(iter<iter_max)
        theta1 = theta;
    else
        theta1 = theta_0;
    end
    iter
end