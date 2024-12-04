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






function [q] = ur5_ikine(DH,T)


    d1 = DH.d(1);
    d4 = DH.d(4); d5 = DH.d(5); d6 = DH.d(6);
    a2 = DH.a(3); a3 = DH.a(4);

    nx = T(1,1); ny = T(2,1); nz = T(3,1);
    ox = T(1,2); oy = T(2,2); oz = T(3,2);
    ax = T(1,3); ay = T(2,3); az = T(3,3);
    px = T(1,4); py = T(2,4); pz = T(3,4);
    
    m = py-d6*ay;n = d6*ax-px;
    
    %q1:
    q1(1) = atan2(-d4,sqrt(m^2 + n^2-d4^2))-atan2(m,n);
    q1(2) = atan2(-d4,-sqrt(m^2 + n^2-d4^2))-atan2(m,n);
    
    qa = atan2(-ax,ay)*180/pi

    %q5:
    c1 = cos(q1(1));s1 = sin(q1(1));
    c5 = ax*s1 - ay*c1;s5_1 = sqrt(1-c5^2);s5_2 = -sqrt(1-c5^2);
    q5(1) = atan2(s5_1,c5); q5(2) = atan2(s5_2,c5);
    
    c1 = cos(q1(2));s1 = sin(q1(2));
    c5 = ax*s1 - ay*c1;s5_1 = sqrt(1-c5^2);s5_2 = -sqrt(1-c5^2);
    q5(3) = atan2(s5_1,c5); q5(4) = atan2(s5_2,c5);
    
    %q6:
    c1 = cos(q1(1));s1 = sin(q1(1));s5 = sin(q5(1));
    m = c1*oy - ox*s1;n = c1*ny - nx*s1;
    q6(1) = atan2(n,m)+atan2(s5,0);
    s5 = sin(q5(2));
    q6(2) = atan2(n,m)+atan2(s5,0);
    
    c1 = cos(q1(2));s1 = sin(q1(2));s5 = sin(q5(1));
    m = c1*oy - ox*s1;n = c1*ny - nx*s1;
    q6(3) = atan2(n,m)+atan2(s5,0);
    s5 = sin(q5(2));
    q6(4) = atan2(n,m)+atan2(s5,0);
    
    [q3(1),q3(2)] = cal_formula_q3(T,DH,sin(q1(1)),cos(q1(1)),sin(q6(1)),cos(q6(1)));
    [q3(3),q3(4)] = cal_formula_q3(T,DH,sin(q1(1)),cos(q1(1)),sin(q6(2)),cos(q6(2)));
    [q3(5),q3(6)] = cal_formula_q3(T,DH,sin(q1(2)),cos(q1(2)),sin(q6(3)),cos(q6(3)));
    [q3(7),q3(8)] = cal_formula_q3(T,DH,sin(q1(2)),cos(q1(2)),sin(q6(4)),cos(q6(4)));
    
    [q2(1)] = cal_formula_q2(T,DH,sin(q1(1)),cos(q1(1)),sin(q6(1)),cos(q6(1)),sin(q3(1)),cos(q3(1)));
    [q2(2)] = cal_formula_q2(T,DH,sin(q1(1)),cos(q1(1)),sin(q6(1)),cos(q6(1)),sin(q3(2)),cos(q3(2)));
    [q2(3)] = cal_formula_q2(T,DH,sin(q1(1)),cos(q1(1)),sin(q6(2)),cos(q6(2)),sin(q3(3)),cos(q3(3)));
    [q2(4)] = cal_formula_q2(T,DH,sin(q1(1)),cos(q1(1)),sin(q6(2)),cos(q6(2)),sin(q3(4)),cos(q3(4)));
    [q2(5)] = cal_formula_q2(T,DH,sin(q1(2)),cos(q1(2)),sin(q6(3)),cos(q6(3)),sin(q3(5)),cos(q3(5)));
    [q2(6)] = cal_formula_q2(T,DH,sin(q1(2)),cos(q1(2)),sin(q6(3)),cos(q6(3)),sin(q3(6)),cos(q3(6)));
    [q2(7)] = cal_formula_q2(T,DH,sin(q1(2)),cos(q1(2)),sin(q6(4)),cos(q6(4)),sin(q3(7)),cos(q3(7)));
    [q2(8)] = cal_formula_q2(T,DH,sin(q1(2)),cos(q1(2)),sin(q6(4)),cos(q6(4)),sin(q3(8)),cos(q3(8)));
    
    [q4(1)] = cal_formula_q4(T,sin(q1(1)),cos(q1(1)),sin(q6(1)),cos(q6(1)),q2(1),q3(1));
    [q4(2)] = cal_formula_q4(T,sin(q1(1)),cos(q1(1)),sin(q6(1)),cos(q6(1)),q2(2),q3(2));
    [q4(3)] = cal_formula_q4(T,sin(q1(1)),cos(q1(1)),sin(q6(2)),cos(q6(2)),q2(3),q3(3));
    [q4(4)] = cal_formula_q4(T,sin(q1(1)),cos(q1(1)),sin(q6(2)),cos(q6(2)),q2(4),q3(4));
    [q4(5)] = cal_formula_q4(T,sin(q1(2)),cos(q1(2)),sin(q6(3)),cos(q6(3)),q2(5),q3(5));
    [q4(6)] = cal_formula_q4(T,sin(q1(2)),cos(q1(2)),sin(q6(3)),cos(q6(3)),q2(6),q3(6));
    [q4(7)] = cal_formula_q4(T,sin(q1(2)),cos(q1(2)),sin(q6(4)),cos(q6(4)),q2(7),q3(7));
    [q4(8)] = cal_formula_q4(T,sin(q1(2)),cos(q1(2)),sin(q6(4)),cos(q6(4)),q2(8),q3(8));
  
    q = zeros(8,6);
    q = [q1(1) q2(1) q3(1) q4(1) q5(1) q6(1);
        q1(1) q2(2) q3(2) q4(2) q5(1) q6(1);
        q1(1) q2(3) q3(3) q4(3) q5(2) q6(2);
        q1(1) q2(4) q3(4) q4(4) q5(2) q6(2);
        q1(2) q2(5) q3(5) q4(5) q5(3) q6(3);
        q1(2) q2(6) q3(6) q4(6) q5(3) q6(3);
        q1(2) q2(7) q3(7) q4(7) q5(4) q6(4);
        q1(2) q2(8) q3(8) q4(8) q5(4) q6(4);];
   
    q = q*180/pi;
    return;
