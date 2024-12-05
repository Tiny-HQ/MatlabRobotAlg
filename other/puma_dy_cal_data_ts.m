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

function tao = puma_dy_cal_data_ts(q,dq,ddq)


    global g m1 m2 m3 m4 m5 m6;
  	global ic1 ic2 ic3 ic4 ic5 ic6;
    global Pc111 Pc222 Pc333 Pc444 Pc555 Pc666;
    global P001 P112 P223 P334 P445 P556 P667;

    q1 = q(1)*pi/180.0;
    q2 = q(2)*pi/180.0;
    q3 = q(3)*pi/180.0-pi;
    q4 = q(4)*pi/180.0;
    q5 = q(5)*pi/180.0;
    q6 = q(6)*pi/180.0+pi;

    dq1 = dq(1)*pi/180.0;
    dq2 = dq(2)*pi/180.0;
    dq3 = dq(3)*pi/180.0;
    dq4 = dq(4)*pi/180.0;
    dq5 = dq(5)*pi/180.0;
    dq6 = dq(6)*pi/180.0;

    ddq1 = ddq(1)*pi/180.0;
    ddq2 = ddq(2)*pi/180.0;
    ddq3 = ddq(3)*pi/180.0;
    ddq4 = ddq(4)*pi/180.0;
    ddq5 = ddq(5)*pi/180.0;
    ddq6 = ddq(6)*pi/180.0;


    Ic1 = ic1;
    Ic2 = ic2;
    Ic3 = ic3;
    Ic4 = ic4;
    Ic5 = ic5;
    Ic6 = ic6;

    W000=[0;0;0];   dW000=[0;0;0]; 
    V000=[0;0;0];   dV000=[0;0;g]; 
    Z111=[0;0;1];  Z222=[0;0;1];  Z333=[0;0;1];  Z444=[0;0;1];  Z555=[0;0;1];  Z666=[0;0;1];



    R10=[ cos(q1)   -sin(q1)  0  ;
          sin(q1)    cos(q1)  0  ;
             0           0        1  ]';
    R01=[ cos(q1)   -sin(q1)  0  ;
          sin(q1)    cos(q1)  0  ;
             0           0        1  ]; 

    R21=[ cos(q2)   -sin(q2)  0 ;
              0            0      1 ;
          -sin(q2)  -cos(q2)  0 ]';
    R12=[ cos(q2)   -sin(q2)  0 ;
              0            0      1 ;
          -sin(q2)  -cos(q2)  0 ];

    R32=[ cos(q3) -sin(q3)  0 ;
          sin(q3)  cos(q3)  0 ;
             0          0       1 ]';
    R23=[ cos(q3) -sin(q3)  0 ;
          sin(q3)  cos(q3)  0 ;
             0          0       1 ];

    R43=[ cos(q4)   -sin(q4)  0 ;
              0           0       1 ;
          -sin(q4)  -cos(q4)  0 ]';
    R34=[ cos(q4)   -sin(q4)  0 ;
              0           0       1 ;
          -sin(q4)  -cos(q4)  0 ];

    R54=[ cos(q5) -sin(q5)  0 ;
              0          0     -1 ;
          sin(q5)  cos(q5)  0 ]';
    R45=[ cos(q5) -sin(q5)  0 ;
              0          0     -1 ;
          sin(q5)  cos(q5)  0 ]; 

    R65=[ cos(q6)   -sin(q6)  0 ;
              0           0       1 ;
          -sin(q6)  -cos(q6)  0 ]';
    R56=[ cos(q6)   -sin(q6)  0 ;
              0           0       1 ;
          -sin(q6)  -cos(q6)  0 ];
  
  
    % ����0->1
    W101 = R10 * W000 + dq1 * Z111 ;
    dW101 = R10 * dW000 + cross ( R10 * W000 , dq1 * Z111 ) + ddq1 * Z111 ;
    dV101 = R10 * ( dV000 + cross ( dW000 , P001 ) + cross ( W000 , cross(W000,P001) )) ;

    dVc101 = dV101 + cross (dW101 , Pc111 ) + cross ( W101 , cross ( W101 , Pc111 ) );
    Fc111 = m1 * dVc101 ; 
    Nc111 = Ic1 * dW101 + cross ( W101 , Ic1 * W101 );

    % ����1->2
    W202 = R21 * W101 + dq2 * Z222 ;
    dW202 = R21 * dW101 + cross ( R21 * W101 , dq2 * Z222 ) + ddq2 * Z222 ;
    dV202 = R21 * ( dV101 + cross ( dW101 , P112 ) + cross ( W101 , cross(W101,P112) )) ;

    dVc202 = dV202 + cross (dW202 , Pc222 ) + cross ( W202 , cross ( W202 , Pc222 ) );
    Fc222 = m2 * dVc202 ; 
    Nc222 = Ic2 * dW202 + cross ( W202 , Ic2 * W202 );

    % ����2->3
    W303 = R32 * W202 + dq3 * Z333 ;
    dW303 = R32 * dW202 + cross ( R32 * W202 , dq3 * Z333 ) + ddq3 * Z333 ;
    dV303 = R32 * ( dV202 + cross ( dW202 , P223 ) + cross ( W202 , cross(W202,P223) )) ;

    dVc303 = dV303 + cross (dW303 , Pc333 ) + cross ( W303 , cross ( W303 , Pc333 ) );
    Fc333 = m3 * dVc303 ; 
    Nc333 = Ic3 * dW303 + cross ( W303 , Ic3 * W303 );

    % ����3->4
    W404 = R43 * W303 + dq4 * Z444 ;
    dW404 = R43 * dW303 + cross ( R43 * W303 , dq4 * Z444 ) + ddq4 * Z444 ;
    dV404 = R43 * ( dV303 + cross ( dW303 , P334 ) + cross ( W303 , cross(W303,P334) )) ;

    dVc404 = dV404 + cross (dW404 , Pc444 ) + cross ( W404 , cross ( W404 , Pc444 ) );
    Fc444 = m4 * dVc404 ; 
    Nc444 = Ic4 * dW404 + cross ( W404 , Ic4 * W404 );

    % ����4->5
    W505 = R54 * W404 + dq5 * Z555 ;
    dW505 = R54 * dW404 + cross ( R54 * W404 , dq5 * Z555 ) + ddq5 * Z555 ;
    dV505 = R54 * ( dV404 + cross ( dW404 , P445 ) + cross ( W404 , cross(W404,P445) )) ;

    dVc505 = dV505 + cross (dW505 , Pc555 ) + cross ( W505 , cross ( W505 , Pc555 ) );
    Fc555 = m5 * dVc505 ; 
    Nc555 = Ic5 * dW505 + cross ( W505 , Ic5 * W505 );

    % ����5->6
    W606 = R65 * W505 + dq6 * Z666 ;
    dW606 = R65 * dW505 + cross ( R65 * W505 , dq6 * Z666 ) + ddq6 * Z666 ;
    dV606 = R65 * ( dV505 + cross ( dW505 , P556 ) + cross ( W505 , cross(W505,P556) )) ;

    dVc606 = dV606 + cross (dW606 , Pc666 ) + cross ( W606 , cross ( W606 , Pc666 ) );
    Fc666 = m6 * dVc606 ; 
    Nc666 = Ic6 * dW606 + cross ( W606 , Ic6 * W606 );


    % ����7->6
    f666 = Fc666 ;
    n666 = Nc666 + cross(Pc666,Fc666) ;

    % ����6->5
    f555 = R56*f666 + Fc555 ;
    n555 = Nc555 + R56*n666 + cross(Pc555,Fc555) +cross (P556,R56*f666) ;

    % ����5->4
    f444 = R45*f555 + Fc444 ;
    n444 = Nc444 + R45*n555 + cross(Pc444,Fc444) +cross (P445,R45*f555) ;

    % ����4->3
    f333 = R34*f444 + Fc333 ;
    n333 = Nc333 + R34*n444 + cross(Pc333,Fc333) +cross (P334,R34*f444) ;

    % ����3->2
    f222 = R23*f333 + Fc222 ;
    n222 = Nc222 + R23*n333 + cross(Pc222,Fc222) +cross (P223,R23*f333) ;

    % ����2->1
    f111 = R12*f222 + Fc111 ;
    n111 = Nc111 + R12*n222 + cross(Pc111,Fc111) +cross (P112,R12*f222) ;




    tao(1) = n111(3);
    tao(2) = n222(3);
    tao(3) = n333(3);
    tao(4) = n444(3);
    tao(5) = n555(3);
    tao(6) = n666(3);




end





