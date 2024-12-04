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

%gauss??;
%perfect!!
%????,????;
%???matlab???????????,???,???;

clc;
clear;


x = randn(300);
%x = magic(5);%magic()????,?????,???????,????0;
tic;
y = x;
det(y)
[max_column,max_row] = size(x);

if (max_column~=max_row)
    return;
end



unit_eye = eye(max_column);

%??????,??????0;
for i = 1:max_column

    %??i?????????????;
    max_unit = 0.0;
    max_c = 0;
    for j = i:max_column
       if (abs(x(j,i))>max_unit)
           max_unit = abs(x(j,i));
           max_c = j;
       end
    end
    
    %???i?????;
    temp = x(i,:);          temp1 = unit_eye(i,:);
    x(i,:) = x(max_c,:);    unit_eye(i,:) = unit_eye(max_c,:);  
    x(max_c,:) = temp;      unit_eye(max_c,:) = temp1;
    
    %????????????????1,???????????i?(????i???????1?);
    coeff = x(i,i);
    unit_eye(i,:) = unit_eye(i,:)/coeff;       
    x(i,:) = x(i,:)/coeff;                  
    for k = i+1:max_column
        unit_eye(k,:) =unit_eye(k,:)-x(k,i)*unit_eye(i,:);
        x(k,:) = x(k,:)-x(k,i)*x(i,:);       
    end

end



%?????; 
for j = max_column:-1:1
    for i = 1:j-1
        unit_eye(i,:) = unit_eye(i,:)-unit_eye(j,:)*x(i,j);
        x(i,:) = x(i,:)-x(j,:)*x(i,j);
    end
    
end
toc




tic;
inv(x);
toc




% x
% inv(y)
% unit_eye

