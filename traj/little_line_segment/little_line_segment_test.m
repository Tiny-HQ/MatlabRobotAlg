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



% P = [0.35 0.267;
%     0.71 0.53;
%     1.2 0.9;
%     0.6 1.65;
%     -2 3.3;
%     -3.5 5.3;
%     -4 5.8;
%     -6 7.3];

P = [0.35 0.267;
    0.71 0.53;
    1.2 0.9;
    0.6 1.65;
    -2 3.3;
    -3.5 5.3;
    -4 5.8;
    -6 7.3]*100;


[mm,nn] = size(P);

e = 10;
v = 400.0;
a = 5000.0;
j = 10000.0;
Ts = 0.001;
v_start = 0;
smooth_coff = 20;% smooth coffecient; buffer length;
global buffer;
buffer = zeros(smooth_coff,nn);

for i = 1:smooth_coff
   buffer(i,:) = P(1,:); 
end

[m,n] = size(P);
vec = zeros(m,2);
dis = zeros(1,m);
v_final = zeros(1,m);
t = zeros(m,7);


for i = 2:m  
   dis(i) = sqrt(sum((P(i,:)-P(i-1,:)).^2));
   vec(i-1,:) = (P(i,:)-P(i-1,:))/dis(i);
end

[vf,vb] = little_line_segment_cal_forward_backward_vel(P,a,j,v_start);
[v_limit] = little_line_segment_cal_angle_limit(P,e,a,v_start);



for i = 1:m
    v_final(i) = min([v,vf(i),vb(i),v_limit(i)]);
end
ss = zeros(1,m);
for i = 1:m-1
    ss(i+1) = ss(i)+dis(i+1);
end
for i = 1:length(v)-1
    while (1)
        [t(i,:),j,error] = lls_s_curve_all_parameter_cal_para(ss(i),ss(i+1),v_final(i),v_final(i+1),v,a,j);
        if(error == 1)
           v_final(i+1) = v_final(i+1)/2.0;% velocity decrease to satisfy the need.
        else
            break;
        end
    end
end

sss = zeros(m-1,20000);
vvv = zeros(m-1,20000);
total_point = zeros(1,m-1);
t_s = 0.0;
t_e = 0.0;
no = zeros(1,m-1);
for i = 1:m-1
    [t(i,:),j,error] = lls_s_curve_all_parameter_cal_para(ss(i),ss(i+1),v_final(i),v_final(i+1),v,a,j);
     [s_,vv,aa,jjerk,t_e] = lls_s_curve_all_parameter_cal_traj(t(i,:),Ts,j,v_final(i),0.0,t_s);
     t_s = t_e;
    sss(i,1:length(s_)) = s_;  
    total_point(i) = length(s_);
    vvv(i,1:length(s_)) = vv(1:length(s_));  
    no (i)= length(s_);
end
sum_no = sum(no(:));
Pg = zeros(sum_no,nn);

count = 1;
for i = 1:m-1
    for j = 1:no(i)
        Pg(count,:) = P(i,:)+sss(i,j)*vec(i,:);count = count+1;
    end
end
count = count-1;
Psm = zeros(count+smooth_coff,nn);
for i = 1:count
    pv = zeros(1,nn);
    pv = lls_enque(Pg(i,:),smooth_coff);
    Psm(i,:) = pv;
end
for i = 1:smooth_coff
    pv = lls_enque(P(mm,:),smooth_coff);
    Psm(i+count,:) = pv;
end

plot(P(:,1),P(:,2),'o');hold on;
plot(Pg(:,1),Pg(:,2));hold on;
plot(Psm(:,1),Psm(:,2));

Vx = diff(Pg(:,1)/Ts);Vy = diff(Pg(:,2)/Ts);V = zeros(1,length(Vx));
Vxx = diff(Psm(:,1)/Ts);Vyy = diff(Psm(:,2)/Ts);Vv = zeros(1,length(Vxx));
for i = 1:length(Vx)
    V(i) = sqrt(sum(Vx(i)^2+Vy(i)^2));
end
for i = 1:length(Vxx)
      Vv(i) = sqrt(sum(Vxx(i)^2+Vyy(i)^2));
end
figure;
plot(V);hold on;plot(Vv);





