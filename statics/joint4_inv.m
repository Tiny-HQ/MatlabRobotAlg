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


sc = [0 0 1 0 0 0;
    0 0 1 0 -1 0;
    0 0 1 0 -2 0;
    0 0 1 0 -3 0;]';

T_home = [1 0 0 4;
    0 1 0 0;
    0 0 1 0;
    0 0 0 1];

theta_0 = [0 0 0 0];    %�oʼ�Ƕ�ֵ;
tic
T_end = fkine_sc(sc,T_home,htrans(2,1,0)*hrotz(90))

%�������󲻳��⣬?O�˵�����⣬�?��`��ĳ����;
%�����е�ĳ?��������A�ɹ`��ֵ��?O�ĳ�ֹ��?
theta = ikine_sc(sc,T_home,theta_0,T_end)

T_end = fkine_sc(sc,T_home,theta)

toc;













