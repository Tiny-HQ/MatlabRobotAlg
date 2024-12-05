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


function tao = gen_6dof_dy_cal_data_min_param(q,dq,ddq)

    global g m1 m2 m3 m4 m5 m6;
  	global ii1 ii2 ii3 ii4 ii5 ii6 U_r;
    global Pc111 Pc222 Pc333 Pc444 Pc555 Pc666;
    global P001 P112 P223 P334 P445 P556 ;
    global a3 a4 d3 d4 a2 d6;
    
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

    qq1 = q(1);    qq2 = q(2);    qq3 = q(3);    qq4 = q(4);    qq5 = q(5);
    qq6 = q(6);

    dqq1 = dq(1)*pi/180.0;    dqq2 = dq(2)*pi/180.0;    dqq3 = dq(3)*pi/180.0;    dqq4 = dq(4)*pi/180.0;    dqq5 = dq(5)*pi/180.0;    dqq6 = dq(6)*pi/180.0;

    ddqq1 = ddq(1)*pi/180.0;    ddqq2 = ddq(2)*pi/180.0;    ddqq3 = ddq(3)*pi/180.0;    ddqq4 = ddq(4)*pi/180.0;    ddqq5 = ddq(5)*pi/180.0;    ddqq6 = ddq(6)*pi/180.0;
    
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
    
%     tao = U_r*fi;
      %% ��С��;
     %% ���Ե����ؽڵ���д��С���������ؽ��Ȳ��������ok������������ȷ������Ҳ����һ�£�Ϊɶ�����᲻�ԣ�������Ϊд�����ؽ�ʱ�������ؽڵ���Ӧ��������Ҫɾ���������������ỹû���ʱ���Ż᲻�ԣ���������ֻ��Ҫ��ע���������ؼ���;
      %  Try writing the minimum set for the sixth joint separately, leaving the others unchanged. The result is okay. The sixth axis result is correct. Here's an explanation of why the other axes are not correct. That's because when writing the sixth joint, the corresponding column items for the sixth joint need to be deleted, so the other axes are not complete yet and will not be correct. Therefore, we only need to focus on the sixth axis torque
     %     YY6 = Ii66yy;M6 = m6;
%     MX6 = m6*Pc666(1); MY6 = m6*Pc666(2);MZ6 = m6*Pc666(3);
%     XX6 = Ii66xx-YY6; XY6 = Ii66xy;XZ6 = Ii66xz;YZ6 = Ii66yz;ZZ6 = Ii66zz;
%     fi6_min_param = [MX6 MY6 XX6 XY6 XZ6 YZ6 ZZ6]';
%     fi_min = [fi1;fi2;fi3;fi4;fi5;fi6_min_param];
%     U_min_param = zeros(6,57);%ÿһ����д����С��֮�󣬾ͻ��ٶ�Ӧ��������
%     U_min_param(:,1:50) = U_r(:,1:50);
%     U_min_param(:,51) = U_r(:,52);
%     U_min_param(:,52) = U_r(:,53);
%     U_min_param(:,53) = U_r(:,55);
%     U_min_param(:,54) = U_r(:,56);
%     U_min_param(:,55) = U_r(:,57);
%     U_min_param(:,56) = U_r(:,59);
%     U_min_param(:,57) = U_r(:,60);  
%     tao = U_min_param*fi_min;
    
    %% ���Ե��塢���ؽڵ���д��С���������ؽ��Ȳ�����5��6����ok��
    %Try writing the minimal sets for joints 5 and 6 separately, leaving the other joints unchanged. The results for joints 5 and 6 are okay
