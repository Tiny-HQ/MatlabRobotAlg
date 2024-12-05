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


%????,0/1????;
clc;
clear;



% w = randperm(10);
% v = randperm(10);

w = [2 3 6 9 12 2 1 3];
v = [3 6 9 2 8 9 2 3];
n = length(w);
w_limt = 10;



tic;
table = zeros(n,w_limt+1);
for i = 1:n-1
    for j = 0:w_limt
        if(w(i+1)>=j+1)
            table(i+1,j+1) = table(i,j+1);
        else
            table(i+1,j+1) = max(table(i,j+1),v(i+1)+table(i,j+1-w(i+1)));
        end   
    end
end

table

%optimize space;
table_opt = zeros(1,w_limt+1);
for i = 1:n-1
    for j = w_limt:-1:0
        if(w(i+1)>=j+1)
            table_opt(j+1) = table_opt(j+1);
        else
            table_opt(j+1) = max(table_opt(j+1),v(i+1)+table_opt(j+1-w(i+1)));
        end   
    end
     table_opt
end

toc;
















