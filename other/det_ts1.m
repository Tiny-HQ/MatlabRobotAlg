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

%初等变换求行列式; The elementary transformation is used to find the determinant;

clc;
clear;




%x = randn(8);
%x = magic(3)%magic()函数参数，在偶数阶时，矩阵很容易奇异，行列式为0; magic() function argument, at the even order, the matrix is easily singular, and the determinant is 0;
%x = [1 2 3;2 4 6 ;3 6 9]
x = [1 2 3;2 4 7 ;3 8 7]
y = x
det(y)
[max_column,max_row] = size(x);

if (max_column~=max_row)
    return;
end


max_c = 0;
counts = 0;

for i = 1:max_column
  
    max_unit = eps;
    max_c = 0;
    for j = i:max_column
       if (abs(x(j,i))>max_unit)
           max_unit = abs(x(j,i));
           max_c = j;
       end
    end
    
    %如果某一行是令一行的倍数，那么会出现下面这种情况; If a line is a multiple of a line, the following situation will occur;
    if max_c == 0
        break ;
    end
     
    %交换第i行跟最大行;交换一次要乘以个（-1），这里是为了保证每次x（i，i）不为0;Swap the ith line with the largest row; The exchange is multiplied by (-1) once, here to ensure that x(i,i) is not 0 each time;
    if i ~= max_c
        temp = x(i,:);         
        x(i,:) = x(max_c,:);   
        x(max_c,:) = temp;    
        counts = counts+1;
    end
    
    for k = i+1:max_column
        coeff = x(k,i)/x(i,i);
        x(k,:) = x(k,:)-coeff*x(i,:); 
    end
end

multi = 1.0;
for k =1 :max_column
    multi = multi*x(k,k);
end

if(mod(counts,2) ~= 0)
   multi= -multi;
end

multi



