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

format long g;

syms q1 q2 q3 q4 q5 q6 real; 
syms dq1 dq2 dq3 dq4 dq5 dq6 real; 
syms ddq1 ddq2 ddq3 ddq4 ddq5 ddq6 real; 


syms g a3 d2 d4 d6 m1 m2 m3 m4 m5 m6 real;
syms ic1xx ic1xy ic1xz ic1yy ic1yz ic1zz ic2xx ic2xy ic2xz ic2yy ic2yz ic2zz ic3xx ic3xy ic3xz ic3yy ic3yz ic3zz real;
syms ic4xx ic4xy ic4xz ic4yy ic4yz ic4zz ic5xx ic5xy ic5xz ic5yy ic5yz ic5zz ic6xx ic6xy ic6xz ic6yy ic6yz ic6zz real;
syms pc1x pc1y pc1z pc2x pc2y pc2z pc3x pc3y pc3z pc4x pc4y pc4z pc5x pc5y pc5z pc6x pc6y pc6z real;
% syms ic1 ic2 ic3 ic4 ic5 ic6 real;
% syms Pc111 Pc222 Pc333 Pc444 Pc555 Pc666 real;
% syms P001 P112 P223 P334 P445 P556 real;


Pc111 = [pc1x pc1y pc1z]';Pc222 = [pc2x pc2y pc2z]';Pc333 = [pc3x pc3y pc3z]';Pc444 = [pc4x pc4y pc4z]';Pc555 = [pc5x pc5y pc5z]';Pc666 = [pc6x pc6y pc6z]';
P001 = [0 0 0]';P112 = [0 d2 0]';P223 = [a3 0 0]';P334 = [0 d4 0]';P445 = [0 0 0]';P556 = [0 d6 0]';    P667 = [0 0 0]';                                          
ic1=[ic1xx -ic1xy -ic1xz;
 -ic1xy ic1yy -ic1yz;
 -ic1xz -ic1yz ic1zz];  

ic2=[ic2xx -ic2xy -ic2xz;
 -ic2xy ic2yy -ic2yz;
 -ic2xz -ic2yz ic2zz];

ic3=[ic3xx -ic3xy -ic3xz;
 -ic3xy ic3yy -ic3yz;
 -ic3xz -ic3yz ic3zz];   

ic4=[ic4xx -ic4xy -ic4xz;
 -ic4xy ic4yy -ic4yz;
 -ic4xz -ic4yz ic4zz];


ic5=[ic5xx -ic5xy -ic5xz;
 -ic5xy ic5yy -ic5yz;
 -ic5xz -ic5yz ic5zz];

ic6=[ic6xx -ic6xy -ic6xz;
 -ic6xy ic6yy -ic6yz;
 -ic6xz -ic6yz ic6zz];


R01 = [cos(q1) -sin(q1) 0;
       sin(q1) cos(q1) 1;
       0 0 1];R10 = R01';

R12 = [cos(q2) -sin(q2) 0;
       0 0 1;
       -sin(q2) -cos(q2) 0];R21 = R12';
   
R23 = [-cos(q3) sin(q3) 0;
    -sin(q3) -cos(q3) 0;
    0 0 1];R32 = R23';

R34 = [cos(q4) -sin(q4) 0;
       0 0 1;
       -sin(q4) -cos(q4) 0];R43 = R34';
   
R45 = [cos(q5) -sin(q5) 0;
       0 0 -1;
       sin(q5) cos(q5) 0];R54 = R45';
   
R56 = [cos(q6) -sin(q6) 0;
       0 0 1;
       -sin(q6) -cos(q6) 0];R65 = R56';

Z111 = [0 0 1]'; Z222 = [0 0 1]'; Z333 = [0 0 1]'; Z444 = [0 0 1]'; Z555 = [0 0 1]'; Z666 = [0 0 1]'; 

w000 = [0 0 0]';     dw000 = [0 0 0]';     v000 = [0 0 0]';    dv000 = [0 0 g]';



