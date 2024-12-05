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



%����ģ��;
%S�Ǿ��룬����λ��;

function [rescale_ratio,s,v,a,j] = rescale_ratio_cal(S,V,A,J)


    axis_no = length(S);
    MAX_SEG = 7;%�߶μӼ��ٵ��������һ��;
    main_axis = -1;%������
    main_axis_time = 0.0;%����ʱ��;
    
    for i = 1:axis_no   
       [t,j] = s_curve_cal_param_con(S(i),V(i),A(i),J(i));
       if(t(MAX_SEG)>main_axis_time)
          main_axis = i;
          main_axis_time = t(MAX_SEG);
       end   
    end

    dDispRatio = linspace(0,0,axis_no);
    MainAxis_V= linspace(0,0,axis_no);
    MainAxis_A= linspace(0,0,axis_no);
    MainAxis_J= linspace(0,0,axis_no);
 
    d_dis = S;
    d_vel = V;
    d_acc = A;
    d_jerk = J;
    for i = 1:axis_no
        dDispRatio(i) = abs(d_dis(i) / d_dis(main_axis));
        if (d_vel(main_axis) * dDispRatio(i) > d_vel(i))
            MainAxis_V(i) = d_vel(i) / dDispRatio(i);
        else
            MainAxis_V(i) = d_vel(main_axis);
        end
         % ���д�����ٶȼ��;
        if (d_acc(main_axis) * dDispRatio(i) > d_acc(i))
            MainAxis_A(i) = d_acc(i) / dDispRatio(i);
        else
            MainAxis_A(i) = d_acc(main_axis);
        end
         % ���д���Jerk���;
        if (d_jerk(main_axis) * dDispRatio(i) > d_jerk(i))
            MainAxis_J(i) = d_jerk(i) / dDispRatio(i);
        else
            MainAxis_J(i) = d_jerk(main_axis);
        end
    end

    for i = 1:axis_no
        if (d_vel(main_axis) > MainAxis_V(i))
            d_vel(main_axis) = MainAxis_V(i);
        end
        if (d_acc(main_axis) > MainAxis_A(i))
            d_acc(main_axis) = MainAxis_A(i);
        end
        if (d_jerk(main_axis) > MainAxis_J(i))
            d_jerk(main_axis) = MainAxis_J(i);
        end
    end
    
    s = d_dis(main_axis);
    v = d_vel(main_axis);
    a = d_acc(main_axis);
    j = d_jerk(main_axis);
    
    rescale_ratio =  linspace(0,0,axis_no);
    for i = 1:axis_no
        rescale_ratio(i) = d_dis(i) / d_dis(main_axis);
          if (d_dis(main_axis) < 0)
             rescale_ratio(i) = -1.0*rescale_ratio(i);
          end
    end
    

end 