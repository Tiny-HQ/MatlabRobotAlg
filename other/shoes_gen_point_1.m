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

%%0������ǵ�һ�Σ���ô��.xlsx�ļ��������ݱ��浽.mat�ļ�����ȡxlsx�ļ�����;
% shoes_data = xlsread('shoes_data.xlsx');
% save shoes_data;

%% 1�����������ݰ��뿪��;
[num] = load('shoes_data.mat');
x = num.shoes_data(:,1);y = num.shoes_data(:,2);

inter = 10;
limit_dis = 10;%ÿ��inter�������������ƣ�����������ֵ��˵���ڶ���ͼ�ο�ʼ;
counts = length(x);
dis = linspace(0,0,counts/inter+1);
dis1 = zeros(2,inter);
circle = [0 0];
no = 1;

for i = 1:counts/inter

    dis(i) = sqrt( (x(i*inter-inter+1)-x(i*inter+1))^2+(y(i*inter-inter+1)-y(i*inter+1))^2);
     if(dis(i)>limit_dis)
         circle(no) = i;
         no = no+1;
         
         if(no>2)
             break;
         end
     end
end

no1 = 1;
circle1 =[0 0];
for j = 1:(no-1)
    for i = (circle(j)-1)*inter:circle(j)*inter
        dis1(j,i-(circle(j)-1)*inter+1) = sqrt((x(i)-x(i+1))^2+(y(i)-y(i+1))^2);

        if(dis1(j,i-(circle(j)-1)*inter+1)>6)
             circle1(no1) = i;
             no1 = no1+1;
             if(no1>limit_dis)
                 break;
             end
         end
    end
end

x1 = x(1:circle1(1));x2 = x(circle1(1)+1:circle1(2));
y1 = y(1:circle1(1));y2 = y(circle1(1)+1:circle1(2));

%clf;
%plot(x1,y1,'b*');hold on;plot(x2,y2,'b*');%ԭ Ь��;

%% 2���սǱȽϴ�ĵط�ȡ���ܼ����սǱȽ�С�ĵط�ϡ��һ��;
inter = 10;%�����ü������;
len_no1 = length(x1);len_no2 = length(x2);
r1 = linspace(0,0,len_no1-2);r2 = linspace(0,0,len_no2-2);

p1 = [x1,y1,zeros(len_no1,1)];p2 = [x2,y2,zeros(len_no2,1)];
for i = 1:len_no1-2
    [pc,r1(i),theta] = cal_arc_param1(p1(i,:),p1(i+1,:),p1(i+2,:));%���������γɵ�Բ��;
    r1(i) = 1/r1(i);%�뾶����;
end

for i = 1:len_no2-2
    [pc,r2(i),theta] = cal_arc_param1(p2(i,:),p2(i+1,:),p2(i+2,:));
    r2(i) = 1/r2(i);
end

% figure;
% subplot(2,2,1);plot(r1);subplot(2,2,2);plot(diff(r1));
% subplot(2,2,3);plot(r2);subplot(2,2,4);plot(diff(r2));
% suptitle('circle-r,circle-r-diff');

counts1 = 1;cou1 = 1;counts_tmp1 = 1;
x1_new = linspace(0,0,len_no1);x2_new = linspace(0,0,len_no2);y1_new = linspace(0,0,len_no1);y2_new = linspace(0,0,len_no2);

while (1)%Ь������һ��;
    for i = 1:len_no1-2
        if(r1(i)>(1-cou1*0.0005))    %�Ӱ뾶��������1��ʼȡ������������;
            x1_new(counts1) = x1(i);
            y1_new(counts1) = y1(i);
            counts1 = counts1+1;counts_tmp1 = 0;  
        else
            counts_tmp1 = counts_tmp1+1;
            if(counts_tmp1>10)       %����뾶����һֱС��1���ۼ�20������ȡһ����;
                x1_new(counts1) = x1(i);
                y1_new(counts1) = y1(i);
                counts1 = counts1+1;  counts_tmp1 = 0;
            end      
        end  
    end
    
    if(counts1 >500)     %ֱ������500���㣬
        break;
    else
        counts1 = 1;
        x1_new = linspace(0,0,len_no1);
        y1_new = linspace(0,0,len_no1);
    end

     cou1 = cou1+1;
end


%ֱ�Ӱ��ո�ĳЩ��ֱ��ȡ;
 counts2 = 1;cou2 = 2;counts_tmp2 = 1;
