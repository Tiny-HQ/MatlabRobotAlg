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
function [R,P]=DH_Tool(l1,l2,l3,l4,l5,l6,l7,a1,a2,a3,a4,a5,a6,J1,J2,J3,J4,J5,J6)
    %d,e为角度弧度变换
    d=pi/180;
    e=180/pi;
    %DH补偿后的弧度
    j1=(J1+a1)*d;
    j2=(J2+a2+90)*d;
    j3=(J3+a3)*d;
    j4=(J4+a4)*d;
    j5=(J5+a5)*d;
    j6=(J6+a6)*d;
    %连杆变换法
%     T0=[cos(j1) -sin(j1) 0 0;sin(j1) cos(j1) 0 0;0 0 1 0;0 0 0 1];
%     T1=[1 0 0 l6;0 1 0 0;0 0 1 l1;0 0 0 1];
%     T2=[cos(j2) -sin(j2) 0 0;0 0 -1 l7;sin(j2) cos(j2) 0 0;0 0 0 1];
%     T3=[cos(j3) -sin(j3) 0 l2;sin(j3) cos(j3) 0 0;0 0 1 0;0 0 0 1];
%     T4=[cos(j4) -sin(j4) 0 l3;0 0 -1 -l4;sin(j4) cos(j4) 0 0;0 0 0 1];
%     T5=[cos(j5) -sin(j5) 0 0;0 0 1 0;-sin(j5) -cos(j5) 0 0;0 0 0 1];
%     T6=[cos(j6) -sin(j6) 0 0;0 0 -1 -l5;sin(j6) cos(j6) 0 0;0 0 0 1];
%     T=T0*T1*T2*T3*T4*T5*T6
    %标准连杆法
    T1=[cos(j1) -sin(j1) 0 0;sin(j1) cos(j1) 0 0;0 0 1 l1;0 0 0 1];
    T2=[cos(j2) -sin(j2) 0 l6;0 0 -1 0;sin(j2) cos(j2) 0 0;0 0 0 1];
    T3=[cos(j3) -sin(j3) 0 l2;sin(j3) cos(j3) 0 0;0 0 1 l7;0 0 0 1];%按照标准DH这里l7应该为-l7，现有算法可能算反了
    T4=[cos(j4) -sin(j4) 0 l3;0 0 -1 -l4;sin(j4) cos(j4) 0 0;0 0 0 1];
    T5=[cos(j5) -sin(j5) 0 0;0 0 1 0;-sin(j5) -cos(j5) 0 0;0 0 0 1];
    T6=[cos(j6) -sin(j6) 0 0;0 0 -1 -l5;sin(j6) cos(j6) 0 0;0 0 0 1];
    T=T1*T2*T3*T4*T5*T6;
    %从变换矩阵中分离出姿态变换及位置变换
    R=T(1:3,1:3);
    P=T(1:3,4);
    %求解xyz固定角
    Ry=atan2(-R(3,1),sqrt(R(1,1)^2+R(2,1)^2))*e;
    if(Ry==90)
        Rz=0;
        Rx=atan2(R(1,2),R(2,2))*e;
    elseif(Ry==-90)
        Rz=0;
        Rx=-atan2(R(1,2),R(2,2))*e;
    else
        Rz=atan2(R(2,1)/cos(Ry),R(1,1)/cos(Ry))*e;
        Rx=atan2(R(3,2)/cos(Ry),R(3,3)/cos(Ry))*e;
    end
    %求解zyz欧拉角
    B=atan2(sqrt(R(3,1)^2+R(3,2)^2),R(3,3))*e;
    if(B==0)
        A=0;
        C=atan2(-R(1,2),R(1,1))*e;
    elseif(B==180)
        A=0;
        C=atan2(-R(1,2),R(1,1))*e;
    else
        A=atan2(R(2,3)/sin(B*d),R(1,3)/sin(B*d))*e;
        C=atan2(R(3,2)/sin(B*d),-R(3,1)/sin(B*d))*e;
    end
end