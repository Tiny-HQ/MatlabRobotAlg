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


clc;clear;

L = 100;
W = 30;
ms = 5;

n = 360;
T = zeros(4,4,n);


for i = 1:n
   
    T(:,:,i) = htrans(i,i,0)*hrotz(i);
end

figure;

[P1,P2,P3,P4] = draw_rect_dynamic(L,W,T,ms,[-100 500,-100 400]);

plot(P1(:,1),P1(:,2),'r');
plot(P2(:,1),P2(:,2),'g');
plot(P3(:,1),P3(:,2),'b');
plot(P4(:,1),P4(:,2),'y');


%plot_coord_data_dynamic(T,3,ms)


