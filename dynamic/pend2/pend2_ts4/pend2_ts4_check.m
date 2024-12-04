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


format long g;
sum = length(t);

tao1 = linspace(0,0,sum);
tao2 = linspace(0,0,sum);

for i = 1:sum

    q(1) = q1(i,2)*pi/180;       q(2) = q2(i,2)*pi/180;              
    dq(1) = dq1(i,2)*pi/180;     dq(2) = dq2(i,2)*pi/180;          
    ddq(1) = -ddq1(i,2)*pi/180;   ddq(2) = -ddq2(i,2)*pi/180;  

    if i == 100
        
    end
    %[tao1(i),tao2(i)] =
    %pend2_ts4_cal_tao(q(1),dq(1),ddq(1),q(2),dq(2),ddq(2));%牛顿欧拉公式newton-euler
    %[tao1(i),tao2(i)] = pend2_ts4_cal_tao_linear_separate(q(1),dq(1),ddq(1),q(2),dq(2),ddq(2));%线性分离形式 Linear separation form
    [tao1(i),tao2(i)] = pend2_ts4_cal_tao_min_param(q(1),dq(1),ddq(1),q(2),dq(2),ddq(2));%最小集形式 min paramter- form

end

figure;
subplot(4,1,1);
plot(tao1,'r');hold on;plot(tao_data_1.Data,'b');
subplot(4,1,2);
plot(tao2,'r');hold on;plot(tao_data_2.Data,'b');
% 公式计算出来的tao跟实际仿真结果出来的tao做差对比;The difference between the TAO calculated by the formula and the TAO obtained by the actual simulation results is compared.
subplot(4,1,3);
plot(tao1'-tao_data_1.Data);
subplot(4,1,4);
plot(tao2'-tao_data_2.Data);