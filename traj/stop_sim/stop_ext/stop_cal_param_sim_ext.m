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

%AΪ��ʱ�ļ��ٶ�ֵ;
%A_setΪ���õļ��ٶ�ֵ,����;
%�����ʱ�˶����ڼ��ٶȶΣ���ô�����ᱻ����;
%���㷨Ӧ���ڼ��ٶȶκ����ٶ�;
%t1�Ǽ��ٶȼ�Ϊ0��t2Ϊ������ٵ��趨�ļ��ٶ�ֵ
%A is the acceleration value at that time;
%A_set is the set deceleration value, non-zero;
% If the motion is in the deceleration phase at this time, it will not be processed;
% This algorithm is applied to both the acceleration and the constant velocity segment;
%t1 is the acceleration minus 0 and t2 is the reverse acceleration to the set deceleration value

function [t,j] = stop_cal_param_sim_ext(V,A,A_set,J)



     if(abs(A) <= 0.01)
        t(1) = 0.0;

        t_vel = abs((V/J)^0.5);
        t_acc = abs(A_set/J);

        if(t_vel>t_acc)
            t2 = t_acc;
            t3 = V/A_set-t2;
        else
            t2 = t_vel;
            t3 = 0.0;
        end
        t(2) = t(1)+t2;
        t(3) = t(2)+t3;
        t(4) = t(3)+t2;
     else
        t(1) = abs(A/J);%�ٽ�ֵ;limit
        
        %V = V+1/2*A*t(1);
        v_max = 1/2.0*A*t(1)+V;
        
        t_vel = sqrt(v_max/J);%�ٽ�ֵ;linmt
        t_acc = abs(A_set/J);
        
        if t_acc<t_vel
            t1 = t_acc;
           
            t2 = v_max/A_set-t1;
            
            t(2) = t(1)+t1;
            t(3) = t(2)+t2;
            t(4) = t(3)+t1;
        else
            t1 = t_vel;
           
           
            t2 = (v_max/J)^0.5;
            
            t(2) = t(1)+t2;
            t(3) = t(2);
            t(4) = t(3)+t2;
        end

     end

    j = J;

end


















