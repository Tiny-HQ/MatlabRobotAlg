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
Xnihe=zeros(479,20);
a_angle = zeros(479,1);
for i = 1:479
    X = i:19+i;
    [a,b] = Fnihe(X,(tsensorWorldPosXZ(i:(19+i),1))',20);
    Xnihe(i,:) = a*X+b;
    
    [a_angle(i,1),b]= Fnihe(Xnihe(i,:),(tsensorWorldPosXZ(i:(19+i),2))',20);
end;


a_angle = atan2(a_angle,1)*180.0/pi;