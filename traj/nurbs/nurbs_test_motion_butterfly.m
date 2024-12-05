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
%plot 3d figure use nurbs...

clc;
clear;
Ts = 0.001;
last_value = 5;
u = 0:Ts:last_value;

% V_max = 120;
% A_max = 100;
% J_max = 100;

V_max = 80;
A_max = 1650;
J_max = 1650;
  
  
%define nurbs curve control point and weight;
P = [0, 54.493, 52.139; 
0, 55.507, 52.139; 
0, 56.082, 49.615; 
0, 56.780, 44.971; 
0, 69.575, 51.358;
0, 77.786, 58.573; 
0, 90.526, 67.081; 
0, 105.973, 63.801; 
0, 100.400, 47.326;
0, 94.567, 39.913;
0, 92.369, 30.485; 
0, 83.440, 33.757; 
0, 91.892, 28.509; 
0, 89.444, 20.393; 
0, 83.218, 15.446;
0, 87.621, 4.830; 
0, 80.945, 9.267; 
0, 79.834, 14.535; 
0, 76.074, 8.522; 
0, 70.183, 12.550;
0, 64.171, 16.865; 
0, 59.993, 22.122; 
0, 55.680, 36.359; 
0, 56.925, 24.995; 
0, 59.765, 19.828;
0, 54.493, 14.940; 
0, 49.220, 19.828; 
0, 52.060, 24.994; 
0, 53.305, 36.359; 
0, 48.992, 22.122;
0, 44.814, 16.865; 
0, 38.802, 12.551; 
0, 32.911, 8.521; 
0, 29.152, 14.535; 
0, 28.040, 9.267;
0, 21.364, 4.830; 
0, 25.768, 15.447; 
0, 19.539, 20.391; 
0, 17.097, 28.512; 
0, 25.537, 33.750;
0, 16.602, 30.496; 
0, 14.199, 39.803; 
0, 8.668, 47.408;
0, 3.000, 63.794; 
0, 18.465, 67.084;
0, 31.197, 58.572; 
0, 39.411, 51.358; 
0, 52.204, 44.971; 
0, 52.904, 49.614; 
0, 53.478, 52.139;
0, 54.493, 52.139;]; 
w = [1.00, 1.00, 1.00, 1.20, 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, 2.00, 1.00, 1.00, 5.00, 3.00, 1.00,...
     1.10, 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, 1.000, 1.00, 1.10,...
     1.00, 3.00, 5.00, 1.00, 1.00, 2.00, 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, 1.20, 1.00, 1.00, 1.00];
%  
%  a = [0, 0, 0, 0, 0.0083, 0.0150, 0.0361, 0.0855, 0.1293, 0.1509, 0.1931, 0.2273, 0.2435, 0.2561,...
%                       0.2692, 0.2889, 0.3170, 0.3316, 0.3482, 0.3553, 0.3649, 0.3837, 0.4005, 0.4269, 0.4510,...
%                       0.4660, 0.4891, 0.5000, 0.5109, 0.5340, 0.5489, 0.5731, 0.5994, 0.6163, 0.6351, 0.6447,...
%                       0.6518, 0.6683, 0.6830, 0.7111, 0.7307, 0.7439, 0.7565, 0.7729, 0.8069, 0.8491, 0.8707,...
%                       0.9145, 0.9639, 0.9850, 0.9917, 1, 1, 1, 1] ;
  tic;
% ���� NURBS ���߶���  
k = 3; % ���߶���  degree
[m,n] = size(P);
u_vec = nurbs_cal_knot(k,m,last_value);

Cu = zeros(length(u),3);
dCu = zeros(length(u),3);
ddCu = zeros(length(u),3);
k_c = zeros(length(u),1);



