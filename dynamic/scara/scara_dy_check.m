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


%从scara_dy_fir_test.slx中获得各个关节的仿真出来的tao，然后用轨迹生成参数带入动力学公式计算得到tao，两个做差;
%The simulated TAO of each joint is obtained from scara_dy_fir_test.SLX, and then the trajectory generation parameters are brought into the dynamic formula to calculate the TAO, and the difference between the two is made.

sum = length(t);

tao1 = [0,sum,0];
tao2 = [0,sum,0];
tao3 = [0,sum,0];
tao4 = [0,sum,0];

for i = 1:sum

    q(1) = q1(i,2);     q(2) = q2(i,2);     q(3) = d3(i,2)/1000;     q(4) = q4(i,2); 
    dq(1) = dq1(i,2);   dq(2) = dq2(i,2);   dq(3) = dd3(i,2)/1000;   dq(4) = dq4(i,2); 
    ddq(1) = ddq1(i,2);   ddq(2) = ddq2(i,2);   ddq(3) = ddd3(i,2)/1000;   ddq(4) = ddq4(i,2); 
    
    %scara_dy_fir_test.slx中第三个关节是mm单位，所以这里的第三关节都除1000;scara_dy_fir_test. The third joint in SLX is mm units, so the third joint here is divided by 1000;
    tao = scara_dy_cal_data(q,dq,ddq);
    %tao = scara_cal_tao_test(q,dq,ddq);


    tao1(i) = tao(1);
    tao2(i) = tao(2);
    tao3(i) = tao(3);  
    tao4(i) = tao(4);


end

tao1_real = load('tao1_real.mat');
tao2_real = load('tao2_real.mat');
tao3_real = load('tao3_real.mat');
tao4_real = load('tao4_real.mat');

figure;
subplot(4,1,1);
plot(tao1);hold on;plot(tao1_real.tao.Data);
subplot(4,1,2);
plot(tao2);hold on;plot(tao2_real.tao.Data);
subplot(4,1,3);
plot(tao3);hold on;plot(tao3_real.tao.Data);
subplot(4,1,4);
plot(tao4);hold on;plot(tao4_real.tao.Data);

figure;
subplot(4,1,1);
plot(tao1'-tao1_real.tao.Data);
subplot(4,1,2);
plot(tao2'-tao2_real.tao.Data);
subplot(4,1,3);
plot(tao3'-tao3_real.tao.Data);
subplot(4,1,4);
plot(tao4'-tao4_real.tao.Data);




















