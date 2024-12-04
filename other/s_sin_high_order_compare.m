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





clc;
clear;



S = 78.793;
V = 375*0.95*0.3;
A = 3354*0.95*0.3;
D = 3354*0.95*0.3;
J = 33540*0.95*0.3;
t_int = 0.001;


[t,j] = sin_sim_cal_param(S,V,A,D,J);
[ss,s,v,a,jerk] = sin_sim_cal_pvaj(t,j,t_int);



[t1] = s_curve_cal_param_non_symmetry(S,V,A,D,J);
[s1,v1,a1,jerk1] = s_curve_cal_pvaj_non_symmetry(t1,J,t_int);



[t2,A_new] = trape_cal_param_ext(S,V,A,D);
[s2,v2,a2] = trape_cal_pvaj_ext(t2,A,D,t_int);

J = 33540*0.95*0.5;
 [t3,j3] = s_curve_4order_cal_param(S,V,A,J);
 [s3,v3,a3,jerk3] = s_curve_4order_cal_pvaj(t3,j3,t_int);

figure;
subplot(4,1,1);
plot(s);hold on; plot(s1);hold on;plot(s3);hold on;plot(s2);
legend('Sin','Trape','4order','Line');
subplot(4,1,2);
plot(v);hold on;plot(v1);hold on;plot(v3);hold on;plot(v2);
legend('Sin','Trape','4order','Line');
subplot(4,1,3);
plot(a);hold on;plot(a1);hold on;plot(a3);hold on;plot(a2);
legend('Sin','Trape','4order','Line');
subplot(4,1,4);
plot(jerk);hold on;plot(jerk1);hold on;plot(jerk3);
legend('Sin','Trape','4order');



















