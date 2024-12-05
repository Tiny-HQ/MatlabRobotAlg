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

%%%------1-------%%%%
Ts = 0.0005;
vs = 30;
ve = 50;
s = 20;
a = 20;
v = 40;
[t,acc,vc] = trape_ext_cal_param(vs,ve,v,a,s);
[S,V,A] = trape_ext_cal_pvaj(t,acc,vs,vc,ve,Ts);
figure;
subplot(2,7,1);
plot(V);
subplot(2,7,8);
plot(A);

%%%------2-------%%%%
vs = 30;
ve = 50;
s = 50;
a = 20;
v = 10;
[t,acc,vc] = trape_ext_cal_param(vs,ve,v,a,s);
[S,V,A] = trape_ext_cal_pvaj(t,acc,vs,vc,ve,Ts);
subplot(2,7,2);
plot(V);
subplot(2,7,9);
plot(A);

%%%------3-------%%%%
vs = 30;
ve = 50;
s = 100;
a = 20;
v = 20;
[t,acc,vc] = trape_ext_cal_param(vs,ve,v,a,s);
[S,V,A] = trape_ext_cal_pvaj(t,acc,vs,vc,ve,Ts);
subplot(2,7,3);
plot(V);
subplot(2,7,10);
plot(A);

%%%------4-------%%%%
vs = 30;
ve = 50;
s = 100;
a = 20;
v = 40;
[t,acc,vc] = trape_ext_cal_param(vs,ve,v,a,s);
[S,V,A] = trape_ext_cal_pvaj(t,acc,vs,vc,ve,Ts);
subplot(2,7,4);
plot(V);
subplot(2,7,11);
plot(A);

%%%------5-------%%%%
vs = 30;
ve = 50;
s = 40;
a = 20;
v = 40;
[t,acc,vc] = trape_ext_cal_param(vs,ve,v,a,s);
[S,V,A] = trape_ext_cal_pvaj(t,acc,vs,vc,ve,Ts);
subplot(2,7,5);
plot(V);
subplot(2,7,12);
plot(A);

%%%------6-------%%%%
vs = 30;
ve = 50;
s = 50;
a = 20;
v = 60;
[t,acc,vc] = trape_ext_cal_param(vs,ve,v,a,s);
[S,V,A] = trape_ext_cal_pvaj(t,acc,vs,vc,ve,Ts);
subplot(2,7,6);
plot(V);
subplot(2,7,13);
plot(A);

%%%------7-------%%%%
vs = 30;
ve = 50;
s = 130;
a = 20;
v = 60;
[t,acc,vc] = trape_ext_cal_param(vs,ve,v,a,s);
[S,V,A] = trape_ext_cal_pvaj(t,acc,vs,vc,ve,Ts);
subplot(2,7,7);
plot(V);
subplot(2,7,14);
plot(A);



