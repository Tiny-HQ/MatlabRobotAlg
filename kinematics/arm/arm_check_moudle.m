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



%生成随机数来充当角度值，分两块，dh模型测试，跟旋量模型测试，注意旋量的二轴角度要减掉90度，反解之后要加上90度， Generate a random number to act as an angle value, divided into two parts, DH model test, and spinor model test, pay attention to the two-axis angle of the spinor to subtract 90 degrees, and add 90 degrees after the reverse solution,
%加上之后才能跟初始角度比较; After addition, it can be compared with the initial angle;
%如果需要测试dh模型，打开①处代码; If you need to test the DH model, open the code at (1);
%如果需要测试sc模型，打开②处代码; If you need to test the SC model, open the code at (2);
%证明得到dh模型跟sc模型absolutely correct!!!!!; It is proved that the DH model and the SC model are absolutely correct!!!!;


DH.a(1) = 0.0;%这里是从0开始的;matlab数组只能从1开始; Here it starts at 0; MATLAB arrays can only start at 1;
DH.a(2) = 0.163655;
DH.a(3) = 0.550739;
DH.a(4) = 0.208847;
DH.a(5) = 0.0;
DH.a(6) = 0.0;

DH.alpha(1) = 0.0;%这里是从0开始的;Here it starts at 0; 
DH.alpha(2) = 90;
DH.alpha(3) = 0.0;
DH.alpha(4) = 90;
DH.alpha(5) = -90;
DH.alpha(6) = 90;

DH.d(1) = 0.43;
DH.d(2) = 0.0;
DH.d(3) = -0.001279;
DH.d(4) = 0.700029;
DH.d(5) = 0.0;
DH.d(6) = 0.115;

DH.theta(1) = 0.0;
DH.theta(2) = 0.0;
DH.theta(3) = 0.0;
DH.theta(4) = 0.0;
DH.theta(5) = 0.0;
DH.theta(6) = 0.0;

q = linspace(0,0,6);


%check_dh
%check_sc
for i = 1:4000
    q(1) = (rand()-0.5)*2*165;      %一轴  -165~165; first axis -165~165;
    q(2) = rand()*160;              %二轴  0~160（零位是90度）; second axis 0~160(zeros position is 90 degree)
    q(3) = rand()*200-70;           %三轴  -70~130; thirth -70~130;
    q(4) = (rand()-0.5)*2*170;      %四轴  -170~170; fouth -170~170;
    q(5) = (rand()-0.5)*2*120;      %五轴  -120~120; fifth -120~120;
    q(6) = (rand()-0.5)*2*180;      %六轴  -180~180; sixth -180~180; 
 
%① 
%    [T,shoulder,elbow,wrist] = arm_fkine_dh(q,DH,'deg','deg');
%    q_i = arm_ikine_dh(T,DH,shoulder,elbow,wrist,'deg','deg');


%②
%     q
    q(2) = q(2)-90;%这里是为了将范围 zeros position is 90 degree
    [T1,shoulder1,elbow1,wrist1] = arm_fkine_sc(q,DH,'deg','deg');
    q_i = arm_ikine_sc(T1,DH,shoulder1,elbow1,wrist1,'deg','deg');
    q(2) = q(2)+90;
    
    if (abs(q(1)-q_i(1))>0.01)||(abs(q(2)-q_i(2))>0.01)||(abs(q(3)-q_i(3))>0.01)||(abs(q(4)-q_i(4))>0.01)||(abs(q(5)-q_i(5))>0.01)||(abs(q(6)-q_i(6))>0.01)
        if(abs(q(1)-q_i(1))-360 <= 0.1)
            continue;
        end
        display(i,'failure!');
        q
        q_i
        break;
    else
        display(i,'nice boy!');
    end
end


























