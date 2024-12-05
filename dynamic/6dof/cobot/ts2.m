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



%���һ�ؽ�����ʱ����;It is used to find the first joint moment;

% mx2 = 0;
% my2 = 0;
% xx2 = 0.270535360814424;
% xy2 = -0.125760336104957;
% xz2 = 0.294155954290448;
% yz2 = -0.0892952793765388;
% zz2 = 1.97514434738082e-19;

% mx3 = -0.0156467531573889;
% my3 = -0.0906122262280733;
% xx3 = -0.213778105093391;
% xy3 = 0.0336822294804673;
% xz3 = 0.357798344814096;
% yz3 = 0.944216914802467;
% zz3 = -2.23408046754102e-18;

%��ڶ��ؽ�����ʱ����;It is used to find the second joint moment;

mx2 = 2.53176898323084;
my2 = -9.47404813506614;
xx2 = -0.0280963270413018;
xy2 = 0.0976300887077188;
xz2 = 0.210231262573112;
yz2 = 0.0561805241328707;
zz2 = 0.261130133226898;


mx3 = 8.34327243228039;
my3 = 5.90328472916403;
xx3 = 0.0519707790256120;
xy3 = -0.0434212056927052;
xz3 = -0.120624181415644;
yz3 = 0.181116652775868;
zz3 = 0.587542799760519;

target = 4.48029325836016;

tmp = a4*mx3-a4^2*xx3-a4*d4*xz3+a4^2*zz3

g = 9.8065;
a3 = 425.0/1000.0;
a4 = 392.430/1000.0;
d1 = 89.2/1000.0;
d4 = 109/1000.0;
d5 = 93.650/1000.0;
d6 = 82.0/1000.0;




W = zeros(35,1);
AA = zeros(14,1);
BB = zeros(14,1);
CC = zeros(14,1);
DD = zeros(14,1);
EE = zeros(14,1);
FF = zeros(14,1);
GG = zeros(14,1);

%���ܴ���a4��d4��a4^2��d4^2��a4*d4,may exist a4��d4��a4^2��d4^2��a4*d4
A1 = a4*mx2;
A2 = d4*mx2;
A3 = a4^2*mx2;
A4 = d4^2*mx2;
A5 = a4*d4*mx2;
A6 = 2*A1;
A7 = 2*A2;

B1 = a4*my2;
B2 = d4*my2;
B3 = a4^2*my2;
B4 = d4^2*my2;
B5 = a4*d4*my2;
B6 = 2*B1;
B7 = 2*B2;

C1 = a4*xz2;
C2 = d4*xz2;
C3 = a4^2*xz2;
C4 = d4^2*xz2;
C5 = a4*d4*xz2;
C6 = 2*C1;
C7 = 2*C2;

D1 = a4*xx2;
D2 = d4*xx2;
D3 = a4^2*xx2;
D4 = d4^2*xx2;
D5 = a4*d4*xx2;
D6 = 2*D1;
D7 = 2*D2;

E1 = a4*xy2;
E2 = d4*xy2;
E3 = a4^2*xy2;
E4 = d4^2*xy2;
E5 = a4*d4*xy2;
E6 = 2*E1;
E7 = 2*E2;

F1 = a4*yz2;
F2 = d4*yz2;
F3 = a4^2*yz2;
F4 = d4^2*yz2;
F5 = a4*d4*yz2;
F6 = 2*F1;
F7 = 2*F2;

G1 = a4*zz2;
G2 = d4*zz2;
G3 = a4^2*zz2;
G4 = d4^2*zz2;
G5 = a4*d4*zz2;
G6 = 2*G1;
G7 = 2*G2;

