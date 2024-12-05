
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


clc;
clear;




S = 100.6;
V = 20;
A = 100;
D = 100;
J = 1000;%�ȼӣ��ȼ������� 
[t] = s_curve_cal_param_non_symmetry(S,V,A,D,J);
[s,v,a,jerk] = s_curve_cal_pvaj_non_symmetry(t,J,0.001);
subplot(4,2,1);
plot(v,'b');
title('acc-vel-dec');
subplot(4,2,3);
plot(a,'r');


S = 100.1;
V = 20;
A = 200;
D = 100;
J = 1000;%���ȼӣ��ȼ�������
[t] = s_curve_cal_param_non_symmetry(S,V,A,D,J);
[s,v,a,jerk] = s_curve_cal_pvaj_non_symmetry(t,J,0.001);
subplot(4,2,2);
plot(v,'b');
title('no acc-vel-dec');
subplot(4,2,4);
plot(a,'r');


S = 100.9;
V = 20;
A = 100;
D = 200;
J = 1000;%�ȼӣ����ȼ�������
[t] = s_curve_cal_param_non_symmetry(S,V,A,D,J);
[s,v,a,jerk] = s_curve_cal_pvaj_non_symmetry(t,J,0.001);
subplot(4,2,5);
plot(v,'b');
title('acc-vel-no dec');
subplot(4,2,7);
plot(a,'r');

S = 100.9;
V = 2000;
A = 100;
D = 200;
J = 1000;%�ȼӣ��ȼ���������
[t] = s_curve_cal_param_non_symmetry(S,V,A,D,J);
[s,v,a,jerk] = s_curve_cal_pvaj_non_symmetry(t,J,0.001);
subplot(4,2,6);
plot(v,'b');
title('acc-no vel-dec');
subplot(4,2,8);
plot(a,'r');


figure;
S = 100.6;
V = 20;
A = 1000;
D = 1000;
J = 1000;%���ȼӣ����ȼ�������
[t] = s_curve_cal_param_non_symmetry(S,V,A,D,J);
[s,v,a,jerk] = s_curve_cal_pvaj_non_symmetry(t,J,0.001);
subplot(4,2,1);
plot(v,'b');
title('no acc-vel-no dec');
subplot(4,2,3);
plot(a,'r');

S = 100.1;
V = 200;
A = 2000;
D = 100;
J = 1000;%���ȼӣ��ȼ���������
[t] = s_curve_cal_param_non_symmetry(S,V,A,D,J);
[s,v,a,jerk] = s_curve_cal_pvaj_non_symmetry(t,J,0.001);
subplot(4,2,2);
plot(v,'b');
title('no acc-no vel-dec');
subplot(4,2,4);
plot(a,'r');


S = 100.9;
V = 120;
A = 40;
D = 2000;
J = 1000;%�ȼӣ����ȼ���������
[t] = s_curve_cal_param_non_symmetry(S,V,A,D,J);
[s,v,a,jerk] = s_curve_cal_pvaj_non_symmetry(t,J,0.001);
subplot(4,2,5);
plot(v,'b');
title('acc-no vel-no dec');
subplot(4,2,7);
plot(a,'r');

S = 10.9;
V = 2000;
A = 100;
D = 200;
J = 100;%���ȼӣ����ȼ���������
[t] = s_curve_cal_param_non_symmetry(S,V,A,D,J);
[s,v,a,jerk] = s_curve_cal_pvaj_non_symmetry(t,J,0.001);
subplot(4,2,6);
plot(v,'b');
title('no acc-no vel-no dec');
subplot(4,2,8);
plot(a,'r');


