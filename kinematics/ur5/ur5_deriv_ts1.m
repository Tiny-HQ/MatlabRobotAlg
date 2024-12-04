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
format bank;
%
%+---+-----------+-----------+-----------+-----------+-----------+
%| j |     theta |         d |         a |     alpha |    offset |
%+---+-----------+-----------+-----------+-----------+-----------+
%|  1|         q1|         d1|         a0|     alpha0|          0|
%|  2|         q2|         d2|         a1|     alpha1|          0|
%|  3|         q3|         d3|         a2|     alpha2|          0|
%|  4|         q4|         d4|         a3|     alpha3|          0|
%|  5|         q5|         d5|         a4|     alpha4|          0|
%|  6|         q6|         d6|         a5|     alpha5|          0|
%+---+-----------+-----------+-----------+-----------+-----------+

%+---+-----------+-----------+-----------+-----------+-----------+
%| j |     theta |         d |         a |     alpha |    offset |
%+---+-----------+-----------+-----------+-----------+-----------+
%|  1|          0|         d1|        0.0|        0.0|          0|
%|  2|        180|        0.0|        0.0|         90|          0|
%|  3|        -90|        0.0|         a2|        0.0|          0|
%|  4|          0|         d4|         a3|        0.0|          0|
%|  5|         90|         d5|        0.0|        -90|          0|
%|  6|        180|         d6|        0.0|         90|          0|
%+---+-----------+-----------+-----------+-----------+-----------+

syms nx ny nz ox oy oz ax ay az px py pz;
syms d1 a2 a3 d4 d5 d6;
syms q1 q2 q3 q4 q5 q6;
syms c1 c2 c3 c4 c5 c6 s1 s2 s3 s4 s5 s6

syms T01 T12 T23 T34 T45 T56;
syms T01_1 T12_1 T23_1 T34_1 T45_1 T56_1;

% ??:q5?0,c5 = 1,s5 = 0;
% c5 = 1;s5 = 0;

% ???????????????????,????????????,???????;
% d1 = 162.5;a2 =  425.0;a3 = 392.25;d4 = 133.3;d5 = 99.7;d6 = 99.6;
% q = [-82.25 -171.24 125.39 -144.27 254.83 -136.18]*pi/180;
% c1 = cos(q(1));s1 = sin(q(1));
% c2 = cos(q(2));s2 = sin(q(2));
% c3 = cos(q(3));s3 = sin(q(3));
% c4 = cos(q(4));s4 = sin(q(4));
% c5 = cos(q(5));s5 = sin(q(5));
% c6 = cos(q(6));s6 = sin(q(6));

%% q1:
%rotz
T01 = [c1 -s1 0 0;s1 c1 0 0;0 0 1 d1; 0 0 0 1];
T01_1 = [c1 s1 0 0; -s1 c1 0 0;0 0 1 -d1; 0 0 0 1];


%% q2:
% rotx(90)*rotz(pi+theta);
%   [1 0 0 0;       [-c2 s2 0 0;         [ -c2 s2 0 0;
%   0 0 -1 0;   *    -s2 -c2 0 0;   =       0 0 -1 0;
%   0 1 0 0 ;       0 0 1 0;                -s2 -c2 0 0;
%   0 0 0 1]        0 0 0 1]                0 0 0 1;]
T12 = [-c2 s2 0 0;0 0 -1 0; -s2 -c2 0 0;0 0 0 1;];
T12_1 = [-c2 0 -s2 0; s2 0 -c2 0;0 -1 0 0;0 0 0 1];

%% q3:
% transx(a2)*rotz(theta)
%   [1 0 0 a2;       [c3 -s3 0 0;         [ c3 -s3 0 a2;
%   0 1 0 0;   *     s3 c3 0 0;   =       s3 c3 0 0;
%   0 0 1 0;         0 0 1 0;             0 0 1 0;
%   0 0 0 1]         0 0 0 1]             0 0 0 1;]
T23 = [c3 -s3 0 a2;s3 c3 0 0;0 0 1 0; 0 0 0 1;];