%1->6.c
w101 = R10*w000+dq1*Z111;
dw101 = R10*dw000+cross(R10*w000,dq1*Z111)+ddq1*Z111;
dv101 = R10*(cross(dw000,P001)+cross(w000,cross(w000,P001))+dv000);
dvc101 = cross(dw101,Pc111)+cross(w101,cross(w101,Pc111))+dv101;
Fc101 = m1*dvc101;
Nc101 = ic1*dw101+cross(w101,ic1*w101);



w202 = R21*w101+dq2*Z222;
dw202 = R21*dw101+cross(R21*w101,dq2*Z222)+ddq2*Z222;
dv202 = R21*(cross(dw101,P112)+cross(w101,cross(w101,P112))+dv101);
dvc202 = cross(dw202,Pc222)+cross(w202,cross(w202,Pc222))+dv202;
Fc202 = m2*dvc202;
Nc202 = ic2*dw202+cross(w202,ic2*w202);


w303 = R32*w202+dq3*Z333;
dw303 = R32*dw202+cross(R32*w202,dq3*Z333)+ddq3*Z333;
dv303 = R32*(cross(dw202,P223)+cross(w202,cross(w202,P223))+dv202);
dvc303 = cross(dw303,Pc333)+cross(w303,cross(w303,Pc333))+dv303;
Fc303 = m3*dvc303;
Nc303 = ic3*dw303+cross(w303,ic3*w303);


w404 = R43*w303+dq4*Z444;
dw404 = R43*dw303+cross(R43*w303,dq4*Z444)+ddq4*Z444;
dv404 = R43*(cross(dw303,P334)+cross(w303,cross(w303,P334))+dv303);
dvc404 = cross(dw404,Pc444)+cross(w404,cross(w404,Pc444))+dv404;
Fc404 = m4*dvc404;
Nc404 = ic4*dw404+cross(w404,ic4*w404);


w505 = R54*w404+dq5*Z555;
dw505 = R54*dw404+cross(R54*w404,dq5*Z555)+ddq5*Z555;
dv505 = R54*(cross(dw404,P445)+cross(w404,cross(w404,P445))+dv404);
dvc505 = cross(dw505,Pc555)+cross(w505,cross(w505,Pc555))+dv505;
Fc505 = m5*dvc505;
Nc505 = ic5*dw505+cross(w505,ic5*w505);

w606 = R65*w505+dq6*Z666;
dw606 = R65*dw505+cross(R65*w505,dq6*Z666)+ddq6*Z666;
dv606 = R65*(cross(dw505,P556)+cross(w505,cross(w505,P556))+dv505);
dvc606 = cross(dw606,Pc666)+cross(w606,cross(w606,Pc666))+dv606;
Fc606 = m6*dvc606;
Nc606 = ic6*dw606+cross(w606,ic6*w606);



%6->1
R67 = eye(3);n707 = [0 0 0]';f707 = [0 0 0]';

f606 = R67*f707 + Fc606 ;
n606 = Nc606 + R67*n707 + cross(Pc666,Fc606)  ;

f505 = R56*f606 + Fc505 ;
n505 = Nc505 + R56*n606 + cross(Pc555,Fc505) +cross (P556,R56*f606) ;

f404 = R45*f505 + Fc404 ;
n404 = Nc404 + R45*n505 + cross(Pc444,Fc404) +cross (P445,R45*f505) ;

f303 = R34*f404 + Fc303 ;
n303 = Nc303 + R34*n404 + cross(Pc333,Fc303) +cross (P334,R34*f404) ;

f202 = R23*f303 + Fc202 ;
n202 = Nc202 + R23*n303 + cross(Pc222,Fc202) +cross (P223,R23*f303) ;

f101 = R12*f202 + Fc101 ;
n101 = Nc101 + R12*n202 + cross(Pc111,Fc101) +cross (P112,R12*f202) ;



tao(1) = n101(3)
tao(2) = n202(3)
tao(3) = n303(3)
tao(4) = n404(3)
tao(5) = n505(3)
tao(6) = n606(3)





