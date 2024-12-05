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
%  X=[-1000     -2500     -3000      -3500     -4000];  165 160 155 150 145
% Y=[50     120     160     180     220];  32000 34000 36000 38000 40000

%  X=[24000 26000 28000  30000 ]; 
%  Y=[200 190 180  170 ];  

 X=[-750 -1750 -2250  -2750 -3000]; 
 Y=[100 90 82  83 83];  

    n=5;                %??5???  

    x2=sum(X.^2);       % ?S(xi^2)  
    x1=sum(X);          % ?S(xi)  
    x1y1=sum(X.*Y);     % ?S(xi*yi)  
    y1=sum(Y);          % ?S(yi)  

    a=(n*x1y1-x1*y1)/(n*x2-x1*x1)      %??????b=(y1-a*x1)/n  
    b=(y1-a*x1)/n                      %??????  
    %??  
    % ???????????????  
    figure  
    plot(X,Y,'+');        
    hold on  
    % ???????????  
    px=0:1:40000;%????????????????  
    py=a*px+b;  
    plot(px,py,'r'); 
