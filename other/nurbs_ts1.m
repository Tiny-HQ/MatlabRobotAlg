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
clear;
flag=1;
for t=0:0.05:1;
% t=1;
hold on
d0=[0 0 ];
d1=[10 10];
d2=[20 10];
d3=[30 0];
d4=[40 0];d5=[50 10];d6=[60 10];d7=[70 0];d8=[80 0];d9=[90 10];
d10=[100 -10];d11=[90 -20];d12=[80 -20];d13=[70 -10];d14=[60 -10];
d15=[50 -20];d16=[40 -20];d17=[30 -10];
m=[0 10 20 30 40 50 60 70 80 90 100 90 80 70 60 50 40 30];
n=[0 10 10 0 0 10 10 0 0 10 -10 -20 -20 -10 -10 -20 -20 -10];
D=[d0;d1;d2;d3];
D2=[d1;d2;d3;d4];
D3=[d2;d3;d4;d5];
D4=[d3;d4;d5;d6];
D5=[d4;d5;d6;d7];
D6=[d5;d6;d7;d8];
D7=[d6;d7;d8;d9];
D8=[d7;d8;d9;d10];
D9=[d8;d9;d10;d11];
D10=[d9;d10;d11;d12];
D11=[d10;d11;d12;d13];
D12=[d11;d12;d13;d14];
D13=[d12;d13;d14;d15];
D14=[d13;d14;d15;d16];
D15=[d14;d15;d16;d17];
M1=[-1,7/4,-11/12,1/6;3,-9/2,3/2,0;-3,3,0,0;1,0,0,0];
M2=[-1/4,7/12,-1/2,1/6;3/4,-5/4,1/2,0;-3/4,1/4,1/2,0;1/4,7/12,1/6,0];
M3=[-1/6,1/2,-1/2,1/6;1/2,-1,1/2,0;-1/2,0,1/2,0;1/6,2/3,1/6,0];
M4=[-1/6,1/2,-1/2,1/6;1/2,-1,1/2,0;-1/2,0,1/2,0;1/6,2/3,1/6,0];
M5=[-1/6,1/2,-1/2,1/6;1/2,-1,1/2,0;-1/2,0,1/2,0;1/6,2/3,1/6,0];
M6=[-1/6 1/2 -7/12 1/4;1/2 -1 1/2 0;-1/2 0 1/2 0;1/6 2/3 1/6 0];
M7=[-1/6 11/12 -7/4 1;1/2 -5/4 3/4 0;-1/2 -1/4 3/4 0;1/6 7/12 1/4 0];
pt1=[t.^3,t.^2,t,1]*M1*D;
pt2=[t.^3,t.^2,t,1]*M2*D2;
pt3=[t.^3,t.^2,t,1]*M3*D3;
pt4=[t.^3,t.^2,t,1]*M4*D4;
pt5=[t.^3,t.^2,t,1]*M5*D5;
pt6=[t.^3,t.^2,t,1]*M5*D6;
pt7=[t.^3,t.^2,t,1]*M5*D7;
pt8=[t.^3,t.^2,t,1]*M5*D8;
pt9=[t.^3,t.^2,t,1]*M5*D9;
pt10=[t.^3,t.^2,t,1]*M5*D10;
pt11=[t.^3,t.^2,t,1]*M5*D11;
pt12=[t.^3,t.^2,t,1]*M5*D12;
pt13=[t.^3,t.^2,t,1]*M5*D13;
pt14=[t.^3,t.^2,t,1]*M6*D14;
pt15=[t.^3,t.^2,t,1]*M7*D15;
px(flag)=pt1(1);py(flag)=pt1(2);
px2(flag)=pt2(1);py2(flag)=pt2(2);
px3(flag)=pt3(1);py3(flag)=pt3(2);
px4(flag)=pt4(1);py4(flag)=pt4(2);
px5(flag)=pt5(1);py5(flag)=pt5(2);
px6(flag)=pt6(1);py6(flag)=pt6(2);
px7(flag)=pt7(1);py7(flag)=pt7(2);
px8(flag)=pt8(1);py8(flag)=pt8(2);
px9(flag)=pt9(1);py9(flag)=pt9(2);
px10(flag)=pt10(1);py10(flag)=pt10(2);
px11(flag)=pt11(1);py11(flag)=pt11(2);
px12(flag)=pt12(1);py12(flag)=pt12(2);
px13(flag)=pt13(1);py13(flag)=pt13(2);
px14(flag)=pt14(1);py14(flag)=pt14(2);
px15(flag)=pt15(1);py15(flag)=pt15(2);
flag=flag+1;
x2=px2;y2=py2;
x3=px3;y3=py3;
x4=px4;y4=py4;
x5=px5;y5=py5;
x6=px6;y6=py6;
x7=px7;y7=py7;
x8=px8;y8=py8;
x9=px9;y9=py9;
x10=px10;y10=py10;
x11=px11;y11=py11;
x12=px12;y12=py12;
x13=px13;y13=py13;
x14=px14;y14=py14;
x15=px15;y15=py15;
x=px;y=py;
plot (x,y,'r.');
plot (x2,y2,'r.');
plot (x3,y3,'r.');
plot (x4,y4,'r.');
plot (x5,y5,'r.');
plot (x6,y6,'r.');
plot (x7,y7,'r.');
plot (x8,y8,'r.');
plot (x9,y9,'r.');
plot (x10,y10,'r.');
plot (x11,y11,'r.');
plot (x12,y12,'r.');
plot (x13,y13,'r.');
plot (x14,y14,'r.');
plot (x15,y15,'r.');
plot (m,n,'b--');
axis equal;
xlabel('X(mm)');
ylabel('Y(mm)');
end