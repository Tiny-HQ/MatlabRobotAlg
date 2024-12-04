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

  
%calculate single link dynamics.

syms theta dtheta ddtheta L g   real;
I1c1 = [0 0 0;0 0.208 0;0 0 0.208];
m1 = 2.409;
R12 = [1 0 0;0 1 0;0 0 1];
n22 = [0 0 0]';
f22 = [0 0 0]';
ctheta1 = cos(theta);stheta1 = sin(theta);
R01 = [ctheta1 -stheta1 0;stheta1 ctheta1 0;0 0 1];
R10 = R01';
P10 = [L 0 0]';PC11 = [L/2 0 0]'; 

w00 =[0 0 0]';dw00 = [0 0 0]';v00 = [0 0 0]';dv00 = [0 -g 0]';

w11 = R10*w00 + [0 0 dtheta]';
dw11 = R10*dw00+cross(R10*w00,[0 0 dtheta]')+[0 0 ddtheta]';
dv11 = R10*(cross(dw00,P10)+cross(w00,cross(w00,P10))+dv00);


dvc11 = cross(dw11,PC11)+cross(w11,cross(w11,PC11))+dv11;


F11 = m1*dvc11;
N11 = I1c1*dw11+cross(w11,I1c1*w11);


f11 = R12 * f22 +F11;
n11 = N11+R12*n22+cross([L/2 0 0]',F11)+cross([L 0 0]',(R12*f22));
tao1 = n11(3)











