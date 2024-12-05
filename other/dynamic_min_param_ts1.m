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




clc;
clear;



syms mi_1 mi mi1 mi2 real;%����;mass
syms Pi_1_x Pi_1_y Pi_1_z Pi_x Pi_y Pi_z Pi1_x Pi1_y Pi1_z Pi2_x Pi2_y Pi2_z real
syms Pci_1_x Pci_1_y Pci_1_z Pci_x Pci_y Pci_z Pci1_x Pci1_y Pci1_z Pci2_x Pci2_y Pci2_z real
syms Ii_1_xx Ii_1_xy Ii_1_xz Ii_1_yy Ii_1_yz Ii_1_zz real;%i-1�����; i-1 axis inertia
syms Ii_xx Ii_xy Ii_xz Ii_yy Ii_yz Ii_zz real;%i�����; i axis inertia
syms Ii1_xx Ii1_xy Ii1_xz Ii1_yy Ii1_yz Ii1_zz real;%i+1�����;i+1 axis inertia
syms Ii2_xx Ii2_xy Ii2_xz Ii2_yy Ii2_yz Ii2_zz real;%i+2�����; i+2 axis inertia

syms dqi_1_x dqi_1_y dqi_1_z ddqi_1_x ddqi_1_y ddqi_1_z real;%i-1����ٶȡ��Ǽ��ٶ�; i-1 axis angular velocity, angular acceleration;
syms dqi_x dqi_y dqi_z ddqi_x ddqi_y ddqi_z real;%i����ٶȡ��Ǽ��ٶ�; i axis angular velocity, angular acceleration;
syms dqi1_x dqi1_y dqi1_z ddqi1_x ddqi1_y ddqi1_z real;%i+1����ٶȡ��Ǽ��ٶ�;i+1 axis angular velocity, angular acceleration;
syms dqi2_x dqi2_y dqi2_z ddqi2_x ddqi2_y ddqi2_z real;%i+2����ٶȡ��Ǽ��ٶ�; i+2 axis angular velocity, angular acceleration;

syms vi_1_x vi_1_y vi_1_z vi_x vi_y vi_z vi1_x vi1_y vi1_z vi2_x vi2_y vi2_z real;
syms ai_1_x ai_1_y ai_1_z ai_x ai_y ai_z ai1_x ai1_y ai1_z ai2_x ai2_y ai2_z real;

Ri_1_i = eye(3);Ri_i1 = eye(3);Ri1_i2 = eye(3);Ri2_i3 = eye(3);

Pi_i_1 = [Pi_1_x Pi_1_y Pi_1_z]';Pi1_i = [Pi_x Pi_y Pi_z]';Pi2_i1 = [Pi1_x Pi1_y Pi1_z]';Pi3_i2 = [Pi2_x Pi2_y Pi2_z]';
Pci_1  = [Pci_1_x Pci_1_y Pci_1_z]';Pci = [Pci_x Pci_y Pci_z]';Pci1 = [Pci1_x Pci1_y Pci1_z]';Pci2 = [Pci2_x Pci2_y Pci2_z]';

Ii_1 = [Ii_1_xx Ii_1_xy Ii_1_xz;Ii_1_xy Ii_1_yy Ii_1_yz;Ii_1_xz Ii_1_yz Ii_1_zz];
Ii = [Ii_xx Ii_xy Ii_xz;Ii_xy Ii_yy Ii_yz;Ii_xz Ii_yz Ii_zz];
Ii1 = [Ii1_xx Ii1_xy Ii1_xz;Ii1_xy Ii1_yy Ii1_yz;Ii1_xz Ii1_yz Ii1_zz];
Ii2 = [Ii2_xx Ii2_xy Ii2_xz;Ii2_xy Ii2_yy Ii2_yz;Ii2_xz Ii2_yz Ii2_zz];

wi_1 = [dqi_1_x dqi_1_y dqi_1_z]';
wi = [dqi_x dqi_y dqi_z]';
wi1 = [dqi1_x dqi1_y dqi1_z]';
wi2 = [dqi2_x dqi2_y dqi2_z]';

dwi_1 = [ddqi_1_x ddqi_1_y ddqi_1_z]';
dwi = [ddqi_x ddqi_y ddqi_z]';
dwi1 = [ddqi1_x ddqi1_y ddqi1_z]';
dwi2 = [ddqi2_x ddqi2_y ddqi2_z]';

dvi_1 = [ai_1_x ai_1_y ai_1_z]';
dvi = [ai_x ai_y ai_z]';
dvi1 = [ai1_x ai1_y ai1_z]';
dvi2 = [ai2_x ai2_y ai2_z]';
fi33 = [0 0 0]';ni33 = [0 0 0]';

ni22 = Ri2_i3*ni33 + cross(Pi3_i2,Ri2_i3*fi33)+cross(wi2,Ii2*wi2)+cross(mi2*Pci2,dvi2)+Ii2*dwi2;
fi22 = Ri2_i3*fi33+mi2*(cross(dwi2,Pci2)+cross(wi2,cross(wi2,Pci2))+dvi2);
ni11 = Ri1_i2*ni22 + cross(Pi2_i1,Ri1_i2*fi22)+cross(wi1,Ii1*wi1)+cross(mi1*Pci1,dvi1)+Ii1*dwi1;
fi11 = Ri1_i2*fi22+mi1*(cross(dwi1,Pci1)+cross(wi1,cross(wi1,Pci1))+dvi1);
ni = Ri_i1*ni11 + cross(Pi1_i,Ri_i1*fi11)+cross(wi,Ii*wi)+cross(mi*Pci,dvi)+Ii*dwi;
fi = Ri_i1*fi11+mi*(cross(dwi,Pci)+cross(wi,cross(wi,Pci))+dvi);
ni_1 = Ri_1_i*ni11 + cross(Pi_i_1,Ri_1_i*fi)+cross(wi_1,Ii*wi_1)+cross(mi_1*Pci_1,dvi_1)+Ii_1*dwi_1;
fi_1 = Ri_1_i*fi11+mi*(cross(dwi_1,Pci_1)+cross(wi_1,cross(wi_1,Pci_1))+dvi_1);

n = [0 0 1]';

ni22'*n
ni11'*n
ni'*n
ni_1'*n