while (1)
  
    for i = 1:len_no2-2
        if(mod(i,cou2)==7)
            x2_new(counts2) = x2(i);
            y2_new(counts2) = y2(i);
            counts2 = counts2+1;
        end
    end
    
    if((counts2<300)&&(counts2~=1))
       break; 
    else
        counts2 = 1;
        x2_new = linspace(0,0,len_no2);
        y2_new = linspace(0,0,len_no2);
    end
    
     cou2 = cou2+1;
    
    
end

format long g; 
data1 = [x1_new(1:counts1-1)' y1_new(1:counts1-1)'];

% figure;
% plot(data1(:,1),data1(:,2),'*');

%% 2-1����Щ�ط������������Ҫ�޳����������ֿ��ٵ����;
[m,n] = size(data1);
dist = linspace(0,0,m-1);
for i = 1:m-1
   dist(i) =sqrt( (data1(i,1)-data1(i+1,1))^2+(data1(i,2)-data1(i+1,2))^2); 
end
% figure;
% plot(dist,'*');
count2_1 = 1;dis_tmp = 0.0;cou1 = 1;counts2_1_list = linspace(0,0,m);
x1_new = linspace(0,0,len_no1);y1_new = linspace(0,0,len_no1);

while (1)%Ь������һ��;
    for i = 1:m-4
        if(dist(i)>(1-cou1*0.0005))    
            x1_new(count2_1) = data1(i,1);
            y1_new(count2_1) = data1(i,2);
            count2_1 = count2_1+1;dis_tmp = 0.0;
        else
            dis_tmp = dis_tmp+dist(i);
            if((dis_tmp>(1-cou1*0.0005))&&(dist(i+1)<(1-cou1*0.0005))&&(dist(i+2)<(1-cou1*0.0005)&&(dist(i+3)<(1-cou1*0.0005))))       
                x1_new(count2_1) = data1(i,1);
                y1_new(count2_1) = data1(i,2);
                count2_1 = count2_1+1;  dis_tmp = 0.0;
            end      
        end  
    end
    
    if(count2_1 >300)     %ֱ������300���㣬
        break;
    else
        count2_1 = 1;
        x1_new = linspace(0,0,len_no1);
        y1_new = linspace(0,0,len_no1);
        cou1 = cou1+1;
    end

end
1-cou1*0.005
figure;
plot(x1_new(1:count2_1-1),y1_new(1:count2_1-1),'*');%hold on;plot(data1(:,1),data1(:,2),'o');


%% 3�����ɵĻ������ܵ�ʾ�̵�;
figure;
%plot(x1,y1,'b*');hold on;plot(x2,y2,'b*');hold on;
data3 = [x1_new(1:count2_1-1)' y1_new(1:count2_1-1)'];
data2 = [x2_new(1:counts2-1)' y2_new(1:counts2-1)'];
plot(x1_new(1:count2_1-1),y1_new(1:count2_1-1),'*');hold on;
plot(x2_new(1:counts2-1),y2_new(1:counts2-1),'*');hold on;
title('tech-point');
dlmwrite('shoes_tech_point1.txt',data3,'delimiter','\t','newline','pc');%��Щ�㼴Ϊʾ�̵�;
dlmwrite('shoes_tech_point2.txt',data2,'delimiter','\t','newline','pc');%��Щ�㼴Ϊʾ�̵�;

%% 4�����ɻ����˵����ڵ��ʵ�ʵ�Ա�;
% figure;
% plot(x1,y1,'b*');hold on;plot(x2,y2,'b*');hold on;%ԭ Ь��;
% t = linspace(0,20,counts1-1);
% [ax1,bx1,cx1,dx1]=c_spline_prm_calc_v3(t,x1_new(1:counts1-1),0);
% pointx1 = c_spline_point_calc(ax1,bx1,cx1,dx1,t,0.004);
% [ay1,by1,cy1,dy1]=c_spline_prm_calc_v3(t,y1_new(1:counts1-1),0);
% pointy1 = c_spline_point_calc(ay1,by1,cy1,dy1,t,0.004);
% plot(pointx1,pointy1,'o');hold on;
% 
% t = linspace(0,20,counts2-1);
% [ax2,bx2,cx2,dx2]=c_spline_prm_calc_v3(t,x2_new(1:counts2-1),0);
% pointx2 = c_spline_point_calc(ax2,bx2,cx2,dx2,t,0.004);
% [ay2,by2,cy2,dy2]=c_spline_prm_calc_v3(t,y2_new(1:counts2-1),0);
% pointy2 = c_spline_point_calc(ay2,by2,cy2,dy2,t,0.004);
% plot(pointx2,pointy2,'o');
% title('single-cycle and actual points');


% figure;
% plot(pointx1,pointy1,'o');hold on;plot(pointx2,pointy2,'o');
% title('single-cycle points');

