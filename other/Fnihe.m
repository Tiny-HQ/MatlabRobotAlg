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
function [a,b]= Fnihe( X,Y,n )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
     %n=5;                %??5???  

    x2=sum(X.^2);       % ?S(xi^2)  
    x1=sum(X);          % ?S(xi)  
    x1y1=sum(X.*Y);     % ?S(xi*yi)  
    y1=sum(Y);          % ?S(yi)  

    a=(n*x1y1-x1*y1)/(n*x2-x1*x1);      %??????b=(y1-a*x1)/n  
     b=(y1-a*x1)/n;  

end

