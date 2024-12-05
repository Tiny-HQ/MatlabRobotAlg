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
    joint =zeros(498,6);
    for i=1:498
     joint(i,:) = Joint_XZ(i,1:6);
    end
        xz=zeros(498,2);

    for i = 1:1:498
        xz(i,:) = Joint_XZ(i,7:8);
    end

    t_ssss=zeros(4,4,498);xz = xz/1000;
    for i = 1:498
        t_ssss(:,:,i) = transl([0,-xz(i,:)]);
    end

    bot.fkine(joint);
    T = bot.fkine(joint);
    T_toolPos=transl(T)*1000;



    Tse_origin = zeros(4,4,498);
    for i = 1:498
        Tse_origin(:,:,i) = T(:,:,i)*t_sensor*t_ssss(:,:,i);
    end
    T_sensorPos = transl(Tse_origin)*1000;
    
     T_sensorPos_temp=zeros(494,2);
    for i = 1:494
        T_sensorPos_temp(i,1) = T_sensorPos(i+4,1)-T_sensorPos(i,1);
        T_sensorPos_temp(i,2) = T_sensorPos(i+4,3)-T_sensorPos(i,3);
    end

   %???????????????,???????????????????????
k=T_sensorPos_temp(:,2)./T_sensorPos_temp(:,1);
    angle = atan2(k,1);angle = -angle*180/pi;
    
    %????????????????????????????????
 for i =1:474
    [a(i),b(i)] = Fnihe(T_sensorPos((i:(19+i)),1),T_sensorPos((i:(19+i)),3),20);
 end
 
 an = atan2(a,1);
 an = (an*180.0/pi)';
plot(an,'*');
hold on;

subplot(2,2,1);
plot3(T_toolPos(:,1),T_toolPos(:,2),T_toolPos(:,3));
hold on;
subplot(2,2,2);
plot3(T_sensorPos(:,1),T_sensorPos(:,2),T_sensorPos(:,3));
hold on;
subplot(2,2,3);
plot(xz(:,1),xz(:,2));
hold on;