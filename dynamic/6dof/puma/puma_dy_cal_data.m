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






function tao = puma_dy_cal_data(q,dq,ddq)



    global g m1 m2 m3 m4 m5 m6;
  	global ic1 ic2 ic3 ic4 ic5 ic6;
    global Pc111 Pc222 Pc333 Pc444 Pc555 Pc666;
    global P001 P112 P223 P334 P445 P556 P667;

    qq1 = q(1);
    qq2 = q(2);
    qq3 = q(3);
    qq4 = q(4);
    qq5 = q(5);
    qq6 = q(6);

    dqq1 = dq(1)*pi/180.0;
    dqq2 = dq(2)*pi/180.0;
    dqq3 = dq(3)*pi/180.0;
    dqq4 = dq(4)*pi/180.0;
    dqq5 = dq(5)*pi/180.0;
    dqq6 = dq(6)*pi/180.0;

    ddqq1 = ddq(1)*pi/180.0;
    ddqq2 = ddq(2)*pi/180.0;
    ddqq3 = ddq(3)*pi/180.0;
    ddqq4 = ddq(4)*pi/180.0;
    ddqq5 = ddq(5)*pi/180.0;
    ddqq6 = ddq(6)*pi/180.0;
    
    R01 = splitT_R(hrotz(qq1));                 R10 = R01';
    R12 = splitT_R(hrotx(-90)*hrotz(qq2));       R21 = R12';
    R23 = splitT_R(hrotz(qq3-180));              R32 = R23';
    R34 = splitT_R(hrotx(-90)*hrotz(qq4));     R43 = R34';
    R45 = splitT_R(hrotx(90)*hrotz(qq5));      R54 = R45';
    R56 = splitT_R(hrotx(-90)*hrotz(qq6+180));  R65 = R56';


    Z111 = [0 0 1]'; Z222 = [0 0 1]'; Z333 = [0 0 1]'; Z444 = [0 0 1]'; Z555 = [0 0 1]'; Z666 = [0 0 1]'; 

    w000 = [0 0 0]';     dw000 = [0 0 0]';     v000 = [0 0 0]';    dv000 = [0 0 g]';

    %1->6.c
    [w101, dw101 ,dv101 ,dvc101]=cal_single_motion(R10,w000,dw000,dqq1,Z111,ddqq1,P001,dv000,Pc111);
    [Fc101,Nc101] = cal_single_FN(m1,dvc101,ic1,dw101,w101);
    [w202, dw202 ,dv202 ,dvc202]=cal_single_motion(R21,w101,dw101,dqq2,Z222,ddqq2,P112,dv101,Pc222);
    [Fc202,Nc202] = cal_single_FN(m2,dvc202,ic2,dw202,w202);
    [w303, dw303 ,dv303 ,dvc303]=cal_single_motion(R32,w202,dw202,dqq3,Z333,ddqq3,P223,dv202,Pc333);
    [Fc303,Nc303] = cal_single_FN(m3,dvc303,ic3,dw303,w303);
    [w404, dw404 ,dv404 ,dvc404]=cal_single_motion(R43,w303,dw303,dqq4,Z444,ddqq4,P334,dv303,Pc444);
    [Fc404,Nc404] = cal_single_FN(m4,dvc404,ic4,dw404,w404);
    [w505, dw505 ,dv505 ,dvc505]=cal_single_motion(R54,w404,dw404,dqq5,Z555,ddqq5,P445,dv404,Pc555);
    [Fc505,Nc505] = cal_single_FN(m5,dvc505,ic5,dw505,w505);
    [w606, dw606 ,dv606 ,dvc606]=cal_single_motion(R65,w505,dw505,dqq6,Z666,ddqq6,P556,dv505,Pc666);
    [Fc606,Nc606] = cal_single_FN(m6,dvc606,ic6,dw606,w606);

    %6->1
    R67 = eye(3);n707 = [0 0 0]';f707 = [0 0 0]';
   
    [f606,n606] = cal_single_fn(R67,f707,Fc606,Nc606,n707,Pc666,P667);
    [f505,n505] = cal_single_fn(R56,f606,Fc505,Nc505,n606,Pc555,P556);
    [f404,n404] = cal_single_fn(R45,f505,Fc404,Nc404,n505,Pc444,P445);
    [f303,n303] = cal_single_fn(R34,f404,Fc303,Nc303,n404,Pc333,P334);
    [f202,n202] = cal_single_fn(R23,f303,Fc202,Nc202,n303,Pc222,P223);
    [f101,n101] = cal_single_fn(R12,f202,Fc101,Nc101,n202,Pc111,P112);

    tao(1) = n101(3);
    tao(2) = n202(3);
    tao(3) = n303(3);
    tao(4) = n404(3);
    tao(5) = n505(3);
    tao(6) = n606(3);



end

