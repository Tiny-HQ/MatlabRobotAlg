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


function [J] = abs_prec_cal_jacobian(DH,q,tool)


    near_zero = 0.001;

    format long g;

    q1 = q(1); q2 = q(2); q3 = q(3); q4 = q(4); q5 = q(5); q6 = q(6);
    d1 = DH.d(1); d3 = DH.d(3); d4 = DH.d(4); d6 = DH.d(6);
    a1 = DH.a(2); a2 = DH.a(3); a3 = DH.a(4);
    tx = tool(1); ty = tool(2); tz = tool(3);

%     syms q1 q2 q3 q4 q5 q6 'real';
%     syms d1 d3 d4 d6 'real';
%     syms a1 a2 a3 'real';
%     syms tx ty tz 'real';

    % a1 = 0.163655; a2 = 0.550739;a3 = 0.208847;d1 =0.43; d3 = -0.001279;d4 = 0.700029;d6 = 0.115;
    % q1 = pi/3;q2 = pi/2;q3 = pi/3;q4 = pi/4;q5 = pi/5;q6 = pi/6;
    % tx = 0.0;ty = 0.0; tz = 0.0;

    al = [0.0 pi/2 0 pi/2 -pi/2 pi/2];
    a = [0 a1 a2 a3 0 0];
    d = [d1 0 d3 d4 0 d6];
    q = [q1 q2 q3 q4 q5 q6]*pi/180;

    % d1=L1;a1=L6;a2=L2;a3=L3;d4=L4;d3=L7;a6=L5;


    ca = cos(al(1));sa = sin(al(1));
    if(abs(ca)<near_zero)    ca = 0.0;end
    if(abs(sa)<near_zero)    sa = 0.0;end
    T01 = [cos(q(1)) -sin(q(1)) 0 a(1);sin(q(1))*ca cos(q(1))*ca -sa -sa*d(1);sin(q(1))*sa cos(q(1))*sa ca d(1)*ca;0 0 0 1];

    T01_dq1 = [ -sin(q1), -cos(q1), 0, 0;
            cos(q1), -sin(q1), 0, 0;
            0,        0, 0, 0;
            0,        0, 0, 0];
    T01_dd1 = [ 0, 0, 0, 0;
            0, 0, 0, 0;
            0, 0, 0, 1;
            0, 0, 0, 0];

    ca = cos(al(2));sa = sin(al(2));
    if(abs(ca)<near_zero)    ca = 0.0;end
    if(abs(sa)<near_zero)    sa = 0.0;end
    T12 = [cos(q(2)) -sin(q(2)) 0 a(2); sin(q(2))*ca cos(q(2))*ca -sa -sa*d(2);sin(q(2))*sa cos(q(2))*sa ca d(2)*ca;0 0 0 1];
    T12_dq2 = [ -sin(q2), -cos(q2), 0, 0;
            0,        0, 0, 0;
            cos(q2), -sin(q2), 0, 0;
            0,        0, 0, 0]; 
    T12_da2 = [ 0, 0, 0, 1;
            0, 0, 0, 0;
            0, 0, 0, 0;
            0, 0, 0, 0];

    ca = cos(al(3));sa = sin(al(3));
    if(abs(ca)<near_zero)    ca = 0.0;end
    if(abs(sa)<near_zero)    sa = 0.0;end
    T23 = [cos(q(3)) -sin(q(3)) 0 a(3); sin(q(3))*ca cos(q(3))*ca -sa -sa*d(3); sin(q(3))*sa cos(q(3))*sa ca d(3)*ca; 0 0 0 1];
    T23_dq3 = [ -sin(q3), -cos(q3), 0, 0;
            cos(q3), -sin(q3), 0, 0;
            0,        0, 0, 0;
            0,        0, 0, 0];    
    T23_da3 = [ 0, 0, 0, 1;
            0, 0, 0, 0;
            0, 0, 0, 0;
            0, 0, 0, 0];   
    T23_dd3 = [ 0, 0, 0, 0;
            0, 0, 0, 0;
            0, 0, 0, 1;
            0, 0, 0, 0];   


    ca = cos(al(4));sa = sin(al(4));
    if(abs(ca)<near_zero)    ca = 0.0;end
    if(abs(sa)<near_zero)    sa = 0.0;end
    T34 = [cos(q(4)) -sin(q(4)) 0 a(4); sin(q(4))*ca cos(q(4))*ca -sa -sa*d(4);sin(q(4))*sa cos(q(4))*sa ca d(4)*ca;0 0 0 1];
    T34_dq4 = [ -sin(q4), -cos(q4), 0, 0;
            0,        0, 0, 0;
            cos(q4), -sin(q4), 0, 0;
            0,        0, 0, 0];   
    T34_da4 = [ 0, 0, 0, 1;
            0, 0, 0, 0;
            0, 0, 0, 0;
            0, 0, 0, 0];   
    T34_dd4 = [ 0, 0, 0,  0;
            0, 0, 0, -1;
            0, 0, 0,  0;
            0, 0, 0,  0];    



    ca = cos(al(5));sa = sin(al(5));
    if(abs(ca)<near_zero)    ca = 0.0;end
    if(abs(sa)<near_zero)    sa = 0.0;end
    T45 = [cos(q(5)) -sin(q(5)) 0 a(5); sin(q(5))*ca cos(q(5))*ca -sa -sa*d(5); sin(q(5))*sa cos(q(5))*sa ca d(5)*ca; 0 0 0 1];
     T45_dq5 = [ -sin(q5), -cos(q5), 0, 0;
            0,        0, 0, 0;
            -cos(q5),  sin(q5), 0, 0;
            0,        0, 0, 0]; 

    ca = cos(al(6));sa = sin(al(6));
    if(abs(ca)<near_zero)    ca = 0.0;end
    if(abs(sa)<near_zero)    sa = 0.0;end
    T56 = [cos(q(6)) -sin(q(6)) 0 a(6); sin(q(6))*ca cos(q(6))*ca -sa -sa*d(6); sin(q(6))*sa cos(q(6))*sa ca d(6)*ca; 0 0 0 1];
    T56_dq6 = [ -sin(q6), -cos(q6), 0, 0;
            0,        0, 0, 0;
            cos(q6), -sin(q6), 0, 0;
            0,        0, 0, 0];
    T56_dd6 = [ 0, 0, 0,  0;
            0, 0, 0, -1;
            0, 0, 0,  0;
            0, 0, 0,  0];

    P_tool = [tx ty tz 1]';
    T_tcp = T01*T12*T23*T34*T45*T56*P_tool;

    af_aq1 = T01_dq1*T12*T23*T34*T45*T56*P_tool;
    af_ad1 = T01_dd1*T12*T23*T34*T45*T56*P_tool;

    af_aq2 = T01*T12_dq2*T23*T34*T45*T56*P_tool;
    af_aa2 = T01*T12_da2*T23*T34*T45*T56*P_tool;

    af_aq3 = T01*T12*T23_dq3*T34*T45*T56*P_tool;
    af_aa3 = T01*T12*T23_da3*T34*T45*T56*P_tool;
    af_ad3 = T01*T12*T23_dd3*T34*T45*T56*P_tool;

    af_aq4 = T01*T12*T23*T34_dq4*T45*T56*P_tool;
    af_aa4 = T01*T12*T23*T34_da4*T45*T56*P_tool;
    af_ad4 = T01*T12*T23*T34_dd4*T45*T56*P_tool;

    af_aq5 = T01*T12*T23*T34*T45_dq5*T56*P_tool;

    af_aq6 = T01*T12*T23*T34*T45*T56_dq6*P_tool;
    af_ad6 = T01*T12*T23*T34*T45*T56_dd6*P_tool;

    af_at = T01*T12*T23*T34*T45*T56*[1 1 1 1]';

    af = [af_aq1 af_ad1 af_aq2 af_aa2 af_aq3 af_aa3 af_ad3 af_aq4 af_aa4 af_ad4 af_aq5 af_aq6 af_ad6 af_at];
    J = af(1:3,:);
end














