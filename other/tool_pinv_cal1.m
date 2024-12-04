
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
clc
clear
% DH
l1=367.000000;l2=421.2072;l3=46.6187;l4=417.1591;l5=83.500000;l6=48.4528;l7=1.2808;
a1=0;a2=-1.715;a3=0.863;a4=1.0613;a5=0.5305;a6=0;
%最后输入的六个参数是六个关节角
[R1,P1]=DH_Tool(l1,l2,l3,l4,l5,l6,l7,a1,a2,a3,a4,a5,a6,-18.7131,-38.0125,-21.9454,-1.85105,-21.4091,-316.387);
[R2,P2]=DH_Tool(l1,l2,l3,l4,l5,l6,l7,a1,a2,a3,a4,a5,a6,-25.6392,-40.426,-18.9913,30.1207,-30.654,-319.298);
[R3,P3]=DH_Tool(l1,l2,l3,l4,l5,l6,l7,a1,a2,a3,a4,a5,a6,-25.5992,-36.6993,-36.6533,124.463,-19.7611,-335.725);
[R4,P4]=DH_Tool(l1,l2,l3,l4,l5,l6,l7,a1,a2,a3,a4,a5,a6,-14.2548,-35.963,-30.2261,121.123,8.31127,-216.705);
% P=pinv([R1-R2;R2-R3;R3-R4])*[P2-P1;P3-P2;P4-P3]
%因为选择的点都不在同一平面，所以R是满秩的，rank(R)=min{m,n},m为行数，n为列数
R=[R1-R2;R2-R3;R3-R4];
%若rank(R)=m,则行满秩，pinv(R)=R'*(R*R')^(-1)
% P=R'*inv(R*R')*[P2-P1;P3-P2;P4-P3]
%若rank(R)=n,则列满秩，pinv(R)=(R'*R)^(-1)*R',此处R是一个9行3列的矩阵，行上必定线性相关，秩不满9，所以只能是3，即列满秩
P=inv(R'*R)*R'*[P2-P1;P3-P2;P4-P3]
