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

%**filtermain.m**

%function main()
close  all

% ??????? 
t=0:99;
xs=3*sin(t);
figure;
subplot(2,1,1);
plot(t,xs);grid;
ylabel('??');
title('it{???????}');

% ???????
t=0:99;
xn=0.3*sin(0.5*t);
subplot(2,1,2);
plot(t,xn);grid;
ylabel('??');
xlabel('??');
title('it{??????}');

% ????
xn = xs+xn;
xn = xn.' ;   % ??????
dn = xs.' ;   % ??????
M  = 20 ;   % ??????

rho_max = max(eig(xn*xn.'));   % ??????????????
mu = (1/rho_max) ;    % ???? 0 < mu < 1/rho
% [yn,W,en] = LMS(xn,dn,M,mu);
[yn,W,en] = LMS(xn,xn,M,mu);

% ?????????
figure;
subplot(2,1,1);
plot(t,xn);grid;
ylabel('??');
xlabel('??');
title('it{???????}');

% ????????????
subplot(2,1,2);
plot(t,yn);grid;
ylabel('??');
xlabel('??');
title('it{??????????}');

% ????????????,????????????
figure 
plot(t,yn,'b',t,dn,'g',t,dn-yn,'r');grid;
legend('????????','????','??');
ylabel('??');
xlabel('??');
title('it{??????}');


