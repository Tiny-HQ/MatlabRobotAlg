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
%A=[1 1 1;1 2 10;1 10 100];
A=[1 2 3;4 5 6;7 8 9];
% [vector,w] = eigenvector(A'*A);
% disp(vector);disp(w);
% [x,y]=eig(A'*A);
% disp(x);disp(y);
%A=[1 2 3 4;5 6 7 8;9 10 11 12 ;13 14 15 16];
[u,w,v] = svd_funtion(A);
disp(u);disp(w);disp(v);
AA=u*w*v';disp(AA);
[x,y,z] = svd(A);
disp(x);disp(y);disp(z);
AAA=x*y*z';disp(AAA);