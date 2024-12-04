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
last_value = 2;
u = 0:Ts:last_value;

V_max = 30;
A_max = 100;
J_max = 100;
  
%define nurbs curve control point and weight;
P = [0 10 1;
    1 12 -5;
    5 2 9;
    6 33 -11;
    10 55 15 ;
    20 20 -17;
    25 -11 20;
    28 -23 -25;
    39 33 28;
    45 50 36;]; % 控制点坐标  control point coodinate
% P = [0 10 1;1 12 -5;5 2 9;6 33 -11;10 55 15 ;23 -20 17;25 -11 20;28 -23 -25;39 33 28;45 50 36;]; % modify one of control point, figure only change one part of them. 

Wx = [1 ;2;3;4;6 ;1 ;2;3;5;6 ]; % 权重  weight
%Wx = [1 ;1;1;1;1 ;1 ;1;1;1;1 ]; % 权重 weight
Wy = [1 ;1;1;1;1 ;1 ;1;1;1;1 ]; % 权重 weight
% Wy = [1 ;2;3;5;6 ;10 ;2;3;4;6 ]; % 权重  weight
 Wz = [1 ;1;1;1;1 ;1 ;1;1;1;1 ]; % 权重 weight
% Wz = [1 ;2;4;5;6 ;10 ;3;4;5;6 ]; % 权重  weight
  
% 定义 NURBS 曲线度数  degreeee
k = 3; % 曲线度数  
[m,n] = size(P);
u_vec = mnurbs_cal_knot_ext(k,m,last_value);

Cu = zeros(length(u),3);
Cu_v = zeros(n,3);
dCu = zeros(length(u),3);
ddCu = zeros(length(u),3);
k_c = zeros(length(u),1);%curvature;

for j = 1:length(u)

    %i = floor(u(j)/Ts);%determin index of knot vector;
    [Cu(j,1),dCu(j,1),ddCu(j,1),Cu(j,2),dCu(j,2),ddCu(j,2),Cu(j,3),dCu(j,3),ddCu(j,3)] = mnurbs_cal_ddcu_derivative(u(j),k,u_vec,P(:,1),Wx,P(:,2),Wy,P(:,3),Wz);
%     [Cu(j,2),dCu(j,2),ddCu(j,2)] = nurbs_cal_ddcu_derivative(u(j),k,u_vec,P(:,2),Wy);
%     [Cu(j,3),dCu(j,3),ddCu(j,3)] = nurbs_cal_ddcu_derivative(u(j),k,u_vec,P(:,3),Wz);
    
    dcu = [dCu(j,1) dCu(j,2) dCu(j,3)];
    ddcu = [ddCu(j,1) ddCu(j,2) ddCu(j,3)];
    
    c_cross = cross(dcu,ddcu);  
    k_c(j) = sqrt(sum(c_cross.^2))/(sqrt(sum(dcu.^2)))^3;%curvature;
    
end
Cu(1,1) = Cu(2,1);Cu(1,2) = Cu(2,2);Cu(1,3) = Cu(2,3);
Cu(length(u),1) = Cu(length(u)-1,1);Cu(length(u),2) = Cu(length(u)-1,2);Cu(length(u),3) = Cu(length(u)-1,3);
%sss = nurbs_simpson_cal_length(u(2),u(length(u)-1),u_vec,k,P(:,1),Wx,P(:,2),Wy,P(:,3),Wz)
% choose the candidate point and split the curve
[p] = mnurbs_cal_candidate_split_point(V_max,A_max,J_max,k_c);
pp = zeros(1,length(p)+2);
k_cc = zeros(1,length(p));
for i = 1:length(p) 
    k_cc(i) = k_c(p(i));
end;
pp(1) = 2;pp(2:length(p)+1) = p;pp(length(p)+2) = length(u)-1;

% calculate the arc length of every part;
s = zeros(1,length(pp)-1);
for i = 1:length(pp)-1
    s(i) = mnurbs_simpson_cal_length(u(pp(i)),u(pp(i+1)),u_vec,k,P(:,1),Wx,P(:,2),Wy,P(:,3),Wz);
