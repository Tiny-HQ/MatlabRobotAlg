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


%�����ɶȻ�е�ۣ��������㣻�������֣�Six-degree-of-freedom robotic arm, screw calculation; humanoid hand,
%absolutely correct!!!!
%λ��ʸ����������������һ������Ҫ�����൱�鷳��ֻ��Ҫ����pz���У�pz��Լ򵥣�û��theta1��Ӱ�죬pz����ó����Եģ��ͻ����϶�������ʽ����ok��
%The position vector can't be seen as the same as in the book, it needs to be simplified, it is quite troublesome, you only need to simplify pz, pz is relatively simple, there is no influence of theta1, pz simplification is right, it is basically OK to calculate the whole formula;

clc;
clear;


syms c1 c2 c3 c4 c5 c6 s1 s2 s3 s4 s5 s6;
syms l1 l0 l2 l3 l4 l;


T1 = [c1 -s1 0 0 ;
    s1 c1 0 0 ;
    0 0 1 0;
    0 0 0 1];

T2 = [c2 0 s2 -l0*s2 ;
    0 1 0 0 ;
    -s2 0 c2 l0*(1-c2);
    0 0 0 1];


T3 = [c3 -s3 0 (l1+l2)*s3 ;
    s3 c3 0 (l1+l2)*(1-c3) ;
    0 0 1 0;
    0 0 0 1];

T4 = [c4 0 s4 -l0*s4 ;
    0 1 0 0 ;
    -s4 0 c4 l0*(1-c4);
    0 0 0 1];


T5 = [c5 -s5 0 (l1+l2+l3)*s5 ;
    s5 c5 0 (l1+l2+l3)*(1-c5) ;
    0 0 1 0;
    0 0 0 1];


T6 = [c6 0 s6 -l0*s6 ;
    0 1 0 0 ;
    -s6 0 c6 l0*(1-c6);
    0 0 0 1];



T0 = [1 0 0 0;
    0 1 0 l1+l2+l3+l4;
    0 0 1 l0;
    0 0 0 1];

 T1_4 = T1*T2*T3*T4
% 
T1_4(3,4) = c3*l0*s2*s4 - s2*s3*l1 - s2*s3*l2 - c2*l0*c4 +l0;
T1_5 = T1_4*T5
% T1_5(3,4) = l0 - c2*c4*l0 - s5*(c2*s4 + c3*c4*s2)*(l1 + l2 + l3) + c3*l0*s2*s4 - s2*s3*c5*(l1 + l2 + l3) + s2*s3*l3;
% T1_5*T6*T0


 T = T1*T2*T3*T4*T5*T6*T0;



% T = [c1 -s1 0 l*s1;
%     s1 c1 0 l*(1-c1);
%     0 0 1 0;
%     0 0 0 1];
% 
% g0 = [1 0 0 0;
%      0 1 0 l;
%      0 0 1 0;
%      0 0 0 1];
%  T*g0


% 
% T1 = [c1 -s1 0 0 ;
%     s1 c1 0 0 ;
%     0 0 1 0;
%     0 0 0 1];
% 
% T2 = [c2 -s2 0 l1*s2 ;
%     s2 c2 0 l1*(1-c2) ;
%     0 0 1 0;
%     0 0 0 1];
% 
% T3 = [c3 -s3 0 (l1+l2)*s3 ;
%     s3 c3 0 (l1+l2)*(1-c3) ;
%     0 0 1 0;
%     0 0 0 1]
% 
% 
% T0 = [1 0 0 0;
%     0 1 0 l1+l2;
%     0 0 1 l0;
%     0 0 0 1];
% 
% 
% T1*T2*T0