%% q4:
% transx(a3)*rotz(theta)
%   [1 0 0 a3;       [c4 -s4 0 0;         [ c4 -s4 0 a2;
%   0 1 0 0;   *     s4 c4 0 0;   =         s4 c4 0 0;
%   0 0 1 0;         0 0 1 0;              0 0 1 0;
%   0 0 0 1]         0 0 0 1]              0 0 0 1;]
T34 = [c4 -s4 0 a3; s4 c4 0 0;0 0 1 d4;0 0 0 1;];


%% q5:
% rotx(-90)*rotz(theta)*transz(d5);
%   [1 0 0 0;       [c5 -s5 0 0;         [ c5 -s5 0 0;
%   0 0 1 0;   *    s5 c5 0 0;      =      0 0 1 d5;
%   0 1 0 0 ;       0 0 1 0;               -s5 c5 0 0;
%   0 0 0 1]        0 0 0 1]                0 0 0 1;]

T45 = [c5 -s5 0 0; 0 0 1 d5;-s5 c5 0 0; 0 0 0 1;];
T45_1 = [c5 0 s5 0;s5 0 c5 0;0 1 0 -d5; 0 0 0 1];
%% q6
%T56????;
%rotx(pi/2)*rotz(theta+pi)*transz(d6);
% [1 0 0 0;     [-c6 s6 0 0 ;           [-c6 s6 0 0;
% 0 0 -1 0;   *   -s6 -c6 0 0;  =        0 0 -1 -d6;
% 0 1 0 0;        0 0 1 0;               -s6 -c6 0 0;
% 0 0 0 1]        0 0 0 1]               0 0 0 1]
%
T56 = [-c6 s6 0 0; 0 0 -1 -d6;-s6 -c6 0 0;0 0 0 1];
T56_1 = [-c6 0 -s6 0;s6 0 -c6 0;0 -1 0 -d6;0 0 0 1];


T01*T12*T23*T34*T45*T56


T06 = [nx ox ax px;ny oy ay py;nz oz az pz; 0 0 0 1];
    
%% T01_1*T06*T56_1 = T12*T23*T34*T45
T01_1*T06*T56_1
% [ s6*(c1*ox + oy*s1) - c6*(c1*nx + ny*s1), - ax*c1 - ay*s1, - c6*(c1*ox + oy*s1) - s6*(c1*nx + ny*s1), c1*px + py*s1 - d6*(ax*c1 + ay*s1)]
% [ s6*(c1*oy - ox*s1) - c6*(c1*ny - nx*s1),   ax*s1 - ay*c1, - c6*(c1*oy - ox*s1) - s6*(c1*ny - nx*s1), c1*py - px*s1 - d6*(ay*c1 - ax*s1)]
% [                           oz*s6 - c6*nz,             -az,                           - c6*oz - nz*s6,                    pz - d1 - az*d6]
% [                                       0,               0,                                         0,                                  1]
T12*T23*T34*T45
% [ -c5*(c4*(c2*c3 - s2*s3) - s4*(c2*s3 + c3*s2)), s5*(c4*(c2*c3 - s2*s3) - s4*(c2*s3 + c3*s2)), c4*(c2*s3 + c3*s2) + s4*(c2*c3 - s2*s3),   d5*(c4*(c2*s3 + c3*s2) + s4*(c2*c3 - s2*s3)) - a2*c2 - a3*(c2*c3 - s2*s3)]
% [                                            s5,                                          -c5,                                       0,                                                                         -d4]
% [ -c5*(c4*(c2*s3 + c3*s2) + s4*(c2*c3 - s2*s3)), s5*(c4*(c2*s3 + c3*s2) + s4*(c2*c3 - s2*s3)), s4*(c2*s3 + c3*s2) - c4*(c2*c3 - s2*s3), - a2*s2 - d5*(c4*(c2*c3 - s2*s3) - s4*(c2*s3 + c3*s2)) - a3*(c2*s3 + c3*s2)]
% 
% ?q1;
% ????????,-d4 = c1*py - px*s1 - d6*(ay*c1 - ax*s1),???????????;
% ??:-d4 = c1*(py-d6*ay)+s1*(d6*ax-px); ->  -d4 = c1*m+s1*n; -> sin(fai+theta1) = -d4/(m^2+n^2)^0.5;    q1 = atan2(-d4,sqrt(m^2+n^2-d4^2))-atan2(m,n)
% ?q5;
% ??????:
% -c5 = ax*s1 - ay*c1; 
% ?q6;
% ?????????????;
% s5 = s6*(c1*oy - ox*s1) - c6*(c1*ny - nx*s1) -> s5 = s6*m - c6*n
% 0 =- c6*(c1*oy - ox*s1) - s6*(c1*ny - nx*s1) -> 0 = -c6*m - s6*n  ->    q6 = atan2(n,m)+atan2(s5,0);


