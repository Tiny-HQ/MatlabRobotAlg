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
%absolutely wrong!!!!!
%shit!!!!

clc;
clear;

x = [1 3 6 9;45 61 2 6;9 8 1 2;2 3 5 9];
y = x;
y*inv(x)
N = length(x);
maxrow= zeros(1,N);
maxcolumn = zeros(1,N);

for k = 1:N
    
    max = x(k,k);
    maxrow(k) = k;
    maxcolumn(k) = k;
    
    for row = k:N
        for column = k:N
           if abs(x(row,column))>max
               max = x(row,column);
               maxrow(k) = row;
               maxcolumn(k) = column;
           end
        end
    end
    
    temp = x(k,:);
    x(k,:) = x(maxrow(k),:);
    x(maxrow(k),:) = temp;
    x(k,k) = 1/x(k,k);
    
    for column = 1:N
        if column ~= k
            x(k,column) = x(k,column)*x(k,k);
        end
    end
    
    for row = 1:N
        if row~= k
            for column = 1:N
                if column ~= k
                    x(row,column) = x(row,column)-x(row,k)*x(k,column);
                end
            end
        end
    end
    
end



for k = N:-1:1
    temp = x(:,k);
    x(:,k) = x(:,maxrow(k));
    x(:,maxrow(k)) = temp;
    temp = x(k,:);
    x(k,:) = x(maxcolumn(k),:);
    x(maxcolumn(k),:) = temp;
end
   
y*x














