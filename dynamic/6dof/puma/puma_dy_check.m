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
tao3 = linspace(0,0,sum);
tao4 = linspace(0,0,sum);
tao5 = linspace(0,0,sum);
tao6 = linspace(0,0,sum);



for i = 1:sum
    

    q(1) = q1(i,2);       q(2) = q2(i,2);       q(3) = q3(i,2);       q(4) = q4(i,2);       q(5) = q5(i,2);         q(6) = q6(i,2); 
    dq(1) = dq1(i,2);     dq(2) = dq2(i,2);     dq(3) = dq3(i,2);     dq(4) = dq4(i,2);     dq(5) = dq5(i,2);       dq(6) = dq6(i,2);
    ddq(1) = ddq1(i,2);   ddq(2) = ddq2(i,2);   ddq(3) = ddq3(i,2);   ddq(4) = ddq4(i,2);   ddq(5) = ddq5(i,2);     ddq(6) = ddq6(i,2);
    
    if(82 == i)
        ;
    end

   % tao = puma_dy_cal_data(q,dq,ddq);%牛顿欧拉方法求;newton-euler method
   %  tao = puma_dy_cal_data_linear_separate(q,dq,ddq);%线性分离形式求;Linear separation form
   
   tao = puma_dy_cal_data_min_param_2(q,dq,ddq);%最小集形式求;the min-paramter caculate,tao = puma_dy_cal_data_min_param is also ok, but some paramters is not the same as the book.

    tao1(i) = tao(1);
    tao2(i) = tao(2);
    tao3(i) = tao(3);  
    tao4(i) = tao(4);
    tao5(i) = tao(5);
    tao6(i) = tao(6);

end


figure;
subplot(6,1,1);
plot(tao1,'r');hold on;plot(tao_data_1.Data,'b');
subplot(6,1,2);
plot(tao2,'r');hold on;plot(tao_data_2.Data,'b');
subplot(6,1,3);
plot(tao3,'r');hold on;plot(tao_data_3.Data,'b');
subplot(6,1,4);
plot(tao4,'r');hold on;plot(tao_data_4.Data,'b');
subplot(6,1,5);
plot(tao5,'r');hold on;plot(tao_data_5.Data,'b');
subplot(6,1,6);
plot(tao6,'r');hold on;plot(tao_data_6.Data,'b');

figure;
subplot(6,1,1);
plot(tao1'-tao_data_1.Data);
subplot(6,1,2);
plot(tao2'-tao_data_2.Data);
subplot(6,1,3);
plot(tao3'-tao_data_3.Data);
subplot(6,1,4);
plot(tao4'-tao_data_4.Data);
subplot(6,1,5);
plot(tao5'-tao_data_5.Data);
subplot(6,1,6);
plot(tao6'-tao_data_6.Data);














