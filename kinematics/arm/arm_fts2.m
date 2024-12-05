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

%arm_fkine�е�model2...OK!������������ʽ; model2 in arm_fkine... OK!



clc;
clear;


syms t1 t2 t3 t4 t5 t6 real;
syms a1 a2 a3 d1 d3 d4 d6 real;


syms c1 c2 c3 c4 c5 c6 real;
syms s1 s2 s3 s4 s5 s6 real;

% c1 = 1;c2 = 0;c3 = 1;c4 = 1;c5 = 1;c6 = 1;
% s1 = 0;s2 = 1;s3 = 0;s4 = 0;s5 = 0;s6 = 0;
% a2 = 0.163655;a3 = 0.550739;a4 = 0.208847;
% d1 = 0.43;d3 = -0.001279; d4 = 0.700029;d6 = 0.115;
% t1 = 0;t2 =pi/2;t3 = 0;t4 = 0;t5 = 0;t6 = 0;

T01 = trotx(0)*transl(0,0,0)*trotz(t1)*transl(0,0,d1);


T12 = trotx(pi/2)*transl(a1,0,0)*trotz(t2)*transl(0,0,0);
% 
 T23 = trotx(0)*transl(a2,0,0)*trotz(t3)*transl(0,0,d3);
% 
 T34 = trotx(pi/2)*transl(a3,0,0)*trotz(t4)*transl(0,0,d4);
% 
 T45 = trotx(-pi/2)*transl(0,0,0)*trotz(t5)*transl(0,0,0);
% 
% 
% 
 T56 = trotx(pi/2)*transl(0,0,0)*trotz(t6)*transl(0,0,d6);

% c1 = 1;c2 = 0;c3 = 1;c4 = 1;c5 = 1;c6 = 1;
% s1 = 0;s2 = 1;s3 = 0;s4 = 0;s5 = 0;s6 = 0;
% a1 = 0.163655;a2 = 0.550739;a3 = 0.208847;
% d1 = 0.43;d3 = -0.001279; d4 = 0.700029;d6 = 0.115;
% t1 = 0;t2 =pi/2;t3 = 0;t4 = 0;t5 = 0;t6 = 0;

T=T01*T12*T23*T34*T45*T56;

T_01 = [c1 -s1 0 0 ;
        s1 c1  0 0 ;
        0  0  1 d1;
        0  0  0 1];

T_12 = [c2 -s2 0 a1 ;
        0  0  -1 0 ;
        s2 c2 0 0;
        0  0  0 1];

T_23 = [c3 -s3 0 a2 ;
        s3  c3  0 0 ;
        0 0 1 d3;
        0  0  0 1];

T_34 = [c4 -s4 0 a3 ;
        0  0  -1 -d4 ;
        s4 c4 0 0;
        0  0  0 1];

T_45 = [c5 -s5 0 0 ;
        0  0  1 0;
        -s5 -c5 0 0;
        0  0  0 1];
    
T_56 = [c6 -s6 0 0 ;
        0  0  -1 -d6 ;
        s6 c6 0 0;
        0  0  0 1];

T=T_01*T_12*T_23*T_34*T_45*T_56;
T_12*T_23*T_34
T_34*T_45*T_56

c1 = 1;c2 = 0;c3 = 1;c4 = 1;c5 = 1;c6 = 1;
s1 = 0;s2 = 1;s3 = 0;s4 = 0;s5 = 0;s6 = 0;
a1 = 0.163655;a2 = 0.550739;a3 = 0.208847;
d1 = 0.43;d3 = -0.001279; d4 = 0.700029;d6 = 0.115;
t1 = 0;t2 =pi/2;t3 = 0;t4 = 0;t5 = 0;t6 = 0;

% T_temp = eye(4);
% T_temp(1,1) =  s6*(c4*s1 - s4*(c1*c2*c3 - c1*s2*s3)) - c6*(s5*(c1*c2*s3 + c1*c3*s2) - c5*(s1*s4 + c4*(c1*c2*c3 - c1*s2*s3)));
% T_temp(1,2) =  s6*(s5*(c1*c2*s3 + c1*c3*s2) - c5*(s1*s4 + c4*(c1*c2*c3 - c1*s2*s3))) + c6*(c4*s1 - s4*(c1*c2*c3 - c1*s2*s3));
% T_temp(1,3) =  c5*(c1*c2*s3 + c1*c3*s2) + s5*(s1*s4 + c4*(c1*c2*c3 - c1*s2*s3));
% T_temp(1,4) =   a1*c1 + d3*s1 + d6*(c5*(c1*c2*s3 + c1*c3*s2) + s5*(s1*s4 + c4*(c1*c2*c3 - c1*s2*s3))) + a3*(c1*c2*c3 - c1*s2*s3) + d4*(c1*c2*s3 + c1*c3*s2) + a2*c1*c2;
% 
% T_temp(2,1) = - c6*(s5*(c2*s1*s3 + c3*s1*s2) + c5*(c1*s4 - c4*(c2*c3*s1 - s1*s2*s3))) - s6*(c1*c4 + s4*(c2*c3*s1 - s1*s2*s3));
% T_temp(2,2) = s6*(s5*(c2*s1*s3 + c3*s1*s2) + c5*(c1*s4 - c4*(c2*c3*s1 - s1*s2*s3))) - c6*(c1*c4 + s4*(c2*c3*s1 - s1*s2*s3));
% T_temp(2,3) = c5*(c2*s1*s3 + c3*s1*s2) - s5*(c1*s4 - c4*(c2*c3*s1 - s1*s2*s3));
% T_temp(2,4) = a1*s1 - c1*d3 + d6*(c5*(c2*s1*s3 + c3*s1*s2) - s5*(c1*s4 - c4*(c2*c3*s1 - s1*s2*s3))) + a3*(c2*c3*s1 - s1*s2*s3) + d4*(c2*s1*s3 + c3*s1*s2) + a2*c2*s1;
% 
% T_temp(3,1) =  c6*(s5*(c2*c3 - s2*s3) + c4*c5*(c2*s3 + c3*s2)) - s4*s6*(c2*s3 + c3*s2);
% T_temp(3,2) =  - s6*(s5*(c2*c3 - s2*s3) + c4*c5*(c2*s3 + c3*s2)) - c6*s4*(c2*s3 + c3*s2);
% T_temp(3,3) =  c4*s5*(c2*s3 + c3*s2) - c5*(c2*c3 - s2*s3);
% T_temp(3,4) =  d1 + a2*s2 + a3*(c2*s3 + c3*s2) - d4*(c2*c3 - s2*s3) - d6*(c5*(c2*c3 - s2*s3) - c4*s5*(c2*s3 + c3*s2));



T_temp