for j = 1:length(u)

    %i = floor(u(j)/Ts);%determin index of knot vector;
    [Cu(j,1),dCu(j,1),ddCu(j,1),Cu(j,2),dCu(j,2),ddCu(j,2),Cu(j,3),dCu(j,3),ddCu(j,3)] = nurbs_cal_ddcu_derivative(u(j),k,u_vec,P(:,1),w',P(:,2),w',P(:,3),w');
%     [Cu(j,2),dCu(j,2),ddCu(j,2)] = nurbs_cal_ddcu_derivative(u(j),k,u_vec,P(:,2),w');
%     [Cu(j,3),dCu(j,3),ddCu(j,3)] = nurbs_cal_ddcu_derivative(u(j),k,u_vec,P(:,3),w');
    
    dcu = [dCu(j,1) dCu(j,2) dCu(j,3)];
    ddcu = [ddCu(j,1) ddCu(j,2) ddCu(j,3)];
    
    c_cross = cross(dcu,ddcu);  
    if(sqrt(sum(dcu.^2))<0.00001)
        k_c(j) = 0.0;
    else
        k_c(j) = sqrt(sum(c_cross.^2))/(sqrt(sum(dcu.^2)))^3;%curvature;
    end
    
end
Cu(1,1) = Cu(2,1);Cu(1,2) = Cu(2,2);Cu(1,3) = Cu(2,3);
Cu(length(u),1) = Cu(length(u)-1,1);Cu(length(u),2) = Cu(length(u)-1,2);Cu(length(u),3) = Cu(length(u)-1,3);
%sss = nurbs_simpson_cal_length(u(2),u(length(u)-1),u_vec,k,P(:,1),Wx,P(:,2),Wy,P(:,3),Wz)
% choose the candidate point and split the curve
% k_c(1) = k_c(2); k_c(length(k_c)) = k_c(length(k_c)-1);
[p] = nurbs_cal_candidate_split_point(V_max,A_max,J_max,k_c);
pp = zeros(1,length(p)+2);
k_cc = zeros(1,length(p));
for i = 1:length(p) 
    k_cc(i) = k_c(p(i));
end;
pp(1) = 2;pp(2:length(p)+1) = p;pp(length(p)+2) = length(u)-1;

% calculate the arc length of every part;
s = zeros(1,length(pp)-1);
for i = 1:length(pp)-1
    s(i) = nurbs_simpson_cal_length(u(pp(i)),u(pp(i+1)),u_vec,k,P(:,1),w',P(:,2),w',P(:,3),w');
end


%calculate the velocity limit at the candidate point;
[v,ss] = nurbs_cal_velocity(s,k_cc,V_max,A_max,J_max);
t = zeros(length(v)-1,7);

for i = 1:length(v)-1
    while (1)
        [t(i,:),j,error] = s_curve_all_parameter_cal_para(ss(i),ss(i+1),v(i),v(i+1),V_max,A_max,J_max);
        if(error == 1)
           v(i+1) = v(i+1)/2.0;% velocity decrease to satisfy the need.
        else
            break;
        end
    end
end

%calculate every part motion parameter time segment;
%generate the arc length trajctory;
Tss = 0.004; %interpolation cycle;1ms;
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
toc;


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
% figure;
% subplot(2,1,1);
% plot(s_t);
% subplot(2,1,2);
% plot(v_t);hold on;plot(diff(s_t)/Tss);

s_length = ss(length(ss));
%generate trajctory

Cu1 = zeros(total,3);
count = 1;Cu1(count,:) = P(1,:);
u_t = Ts;dcux = 0.0;dcuy = 0.0;dcuz = 0.0;ddcux = 0.0;ddcuy = 0.0;ddcuz = 0.0;
u_tt = zeros(1,total-1);
tic;
for i = 1:total-1

     [Cu1(i,1), dcux, ddcux,Cu1(i,2), dcuy, ddcuy,Cu1(i,3), dcuz, ddcuz] =  nurbs_cal_ddcu_derivative(u_t,k,u_vec,P(:,1),w',P(:,2),w',P(:,3),w');
     ds = s_t(i+1)-s_t(i);
     dcu = [dcux dcuy dcuz];
     ddcu = [ddcux ddcuy ddcuz];
     dcu_mo = sqrt(dcux^2+dcuy^2+dcuz^2);
     if(abs(dcu_mo)<eps)
         u_t = Ts;continue;
     end
     u_t = u_t + 1/(dcu_mo)*ds-0.5*sum(dcu.*ddcu)/dcu_mo^4*ds^2;
    % u_t = u_t + 1/(dcu_mo)*ds;
         u_tt(i) = u_t;
     if u_t>last_value
         u_t = last_value-Ts; 
     end
    if (u_t<0)
         u_t = Ts;
    end


end
toc;

  Cu1(1,:) = P(1,:); Cu1(2,:) = P(1,:);Cu1(total,:) = Cu1(total-1,:);
figure;
 plot3(P(:,1),P(:,2),P(:,3));hold on;
 plot3(Cu(:,1),Cu(:,2),Cu(:,3)); hold on;
 plot3(Cu1(:,1),Cu1(:,2),Cu1(:,3)); hold on;
 for i = 1:length(pp)
   plot3(Cu(pp(i),1),Cu(pp(i),2),Cu(pp(i),3),'*');
end


 
 
%check velocity ;
 figure;
 vx = diff(Cu1(:,1)/Tss); vy = diff(Cu1(:,2)/Tss); vz = diff(Cu1(:,3)/Tss);
VV = zeros(1,length(vx));
for i = 1:length(vx)
   VV(i) = sqrt(vx(i)^2+vy(i)^2+vz(i)^2); 
end
plot(VV);
hold on;plot(diff(s_t)/Tss);

