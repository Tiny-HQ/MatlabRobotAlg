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

Ts = 0.001;

%vs == ve,v<vs;
% vs = 50;
% ve = 50;
% s = 100;
% a = 100;
% v = 20;

%vs == ve,v<vs;
% vs = 50;
% ve = 50;
% s = 10;
% a = 100;
% v = 20;

%vs == ve,v>vs;
% vs = 50;
% ve = 50;
% s = 200;
% a = 100;
% v = 60;

%vs == ve,v>vs;
% vs = 50;
% ve = 50;
% s = 9;
% a = 100;
% v = 60;

%vs == ve,v==vs;
% vs = 50;
% ve = 50;
% s = 100;
% a = 100;
% v = 50;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%vs < ve,v<vs;
% vs = 50;
% ve = 70;
% s = 100;
% a = 100;
% v = 20;

%vs < ve,v<vs;
% vs = 50;
% ve = 70;
% s = 20;
% a = 100;
% v = 20;


%vs < ve,ve>v>vs;
% vs = 50;
% ve = 70;
% s = 20;
% a = 100;
% v = 60;

%vs < ve,ve>v>vs;
% vs = 50;
% ve = 70;
% s = 10;
% a = 100;%?????????????120;
% v = 60;


%vs < ve,v > ve;
% vs = 50;
% ve = 70;
% s = 100;
% a = 100;
% v = 80;

%vs < ve,v > ve;
% vs = 50;
% ve = 70;
% s = 20;
% a = 100;
% v = 80;

%ts
% vs = 70;
% ve = 150;
% s = 20;
% a = 100;
% v = 80;


%vs>ve???,???????;

vs = 0;
ve = 0;
s = 50;
a = 600;
v = 140;
[t,acc,vc] = trape_ext_cal_param(vs,ve,v,a,s);
[S,V,A] = trape_ext_cal_pvaj(t,acc,vs,vc,ve,Ts);


figure;
subplot(3,1,1);
plot(S);
subplot(3,1,2);
plot(V);hold on ;plot(diff(S/Ts));
subplot(3,1,3);
plot(A);

















