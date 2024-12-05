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






clc;
clear;


%????;(A = 0);
% D = 50;
% V = 1300;
% A = 0.0;
% A_set =1000;
% J = 1000;

%????;(A = 0);
% D = 50;
% V = 1300;
% A = 0.0;
% A_set =1400;
% J = 1000;

%????;(A > 0);
% D = 50;
% V = 1300;
% A = 100.0;
% A_set =1400;
% J = 1000;

%????;(A > 0);
% D = 50;
% V = 1300;
% A = 100.0;
% A_set =1000;
% J = 1000;

%????;(A < 0);
D = 50;
V = 100;
A = -1000.0;
A_set =1000;
J = 1000;

%????;(A < 0)??A?V???????((V-1/2*abs(A)*t_)=0);
%A???0??,??V???0;
% D = 50;
% V = 500;
% A = -1000.0;
% A_set =1000;
% J = 1000;

%?????,?????,??????;
% D = 50;
% V = 500;
% A = -1200.0;
% A_set =1000;
% J = 1000;

% ???,????????????????,???????,??????????????0;
% D = 50;
% V = 500;
% A = -100.0;
% A_set =90;
% J = 1000;

%???????????????100,????????????,?????,?????;
% D = 50;
% V = 500;
% A = -90;
% A_set =100;
% J = 1000;

%????????????????,?????;
% D = 50;
% V = 500;
% A = -90;
% A_set =1000;
% J = 1000;

% D = 1.311;
% V = 79.73;
% A = 1972.77;
% A_set =6000;
% J = 96000;



[t,j] = stop_cal_param(V,A,A_set,J);
[p,v,a,jerk] = stop_cal_pvaj(t,j,V,A,D);



subplot(4,1,1);plot(p,'b');grid on;hold on;
subplot(4,1,2);plot(v,'r');grid on;hold on;
subplot(4,1,3);plot(a,'g');grid on;hold on;
subplot(4,1,4);plot(jerk,'g');grid on;hold on;