% W(1) = A1;W(2) = A2;W(3) = A3;W(4) = A4;W(5) = A5;
% W(6) = B1;W(7) = B2;W(8) = B3;W(9) = B4;W(10) = B5;
% W(11) = C1;W(12) = C2;W(13) = C3;W(14) = C4;W(15) = C5;
% W(16) = D1;W(17) = D2;W(18) = D3;W(19) = D4;W(20) = D5;
% W(21) = E1;W(22) = E2;W(23) = E3;W(24) = E4;W(25) = E5;
% W(26) = F1;W(27) = F2;W(28) = F3;W(29) = F4;W(30) = F5;
% W(31) = G1;W(32) = G2;W(33) = G3;W(34) = G4;W(35) = G5;

%Ҳ���ܴ��ڼӼ�������������10�ĳЩϵ�����п��ܳ�Ϊƴ������ֵ;There may also be additions and subtractions, so there are 10 terms here, and some coefficients may become spelled values;
AA(1) = A1;AA(2) = A2;AA(3) = A3;AA(4) = A4;AA(5) = A5;AA(6) = -A1;AA(7) = -A2;AA(8) = -A3;AA(9) = -A4;AA(10) = -A5;AA(11) = A6;AA(12) = -A6;AA(13) = A7;AA(14) = -A7;
BB(1) = B1;BB(2) = B2;BB(3) = B3;BB(4) = B4;BB(5) = B5;BB(6) = -B1;BB(7) = -B2;BB(8) = -B3;BB(9) = -B4;BB(10) = -B5;BB(11) = B6;BB(12) = -B6;BB(13) = B7;BB(14) = -B7;
CC(1) = C1;CC(2) = C2;CC(3) = C3;CC(4) = C4;CC(5) = C5;CC(6) = -C1;CC(7) = -C2;CC(8) = -C3;CC(9) = -C4;CC(10) = -C5;CC(11) = C6;CC(12) = -C6;CC(13) = C7;CC(14) = -C7;
DD(1) = D1;DD(2) = D2;DD(3) = D3;DD(4) = D4;DD(5) = D5;DD(6) = -D1;DD(7) = -D2;DD(8) = -D3;DD(9) = -D4;DD(10) = -D5;DD(11) = D6;DD(12) = -D6;DD(13) = D7;DD(14) = -D7;
EE(1) = E1;EE(2) = E2;EE(3) = E3;EE(4) = E4;EE(5) = E5;EE(6) = -E1;EE(7) = -E2;EE(8) = -E3;EE(9) = -E4;EE(10) = -E5;EE(11) = E6;EE(12) = -E6;EE(13) = E7;EE(14) = -E7;
FF(1) = F1;FF(2) = F2;FF(3) = F3;FF(4) = F4;FF(5) = F5;FF(6) = -F1;FF(7) = -F2;FF(8) = -F3;FF(9) = -F4;FF(10) = -F5;FF(11) = F6;FF(12) = -F6;FF(13) = F7;FF(14) = -F7;
GG(1) = G1;GG(2) = G2;GG(3) = G3;GG(4) = G4;GG(5) = G5;GG(6) = -G1;GG(7) = -G2;GG(8) = -G3;GG(9) = -G4;GG(10) = -G5;GG(11) = G6;GG(12) = -G6;GG(13) = G7;GG(14) = -G7;

count = 0;
for i = 1:14
    
    for j = 1:14
        
        for m = 1:14
        
            for n = 1:14
        
                for k = 1:14
                    
                    for w = 1:14
                       
                        for r = 1:14
                            t1 = AA(i);t2 = BB(j);t3 = CC(m);t4 = DD(n);t5 = EE(k);t6 = FF(w);t7 = GG(r);
                     
                            for tt = 1:112
                         
                                count = count+1;
                                if(mod(count,1000000) == 0)
                                    count
                                end
                                sum = bitget(tt,1)*t1+bitget(tt,2)*t2+bitget(tt,3)*t3+bitget(tt,4)*t4+bitget(tt,5)*t5+bitget(tt,6)*t6+bitget(tt,7)*t7+tmp;
           
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





