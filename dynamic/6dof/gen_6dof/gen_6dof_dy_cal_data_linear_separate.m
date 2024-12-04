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


function tao = gen_6dof_dy_cal_data_linear_separate(q,dq,ddq)



    global g m1 m2 m3 m4 m5 m6;
  	global ii1 ii2 ii3 ii4 ii5 ii6 U_r;
    global Pc111 Pc222 Pc333 Pc444 Pc555 Pc666;
    global P001 P112 P223 P334 P445 P556 ;
    
    Ii11xx = ii1(1,1);Ii11xy = ii1(1,2);Ii11xz = ii1(1,3);
    Ii11yy = ii1(2,2);Ii11yz = ii1(2,3);Ii11zz = ii1(3,3);
    
    Ii22xx = ii2(1,1);Ii22xy = ii2(1,2);Ii22xz = ii2(1,3);
    Ii22yy = ii2(2,2);Ii22yz = ii2(2,3);Ii22zz = ii2(3,3);
    
    Ii33xx = ii3(1,1);Ii33xy = ii3(1,2);Ii33xz = ii3(1,3);
    Ii33yy = ii3(2,2);Ii33yz = ii3(2,3);Ii33zz = ii3(3,3);
    
    Ii44xx = ii4(1,1);Ii44xy = ii4(1,2);Ii44xz = ii4(1,3);
    Ii44yy = ii4(2,2);Ii44yz = ii4(2,3);Ii44zz = ii4(3,3);
    
    Ii55xx = ii5(1,1);Ii55xy = ii5(1,2);Ii55xz = ii5(1,3);
    Ii55yy = ii5(2,2);Ii55yz = ii5(2,3);Ii55zz = ii5(3,3);
    
    Ii66xx = ii6(1,1);Ii66xy = ii6(1,2);Ii66xz = ii6(1,3);
    Ii66yy = ii6(2,2);Ii66yz = ii6(2,3);Ii66zz = ii6(3,3);
    
    fi1 = [m1 m1*Pc111(1) m1*Pc111(2) m1*Pc111(3) Ii11xx Ii11xy Ii11xz Ii11yy Ii11yz Ii11zz]';
    fi2 = [m2 m2*Pc222(1) m2*Pc222(2) m2*Pc222(3) Ii22xx Ii22xy Ii22xz Ii22yy Ii22yz Ii22zz]';
    fi3 = [m3 m3*Pc333(1) m3*Pc333(2) m3*Pc333(3) Ii33xx Ii33xy Ii33xz Ii33yy Ii33yz Ii33zz]';
    fi4 = [m4 m4*Pc444(1) m4*Pc444(2) m4*Pc444(3) Ii44xx Ii44xy Ii44xz Ii44yy Ii44yz Ii44zz]';
    fi5 = [m5 m5*Pc555(1) m5*Pc555(2) m5*Pc555(3) Ii55xx Ii55xy Ii55xz Ii55yy Ii55yz Ii55zz]';
    fi6 = [m6 m6*Pc666(1) m6*Pc666(2) m6*Pc666(3) Ii66xx Ii66xy Ii66xz Ii66yy Ii66yz Ii66zz]';
    
    fi = [fi1;fi2;fi3;fi4;fi5;fi6];

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
    R12 = splitT_R(hrotx(-90)*hrotz(qq2-90));       R21 = R12';
    R23 = splitT_R(hrotz(qq3));              R32 = R23';
    R34 = splitT_R(hrotx(-90)*hrotz(qq4));     R43 = R34';
    R45 = splitT_R(hrotx(90)*hrotz(qq5));      R54 = R45';
    R56 = splitT_R(hrotx(-90)*hrotz(qq6));  R65 = R56';


    Z111 = [0 0 1]'; Z222 = [0 0 1]'; Z333 = [0 0 1]'; Z444 = [0 0 1]'; Z555 = [0 0 1]'; Z666 = [0 0 1]'; 

    w000 = [0 0 0]';     dw000 = [0 0 0]';     v000 = [0 0 0]';    dv000 = [0 0 g]';

    [w101, dw101 ,dv101 ,dvc101]=cal_single_motion(R10,w000,dw000,dqq1,Z111,ddqq1,P001,dv000,Pc111);
    [w202, dw202 ,dv202 ,dvc202]=cal_single_motion(R21,w101,dw101,dqq2,Z222,ddqq2,P112,dv101,Pc222);
    [w303, dw303 ,dv303 ,dvc303]=cal_single_motion(R32,w202,dw202,dqq3,Z333,ddqq3,P223,dv202,Pc333);
    [w404, dw404 ,dv404 ,dvc404]=cal_single_motion(R43,w303,dw303,dqq4,Z444,ddqq4,P334,dv303,Pc444);
    [w505, dw505 ,dv505 ,dvc505]=cal_single_motion(R54,w404,dw404,dqq5,Z555,ddqq5,P445,dv404,Pc555);
    [w606, dw606 ,dv606 ,dvc606]=cal_single_motion(R65,w505,dw505,dqq6,Z666,ddqq6,P556,dv505,Pc666);

    A1 = zeros(6,10);A2 = zeros(6,10);A3 = zeros(6,10);A4 = zeros(6,10);A5 = zeros(6,10);A6 = zeros(6,10);
    A1(1:3,1) = dv101;A1(1:3,2:4) = S_alg(dw101)+S_alg(w101)*S_alg(w101);
    A1(4:6,2:4) = -S_alg(dv101);A1(4:6,5:10) = K_alg(dw101)+S_alg(w101)*K_alg(w101);
    
    A2(1:3,1) = dv202;A2(1:3,2:4) = S_alg(dw202)+S_alg(w202)*S_alg(w202);
    A2(4:6,2:4) = -S_alg(dv202);A2(4:6,5:10) = K_alg(dw202)+S_alg(w202)*K_alg(w202);
    
    A3(1:3,1) = dv303;A3(1:3,2:4) = S_alg(dw303)+S_alg(w303)*S_alg(w303);
    A3(4:6,2:4) = -S_alg(dv303);A3(4:6,5:10) = K_alg(dw303)+S_alg(w303)*K_alg(w303);
    
    A4(1:3,1) = dv404;A4(1:3,2:4) = S_alg(dw404)+S_alg(w404)*S_alg(w404);
    A4(4:6,2:4) = -S_alg(dv404);A4(4:6,5:10) = K_alg(dw404)+S_alg(w404)*K_alg(w404);
    
    A5(1:3,1) = dv505;A5(1:3,2:4) = S_alg(dw505)+S_alg(w505)*S_alg(w505);
    A5(4:6,2:4) = -S_alg(dv505);A5(4:6,5:10) = K_alg(dw505)+S_alg(w505)*K_alg(w505);
    
    A6(1:3,1) = dv606;A6(1:3,2:4) = S_alg(dw606)+S_alg(w606)*S_alg(w606);
    A6(4:6,2:4) = -S_alg(dv606);A6(4:6,5:10) = K_alg(dw606)+S_alg(w606)*K_alg(w606);
    

    T12 = [R12 zeros(3,3);S_alg(P112)*R12 R12];
    T23 = [R23 zeros(3,3);S_alg(P223)*R23 R23];
    T34 = [R34 zeros(3,3);S_alg(P334)*R34 R34]; 
    T45 = [R45 zeros(3,3);S_alg(P445)*R45 R45];
    T56 = [R56 zeros(3,3);S_alg(P556)*R56 R56];

    
    U11 = A1;U12 = T12*A2;U13 = T12*T23*A3;U14 = T12*T23*T34*A4;U15 = T12*T23*T34*T45*A5;U16 = T12*T23*T34*T45*T56*A6;
    U22 = A2;U23 = T23*A3;U24 = T23*T34*A4;U25 = T23*T34*T45*A5;U26 = T23*T34*T45*T56*A6;
    U33 = A3;U34 = T34*A4;U35 = T34*T45*A5;U36 = T34*T45*T56*A6;
    U44 = A4;U45 = T45*A5;U46 = T45*T56*A6;
    U55 = A5;U56 = T56*A6;
    U66 = A6;
    
        
    U = [U11 U12 U13 U14 U15 U16;
        zeros(6,10) U22 U23 U24 U25 U26;
        zeros(6,10) zeros(6,10) U33 U34 U35 U36;
        zeros(6,10) zeros(6,10) zeros(6,10) U44 U45 U46;
        zeros(6,10) zeros(6,10) zeros(6,10) zeros(6,10) U55 U56;
        zeros(6,10) zeros(6,10) zeros(6,10) zeros(6,10) zeros(6,10) U66;];
    
    
    U_r = [U(6,:);
        U(12,:);
        U(18,:);
        U(24,:);
        U(30,:);
        U(36,:);];

    
    f = U*fi;
    
    tao = U_r*fi;



end
function [w, dw ,dv ,dvc]=cal_single_motion(R,w0,dw0,dq,Z,ddq,P01,dv0,Pc)
    w = R*w0+dq*Z;
    dw = R*dw0+cross(R*w0,dq*Z)+ddq*Z;
    dv = R*(cross(dw0,P01)+cross(w0,cross(w0,P01))+dv0);
    dvc = cross(dw,Pc)+cross(w,cross(w,Pc))+dv;
end
