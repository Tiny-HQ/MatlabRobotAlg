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


t_int = 0.001;% 1ms


%need to discrete............


ss1 = 13;
vs1 = 5;
ve1 = 20;
v_max = 30;
A = 100;

ss2 = 90;
vs2 = 20;
ve2 = 15;

[t1,acc1,vc] = lls_trape_ext_cal_param(vs1,ve1,v_max,A,ss1);
% [t1,je1,error] = lls_trape_ext_cal_param(ss1,se1,vs1,ve1,v_max,A,J);
[s1,v1,a1,t_d,sum_no1] = lls_trape_ext_cal_pvaj(t1,A,vs1,v_max,ve1,t_int,0.0);


plot(diff(s1)/t_int);

[t2,acc2,vc] = lls_trape_ext_cal_param(vs2,ve2,v_max,A,ss2);
[s2,v2,a2,t_d,sum_no] = lls_trape_ext_cal_pvaj(t2,A,vs2,v_max,ve2,t_int,t_d);

l = length(s1)+length(s2);
s = zeros(1,l);
v = zeros(1,l);
a = zeros(1,l);
jer= zeros(1,l);
s(1:length(s1))= s1;
s(length(s1)+1:l) = s2+ss1;
v(1:length(s1))= v1;
v(length(s1)+1:l) = v2;
a(1:length(s1))= a1;
a(length(s1)+1:l) = a2;




subplot(3,1,1);
plot(s,'g');
subplot(3,1,2);
plot(v,'b');hold on;plot(diff(s/t_int));
subplot(3,1,3);
plot(a,'r');