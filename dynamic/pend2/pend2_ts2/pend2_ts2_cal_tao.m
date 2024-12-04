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

function [tao1,tao2] = pend2_ts2_cal_tao(q11,dq1,ddq1,q22,dq2,ddq2)


    global  g m1 m2 IC11 IC22 P10 P21 P32 PC11 PC22;

    
    P10 = [0 0 0]';

    

    

    R01 = rotz(q11*180/pi);
    R12 = roty(-90)*rotz(q22*180/pi);
    R23 = eye(3);
    R32 = R23';R21 = R12';R10 = R01';
    
    %外推0->3 extrapolate0->3
    w00 = [0 0 0]';dw00 = [0 0 0]';v00 = [0 0 0]';dv00 = [0 0 g]';%这里写g的话，变量g为9.81，如果写-g，那么变量g为-9.81;If you write g here, the variable g is 9.81, and if you write -g, then the variable g is -9.81;
    zv = [0 0 1]';
    
    w11 = R10*w00+dq1*zv;
    dw11 = R10*dw00+cross(R10*w00,dq1*zv)+ddq1*zv;
    dv11 = R10*(cross(dw00,P10)+cross(w00,(cross(w00,P10)))+dv00);
    dvc11 = cross(dw11,PC11)+cross(w11,cross(w11,PC11))+dv11;
    F11 = m1*dvc11;
    N11 = IC11*dw11+cross(w11,IC11*w11);


    w22 = R21*w11+dq2*zv;
    dw22 = R21*dw11+cross(R21*w11,dq2*zv)+ddq2*zv;
    dv22 = R21*(cross(dw11,P21)+cross(w11,(cross(w11,P21)))+dv11);
    dvc22 = cross(dw22,PC22)+cross(w22,cross(w22,PC22))+dv22;
    F22 = m2*dvc22;
    N22 = IC22*dw22+cross(w22,IC22*w22);


    %内推3->1 Extrapolation3->1
    f33 = [0 0 0]';n33 = [0 0 0]';
    f22 = R32*f33+F22;
    n22 = N22+R32*n33+cross(PC22,F22)+cross(P32,R32*f33);
    tao2 = n22(3);


    f11 = R12*f22+F11;
    n11 = N11+R12*n22+cross(PC11,F11)+cross(P21,R12*f22);
    tao1 = n11(3);

end
