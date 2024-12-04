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


Ts = 0.001;
last_value = 1;
u = 0:Ts:last_value;
k = 3;%degree;


Q  = [
    0.0000, 0.0000;
    0.2718, 0.2685;
    0.5539, 0.5260;
    0.8581, 0.7566;
    1.1971, 0.9310;
    1.5708, 1.0000;
    1.9445, 0.9310;
    2.2835, 0.7566;
    2.5877, 0.5260;
    2.8698, 0.2685;
    3.1416, 0.0000;
    3.4134, -0.2685;
    3.6955, -0.5260;
    3.9997, -0.7566;
    4.3387, -0.9310;
    4.7124, -1.0000;
    5.0861, -0.9310;
    5.4251, -0.7566;
    5.7293, -0.5260;
    6.0114, -0.2685;
    6.2832, -0.0000
];

[mm,nn] = size(Q);
eror = zeros(mm-9,2);

% must choose bigger than 5, 3 degree must have 5 points, also get rid of
% as for mm-4, i think that is unneccessary, also the curve get some
% strange shape.
for i = 5:mm-4
    eror(i-4,1) = i;
    [Pc,u_vec,eror(i-4,2)] = mnurbs_cal_inverse_point_error(Q,k,i);
    
    %% can get every n control points curve, choose the min error which repent the best n
     Cux = zeros(length(u));Cuy = zeros(length(u));
     for ii = 1:length(u)
        [Nik,dNik,ddNik] = mnurbs_cal_basis_func_matrix(u(ii),k,u_vec);
        Cux(ii) = Nik'*Pc(:,1);
        Cuy(ii) = Nik'*Pc(:,2);
     end
     Cux(length(u),1) = Pc(i,1);Cuy(length(u),1) = Pc(i,2);
    plot(Q(:,1),Q(:,2), 'bo-', 'MarkerFaceColor', 'b');hold on;
    plot(Pc(:,1),Pc(:,2));hold on;
    plot(Cux,Cuy); hold on;
    xlabel('X');
    ylabel('Y');
    grid on;
    pause(1);
end
eror
%% also can use nurbs not non_uniform B spline, change the weight to get more accuracy curve.
% another point, we can chose not min error point, also can choose index
% 10 or 13 or 9, 8 index is less point, we can get less number of point, only 10 control point can get well
% curve, 17 is nearly the total of Q.
chose_n = 13;
% chose_n = 17;
[Pc,er] = mnurbs_cal_inverse_point_error(Q,k,chose_n);
u_vec = mnurbs_cal_knot_ext(k,chose_n,1);
Cux = zeros(length(u));Cuy = zeros(length(u));
  for ii = 1:length(u)
        [Nik,dNik,ddNik] = mnurbs_cal_basis_func_matrix(u(ii),k,u_vec);
        Cux(ii) = Nik'*Pc(:,1);
        Cuy(ii) = Nik'*Pc(:,2);    
  end
  Cux(length(u),1) = Pc(chose_n,1);Cuy(length(u),1) = Pc(chose_n,2);
 figure;
plot(Q(:,1),Q(:,2), 'bo-', 'MarkerFaceColor', 'b');hold on;
plot(Pc(:,1),Pc(:,2), 'bo-', 'MarkerFaceColor', 'r');hold on;
plot(Cux,Cuy,'g'); hold on;
xlabel('X');
ylabel('Y');
grid on;



