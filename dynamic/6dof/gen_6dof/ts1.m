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

target =   0.201170105854524;

a2 = 100.0/1000.0;
d3 = 2.650/1000.0;
a3 = 409/1000.0;


zz1 = 0.217608444355748;
mx2 = 0.0148825465627565;
my2 = 0.0490259923817414;
xx2 = 0.270535360814424;
xy2 = -0.125760336104957;
xz2 = 0.294155954290448;
yz2 = -0.0892952793765388;
zz2 = -6.12040320468727e-18;


mx3 = -0.0631995361440202;
my3 = 0.0859478582237045;
xx3 = 0.431386549449139;
xy3 = -0.0336822294804674;
xz3 = 0.944216914802467;
yz3 = -0.357798344814096;
zz3 = -2.93326863999800e-18;

coeff_M3 = a3*mx2-a3^2*xx2-a3*d3*xz2+a3^2*zz2+(a3^2+d3^2+a2^2)*zz1;
coeff_M4 = a4*mx3+d4*my3+(d4^2-a4^2)*xx3-a4*d4*xy3+(a4^2+d4^2)*zz3+coeff_M3;


A = zeros(20,0);
A(1) = a2;
A(2) = a3;
A(3) = d3;

A(4) = 2*a2;
A(5) = 2*a3;
A(6) = 2*d3;

A(7) = a2^2;
A(8) = a3^2;
A(9) = d3^2;

A(10) = 2*a2^2;
A(11) =2* a3^2;
A(12) = 2*d3^2;

A(13) = a2*a3;
A(14) = a3*d3;
A(15) = a2*d3;

A(16) = 2*a2*a3;
A(17) = 2*a3*d3;
A(18) = 2*a2*d3;
sum = 0.0;

for i = 1:2^18-1
    
    for j = 1:18
       sum = sum+bitget(i,j)*A(j);      
    end
           
       if(abs(sum-target)<10e-3)
          i
          break
          
       end
    
end 
