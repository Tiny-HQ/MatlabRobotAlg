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
%% CoM dynamics symbol of SCARA
clear;
clc;
format long g;

%% ?????
syms q1 q2  q4  real;
syms dq1 dq2  dq4  real;
syms ddq1 ddq2  ddq4  real;
syms dd3 ddd3 real;
syms al0 al1 al2 al3  real;
syms a0 a1 a2 a3  real;
syms d1 d2 d3 d4  real;
syms m1 m2 m3 m4  real;
syms g ;

syms P001x P001y P001z real;
syms P112x P112y P112z real;
syms P223x P223y P223z real;
syms P334x P334y P334z real;
P001 = [P001x; P001y; P001z];
P112 = [P112x; P112y; P112z];
P223 = [P223x; P223y; P223z];
P334 = [P334x; P334y; P334z];

syms Pc111x Pc111y Pc111z real;
syms Pc222x Pc222y Pc222z real;
syms Pc333x Pc333y Pc333z real;
syms Pc444x Pc444y Pc444z real;
Pc111 = [Pc111x; Pc111y; Pc111z];
Pc222 = [Pc222x; Pc222y; Pc222z];
Pc333 = [Pc333x; Pc333y; Pc333z];
Pc444 = [Pc444x; Pc444y; Pc444z];

syms   Ic1xx  Ic1xy  Ic1xz  Ic1yy  Ic1yz   Ic1zz real;
syms   Ic2xx  Ic2xy  Ic2xz  Ic2yy  Ic2yz   Ic2zz real;
syms   Ic3xx  Ic3xy  Ic3xz  Ic3yy  Ic3yz   Ic3zz real;
syms   Ic4xx  Ic4xy  Ic4xz  Ic4yy  Ic4yz   Ic4zz real;
Ic1 = [ Ic1xx  -Ic1xy  -Ic1xz ; 
       -Ic1xy   Ic1yy  -Ic1yz ;
       -Ic1xy  -Ic1yz   Ic1zz ];
Ic2 = [ Ic2xx  -Ic2xy  -Ic2xz ; 
       -Ic2xy   Ic2yy  -Ic2yz ;
       -Ic2xz  -Ic2yz   Ic2zz ];
Ic3 = [ Ic3xx  -Ic3xy  -Ic3xz ; 
       -Ic3xy   Ic3yy  -Ic3yz ;
       -Ic3xz  -Ic3yz   Ic3zz ];
Ic4 = [ Ic4xx  -Ic4xy  -Ic4xz ; 
       -Ic4xy   Ic4yy  -Ic4yz ;
       -Ic4xz  -Ic4yz   Ic4zz ];

q=[ q1 q2 0 q4 ];
al=[ 0 0 0 0 ];

P001 = [0; 0; 0];
P112 = [a1; 0; 0];
P223 = [a2; 0; d3];
P334 = [0; 0; 0];

W000=[0;0;0];   dW000=[0;0;0]; 
dV000=[0;0;g]; 
Z111=[0;0;1];   Z222=[0;0;1];  Z333=[0;0;1];  Z444=[0;0;1]; 

R10=[ cos(q(1))   -sin(q(1))  0  ;
      sin(q(1))    cos(q(1))  0  ;
         0           0        1  ]';
R01=[ cos(q(1))   -sin(q(1))  0  ;
      sin(q(1))    cos(q(1))  0  ;
         0           0        1  ]; 
  
R21=[ cos(q(2))   -sin(q(2))  0  ;
      sin(q(2))    cos(q(2))  0  ;
         0           0        1  ]';
R12=[ cos(q(2))   -sin(q(2))  0  ;
      sin(q(2))    cos(q(2))  0  ;
         0           0        1  ]; 
 
R32=[ 1  0  0 ;
      0  1  0 ;
      0  0  1 ]';
R23=[ 1  0  0 ;
      0  1  0 ;
      0  0  1 ];
  
R43=[ cos(q(4))   -sin(q(4))  0  ;
      sin(q(4))    cos(q(4))  0  ;
         0           0        1  ]';
R34=[ cos(q(4))   -sin(q(4))  0  ;
      sin(q(4))    cos(q(4))  0  ;
         0           0        1  ];
%% ??  
% ??0->1
W101 = R10 * W000 + dq1 * Z111 ;
dW101 = R10 * dW000 + cross ( R10 * W000 , dq1 * Z111 ) + ddq1 * Z111 ;
dV101 = R10 * ( dV000 + cross ( dW000 , P001 ) + cross ( W000 , cross(W000,P001) )) ;

dVc101 = dV101 + cross (dW101 , Pc111 ) + cross ( W101 , cross ( W101 , Pc111 ) );
Fc111 = m1 * dVc101 ; 
Nc111 = Ic1 * dW101 + cross ( W101 , Ic1 * W101 );

% ??1->2
W202 = R21 * W101 + dq2 * Z222 ;
dW202 = R21 * dW101 + cross ( R21 * W101 , dq2 * Z222 ) + ddq2 * Z222 ;
dV202 = R21 * ( dV101 + cross ( dW101 , P112 ) + cross ( W101 , cross(W101,P112) )) ;

dVc202 = dV202 + cross (dW202 , Pc222 ) + cross ( W202 , cross ( W202 , Pc222 ) );
Fc222 = m2 * dVc202 ; 
Nc222 = Ic2 * dW202 + cross ( W202 , Ic2 * W202 );

% ??2->3
W303 = R32 * W202  ;
dW303 = R32 * dW202 ;
dV303 = R32 * ( dV202 + cross ( dW202 , P223 ) + cross ( W202 , cross(W202,P223) )) + 2*cross(R32*W202 , [0 0 -dd3]' ) + [0 0 ddd3]' ;

dVc303 = dV303 + cross (dW303 , Pc333 ) + cross ( W303 , cross ( W303 , Pc333 ) );
Fc333 = m3 * dVc303 ; 
Nc333 = Ic3 * dW303 + cross ( W303 , Ic3 * W303 );

% ??3->4
W404 = R43 * W303 + dq4 * Z444 ;
dW404 = R43 * dW303 + cross ( R43 * W303 , dq4 * Z444 ) + ddq4 * Z444 ;
dV404 = R43 * ( dV303 + cross ( dW303 , P334 ) + cross ( W303 , cross(W303,P334) )) ;

dVc404 = dV404 + cross (dW404 , Pc444 ) + cross ( W404 , cross ( W404 , Pc444 ) );
Fc444 = m4 * dVc404 ; 
Nc444 = Ic4 * dW404 + cross ( W404 , Ic4 * W404 );

f555 = [0 0 0]';
n555 = [0 0 0]';
R45 = 0;
P445= [0 0 0]';

%% ??
% ??5->4
f444 = R45*f555 + Fc444 ;
n444 = Nc444 + R45*n555 + cross(Pc444,Fc444) +cross (P445,R45*f555) ;

% ??4->3
f333 = R34*f444 + Fc333 ;
n333 = Nc333 + R34*n444 + cross(Pc333,Fc333) +cross (P334,R34*f444) ;

% ??3->2
f222 = R23*f333 + Fc222 ;
n222 = Nc222 + R23*n333 + cross(Pc222,Fc222) +cross (P223,R23*f333) ;

% ??2->1
f111 = R12*f222 + Fc111 ;
n111 = Nc111 + R12*n222 + cross(Pc111,Fc111) +cross (P112,R12*f222) ;

%% ??
AAA1 = n111(3)
AAA2 = n222(3)
AAA3 = f333(3)
AAA4 = n444(3)