function [w, dw ,dv ,dvc]=cal_single_motion(R,w0,dw0,dq,Z,ddq,P01,dv0,Pc)
    w = R*w0+dq*Z;
    dw = R*dw0+cross(R*w0,dq*Z)+ddq*Z;
    dv = R*(cross(dw0,P01)+cross(w0,cross(w0,P01))+dv0);
    dvc = cross(dw,Pc)+cross(w,cross(w,Pc))+dv;
end

function [Fc,Nc] = cal_single_FN(m,dvc,ic,dw,w)
    Fc = m*dvc;
    Nc = ic*dw+cross(w,ic*w);
end

function [f,n] = cal_single_fn(R,f1,Fc1,Nc1,n2,Pc,P)
    f = R*f1 + Fc1 ;
    n = Nc1 + R*n2 + cross(Pc,Fc1) +cross (P,R*f1) ;
end
%
%     w101 = R10*w000+dqq1*Z111;
%     dw101 = R10*dw000+cross(R10*w000,dqq1*Z111)+ddqq1*Z111;
%     dv101 = R10*(cross(dw000,P001)+cross(w000,cross(w000,P001))+dv000);
%     dvc101 = cross(dw101,Pc111)+cross(w101,cross(w101,Pc111))+dv101;

%     w202 = R21*w101+dqq2*Z222;
%     dw202 = R21*dw101+cross(R21*w101,dqq2*Z222)+ddqq2*Z222;
%     dv202 = R21*(cross(dw101,P112)+cross(w101,cross(w101,P112))+dv101);
%     dvc202 = cross(dw202,Pc222)+cross(w202,cross(w202,Pc222))+dv202;
%     w303 = R32*w202+dqq3*Z333;
%     dw303 = R32*dw202+cross(R32*w202,dqq3*Z333)+ddqq3*Z333;
%     dv303 = R32*(cross(dw202,P223)+cross(w202,cross(w202,P223))+dv202);
%     dvc303 = cross(dw303,Pc333)+cross(w303,cross(w303,Pc333))+dv303;
%     w404 = R43*w303+dqq4*Z444;
%     dw404 = R43*dw303+cross(R43*w303,dqq4*Z444)+ddqq4*Z444;
%     dv404 = R43*(cross(dw303,P334)+cross(w303,cross(w303,P334))+dv303);
%     dvc404 = cross(dw404,Pc444)+cross(w404,cross(w404,Pc444))+dv404;
%     w505 = R54*w404+dqq5*Z555;
%     dw505 = R54*dw404+cross(R54*w404,dqq5*Z555)+ddqq5*Z555;
%     dv505 = R54*(cross(dw404,P445)+cross(w404,cross(w404,P445))+dv404);
%     dvc505 = cross(dw505,Pc555)+cross(w505,cross(w505,Pc555))+dv505;
%     w606 = R65*w505+dqq6*Z666;
%     dw606 = R65*dw505+cross(R65*w505,dqq6*Z666)+ddqq6*Z666;
%     dv606 = R65*(cross(dw505,P556)+cross(w505,cross(w505,P556))+dv505);
%     dvc606 = cross(dw606,Pc666)+cross(w606,cross(w606,Pc666))+dv606;
%     Fc101 = m1*dvc101;
%     Nc101 = ic1*dw101+cross(w101,ic1*w101); 
%         Fc202 = m2*dvc202;
%     Nc202 = ic2*dw202+cross(w202,ic2*w202);
%         Fc303 = m3*dvc303;
%     Nc303 = ic3*dw303+cross(w303,ic3*w303);
%         Fc404 = m4*dvc404;
%     Nc404 = ic4*dw404+cross(w404,ic4*w404);
%         Fc505 = m5*dvc505;
%     Nc505 = ic5*dw505+cross(w505,ic5*w505);
%         Fc606 = m6*dvc606;
%     Nc606 = ic6*dw606+cross(w606,ic6*w606);
%     f606 = R67*f707 + Fc606 ;
%     n606 = Nc606 + R67*n707 + cross(Pc666,Fc606) +cross (P667,R67*f707) ;
%     f505 = R56*f606 + Fc505 ;
%     n505 = Nc505 + R56*n606 + cross(Pc555,Fc505) +cross (P556,R56*f606) ;

%     f404 = R45*f505 + Fc404 ;
%     n404 = Nc404 + R45*n505 + cross(Pc444,Fc404) +cross (P445,R45*f505) ;
%     f303 = R34*f404 + Fc303 ;
%     n303 = Nc303 + R34*n404 + cross(Pc333,Fc303) +cross (P334,R34*f404) ;
%     f202 = R23*f303 + Fc202 ;
%     n202 = Nc202 + R23*n303 + cross(Pc222,Fc202) +cross (P223,R23*f303) ;
%     f101 = R12*f202 + Fc101 ;
%     n101 = Nc101 + R12*n202 + cross(Pc111,Fc101) +cross (P112,R12*f202) ;