%     YY6 = Ii66yy;M6 = m6;
%     MX6 = m6*Pc666(1); MY6 = m6*Pc666(2);MZ6 = m6*Pc666(3);
%     XX6 = Ii66xx-YY6; XY6 = Ii66xy;XZ6 = Ii66xz;YZ6 = Ii66yz;ZZ6 = Ii66zz;
%     YY5 = Ii55yy;M5 = m5+m6;
%     MX5 = m5*Pc555(1);MY5 = m5*Pc555(2)+(MZ6+d6*M6);MZ5 = m5*Pc555(3);
%     XX5 = Ii55xx-YY5+YY6+2*d6*MZ6+d6^2*M6;XY5 = Ii55xy;XZ5 = Ii55xz;YZ5 = Ii55yz;ZZ5 = Ii55zz+YY6+2*d6*MZ6+d6^2*M6;
%     fi5_min_param = [MX5 MY5 XX5 XY5 XZ5 YZ5 ZZ5]';
%     fi6_min_param = [MX6 MY6 XX6 XY6 XZ6 YZ6 ZZ6]';
%     fi_min = [fi1;fi2;fi3;fi4;fi5_min_param;fi6_min_param];
%     U_min_param = zeros(6,54);%ÿһ����д����С��֮�󣬾ͻ��ٶ�Ӧ��������%After each axis is written as a minimal set, there will be one fewer corresponding column.
%     U_min_param(:,1:40) = U_r(:,1:40);
%     U_min_param(:,41) = U_r(:,42);
%     U_min_param(:,42) = U_r(:,43);
%     U_min_param(:,43) = U_r(:,45);
%     U_min_param(:,44) = U_r(:,46);
%     U_min_param(:,45) = U_r(:,47);
%     U_min_param(:,46) = U_r(:,49);
%     U_min_param(:,47) = U_r(:,50);  
%     U_min_param(:,48) = U_r(:,52);
%     U_min_param(:,49) = U_r(:,53);
%     U_min_param(:,50) = U_r(:,55);
%     U_min_param(:,51) = U_r(:,56);
%     U_min_param(:,52) = U_r(:,57);
%     U_min_param(:,53) = U_r(:,59);
%     U_min_param(:,54) = U_r(:,60);  
%     tao = U_min_param*fi_min;
    
    %% ���Ե��ġ��塢���ؽڵ���д��С���������ؽ��Ȳ�����4��5��6����ok��
    %Try to write the smallest set of the fourth, fifth, and sixth joints separately, and the other joints will not move first, and the results of the 4th, 5th, and 6th axes are OK
%     YY6 = Ii66yy;M6 = m6;
%     MX6 = m6*Pc666(1); MY6 = m6*Pc666(2);MZ6 = m6*Pc666(3);
%     XX6 = Ii66xx-YY6; XY6 = Ii66xy;XZ6 = Ii66xz;YZ6 = Ii66yz;ZZ6 = Ii66zz;
%     YY5 = Ii55yy;M5 = m5+m6;
%     MX5 = m5*Pc555(1);MY5 = m5*Pc555(2)+(MZ6+d6*M6);MZ5 = m5*Pc555(3);
%     XX5 = Ii55xx-YY5+YY6+2*d6*MZ6+d6^2*M6;XY5 = Ii55xy;XZ5 = Ii55xz;YZ5 = Ii55yz;ZZ5 = Ii55zz+YY6+2*d6*MZ6+d6^2*M6;
%     YY4 = Ii44yy;M4 = m4+m5+m6;
%     MX4 = m4*Pc444(1);MY4 = m4*Pc444(2)-MZ5;MZ4 = m4*Pc444(3);
%     XX4 = Ii44xx-YY4+YY5;XY4 = Ii44xy;XZ4 = Ii44xz;YZ4 = Ii55yz;ZZ4 = Ii44zz+YY5;
%     fi4_min_param = [MX4 MY4 XX4 XY4 XZ4 YZ4 ZZ4]';
%     fi5_min_param = [MX5 MY5 XX5 XY5 XZ5 YZ5 ZZ5]';
%     fi6_min_param = [MX6 MY6 XX6 XY6 XZ6 YZ6 ZZ6]';
%     fi_min = [fi1;fi2;fi3;fi4_min_param;fi5_min_param;fi6_min_param];
%     U_min_param = zeros(6,51);%ÿһ����д����С��֮�󣬾ͻ��ٶ�Ӧ��������%After each axis is written as the minimum set, the corresponding number of columns is missing
%     U_min_param(:,1:30) = U_r(:,1:30);
%     U_min_param(:,31) = U_r(:,32);
%     U_min_param(:,32) = U_r(:,33);
%     U_min_param(:,33) = U_r(:,35);
%     U_min_param(:,34) = U_r(:,36);
%     U_min_param(:,35) = U_r(:,37);
%     U_min_param(:,36) = U_r(:,39);
%     U_min_param(:,37) = U_r(:,40); 
%     U_min_param(:,38) = U_r(:,42);
%     U_min_param(:,39) = U_r(:,43);
%     U_min_param(:,40) = U_r(:,45);
%     U_min_param(:,41) = U_r(:,46);
%     U_min_param(:,42) = U_r(:,47);
%     U_min_param(:,43) = U_r(:,49);
%     U_min_param(:,44) = U_r(:,50);  
%     U_min_param(:,45) = U_r(:,52);
%     U_min_param(:,46) = U_r(:,53);
%     U_min_param(:,47) = U_r(:,55);
%     U_min_param(:,48) = U_r(:,56);
%     U_min_param(:,49) = U_r(:,57);
%     U_min_param(:,50) = U_r(:,59);
%     U_min_param(:,51) = U_r(:,60);  
%     tao = U_min_param*fi_min;
    
       %% ���Ե������ġ��塢���ؽڵ���д��С���������ؽ��Ȳ�����3��4��5��6����ok��
       %Try to write the minimum set separately for the third, fourth, fifth, and sixth joints, and the other joints will not move first, and the results of the 3rd, 4th, 5th, and 6th axes are OK
