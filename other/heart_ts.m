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
theta = -pi:0.1:pi;
x = 400*ones(1,length(theta))+150*cos(theta);
y = 150*(sin(theta)+((cos(theta)).^2).^(1/3));
plot(x,y,'o')



fid = fopen('heart_data.txt','wt');
for i = 1:length(x)
    fprintf(fid,'%g,%g,0,0,0,0\n',x(i),y(i));
end

fclose(fid);
