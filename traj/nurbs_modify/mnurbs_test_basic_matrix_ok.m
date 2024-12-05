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
Ts = 0.001;
last_value = 5;
u = 0:Ts:last_value;
  k = 3; % ????  
  P = [0 10 1;
    1 12 -5;
    5 2 9;
    6 33 -11;
    10 55 15 ;
    20 20 -17;
    25 -11 20;
    28 -23 -25;
    39 33 28;
    45 50 36;]; % ?????  

[n,m] = size(P);
  
u_vec = mnurbs_cal_knot_ext(k,n,last_value);

Cux = zeros(1,length(u));
Cuy = zeros(1,length(u));
Cuz = zeros(1,length(u));


Nik = zeros(n,length(u));

for j = 1:length(u)
       for i = 1:n
           index = mnurbs_cal_index(u(j),u_vec);
           %if((i > index+k+2)||(i<index-k-2)||(i+k+1)>length(u_vec))
           % ;
           %else
                [Nik(i,j),dNik] = mnurbs_cal_basis_functions_Nik_dNik(u(j),i,k,u_vec) ;         
           %end
       end    

%    [Nik(:,j),dNik,ddNik] = nurbs_cal_basis_func_matrix(u(j),k,u_vec) ;
   Cux(j) = Nik(:,j)'*P(:,1);
   Cuy(j) = Nik(:,j)'*P(:,2);
   Cuz(j) = Nik(:,j)'*P(:,3);
end
Cux(length(u)) = P(n,1);Cuy(length(u)) = P(n,2);Cuz(length(u)) = P(n,3);
figure;
plot3(Cux,Cuy,Cuz);hold on;
plot3(P(:,1),P(:,2),P(:,3));

figure;
for j = 1:n
   plot(Nik(j,:));hold on;
       pause(0.2);
end



