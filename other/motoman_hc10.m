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

mdl_puma560;

% 
% L1 = Link('d',275,'a',0,'alpha',0,'qlim',[-180,180]*deg);
% L2 = Link('d',0,'a',0,'alpha',-pi/2,'qlim',[-180,180]*deg);
% L3 = Link('d',0,'a',700,'alpha',0,'qlim',[-5,355]*deg);
% L4 = Link('d',500,'a',0,'alpha',-pi/2,'qlim',[-180,180]*deg);
% L5 = Link('d',162,'a',0,'alpha',pi/2,'qlim',[-180,180]*deg);
% L6 = Link('d',130,'a',0,'alpha',-pi/2,'qlim',[-180,180]*deg);
% bot = SerialLink([L1 L2 L3 L4 L5 L6],'name','motoman_hc10');
% 
% q0 = [0 -pi/2 pi/2 0 0 pi];
% bot.fkine(q0)
%bot.teach(q0);

 q = [pi/2 0 0 0 0 0];
%q = [0 0 0 0 0 0];

T01 = create_link(q(1),       275,   0.0,    0.0,'rad');
T12 = create_link(q(2)-pi/2,  0.0,   -pi/2,  0.0,'rad');
T23 = create_link(q(3),       0.0,   0.0,    700.0,'rad');
T34 = create_link(q(4),       500,   -pi/2,  0.0,'rad');
T45 = create_link(q(5),       162,    pi/2,  0.0,'rad');
T56 = create_link(q(6)+pi,    130,    -pi/2, 0.0,'rad');



    T = T01*T12*T23*T34*T45*T56







