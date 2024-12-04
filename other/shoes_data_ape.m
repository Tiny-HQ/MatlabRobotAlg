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
clc;
clear;



A = load('shoes_tech_point1.txt');
B = load('shoes_tech_point2.txt');

fid = fopen('.\shoes_teach_point.txt','w+');
[m1,n1] = size(A);
[m2,n2] = size(B);
for i = 1:m1
   fprintf(fid,'P%d, %f, %f, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Right, UnKnown, UnKnown, 1, -1, 1, 0,#....\n',i,A(i,1),A(i,2));  
end
for i = 1:m2
   fprintf(fid,'Q%d, %f, %f, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Right, UnKnown, UnKnown, 1, -1, 1, 0,#....\n',i,B(i,1),B(i,2));  
end

fclose(fid);