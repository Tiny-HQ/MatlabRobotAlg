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
%a?0???5;
%alpha?0???5;
%d?1???6;
%theta?1???6;
%
%+---+-----------+-----------+-----------+-----------+-----------+
%| j |     theta |         d |         a |     alpha |    offset |
%+---+-----------+-----------+-----------+-----------+-----------+
%|  1|         q1|         d1|         a0|     alpha0|          0|
%|  2|         q2|         d2|         a1|     alpha1|          0|
%|  3|          0|         q3|         a2|     alpha2|          0|
%|  4|         q4|         d4|         a3|     alpha3|          0|
%+---+-----------+-----------+-----------+-----------+-----------+

%+---+-----------+-----------+-----------+-----------+-----------+
%| j |     theta |         d |         a |     alpha |    offset |
%+---+-----------+-----------+-----------+-----------+-----------+
%|  1|          0|        0.0|        0.0|        0.0|          0|
%|  2|          0|        0.0|        325|        0.0|          0|
%|  3|          0|        0.0|        275|        0.0|          0|
%|  4|          0|        0.0|        0.0|        0.0|          0|
%+---+-----------+-----------+-----------+-----------+-----------+



DH.a(1) = 0.0;%????0???;matlab?????1??;
DH.a(2) = 225;
DH.a(3) = 175;
DH.a(4) = 0;


DH.alpha(1) = 0.0;%????0???;
DH.alpha(2) = 0.0;
DH.alpha(3) = 0.0;
DH.alpha(4) = 0.0;

DH.d(1) = 0;
DH.d(2) = 0.0;
DH.d(3) = 0.0;
DH.d(4) = 0.0;


DH.theta(1) = 0.0;
DH.theta(2) = 0.0;
DH.theta(3) = 0.0;
DH.theta(4) = 0.0;



% q = [-30.917 90.222 0 -101.305];%(-180-180???;)

q = [0 0 0 0];[T,ori] = scara_fkine(q,DH,'deg','deg');T
q = [0.01 0 0 0];[T,ori] = scara_fkine(q,DH,'deg','deg');T


% 
% tr2eul(T)*180/pi
% 
% q = scara_ikine(T,ori,DH,'deg','deg')
























