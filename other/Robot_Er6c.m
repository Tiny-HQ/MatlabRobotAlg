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
mdl_puma560
L1 = Link('d',0.43,'a',0.163655,'alpha',pi/2,'qlim',[-165,165]*deg);
L2 = Link('d',0,'a',0.550739,'alpha',0,'qlim',[-60,180]*deg);
L3 = Link('d',-0.001279,'a',0.208847,'alpha',pi/2,'qlim',[-85,135]*deg);
L4 = Link('d',0.700029,'a',0,'alpha',-pi/2,'qlim',[-360,360]*deg);
L5 = Link('d',0,'a',0,'alpha',pi/2,'qlim',[-135,135]*deg);
L6 = Link('d',0.115,'a',0,'alpha',0,'qlim',[-360,360]*deg);
bot = SerialLink([L1 L2 L3 L4 L5 L6],'name','ER6C-C60');

t_sensor_unit_old = transl(0.02859665,-0.004333566,0.1219506);

t_sensor_unit_new = transl(0.004333566,0.02859665,0.1219506);

qh = [0*pi/180.0, 90*pi/180,-20*pi/180,0*pi/180,-65.7*pi/180.0,0*pi/180]
%bot.tool = [-0.5023    0.1181    0.8566   -0.0668741;-0.3830   -0.9185   -0.0979  -0.004246678;0.7752   -0.3773    0.5066  0.29703156;0         0         0    1.0000];
bot.tool = [ 0.89451981 -0.020255728 0.44656923 -0.066874184;-0.008481265 -0.99956208 -0.028349893 -0.0042466784;0.44694784 0.021572065 -0.89429992 0.29703156;0 0 0 1]
t_sensor_old = [0.99931389,-0.033218067,-0.0011807,0.02859665;0.03290,0.99233,-0.102821,-0.004333566;0.0045872,0.11900304,0.99469918,0.1219506;0,0,0,1];
t_sensor_new = [ 0.9923,-0.0329, 0.1028,0.0043;0.0332,0.9993, -0.0012, 0.0286; -0.1190,0.0046,0.9947,0.1220;0,0,0,1];
t_sensor = [0.99930108 -0.025166024  0.013634275  0.032249344; 0.026404113 0.9950881 -0.071786977 -0.0061124425;-0.011760712  0.09574122 0.99732685  0.12385125;0 0 0 1];




 t_new =[-0.0375    0.6897    0.7234    0.7084; -0.9944    0.0415   -0.0746    0.0066; -0.0927   -0.7227    0.6862    0.5491; 0   0         0    1.0000];
 t_old =[0.6897   , 0.0375   , 0.7234  ,  0.7083; 0.0415  ,  0.9944 ,  -0.0746   , 0.0065; -0.7227   , 0.0927   , 0.6861   , 0.5491;0 , 0 , 0 , 1.0000];