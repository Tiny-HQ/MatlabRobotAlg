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
clc;clear all; close all;

pi=3.14159267;
counts=0;                  % 时间戳序号
period=0.004;              % 计算周期
pp=[ 120  100    0  0];       % 关节正限位
pn=[-120 -100    0  0];       % 关节负限位
s0=[ 0 0  0  0];
for num=1:50    
y1=pn(1)+(pp(1)-pn(1))*rand(1,1); % 随机生成J1角度  
y2=pn(2)+(pp(2)-pn(2))*rand(1,1); % 随机生成J2角度  
y3=pn(3)+(pp(3)-pn(3))*rand(1,1); % 随机生成J3角度  
y4=pn(4)+(pp(4)-pn(4))*rand(1,1); % 随机生成J4角度  
sf=[y1 y2 y3 y4];

dabs=abs(sf-s0)+0.000001; % 角度距离，无方向
dves=sf-s0;               % 角度总位移，有方向

vmax=[375 600 925 875];
amax=[3354 4848 2000 5000];
jmax=[53540 48480 20000 25000];
tva=vmax./amax*pi;
taj=amax./jmax*2*pi;
                  
t=[];
tadc=[];
ds=[];
flag=[1 1 1 1];                           % 默认各轴均有匀速段
dvs=[0 0 0 0];                            % 关节加减速距离
for i=1:4
    ti=max(tva(i),taj(i));                % 关节最大加减速时间
    si=vmax(i)*ti*0.5;                    % 关节最大加减速距离
    tadc=[tadc ti];                       % 各关节最大加减速时间
      ds=[ds si];                         % 各关节最大加减速距离
      if (dabs(i)-si) <0                  % 本关节未达到最大速度
          tti=(dabs(i)/si)^(1/3)*ti;      % 根据角位移等比缩放
          flag(i)=0;                      % 置0，表征无匀速段
          dvs(i)=dves(i);                 %
      else                                % 关节达到最大速度
          tti=ti+(dabs(i)-si)/vmax(i);    % 关节运行总时间
          dvs(i)=dves(i)*si/dabs(i);      % 
      end 
     t=[t tti];
end               
[dt,jmain]=max(t);                        % 主轴运行时间及关节序号

% 不只一根主轴
if size(jmain,1)>1
    jmain=jmain(1);
end

counT=0:period:(dt+period);
counT=counT.';
st=[];
vt=[];
at=[];
jt=[];

if flag(jmain) == 1                           % 主轴存在匀速段
    % 调整从轴的dvs（加减速距离）
    dvs=dves/(1+2*(dt-tadc(jmain))/tadc(jmain));
    for i=1:size(counT,1)
        countime=counT(i);
        if countime <= tadc(jmain)*0.5        % 时间戳在加速段 
            sts1=s0+dvs*((countime)/tadc(jmain)-0.5*sin(2*pi*(countime)/tadc(jmain))/pi);
            vst1=dvs/tadc(jmain)-dvs*cos(2*pi*(countime)/tadc(jmain))/tadc(jmain);
            ast1=dvs*2*pi*sin(2*pi*countime/tadc(jmain))/tadc(jmain)^2;
            jst1=dvs*(2*pi)^2*cos(2*pi*countime/tadc(jmain))/tadc(jmain)^3;
            st=[st;sts1];
            vt=[vt;vst1];
            at=[at;ast1];
            jt=[jt;jst1];
        elseif countime > (tadc(jmain)*0.5)  &&  countime <= (dt-tadc(jmain)*0.5)  % 时间戳在匀速段
%             sts2=sts1+vst1*(countime-tadc(jmain)*0.5);
            vst2=(dvs*2)/tadc(jmain);
            sts2=s0+0.5*dvs+vst2*(countime-tadc(jmain)*0.5);            
            ast2=[0 0 0 0];
            jst2=[0 0 0 0];
            st=[st;sts2];
            vt=[vt;vst2];
            at=[at;ast2];
            jt=[jt;jst2];
        elseif countime > (dt-tadc(jmain)*0.5) && countime <= dt    % 时间戳在减速段
            sts3=s0+0.5*dvs+vst2*(dt-tadc(jmain))-dvs*0.5+dvs*((countime-dt+tadc(jmain))/tadc(jmain)-0.5*sin(2*pi*(countime-dt+tadc(jmain))/tadc(jmain))/pi);
            vst3=dvs/tadc(jmain)-dvs*cos(2*pi*(countime-dt+tadc(jmain))/tadc(jmain))/tadc(jmain);
            ast3=dvs*2*pi*sin(2*pi*(countime-dt+tadc(jmain))/tadc(jmain))/tadc(jmain)^2;
            jst3=dvs*(2*pi)^2*cos(2*pi*(countime-dt+tadc(jmain))/tadc(jmain))/tadc(jmain)^3;
            st=[st;sts3];
            vt=[vt;vst3];
            at=[at;ast3];
            jt=[jt;jst3];
        else countime>dt;                   % 时间戳超出主轴运行时间
            st=[st;sf];
            vt=[vt;0 0 0 0];
            at=[at;0 0 0 0];
            jt=[jt;0 0 0 0];
        end
    end
else                                      % 主轴没有匀速段
    for i=1:size(counT,1)
        countime=counT(i);
        dvs=dves;
        if countime <= dt                 % 时间戳在加减速段 
            sts1=s0+dvs*((countime)/dt-0.5*sin(2*pi*(countime)/dt)/pi);
            vst1=dvs/dt-dvs*cos(2*pi*(countime)/dt)/dt;
            ast1=dvs*2*pi*sin(2*pi*countime/dt)/dt^2;
            jst1=dvs*(2*pi)^2*cos(2*pi*countime/dt)/dt^3;
            st=[st;sts1];
            vt=[vt;vst1];
            at=[at;ast1];
            jt=[jt;jst1];
        else countime>dt;                   % 时间戳超出主轴运行时间
            st=[st;sf];
            vt=[vt;0 0 0 0];
            at=[at;0 0 0 0];
            jt=[jt;0 0 0 0];
        end
    end
end
s0=sf;

stout=[];
vtout=[];
atout=[];
jtout=[];
 
for i=1:1:size(st,1)  
stout=[stout;st(i,:)];
vtout=[vtout;vt(i,:)];
atout=[atout;at(i,:)];
jtout=[jtout;jt(i,:)];
end

N=1:size(stout,1);
subplot(4,1,1);
plot(N,stout(:,1),N,stout(:,2),N,stout(:,3),N,stout(:,4));
legend('Joint1-dis','Joint2-dis','Joint3-dis','Joint4-dis'); 
grid on;
subplot(4,1,2);
plot(N,vtout(:,1),N,vtout(:,2),N,vtout(:,3),N,vtout(:,4));
legend('Joint1-omega','Joint2-omega','Joint3-omega','Joint4-omega'); 
grid on;
subplot(4,1,3);
plot(N,atout(:,1),N,atout(:,2),N,atout(:,3),N,atout(:,4));
legend('Joint1-acc','Joint2-acc','Joint3-acc','Joint4-acc'); 
grid on;
subplot(4,1,4);
plot(N,jtout(:,1),'o',N,jtout(:,2),'o',N,jtout(:,3),'*',N,jtout(:,4),'*');
legend('Joint1-jek','Joint2-jek','Joint3-jek','Joint4-jek'); 
grid on;
pause(1.5);

end