end


function [q,q_] = cal_formula_q3(T,DH,s1,c1,s6,c6)
    d1 = DH.d(1);
    d4 = DH.d(4); d5 = DH.d(5); d6 = DH.d(6);
    a2 = DH.a(3); a3 = DH.a(4);

    nx = T(1,1); ny = T(2,1); nz = T(3,1);ox = T(1,2); oy = T(2,2); oz = T(3,2);ax = T(1,3); ay = T(2,3); az = T(3,3);px = T(1,4); py = T(2,4); pz = T(3,4);
    x = c1*px + py*s1 + d5*(c6*(c1*ox + oy*s1) + s6*(c1*nx + ny*s1)) - d6*(ax*c1 + ay*s1);
    y = pz - d1 - az*d6 + d5*(c6*oz + nz*s6);
    q = acos((x^2+y^2-a2^2-a3^2)/(2*a2*a3));q_ = -acos((x^2+y^2-a2^2-a3^2)/(2*a2*a3));
end

function [q] = cal_formula_q2(T,DH,s1,c1,s6,c6,s3,c3)
    d1 = DH.d(1);
    d4 = DH.d(4); d5 = DH.d(5); d6 = DH.d(6);
    a2 = DH.a(3); a3 = DH.a(4);
    
    nx = T(1,1); ny = T(2,1); nz = T(3,1);ox = T(1,2); oy = T(2,2); oz = T(3,2);ax = T(1,3); ay = T(2,3); az = T(3,3);px = T(1,4); py = T(2,4); pz = T(3,4);
    
    x = c1*px + py*s1 + d5*(c6*(c1*ox + oy*s1) + s6*(c1*nx + ny*s1)) - d6*(ax*c1 + ay*s1);
    y = pz - d1 - az*d6 + d5*(c6*oz + nz*s6);
    
    A = a2+a3*c3;B = -a3*s3;
    C = s3*a3;  D = a2+a3*c3;      M = -x;N = -y;
    
    c2 = (D*M-N*B)/(A*D-B*C); s2 = (A*N-C*M)/(A*D-B*C);
    q = atan2(s2,c2);
end

function [q] = cal_formula_q4(T,s1,c1,s6,c6,q2,q3)
    nx = T(1,1); ny = T(2,1); nz = T(3,1);ox = T(1,2); oy = T(2,2); oz = T(3,2);   
   s234 = -c6*(c1*ox + oy*s1) - s6*(c1*nx + ny*s1) ;
   c234 = c6*oz + nz*s6 ;
   q = atan2(s234,c234) - q2 - q3;
end

