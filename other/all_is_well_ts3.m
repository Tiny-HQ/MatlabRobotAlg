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




T_trans = [0.16212250768242 0.00232477206632926 0 209.713484467607;
    -0.0022296898156149 -0.168577842718384 0 914.441278359736;
    0 0 1 0;
    0 0 0 1]%ccd坐标转到wcs CCD coordinates go to WCS


ccd = [1751.55 714.673 0 1]';%像素坐标 Pixel coordinates
T_wcs = T_trans*ccd%像素坐标转到世界坐标系坐标 The pixel coordinates go to the world coordinate system coordinates


T_trans_conveyor = rotz(-89*pi/180);%皮带坐标系到wcs坐标系姿态转换关系 Attitude conversion relationship from belt coordinate system to WCS coordinate system
T_trans_conveyor(1,4) = 453.748;%皮带坐标系到wcs坐标系位置转换关系 The position conversion relationship between the belt coordinate system and the WCS coordinate system
T_trans_conveyor(2,4) = 604.124;%皮带坐标系到wcs坐标系位置转换关系 The position conversion relationship between the belt coordinate system and the WCS coordinate system
T_trans_conveyor(3,4) = -92.398;%皮带坐标系到wcs坐标系位置转换关系 皮带坐标系到wcs坐标系位置转换关系
T_trans_conveyor(4,4) = 1.0;

T_trans_conveyor

T_conveyor = T_trans_conveyor\T_wcs%算到皮带坐标系下坐标值;y值是44，y值范围-237到-51怎么能进的去？？？ Calculate the coordinate value in the belt coordinate system; The y-value is 44, and the y-value ranges from -237 to -51???














