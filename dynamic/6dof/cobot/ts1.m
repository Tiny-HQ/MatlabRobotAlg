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

%求第三关节的力矩时，找到某个时刻对应的最小参数集的矩阵项，下面的这些都是系数，就是U_r矩阵中的值，拿出来的，
%When finding the moment of the third joint, find the matrix terms corresponding to the minimum parameter set at a certain time, and the following are all coefficients, which are the values in the U_r matrix.
%这里选取最后一刻的U_r矩阵的项(Here we pick the last-minute U_r matrix items)，mx3 = U_r(3,22),my3 = U_r(3,23),xx3 = U_r(3,25),xy3 =
%U_r(3,26),xz3 = U_r(3,27),yz3 = U_r(3,29),zz3 =
%U_r(3,30),目标需要组成M4的矩阵系数，也就是U_r(3,31);
%The target needs to make up the matrix coefficients of M4, which is U_r(3,31);


mx3 = 8.05426507300598;
my3 = 5.52921746908951;
xx3 = 0.0519707790256120;
xy3 = -0.0434212056927052;
xz3 = -0.120624181415644;
yz3 = 0.181116652775868;
zz3 = 0.587542799760519;

a4 = 392.430/1000.0;
d4 = 109/1000.0;


target = 3.24837371633976;%这个是m4项对应的矩阵系数;This is the matrix coefficient corresponding to the m4 term;
W = zeros(35,1);
AA = zeros(10,1);
BB = zeros(10,1);
CC = zeros(10,1);
DD = zeros(10,1);
EE = zeros(10,1);
FF = zeros(10,1);
GG = zeros(10,1);

%可能存在a4、d4、a4^2、d4^2、a4*d4
A1 = a4*mx3;
A2 = d4*mx3;
A3 = a4^2*mx3;
A4 = d4^2*mx3;
A5 = a4*d4*mx3;

B1 = a4*my3;
B2 = d4*my3;
B3 = a4^2*my3;
B4 = d4^2*my3;
B5 = a4*d4*my3;

C1 = a4*xz3;
C2 = d4*xz3;
C3 = a4^2*xz3;
C4 = d4^2*xz3;
C5 = a4*d4*xz3;

D1 = a4*xx3;
D2 = d4*xx3;
D3 = a4^2*xx3;
D4 = d4^2*xx3;
D5 = a4*d4*xx3;

E1 = a4*xy3;
E2 = d4*xy3;
E3 = a4^2*xy3;
E4 = d4^2*xy3;
E5 = a4*d4*xy3;

F1 = a4*yz3;
F2 = d4*yz3;
F3 = a4^2*yz3;
F4 = d4^2*yz3;
F5 = a4*d4*yz3;

G1 = a4*zz3;
G2 = d4*zz3;
G3 = a4^2*zz3;
G4 = d4^2*zz3;
G5 = a4*d4*zz3;

%也可能存在加减，所以这里有10项，某些系数都有可能成为拼出来的值;There may also be additions and subtractions, so there are 10 terms here, and some coefficients may become spelled values;
AA(1) = A1;AA(2) = A2;AA(3) = A3;AA(4) = A4;AA(5) = A5;AA(6) = -A1;AA(7) = -A2;AA(8) = -A3;AA(9) = -A4;AA(10) = -A5;%A1
BB(1) = B1;BB(2) = B2;BB(3) = B3;BB(4) = B4;BB(5) = B5;BB(6) = -B1;BB(7) = -B2;BB(8) = -B3;BB(9) = -B4;BB(10) = -B5;%
CC(1) = C1;CC(2) = C2;CC(3) = C3;CC(4) = C4;CC(5) = C5;CC(6) = -C1;CC(7) = -C2;CC(8) = -C3;CC(9) = -C4;CC(10) = -C5;%-C5
DD(1) = D1;DD(2) = D2;DD(3) = D3;DD(4) = D4;DD(5) = D5;DD(6) = -D1;DD(7) = -D2;DD(8) = -D3;DD(9) = -D4;DD(10) = -D5;%-D3
EE(1) = E1;EE(2) = E2;EE(3) = E3;EE(4) = E4;EE(5) = E5;EE(6) = -E1;EE(7) = -E2;EE(8) = -E3;EE(9) = -E4;EE(10) = -E5;%
FF(1) = F1;FF(2) = F2;FF(3) = F3;FF(4) = F4;FF(5) = F5;FF(6) = -F1;FF(7) = -F2;FF(8) = -F3;FF(9) = -F4;FF(10) = -F5;%
GG(1) = G1;GG(2) = G2;GG(3) = G3;GG(4) = G4;GG(5) = G5;GG(6) = -G1;GG(7) = -G2;GG(8) = -G3;GG(9) = -G4;GG(10) = -G5;%G3

count = 0;
for i = 1:10
    
    for j = 1:10
        
        for m = 1:10
        
            for n = 1:10
        
                for k = 1:10
                    
                    for w = 1:10
                       
                        for r = 1:10
                            t1 = AA(i);t2 = BB(j);t3 = CC(m);t4 = DD(n);t5 = EE(k);t6 = FF(w);t7 = GG(r);
                            %一共有7种，有些项可能还没有，所以有2^7次方种，每一种都需要查询到，There are 7 kinds in total, and some items may not be available yet, so there are 2^7 power species, and each one needs to be queried
                            for tt = 1:127
                                   %大概计算了一千万次就出来了。反推回去，就能知道是哪些项，然后再往最小二乘里面写好相应的系数就行了,It came out after about 10 million calculations. Push back to know which terms are, and then write the corresponding coefficients into the least squares
                                count = count+1;
                                if(mod(count,10000) == 0)
                                   count 
                                end
                                sum = bitget(tt,1)*t1+bitget(tt,2)*t2+bitget(tt,3)*t3+bitget(tt,4)*t4+bitget(tt,5)*t5+bitget(tt,6)*t6+bitget(tt,7)*t7;
           
                                if(abs(sum-target)<10e-10)
                                    bitget(tt,1)
                                    bitget(tt,2)
                                    bitget(tt,3)
                                    bitget(tt,4)
                                    bitget(tt,5)
                                    bitget(tt,6)
                                    bitget(tt,7)
                                    count
                                    t1
                                    t2
                                    t3
                                    t4
                                    t5
                                    t6
                                    t7
                                    i
                                    j
                                   m
                                   n
                                   k
                                   w
                                   r
                                   break; 
                                end
                                
                            end
                            
                        end
                        
                    end
        
                end
            end
        
        end 
 
    
    end
    
end 