end


%calculate the velocity limit at the candidate point;
[v,ss] = mnurbs_cal_velocity(s,k_cc,V_max,A_max,J_max);
t = zeros(length(v)-1,7);

%calculate every part motion parameter time segment;
%generate the arc length trajctory;
Tss = 0.002; %interpolation cycle;1ms;
sss = zeros(length(v)-1,20000);
vvv = zeros(length(v)-1,20000);
total_point = zeros(1,length(v)-1);
t_s = 0.0;
t_e = 0.0;
for i = 1:length(v)-1
    [t(i,:),j,error] = s_curve_all_parameter_cal_para(ss(i),ss(i+1),v(i),v(i+1),V_max,A_max,J_max);
     [s_,vv,aa,jjerk,t_e] = s_curve_all_parameter_cal_traj(t(i,:),Tss,J_max,v(i),ss(i),t_s);
     t_s = t_e;
    sss(i,1:length(s_)) = s_;  
    total_point(i) = length(s_);
    vvv(i,1:length(s_)) = vv(1:length(s_));  
end


count = 1;
total = sum(total_point);
s_t = zeros(1,total);
v_t = zeros(1,total);
for i = 1:length(v)-1
   for j = 1:total_point(i) 
        s_t(count) = sss(i,j);
        v_t(count) = vvv(i,j);count = count+1;
   end
end
figure;
subplot(2,1,1);
plot(s_t);
subplot(2,1,2);
plot(v_t);hold on;plot(diff(s_t)/Tss);

s_length = ss(length(ss));
%generate trajctory

Cu1 = zeros(total,3);
count = 1;Cu1(count,:) = P(1,:);
u_t = 0;dcux = 0.0;dcuy = 0.0;dcuz = 0.0;ddcux = 0.0;ddcuy = 0.0;ddcuz = 0.0;
for i = 1:total-1
    if(i == 31)
       i =31; 
    end
     [Cu1(i,1), dcux, ddcux,Cu1(i,2), dcuy, ddcuy,Cu1(i,3), dcuz, ddcuz] =  mnurbs_cal_ddcu_derivative(u_t,k,u_vec,P(:,1),Wx,P(:,2),Wy,P(:,3),Wz);
%      [Cu1(i,2), dcuy, ddcuy] =  nurbs_cal_ddcu_derivative(u_t,k,u_vec,P(:,2),Wy);
%      [Cu1(i,3), dcuz, ddcuz] =  nurbs_cal_ddcu_derivative(u_t,k,u_vec,P(:,3),Wz);
     ds = s_t(i+1)-s_t(i);
     dcu = [dcux dcuy dcuz];
     ddcu = [ddcux ddcuy ddcuz];
     dcu_mo = sqrt(dcux^2+dcuy^2+dcuz^2);
     u_t = u_t + 1/(dcu_mo)*ds;
     %u_t = u_t + 1/(dcu_mo)*ds-0.5*sum(dcu.*ddcu)/dcu_mo^4*ds^2;
     if(u_t>last_value)
         u_t = last_value;
     elseif (u_t<0)
         u_t = 0;
     end


end

  Cu1(1,:) = P(1,:); Cu1(total,:) = Cu1(total-1,:);
figure;
 plot3(P(:,1),P(:,2),P(:,3));hold on;
 plot3(Cu(:,1),Cu(:,2),Cu(:,3)); hold on;
 plot3(Cu1(:,1),Cu1(:,2),Cu1(:,3));

 
 
%check velocity ;
 figure;
 vx = diff(Cu1(:,1)/Tss); vy = diff(Cu1(:,2)/Tss); vz = diff(Cu1(:,3)/Tss);
VV = zeros(1,length(vx));
for i = 1:length(vx)
   VV(i) = sqrt(vx(i)^2+vy(i)^2+vz(i)^2); 
end
plot(VV);
hold on;plot(diff(s_t)/Tss);