%     YY6 = Ii66yy;M6 = m6;
%     MX6 = m6*Pc666(1); MY6 = m6*Pc666(2);MZ6 = m6*Pc666(3);
%     XX6 = Ii66xx-YY6; XY6 = Ii66xy;XZ6 = Ii66xz;YZ6 = Ii66yz;ZZ6 = Ii66zz;
%     YY5 = Ii55yy;M5 = m5+m6;
%     MX5 = m5*Pc555(1);MY5 = m5*Pc555(2)+(MZ6+d6*M6);MZ5 = m5*Pc555(3);
%     XX5 = Ii55xx-YY5+YY6+2*d6*MZ6+d6^2*M6;XY5 = Ii55xy;XZ5 = Ii55xz;YZ5 = Ii55yz;ZZ5 = Ii55zz+YY6+2*d6*MZ6+d6^2*M6;
%     YY4 = Ii44yy;M4 = m4+M5;
%     MX4 = m4*Pc444(1);MY4 = m4*Pc444(2)-MZ5;MZ4 = m4*Pc444(3);
%     XX4 = Ii44xx-YY4+YY5;XY4 = Ii44xy;XZ4 = Ii44xz;YZ4 = Ii55yz;ZZ4 = Ii44zz+YY5;
%      YY3 = Ii33yy;M3 = m3+M4;
%     MX3 = m3*Pc333(1)+a4*M4;MY3 = m3*Pc333(2)+(MZ4+d4*M4);MZ3 = m3*Pc333(3);
%      XX3 = Ii33xx-YY3+YY4+2*d4*MZ4+(-a4^2+d4^2)*M4;XY3 = Ii33xy-a4*(MZ4+d4*M4);XZ3 = Ii33xz;YZ3 = Ii33yz;ZZ3 = Ii33zz+YY4+2*d4*MZ4+(d4^2+a4^2)*M4;
% %     XX3 = Ii33xx-YY3+d4^2*M4;XY3 = Ii33xy;XZ3 = Ii33xz-a4*(MZ4-d4*M4);YZ3 = Ii33yz;ZZ3 = Ii33zz+a4^2*M4;
%     fi3_min_param = [MX3 MY3 XX3 XY3 XZ3 YZ3 ZZ3]';
%     fi4_min_param = [MX4 MY4 XX4 XY4 XZ4 YZ4 ZZ4]';
%     fi5_min_param = [MX5 MY5 XX5 XY5 XZ5 YZ5 ZZ5]';
%     fi6_min_param = [MX6 MY6 XX6 XY6 XZ6 YZ6 ZZ6]';
%     fi_min = [fi1;fi2;fi3_min_param;fi4_min_param;fi5_min_param;fi6_min_param];
%     U_min_param = zeros(6,48);%ÿһ����д����С��֮�󣬾ͻ��ٶ�Ӧ��������%After each axis is written as the smallest set, the corresponding number of columns will be missing;
%     U_min_param(:,1:20) = U_r(:,1:20);
%     U_min_param(:,21) = U_r(:,22);
%     U_min_param(:,22) = U_r(:,23);
%     U_min_param(:,23) = U_r(:,25);
%     U_min_param(:,24) = U_r(:,26);
%     U_min_param(:,25) = U_r(:,27);
%     U_min_param(:,26) = U_r(:,29);
%     U_min_param(:,27) = U_r(:,30); 
%     U_min_param(:,28) = U_r(:,32);
%     U_min_param(:,29) = U_r(:,33);
%     U_min_param(:,30) = U_r(:,35);
%     U_min_param(:,31) = U_r(:,36);
%     U_min_param(:,32) = U_r(:,37);
%     U_min_param(:,33) = U_r(:,39);
%     U_min_param(:,34) = U_r(:,40); 
%     U_min_param(:,35) = U_r(:,42);
%     U_min_param(:,36) = U_r(:,43);
%     U_min_param(:,37) = U_r(:,45);
%     U_min_param(:,38) = U_r(:,46);
%     U_min_param(:,39) = U_r(:,47);
%     U_min_param(:,40) = U_r(:,49);
%     U_min_param(:,41) = U_r(:,50);  
%     U_min_param(:,42) = U_r(:,52);
%     U_min_param(:,43) = U_r(:,53);
%     U_min_param(:,44) = U_r(:,55);
%     U_min_param(:,45) = U_r(:,56);
%     U_min_param(:,46) = U_r(:,57);
%     U_min_param(:,47) = U_r(:,59);
%     U_min_param(:,48) = U_r(:,60);  
%     tao = U_min_param*fi_min;

       %% ���Եڶ��������ġ��塢���ؽڵ���д��С���������ؽ��Ȳ�����2��3��4��5��6����ok��
       %Try to write the minimum set separately for the second, third, fourth, fifth, and sixth joints, and the other joints will not move first, and the results of the 2nd, 3rd, 4th, 5th, and 6th axes will be OK
