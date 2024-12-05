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

last_value = 1;

u = 0:Ts:last_value;
  
% ���� NURBS ���߿��Ƶ��Ȩ��  define nurbs curve control point and weigth
Px = [0 ;1;2;3;5;0 ;1;2;3;5;]; % ���Ƶ�����  control point coodinate
W = [1 ;2;3;4;5;6 ;1 ;2;3;4;5;6 ]; % Ȩ��  weight



  
% ���� NURBS ���߶���  degree
k = 3; % ���߶���  
[m,n] = size(Px);
m = m-1;
u_vec = mnurbs_cal_knot_ext(k,m,last_value);


m = n + k+1 + k+1; 
  
Nik = zeros(1,length(u));
Cu = zeros(1,10000);

% figure;
% 
% degree = 3;
%     for index = 1:length(u_vec)
%         for j = 1:length(u)-1
%                 Nik(j) = nurbs_cal_basis_functions(u(j),index,degree,u_vec);
%         end
%         pause(0.2);
%         plot(Nik);hold on;
%     end
% xlim([0 1000]);
% 
subplot(2,2,1);degree = 0;

    for index = 1:length(u_vec)
        for j = 1:length(u)-1
                Nik(j) = mnurbs_cal_basis_functions(u(j),index,degree,u_vec);
        end
        pause(0.2);
        plot(Nik);hold on;
    end
xlim([0 1000]);
subplot(2,2,2);degree = 1;
    for index = 1:length(u_vec)
        for j = 1:length(u)-1
                Nik(j) = mnurbs_cal_basis_functions(u(j),index,degree,u_vec);
        end
        pause(0.2);
        plot(Nik);hold on;
    end
xlim([0 1000]);
subplot(2,2,3);degree = 2;
    for index = 1:length(u_vec)
        for j = 1:length(u)-1
                Nik(j) = mnurbs_cal_basis_functions(u(j),index,degree,u_vec);
        end
        pause(0.2);
        plot(Nik);hold on;
    end
    xlim([0 1000]);
subplot(2,2,4);degree = 3;
    for index = 1:length(u_vec)
        for j = 1:length(u)-1
                Nik(j) = mnurbs_cal_basis_functions(u(j),index,degree,u_vec);
        end
        pause(0.2);
        plot(Nik);hold on;
    end
xlim([0 1000]);



% 
% for degree = 0:k
%     for index = 1:length(u_vec)
%         for j = 1:length(u)-1
%                 Nik(j) = nurbs_cal_basis_functions(u(j),index,degree,u_vec);
%         end
%         pause(0.2);
%         plot(Nik);hold on;
%     end
%     if (index == length(u_vec)) && (degree== k)
%     else
%         
%         clf;
%     end
% 
% end



