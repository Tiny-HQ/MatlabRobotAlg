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


% t = [0.1 0.2 0.3 1.0 1.1 1.2 1.3];
% [ss,s,v,a,jerk] = sin_sim_cal_pvaj(t,100,0.001);


% S = 100.6;
% V = 20;
% A = 100;
% D = 100;
% J = 1000;%匀加，匀减，匀速
% [t,j] = sin_sim_cal_param(S,V,A,D,J);
% [ss,s,v,a,jerk] = sin_sim_cal_pvaj(t,j,0.001);
% 
% display(['disper:',num2str(ss(length(ss))),'  conti:',num2str(s(length(s)))]);



% S = 100.1;
% V = 20;
% A = 200;
% D = 100;
% J = 1000;%无匀加，匀减，匀速
% [t,j] = sin_sim_cal_param(S,V,A,D,J);
% [ss,s,v,a,jerk] = sin_sim_cal_pvaj(t,j,0.001);
% 
% display(['disper:',num2str(ss(length(ss))),'  conti:',num2str(s(length(s)))]);


% S = 100.9;
% V = 20;
% A = 100;
% D = 200;
% J = 1000;%匀加，无匀减，匀速
% [t,j] = sin_sim_cal_param(S,V,A,D,J);
% [ss,s,v,a,jerk] = sin_sim_cal_pvaj(t,j,0.001);
% 
% display(['disper:',num2str(ss(length(ss))),'  conti:',num2str(s(length(s)))]);



% S = 4.53;
% V = 20;
% A = 100;
% D = 200;
% J = 100;%无匀加，无匀减，无匀速
% [t,j] = sin_sim_cal_param(S,V,A,D,J);
% [ss,s,v,a,jerk] = sin_sim_cal_pvaj(t,j,0.001);
% 
% display(['disper:',num2str(ss(length(ss))),'  conti:',num2str(s(length(s)))]);




% S = 6.8;
% V = 20;
% A = 10;
% D = 20;
% J = 1000;%匀加，匀减，无匀速,A>D时，反过来，调换时间序列即可；

% S = 6.8;
% V = 200;
% A = 10000;
% D = 100;
% J = 1000;

S = 450.0;
V = 450.0;
A = 100;
D = 450.0;
J = 1000.0;

for A = 100:450
    V = V-1;S = S-0.5;D = D-0.3;
    [t,j] = sin_sim_cal_param(S,V,A,D,J);
    [ss,s,v,a,jerk] = sin_sim_cal_pvaj(t,j,0.001);

    subplot(4,1,1);
    plot(s,'r');%hold on;plot(ss,'r');
    subplot(4,1,2);
    plot(v,'g');%hold on;plot(diff(s)/0.001);
    subplot(4,1,3);
    plot(a,'b');%hold on;plot(diff(v)/0.001);
    subplot(4,1,4);
    plot(jerk,'y');%hold on;plot(diff(a)/0.001);
    
    pause(0.05);

end 



%display(['disper:',num2str(ss(length(ss))),'  conti:',num2str(s(length(s)))]);



% 
% subplot(4,1,1);
% plot(s);hold on;plot(ss,'r');
% subplot(4,1,2);
% plot(v);%hold on;plot(diff(s)/0.001);
% subplot(4,1,3);
% plot(a);%hold on;plot(diff(v)/0.001);
% subplot(4,1,4);
% plot(jerk);%hold on;plot(diff(a)/0.001);


% figure;
% plot(s,'b');
% hold on;
% plot(ss,'r')



