%     YY6 = Ii66yy;M6 = m6;
%     MX6 = m6*Pc666(1); MY6 = m6*Pc666(2);MZ6 = m6*Pc666(3);
%     XX6 = Ii66xx-YY6; XY6 = Ii66xy;XZ6 = Ii66xz;YZ6 = Ii66yz;ZZ6 = Ii66zz;
%     YY5 = Ii55yy;M5 = m5+m6;
%     MX5 = m5*Pc555(1);MY5 = m5*Pc555(2)+(MZ6+d6*M6);MZ5 = m5*Pc555(3);
%     XX5 = Ii55xx-YY5+YY6+2*d6*MZ6+d6^2*M6;XY5 = Ii55xy;XZ5 = Ii55xz;YZ5 = Ii55yz;ZZ5 = Ii55zz+YY6+2*d6*MZ6+d6^2*M6;
%     YY4 = Ii44yy;M4 = m4+M5;
%     MX4 = m4*Pc444(1);MY4 = m4*Pc444(2)-MZ5;MZ4 = m4*Pc444(3);
%     XX4 = Ii44xx-YY4+YY5;XY4 = Ii44xy;XZ4 = Ii44xz;YZ4 = Ii55yz;ZZ4 = Ii44zz+YY5;
%      YY3 = Ii33yy;M3 = m3+M4;
%     MX3 = m3*Pc333(1)+a4*M4;MY3 = m3*Pc333(2)+(MZ4+d4*M4);MZ3 = m3*Pc333(3);
%      XX3 = Ii33xx-YY3+YY4+2*d4*MZ4+(-a4^2+d4^2)*M4;XY3 = Ii33xy-a4*(MZ4+d4*M4);XZ3 = Ii33xz;YZ3 = Ii33yz;ZZ3 = Ii33zz+YY4+2*d4*MZ4+(d4^2+a4^2)*M4;
%      YY2 = Ii22yy;M2 = m2+m3+m4+m5+m6;
%      MX2 = m2*Pc222(1)+a3*M3;MY2 = m2*Pc222(2);MZ2 = m2*Pc222(3);%+MZ3;
%      XX2 = Ii22xx-YY2+(-a3^2)*M3; XY2 = Ii22xy;XZ2 = Ii22xz-a3*(MZ3+d3*M3);YZ2 = Ii22yz;ZZ2 = Ii22zz+a3^2*M3;   
%     fi2_min_param = [MX2 MY2 XX2 XY2 XZ2 YZ2 ZZ2]';
%     fi3_min_param = [MX3 MY3 XX3 XY3 XZ3 YZ3 ZZ3]';
%     fi4_min_param = [MX4 MY4 XX4 XY4 XZ4 YZ4 ZZ4]';
%     fi5_min_param = [MX5 MY5 XX5 XY5 XZ5 YZ5 ZZ5]';
%     fi6_min_param = [MX6 MY6 XX6 XY6 XZ6 YZ6 ZZ6]';
%     fi_min = [fi1;fi2_min_param;fi3_min_param;fi4_min_param;fi5_min_param;fi6_min_param];
%     U_min_param = zeros(6,45);%ÿһ����д����С��֮�󣬾ͻ��ٶ�Ӧ��������%After each axis is written as the smallest set, the corresponding number of columns will be missing;
%     U_min_param(:,1:10) = U_r(:,1:10);
%     U_min_param(:,11) = U_r(:,12);
%     U_min_param(:,12) = U_r(:,13);
%     U_min_param(:,13) = U_r(:,15);
%     U_min_param(:,14) = U_r(:,16);
%     U_min_param(:,15) = U_r(:,17);
%     U_min_param(:,16) = U_r(:,19);
%     U_min_param(:,17) = U_r(:,20); 
%     U_min_param(:,18) = U_r(:,22);
%     U_min_param(:,19) = U_r(:,23);
%     U_min_param(:,20) = U_r(:,25);
%     U_min_param(:,21) = U_r(:,26);
%     U_min_param(:,22) = U_r(:,27);
%     U_min_param(:,23) = U_r(:,29);
%     U_min_param(:,24) = U_r(:,30); 
%     U_min_param(:,25) = U_r(:,32);
%     U_min_param(:,26) = U_r(:,33);
%     U_min_param(:,27) = U_r(:,35);
%     U_min_param(:,28) = U_r(:,36);
%     U_min_param(:,29) = U_r(:,37);
%     U_min_param(:,30) = U_r(:,39);
%     U_min_param(:,31) = U_r(:,40); 
%     U_min_param(:,32) = U_r(:,42);
%     U_min_param(:,33) = U_r(:,43);
%     U_min_param(:,34) = U_r(:,45);
%     U_min_param(:,35) = U_r(:,46);
%     U_min_param(:,36) = U_r(:,47);
%     U_min_param(:,37) = U_r(:,49);
%     U_min_param(:,38) = U_r(:,50);  
%     U_min_param(:,39) = U_r(:,52);
%     U_min_param(:,40) = U_r(:,53);
%     U_min_param(:,41) = U_r(:,55);
%     U_min_param(:,42) = U_r(:,56);
%     U_min_param(:,43) = U_r(:,57);
%     U_min_param(:,44) = U_r(:,59);
%     U_min_param(:,45) = U_r(:,60);  
%     tao = U_min_param*fi_min;
     %% ���Ե�һ�����������ġ��塢���ؽڵ���д��С���������ؽ��Ȳ�����1��2��3��4��5��6����ok��
     %Try to write the minimum set separately for the first, second, third, fourth, fifth, and sixth joints, and the other joints will not move first, and the results of the 1, 2, 3, 4, 5, and 6 axes are OK
    YY6 = Ii66yy;M6 = m6;
    MX6 = m6*Pc666(1); MY6 = m6*Pc666(2);MZ6 = m6*Pc666(3);
    XX6 = Ii66xx-YY6; XY6 = Ii66xy;XZ6 = Ii66xz;YZ6 = Ii66yz;ZZ6 = Ii66zz;
    YY5 = Ii55yy;M5 = m5+m6;
    MX5 = m5*Pc555(1);MY5 = m5*Pc555(2)+(MZ6+d6*M6);MZ5 = m5*Pc555(3);
    XX5 = Ii55xx-YY5+YY6+2*d6*MZ6+d6^2*M6;XY5 = Ii55xy;XZ5 = Ii55xz;YZ5 = Ii55yz;ZZ5 = Ii55zz+YY6+2*d6*MZ6+d6^2*M6;
    YY4 = Ii44yy;M4 = m4+M5;
    MX4 = m4*Pc444(1);MY4 = m4*Pc444(2)-MZ5;MZ4 = m4*Pc444(3);
    XX4 = Ii44xx-YY4+YY5;XY4 = Ii44xy;XZ4 = Ii44xz;YZ4 = Ii55yz;ZZ4 = Ii44zz+YY5;
    YY3 = Ii33yy;M3 = m3+M4;
    MX3 = m3*Pc333(1)+a4*M4;MY3 = m3*Pc333(2)+(MZ4+d4*M4);MZ3 = m3*Pc333(3);
    XX3 = Ii33xx-YY3+YY4+2*d4*MZ4+(-a4^2+d4^2)*M4;XY3 = Ii33xy-a4*(MZ4+d4*M4);XZ3 = Ii33xz;YZ3 = Ii33yz;ZZ3 = Ii33zz+YY4+2*d4*MZ4+(d4^2+a4^2)*M4;
    YY2 = Ii22yy;M2 = m2+m3+m4+m5+m6;
    MX2 = m2*Pc222(1)+a3*M3;MY2 = m2*Pc222(2);MZ2 = m2*Pc222(3);%+MZ3;
    XX2 = Ii22xx-YY2+(-a3^2)*M3; XY2 = Ii22xy;XZ2 = Ii22xz-a3*(MZ3+d3*M3);YZ2 = Ii22yz;ZZ2 = Ii22zz+a3^2*M3;  
     
    ZZ1 = Ii11zz+YY2+a2^2*M2+YY3+2*d3*MZ3+(a3^2+d3^2)*M3+ a4^2*M4;%% �������Ǿ����ӣ����治����˭��д�����������Ƿ��������µ����ַ�������������ȫ�������ߡ���˭���뵽zz1����С��������д��M3��M4��ϵ����������������������������
                                                                    %It's really a masterpiece here, I'm really unconvinced, who can write it, I really obey him, the kind of clothes that kneel. I can't get to the edge of the book here. Who would have thought that the coefficients and parameters of M3 and M4 could be written in the minimum set of zz1!!!!!!!!!
    fi1_min_param = [ZZ1]';
    fi2_min_param = [MX2 MY2 XX2 XY2 XZ2 YZ2 ZZ2]';
    fi3_min_param = [MX3 MY3 XX3 XY3 XZ3 YZ3 ZZ3]';
    fi4_min_param = [MX4 MY4 XX4 XY4 XZ4 YZ4 ZZ4]';
    fi5_min_param = [MX5 MY5 XX5 XY5 XZ5 YZ5 ZZ5]';
    fi6_min_param = [MX6 MY6 XX6 XY6 XZ6 YZ6 ZZ6]';
    fi_min = [fi1_min_param;fi2_min_param;fi3_min_param;fi4_min_param;fi5_min_param;fi6_min_param];
    U_min_param = zeros(6,36);%ÿһ����д����С��֮�󣬾ͻ��ٶ�Ӧ��������%After each axis is written as the smallest set, the corresponding number of columns will be missing;
    U_min_param(:,1) = U_r(:,10);
    U_min_param(:,2) = U_r(:,12);
    U_min_param(:,3) = U_r(:,13);
    U_min_param(:,4) = U_r(:,15);
    U_min_param(:,5) = U_r(:,16);
    U_min_param(:,6) = U_r(:,17);
    U_min_param(:,7) = U_r(:,19);
    U_min_param(:,8) = U_r(:,20); 
    U_min_param(:,9) = U_r(:,22);
    U_min_param(:,10) = U_r(:,23);
    U_min_param(:,11) = U_r(:,25);
    U_min_param(:,12) = U_r(:,26);
    U_min_param(:,13) = U_r(:,27);
    U_min_param(:,14) = U_r(:,29);
    U_min_param(:,15) = U_r(:,30); 
    U_min_param(:,16) = U_r(:,32);
    U_min_param(:,17) = U_r(:,33);
    U_min_param(:,18) = U_r(:,35);
    U_min_param(:,19) = U_r(:,36);
    U_min_param(:,20) = U_r(:,37);
    U_min_param(:,21) = U_r(:,39);
    U_min_param(:,22) = U_r(:,40); 
    U_min_param(:,23) = U_r(:,42);
    U_min_param(:,24) = U_r(:,43);
    U_min_param(:,25) = U_r(:,45);
    U_min_param(:,26) = U_r(:,46);
    U_min_param(:,27) = U_r(:,47);
    U_min_param(:,28) = U_r(:,49);
    U_min_param(:,29) = U_r(:,50);  
    U_min_param(:,30) = U_r(:,52);
    U_min_param(:,31) = U_r(:,53);
    U_min_param(:,32) = U_r(:,55);
    U_min_param(:,33) = U_r(:,56);
    U_min_param(:,34) = U_r(:,57);
    U_min_param(:,35) = U_r(:,59);
    U_min_param(:,36) = U_r(:,60);  
    tao = U_min_param*fi_min;


end
function [w, dw ,dv ,dvc]=cal_single_motion(R,w0,dw0,dq,Z,ddq,P01,dv0,Pc)
    w = R*w0+dq*Z;
    dw = R*dw0+cross(R*w0,dq*Z)+ddq*Z;
    dv = R*(cross(dw0,P01)+cross(w0,cross(w0,P01))+dv0);
    dvc = cross(dw,Pc)+cross(w,cross(w,Pc))+dv;
end