%%
% T01_1*T06*T56_1*T45_1 = T12*T23*T34
T01_1*T06*T56_1*T45_1;
% [ - c5*(c6*(c1*nx + ny*s1) - s6*(c1*ox + oy*s1)) - s5*(ax*c1 + ay*s1), - c6*(c1*ox + oy*s1) - s6*(c1*nx + ny*s1), - s5*(c6*(c1*nx + ny*s1) - s6*(c1*ox + oy*s1)) - c5*(ax*c1 + ay*s1), c1*px + py*s1 + d5*(c6*(c1*ox + oy*s1) + s6*(c1*nx + ny*s1)) - d6*(ax*c1 + ay*s1)]
% [ - c5*(c6*(c1*ny - nx*s1) - s6*(c1*oy - ox*s1)) - s5*(ay*c1 - ax*s1), - c6*(c1*oy - ox*s1) - s6*(c1*ny - nx*s1), - s5*(c6*(c1*ny - nx*s1) - s6*(c1*oy - ox*s1)) - c5*(ay*c1 - ax*s1), c1*py - px*s1 + d5*(c6*(c1*oy - ox*s1) + s6*(c1*ny - nx*s1)) - d6*(ay*c1 - ax*s1)]
% [                                        - az*s5 - c5*(c6*nz - oz*s6),                           - c6*oz - nz*s6,                                        - az*c5 - s5*(c6*nz - oz*s6),                                              pz - d1 - az*d6 + d5*(c6*oz + nz*s6)]
% [                                                                   0,                                         0,                                                                   0,                                                                                 1]  
T12*T23*T34;
% [   s4*(c2*s3 + c3*s2) - c4*(c2*c3 - s2*s3), c4*(c2*s3 + c3*s2) + s4*(c2*c3 - s2*s3),  0, - a2*c2 - a3*(c2*c3 - s2*s3)]
% [                                         0,                                       0, -1,                          -d4]
% [ - c4*(c2*s3 + c3*s2) - s4*(c2*c3 - s2*s3), s4*(c2*s3 + c3*s2) - c4*(c2*c3 - s2*s3),  0, - a2*s2 - a3*(c2*s3 + c3*s2)]
% [                                         0,                                       0,  0,                            1]
% ?q3:
% ?????????????;
% c2*a2+a3*c23 = x....(-(c1*px + py*s1 + d5*(c6*(c1*ox + oy*s1) + s6*(c1*nx + ny*s1)) - d6*(ax*c1 + ay*s1)))    ??
% s2*a2+a3*s23 = y....(-(pz - d1 - az*d6 + d5*(c6*oz + nz*s6)))     ??
% ????+???? = x^2+y^2 = a2^2+a3^2+2*a2*a3*c3;    q3 = ±acos((x^2+y^2-a2^2-a3^2)/(2*a2*a3))
% ?q2:
% ??????q3???????????,????c2?s2;
% [c2] *[A B] = [M]   A = a2+a3*c3  B = -a3*s3;     M = -x;
% [s2]  [C D]   [N]   C = -s3*a3   D = a2+a3*c3;    N = -y;
% c2 = (DM-NB)/(AD-BC); s2 = (AN-CM)/(AD-BC);
% ?q4:
% ?????????????
%- c6*(c1*ox + oy*s1) - s6*(c1*nx + ny*s1) = s234
% c6*oz + nz*s6 = c234;
%





