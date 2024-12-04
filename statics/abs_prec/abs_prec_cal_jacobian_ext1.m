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



function J = abs_prec_cal_jacobian_ext1(DH,q,tool)



    format long g;
    
    q1 = q(1); q2 = q(2); q3 = q(3); q4 = q(4); q5 = q(5); q6 = q(6);
    d1 = DH.d(1); d3 = DH.d(3); d4 = DH.d(4); d6 = DH.d(6);
    a1 = DH.a(2); a2 = DH.a(3); a3 = DH.a(4);
    tx = tool(1); ty = tool(2); tz = tool(3);


    al = [0.0 pi/2 0 pi/2 -pi/2 pi/2];
    a = [0 a1 a2 a3 0 0];
    d = [d1 0 d3 d4 0 d6];
    q = [q1 q2 q3 q4 q5 q6]*pi/180;

    T01 = create_link(q(1),d(1),al(1),a(1),'rad');
    T12 = create_link(q(2),d(2),al(2),a(2),'rad');
    T23 = create_link(q(3),d(3),al(3),a(3),'rad');
    T34 = create_link(q(4),d(4),al(4),a(4),'rad');
    T45 = create_link(q(5),d(5),al(5),a(5),'rad');
    T56 = create_link(q(6),d(6),al(6),a(6),'rad');

    T16_ = T01*T12*T23*T34*T45*T56;
    T26_ = T12*T23*T34*T45*T56;
    T36_ = T23*T34*T45*T56;
    T46_ = T34*T45*T56;
    T56_ = T45*T56;
    T66_ = T56;
    
    G1 = cal_G_pra(a(1),al(1));
    G2 = cal_G_pra(a(2),al(2));
    G3 = cal_G_pra(a(3),al(3));
    G4 = cal_G_pra(a(4),al(4));
    G5 = cal_G_pra(a(5),al(5));
    G6 = cal_G_pra(a(6),al(6));
    

    J16 = cal_J_pra(T16_);
    J26 = cal_J_pra(T26_);
    J36 = cal_J_pra(T36_);
    J46 = cal_J_pra(T46_);
    J56 = cal_J_pra(T56_);
    J66 = cal_J_pra(T66_);
    
    J = zeros(6,24);
    %J16*G1
    J(1:6,1:4) = J16*G1;
    J(1:6,5:8) = J26*G2;
    J(1:6,9:12) = J36*G3;
    J(1:6,13:16) = J46*G4;
    J(1:6,17:20) = J56*G5;
    J(1:6,21:24) = J66*G6;


end

function G = cal_G_pra(a,al)
    G = zeros(6,4);
    
    G(1,1) = 1;G(2,2) = sin(al);G(3,2) = cos(al);
    G(2,4) = a*cos(al);G(3,4) = -a*sin(al);
    G(4,3) = 1;
    G(5,4) = sin(al); 
    G(6,4) = cos(al); 
end


function J = cal_J_pra(T)
    J = zeros(6,6);

    J(1:3,1:3) = splitT_R(T)';J(4:6,4:6) = splitT_R(T)';
    p = splitT_P(T);n = T(1:3,1);o = T(1:3,2);a = T(1:3,3);
    J(1,4:6) = cross(p,n)';
    J(2,4:6) = cross(p,o)';
    J(3,4:6) = cross(p,a)';
end
