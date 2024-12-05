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
  k = 3; % ��D�sCE? 
  P = [0 10 1;
    1 12 -5;
    5 2 9;
    6 33 -11;
    10 55 15 ;
    20 20 -17;
    25 -11 20;
    28 -23 -25;
    39 33 28;
    45 50 36;]; % zR�Cla�rae  

[n,m] = size(P);
  
u_vec = nurbs_cal_knot(k,n,last_value);

Cux = zeros(1,length(u));
Cuy = zeros(1,length(u));
Cuz = zeros(1,length(u));


Nik = zeros(n+4,length(u));

for j = 1:length(u)
       for i = 2:n+3
           index = nurbs_cal_index(u(j),u_vec);
           if((i > index+k+2)||(i<index-k-2)||(i+k+1)>length(u_vec))
            ;
           else
                [Nik(i+1,j),dNik] = nurbs_cal_basis_functions_Nik_dNik(u(j),i,k,u_vec) ;         
           end
       end    
%     for i = 1:n+1
%         Cux(j) = Nik(i,j)'*P(i,1);
%         Cuy(j) = Nik(i,j)'*P(i,2);
%         Cuz(j) = Nik(i,j)'*P(i,3);
%     end
   %[Nik(:,j),dNik,ddNik] = nurbs_cal_basis_func_matrix(u(j),k,u_vec) ;
%    Cux(i) = Nik(:,i)'*P(:,1);
%    Cuy(i) = Nik(:,i)'*P(:,2);
%    Cuz(i) = Nik(:,i)'*P(:,3);
end

% figure;
% plot3(Cux,Cuy,Cuz);hold on;
% plot3(P(:,1),P(:,2),P(:,3));


for j = 1:length(u_vec)
   plot(Nik(j,:));hold on;
       pause(0.2);
end



