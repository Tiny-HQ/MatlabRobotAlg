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
g = 9.8065;
a3 = 425.0/1000.0;
a4 = 392.430/1000.0;
d1 = 89.2/1000.0;
d4 = 109/1000.0;
d5 = 93.650/1000.0;
d6 = 82.0/1000.0;


target = 0.148016218152696;

A = zeros(24,1);
A(1) = a3;
A(2) = 2*a3;
A(3) = a3^2;
A(4) = 2*a3^2;
A(5) = a4;
A(6) = 2*a4;
A(7) = a4^2;
A(8) = 2*a4^2;
A(9) = d4;
A(10) = 2*d4;
A(11) = d4^2;
A(12) = 2*d4^2;

for i = 1:12
   A(24-i) = -A(i);   
end


for i = 1:2^24
    sum = 0;
    for j = 1:24
       sum =sum+  bitget(i,j)*A(j);
        
       if(abs(sum-target)<10e-8)
          break; 
       end
    end
    
    
end
