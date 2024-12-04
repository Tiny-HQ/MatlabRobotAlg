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

%线性分离;Linear separation
function [tao1,tao2] = pend2_ts4_cal_tao_linear_separate(q11,dq1,ddq1,q22,dq2,ddq2)

    global  g m1 m2 P01 P12 PC11 PC22;
    global Ii11 Ii22 U;
    
    Ii11xx = Ii11(1,1);Ii11xy = Ii11(1,2);Ii11xz = Ii11(1,3);
    Ii11yy = Ii11(2,2);Ii11yz = Ii11(2,3);Ii11zz = Ii11(3,3);
    
    Ii22xx = Ii22(1,1);Ii22xy = Ii22(1,2);Ii22xz = Ii22(1,3);
    Ii22yy = Ii22(2,2);Ii22yz = Ii22(2,3);Ii22zz = Ii22(3,3);
    
    fi1 = [m1 m1*PC11(1) m1*PC11(2) m1*PC11(3) Ii11xx Ii11xy Ii11xz Ii11yy Ii11yz Ii11zz]';
    fi2 = [m2 m2*PC22(1) m2*PC22(2) m2*PC22(3) Ii22xx Ii22xy Ii22xz Ii22yy Ii22yz Ii22zz]';  
    fi = [fi1;fi2];

    R01 = splitT_R( hrotz(q11*180/pi));
    R12 = splitT_R( hrotx(-90)*hrotz(q22*180/pi));
    R23 = splitT_R( hrotx(90));
    R32 = R23';R21 = R12';R10 = R01';
    %外推0->3
    w00 = [0 0 0]';dw00 = [0 0 0]';v00 = [0 0 0]';dv00 = [0 0 g]';%这里写g的话，变量g为9.81，如果写-g，那么变量g为-9.81;% If you write g here, the variable g is 9.81, and if you write -g, then the variable g is -9.81;
    zv = [0 0 1]';
    
    w11 = R10*w00+dq1*zv;
    dw11 = R10*dw00+cross(R10*w00,dq1*zv)+ddq1*zv;
    dv11 = R10*(cross(dw00,P01)+cross(w00,(cross(w00,P01)))+dv00);

    w22 = R21*w11+dq2*zv;
    dw22 = R21*dw11+cross(R21*w11,dq2*zv)+ddq2*zv;
    dv22 = R21*(cross(dw11,P12)+cross(w11,(cross(w11,P12)))+dv11);
    
    A1 = zeros(6,10);A2 = zeros(6,10);
    A1(1:3,1) = dv11;A1(1:3,2:4) = S_alg(dw11)+S_alg(w11)*S_alg(w11);
    A1(4:6,2:4) = -S_alg(dv11);A1(4:6,5:10) = K_alg(dw11)+S_alg(w11)*K_alg(w11);
    
    A2(1:3,1) = dv22;A2(1:3,2:4) = S_alg(dw22)+S_alg(w22)*S_alg(w22);
    A2(4:6,2:4) = -S_alg(dv22);A2(4:6,5:10) = K_alg(dw22)+S_alg(w22)*K_alg(w22);
    

    Q12 = [R12 zeros(3,3);S_alg(P12)*R12 R12];


    U11 = A1;U12 = Q12*A2;
    U22 = A2;
    
    U1 = [U11 U12;
        zeros(6,10) U22];
    
    U = [U1(6,:);
        U1(12,:);];
    
    f = U1*fi;
    
    tao1 = f(6);
    tao2 = f(12);



end
