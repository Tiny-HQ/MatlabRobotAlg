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

clc;
clear;

Ts = 0.004;

O = [0 0 0 32 20 62;
    20 0 0 50 -50 30 ;
    30 0 0 60 30 120;
    40 0 0 30 95 30;
    50 0 0 30 25 20];


[m,n] = size(O);

T = zeros(4,4,m);

for i = 1:m    
    T(:,:,i) = cs_define_zyzeul(O(i,:));
end

Q = zeros(m,4) ;

for i = 1:m
   Q(i,:) = R_to_Quat(splitT_R(T(:,:,i)));
end

si = zeros(m-1,4);
si(1,:) = Q(1,:);
si(m,:) = Q(m,:);
for i = 2:m
    si(i,:) = Squad_cal_ctrl_point(Q(i,:),Q(i-1,:),Q(i+1));
end 
    
q = zeros(1004,4); 
T = zeros(4,4,1004);
counts = 1;
for i = 1:m-1
    for ts = 0:Ts:1
        q(counts,:) = Squad_Inter(Q(i,:),si(i,:),si(i+1,:),Q(i+1,:),ts);
       
         tmp =  Quat_to_R(q(counts,:));
        T(1:3,1:3,counts) =  Quat_to_R(q(counts,:));
        T(1:3,4,counts) = [counts*0.1;counts*0.1;counts*0.1];
         counts = counts+1;
    end
end


plot_coord_data_dynamic(T,10,10,4);









