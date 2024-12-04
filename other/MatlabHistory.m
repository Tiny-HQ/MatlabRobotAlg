%-- 2017/3/22/星期三 9:42 --%
startup_rvc
rtbdemo
mdl_puma560
p560.teach()
L1 = Link('d',0.43,'a',0.165,'alpha',pi/2,'qlim',[-165,165]*deg);
L2 = Link('d',0,'a',0.55,'alpha',0,'qlim',[-60,180]*deg);
L3 = Link('d',0,'a',0.21,'alpha',pi/2,'qlim',[-85,135]*deg);
L4 = Link('d',0.7,'a',0,'alpha',-pi/2,'qlim',[-180,180]*deg);
L5 = Link('d',0,'a',0,'alpha',pi/2,'qlim',[-135,135]*deg);
L6 = Link('d',0.115,'a',0,'alpha',0,'qlim',[-360,360]*deg);
bot = SerialLink([L1 L2 L3 L4 L5 L6],'name','ER6C-C60');
bot.teach();
L1 = Link('d',0.43,'a',0.165,'alpha',pi/2,'qlim',[-165,165]*deg);
L2 = Link('d',0,'a',0.55,'alpha',0,'qlim',[-60,180]*deg);
L3 = Link('d',0,'a',0.208,'alpha',pi/2,'qlim',[-85,135]*deg);
L4 = Link('d',0.7,'a',0,'alpha',-pi/2,'qlim',[-180,180]*deg);
L5 = Link('d',0,'a',0,'alpha',pi/2,'qlim',[-135,135]*deg);
L6 = Link('d',0.115,'a',0,'alpha',0,'qlim',[-360,360]*deg);
bot = SerialLink([L1 L2 L3 L4 L5 L6],'name','ER6C-C60');
bot.teach()
%-- 2017/3/22/星期三 13:20 --%
startup_rvc
L1 = Link('d',0.43,'a',0.165,'alpha',pi/2,'qlim',[-165,165]*deg);
L2 = Link('d',0,'a',0.55,'alpha',0,'qlim',[-60,180]*deg);
L3 = Link('d',0,'a',0.21,'alpha',pi/2,'qlim',[-85,135]*deg);
L4 = Link('d',0.7,'a',0,'alpha',-pi/2,'qlim',[-180,180]*deg);
L5 = Link('d',0,'a',0,'alpha',pi/2,'qlim',[-135,135]*deg);
L6 = Link('d',0.115,'a',0,'alpha',0,'qlim',[-360,360]*deg);
bot = SerialLink([L1 L2 L3 L4 L5 L6],'name','ER6C-C60');
bot.teach();
mdl_puma560;
L1 = Link('d',0.43,'a',0.165,'alpha',pi/2,'qlim',[-165,165]*deg);
L2 = Link('d',0,'a',0.55,'alpha',0,'qlim',[-60,180]*deg);
L3 = Link('d',0,'a',0.21,'alpha',pi/2,'qlim',[-85,135]*deg);
L4 = Link('d',0.7,'a',0,'alpha',-pi/2,'qlim',[-180,180]*deg);
L5 = Link('d',0,'a',0,'alpha',pi/2,'qlim',[-135,135]*deg);
L6 = Link('d',0.115,'a',0,'alpha',0,'qlim',[-360,360]*deg);
bot = SerialLink([L1 L2 L3 L4 L5 L6],'name','ER6C-C60');
bot.teach();
bot.teach();
T = bot.fkine([-16.2*pi/180 57.6*pi/180 2.97*pi/180 44.38*pi/180 -61.66*pi/180 -31.58*pi/180])
T = bot.fkine([-2.14*pi/180 56.74*pi/180 12.59*pi/180 -0.64*pi/180 -61.74pi/180 21.82*pi/180])
T = bot.fkine([-2.14*pi/180 56.74*pi/180 12.59*pi/180 -0.64*pi/180 -61.74*pi/180 21.82*pi/180])
syms A.x
syms Ax Ay Az Bx By Bz
T = [i j k;Ax Ay Az;Bx By Bz]
syms i j k
T = [i j k;Ax Ay Az;Bx By Bz]
det(T)
T = bot.fkine([-16.2*pi/180 57.6*pi/180 2.97*pi/180 44.38*pi/180 -61.66*pi/180 -31.58*pi/180])
inv(T)
Tqiu = [0.9074 -0.4 0.12 1.28745;-0.3992 -0.9160 -0.0393 -0.2075;0.1317 -0.0148 -0.9912 0.0419]
Tqiu = [0.9074 -0.4 0.1265 1.28745;-0.3992 -0.9160 -0.0393 -0.2075;0.1317 -0.0148 -0.9912 0.0419]
Tqiu = [0.9074 -0.4 0.1265 1.28745;-0.3992 -0.9160 -0.0393 -0.2075;0.1317 -0.0148 -0.9912 0.0419;0 0 0 1]
T*Tqiu
inv(T)
P1 = [1.255 -0.046 0.35 0]
P1 = [1.255 ;-0.046; 0.35 ;0]
inv(T) * P1
Tqiu = [0.9074 -0.4 0.1265 1.28745;-0.3992 -0.9160 -0.0393 -0.2075;0.1317 -0.0148 -0.9912 0.0419;0 0 0 1]
Tqiu = [0.9074 -0.4 0.1265 0.0043;-0.3992 -0.9160 -0.0393 0.0042;0.1317 -0.0148 -0.9912 0.3774;0 0 0 1]
T
T*Tqiu
T = bot.fkine([-16.2*pi/180 57.6*pi/180 2.97*pi/180 44.38*pi/180 -61.66*pi/180 -31.58*pi/180])
T*Tqiu
T = [0.9618 -0.0302 0.2720;-0.1842 -0.8063 0.5620 ;0.2023 -0.5907 -0.7811]
T*[0.0043;0.0042;0.3774]
syms a1 a2 a3 b1 b2 b3 c1 c2 c3
T = [a1 a2 a3;b1 b2 b3 ;c1 c2 c3]
T = [a1 b1 c1;
a2 b2 c2;
a3 b3 c3]
inv(T)
T
T = [0.9618 -0.0302 0.2720;-0.1842 -0.8063 0.5620 ;0.2023 -0.5907 -0.7811]
inv(T)
T = bot.fkine([-16.2*pi/180 57.6*pi/180 2.97*pi/180 44.38*pi/180 -61.66*pi/180 -31.58*pi/180])
T*[-0.0043;-0.0042;0.]
T*[-0.0043;-0.0042;0.3774;0]
T*[0.0043;0.0042;0.3774;0]
T = [0.9618 -0.0302 0.2720;-0.1842 -0.8063 0.5620 ;0.2023 -0.5907 -0.7811]
T*[-0.0043;-0.0042;0.3774]+[1.1573;-0.2625 ;0.6435]
T = bot.fkine([-16.2*pi/180 57.6*pi/180 2.97*pi/180 44.38*pi/180 -61.66*pi/180 -31.58*pi/180])
T*[0.9074,-0.4010,0.1265,-0.0043;-0.3992,-0.9160,-0.0393,-0.0042;0.1317,-0.0148,-0.9912,0.3774;0,0,0,1]
T=bot.fkine([16.74*pi/180 53.12*pi/180 0.77*pi/180 -62.60*pi/180 -70.28*pi/180 -43.22*pi/180])
T*[0.9074,-0.4010,0.1265,-0.0043;-0.3992,-0.9160,-0.0393,-0.0042;0.1317,-0.0148,-0.9912,0.3774;0,0,0,1]
T=bot.fkine([-1.09*pi/180 81.31*pi/180 -28.36*pi/180 -15.74*pi/180 -11.35*pi/180 27.75*pi/180])
T*[0.9074,-0.4010,0.1265,-0.0043;-0.3992,-0.9160,-0.0393,-0.0042;0.1317,-0.0148,-0.9912,0.3774;0,0,0,1]
T=bot.fkine([-2.14*pi/180 56.74*pi/180 12.59*pi/180 -0.64*pi/180 -61.74*pi/180 21.82*pi/180])
T*[0.9074,-0.4010,0.1265,-0.0043;-0.3992,-0.9160,-0.0393,-0.0042;0.1317,-0.0148,-0.9912,0.3774;0,0,0,1]
T=bot.fkine([-2.14*pi/180 56.74*pi/180 12.59*pi/180 -0.64*pi/180 -61.74*pi/180 21.82*pi/180])%P5
T=bot.fkine([-1.98*pi/180 43.46*pi/180 32.27*pi/180 -0.63*pi/180 -68.15*pi/180 21.91*pi/180])%P5
T*[0.9074,-0.4010,0.1265,-0.0043;-0.3992,-0.9160,-0.0393,-0.0042;0.1317,-0.0148,-0.9912,0.3774;0,0,0,1]
T=bot.fkine([-1.98*pi/180 40.49*pi/180 46.25*pi/180 -0.59*pi/180 -79.16*pi/180 21.79*pi/180])%P5
T*[0.9074,-0.4010,0.1265,-0.0043;-0.3992,-0.9160,-0.0393,-0.0042;0.1317,-0.0148,-0.9912,0.3774;0,0,0,1]
%-- 2017/3/23/星期四 9:07 --%
x=[0.5,1.0,1.5,2.0,2.5,3.0];
y=[1.75,2.45,3.81,4.80,7.00,8.60];
p=polyfit(x,y,2)
x1=0.5:0.5:3.0;
y1=polyval(p,x1);
plot(x,y,'*r',x1,y1,'-b')
%-- 2017/4/17/星期一 14:03 --%
rvc_startup
startup_rvc
mdl_puma560
p560.kine
p560.teach
L1 = Link('d',0.43,'a',0.165,'alpha',pi/2,'qlim',[-165,165]*deg);
L2 = Link('d',0,'a',0.55,'alpha',0,'qlim',[-60,180]*deg);
L3 = Link('d',-0.03,'a',0.21,'alpha',pi/2,'qlim',[-85,135]*deg);
L4 = Link('d',0.7,'a',0,'alpha',-pi/2,'qlim',[-180,180]*deg);
L5 = Link('d',0,'a',0,'alpha',pi/2,'qlim',[-135,135]*deg);
L6 = Link('d',0.115,'a',0,'alpha',0,'qlim',[-360,360]*deg);
bot = SerialLink([L1 L2 L3 L4 L5 L6],'name','ER6C-C60');
bot.kine
bot.teach
q = [0 0 0 0 0 0]
bot.teach(q)
bot.kine(q)
bot.fkine(q)
T = bot.fkine(q);
q = likine(T)
bot.ikine(T)
likine(T)
q = [0 0 pi/1.5 0 0 0]
T = fkine(q)
L1 = Link('d',0.43,'a',0.165,'alpha',pi/2,'qlim',[-165,165]*deg);
L2 = Link('d',0,'a',0.55,'alpha',0,'qlim',[-60,180]*deg);
L3 = Link('d',0,'a',0.21,'alpha',pi/2,'qlim',[-85,135]*deg);
L4 = Link('d',0.7,'a',0,'alpha',-pi/2,'qlim',[-180,180]*deg);
L5 = Link('d',0,'a',0,'alpha',pi/2,'qlim',[-135,135]*deg);
L6 = Link('d',0.115,'a',0,'alpha',0,'qlim',[-360,360]*deg);
bot = SerialLink([L1 L2 L3 L4 L5 L6],'name','ER6C-C60');
bot.teach();
bot.fkine(q)
T = bot.fkine(q)
likine(T)
q
likine(T)
%-- 2017/4/18/星期二 10:56 --%
startup_rvc
L1 = Link('d',0.43,'a',0.165,'alpha',pi/2,'qlim',[-165,165]*deg);
L2 = Link('d',0,'a',0.55,'alpha',0,'qlim',[-60,180]*deg);
L3 = Link('d',-0.03,'a',0.21,'alpha',pi/2,'qlim',[-85,135]*deg);
L4 = Link('d',0.7,'a',0,'alpha',-pi/2,'qlim',[-180,180]*deg);
L5 = Link('d',0,'a',0,'alpha',pi/2,'qlim',[-135,135]*deg);
L6 = Link('d',0.115,'a',0,'alpha',0,'qlim',[-360,360]*deg);
bot = SerialLink([L1 L2 L3 L4 L5 L6],'name','ER6C-C60');
L1 = Link('d',0.430000,'a',0.163655,'alpha',pi/2,'qlim',[-165,165]*deg);
L2 = Link('d',0,'a',0.550739,'alpha',0,'qlim',[-60,180]*deg);
L3 = Link('d',-0.001279,'a',0.208847,'alpha',pi/2,'qlim',[-85,135]*deg);
L4 = Link('d',0.700029,'a',0,'alpha',-pi/2,'qlim',[-180,180]*deg);
L5 = Link('d',0,'a',0,'alpha',pi/2,'qlim',[-135,135]*deg);
L6 = Link('d',0.115000,'a',0,'alpha',0,'qlim',[-360,360]*deg);
bot = SerialLink([L1 L2 L3 L4 L5 L6],'name','ER6C-C60')
mdl_puma560
L1 = Link('d',0.430000,'a',0.163655,'alpha',pi/2,'qlim',[-165,165]*deg);
L2 = Link('d',0,'a',0.550739,'alpha',0,'qlim',[-60,180]*deg);
L3 = Link('d',-0.001279,'a',0.208847,'alpha',pi/2,'qlim',[-85,135]*deg);
L4 = Link('d',0.700029,'a',0,'alpha',-pi/2,'qlim',[-180,180]*deg);
L5 = Link('d',0,'a',0,'alpha',pi/2,'qlim',[-135,135]*deg);
L6 = Link('d',0.115000,'a',0,'alpha',0,'qlim',[-360,360]*deg);
bot = SerialLink([L1 L2 L3 L4 L5 L6],'name','ER6C-C60')
bot.teach(qn)
bot.teach(qz)
q = [pi/3,pi/2,pi/3,pi/4,-pi/2,0]
T = bot.fkine(q)
hikine(T)
likine(T)
q = [pi/4 pi/3 pi/4 pi/4 pi/4 pi/4 ]
bot.teach(q)
bot.6sfike(q)
bot.6fike(q)
bot.6sfkine(q)
bot.fkine(q)
T = bot.fkine(q)
hikine(T)
q
L1 = Link('d',0.43,'a',0.165,'alpha',pi/2,'qlim',[-165,165]*deg);
L2 = Link('d',0,'a',0.55,'alpha',0,'qlim',[-60,180]*deg);
L3 = Link('d',0,'a',0.21,'alpha',pi/2,'qlim',[-85,135]*deg);
L4 = Link('d',0.7,'a',0,'alpha',-pi/2,'qlim',[-180,180]*deg);
L5 = Link('d',0,'a',0,'alpha',pi/2,'qlim',[-135,135]*deg);
L6 = Link('d',0.115,'a',0,'alpha',0,'qlim',[-360,360]*deg);
bot = SerialLink([L1 L2 L3 L4 L5 L6],'name','ER6C-C60');
bot.teach();
L1 = Link('d',0.43,'a',0.165,'alpha',pi/2,'qlim',[-165,165]*deg);
L2 = Link('d',0,'a',0.55,'alpha',0,'qlim',[-60,180]*deg);
L3 = Link('d',0,'a',0.21,'alpha',pi/2,'qlim',[-85,135]*deg);
L4 = Link('d',0.7,'a',0,'alpha',-pi/2,'qlim',[-180,180]*deg);
L5 = Link('d',0,'a',0,'alpha',pi/2,'qlim',[-135,135]*deg);
L6 = Link('d',0.115,'a',0,'alpha',0,'qlim',[-360,360]*deg);
bot = SerialLink([L1 L2 L3 L4 L5 L6],'name','ER6C-C60')
bot.fkine(q)
likine(T)
q
L1 = Link('d',0.43,'a',0.165,'alpha',pi/2,'qlim',[-165,165]*deg);
L2 = Link('d',0,'a',0.55,'alpha',0,'qlim',[-60,180]*deg);
L3 = Link('d',-0.03,'a',0.21,'alpha',pi/2,'qlim',[-85,135]*deg);
L4 = Link('d',0.7,'a',0,'alpha',-pi/2,'qlim',[-180,180]*deg);
L5 = Link('d',0,'a',0,'alpha',pi/2,'qlim',[-135,135]*deg);
L6 = Link('d',0.115,'a',0,'alpha',0,'qlim',[-360,360]*deg);
bot = SerialLink([L1 L2 L3 L4 L5 L6],'name','ER6C-C60');
bot.teach();
bot.teach(q)
bot.fkine(q)
T = fkine(q)
T = bot.fkine(q)
hikine(T)
q
L1 = Link('d',0.430000,'a',0.163655,'alpha',pi/2,'qlim',[-165,165]*deg);
L2 = Link('d',0,'a',0.550739,'alpha',0,'qlim',[-60,180]*deg);
L3 = Link('d',-0.001279,'a',0.208847,'alpha',pi/2,'qlim',[-85,135]*deg);
L4 = Link('d',0.700029,'a',0,'alpha',-pi/2,'qlim',[-180,180]*deg);
L5 = Link('d',0,'a',0,'alpha',pi/2,'qlim',[-135,135]*deg);
L6 = Link('d',0.115000,'a',0,'alpha',0,'qlim',[-360,360]*deg);
bot = SerialLink([L1 L2 L3 L4 L5 L6],'name','ER6C-C60');
bot.teach();
T = bot.fkine(q)
hikine(T)
q
L1 = Link('d',0.430000,'a',0.163655,'alpha',pi/2,'qlim',[-165,165]*deg);
L2 = Link('d',0,'a',0.550739,'alpha',0,'qlim',[-60,180]*deg);
L3 = Link('d',-0.1279,'a',0.208847,'alpha',pi/2,'qlim',[-85,135]*deg);
L4 = Link('d',0.700029,'a',0,'alpha',-pi/2,'qlim',[-180,180]*deg);
L5 = Link('d',0,'a',0,'alpha',pi/2,'qlim',[-135,135]*deg);
L6 = Link('d',0.115000,'a',0,'alpha',0,'qlim',[-360,360]*deg);
bot = SerialLink([L1 L2 L3 L4 L5 L6],'name','ER6C-C60')
bot.fkine(q)
T = fkine(q)
T = bot.fkine(q)
hikine(T)
q
T = bot.fkine(q)
hikine(T)
q
q = [0 pi/2 0 0 -pi/2 0];
bot.teach(q)
bot.fkine(q)
L1 = Link('d',0.430000,'a',0.163655,'alpha',pi/2,'qlim',[-165,165]*deg);
L2 = Link('d',0,'a',0.550739,'alpha',0,'qlim',[-60,180]*deg);
L3 = Link('d',-0.001279,'a',0.208847,'alpha',pi/2,'qlim',[-85,135]*deg);
L4 = Link('d',0.700029,'a',0,'alpha',-pi/2,'qlim',[-180,180]*deg);
L5 = Link('d',0,'a',0,'alpha',pi/2,'qlim',[-135,135]*deg);
L6 = Link('d',0.115000,'a',0,'alpha',0,'qlim',[-360,360]*deg);
bot = SerialLink([L1 L2 L3 L4 L5 L6],'name','ER6C-C60');
bot.fkine(q)
T = bot.fkine(q)
hikine(T)
q
L1 = Link('d',0.430000,'a',0.163655,'alpha',pi/2,'qlim',[-165,165]*deg);
L2 = Link('d',0,'a',0.550739,'alpha',0,'qlim',[-60,180]*deg);
L3 = Link('d',0.001279,'a',0.208847,'alpha',pi/2,'qlim',[-85,135]*deg);
L4 = Link('d',0.700029,'a',0,'alpha',-pi/2,'qlim',[-180,180]*deg);
L5 = Link('d',0,'a',0,'alpha',pi/2,'qlim',[-135,135]*deg);
L6 = Link('d',0.115000,'a',0,'alpha',0,'qlim',[-360,360]*deg);
bot = SerialLink([L1 L2 L3 L4 L5 L6],'name','ER6C-C60');
T = bot.fkine(q)
hikine(T)
q
bot.teach()
0.03*180/3.1415926
L1 = Link('d',0.430000,'a',0.163655,'alpha',pi/2,'qlim',[-165,165]*deg);
L2 = Link('d',0,'a',0.550739,'alpha',0,'qlim',[-60,180]*deg);
L3 = Link('d',-0.03,'a',0.208847,'alpha',pi/2,'qlim',[-85,135]*deg);
L4 = Link('d',0.700029,'a',0,'alpha',-pi/2,'qlim',[-180,180]*deg);
L5 = Link('d',0,'a',0,'alpha',pi/2,'qlim',[-135,135]*deg);
L6 = Link('d',0.115000,'a',0,'alpha',0,'qlim',[-360,360]*deg);
bot = SerialLink([L1 L2 L3 L4 L5 L6],'name','ER6C-C60')
bot.fkine(q)
T = bot.fkine(q)
hikine(T)
q
0.00003
L1 = Link('d',0.43,'a',0.165,'alpha',pi/2,'qlim',[-165,165]*deg);
L2 = Link('d',0,'a',0.55,'alpha',0,'qlim',[-60,180]*deg);
L3 = Link('d',0,'a',0.21,'alpha',pi/2,'qlim',[-85,135]*deg);
L4 = Link('d',0.7,'a',0,'alpha',-pi/2,'qlim',[-180,180]*deg);
L5 = Link('d',0,'a',0,'alpha',pi/2,'qlim',[-135,135]*deg);
L6 = Link('d',0.115,'a',0,'alpha',0,'qlim',[-360,360]*deg);
bot = SerialLink([L1 L2 L3 L4 L5 L6],'name','ER6C-C60');
bot.teach()
L1 = Link('d',0.43,'a',0.165,'alpha',pi/2,'qlim',[-165,165]*deg);
L2 = Link('d',0,'a',0.55,'alpha',0,'qlim',[-60,180]*deg);
L3 = Link('d',-0.0013,'a',0.21,'alpha',pi/2,'qlim',[-85,135]*deg);
L4 = Link('d',0.7,'a',0,'alpha',-pi/2,'qlim',[-180,180]*deg);
L5 = Link('d',0,'a',0,'alpha',pi/2,'qlim',[-135,135]*deg);
L6 = Link('d',0.115,'a',0,'alpha',0,'qlim',[-360,360]*deg);
bot = SerialLink([L1 L2 L3 L4 L5 L6],'name','ER6C-C60')
T =bot.fkine(q)
hikine(T)
L1 = Link('d',0.43,'a',0.165,'alpha',pi/2,'qlim',[-165,165]*deg);
L2 = Link('d',0,'a',0.55,'alpha',0,'qlim',[-60,180]*deg);
L3 = Link('d',0,'a',0.21,'alpha',pi/2,'qlim',[-85,135]*deg);
L4 = Link('d',0.7,'a',0,'alpha',-pi/2,'qlim',[-180,180]*deg);
L5 = Link('d',0,'a',0,'alpha',pi/2,'qlim',[-135,135]*deg);
L6 = Link('d',0.115,'a',0,'alpha',0,'qlim',[-360,360]*deg);
bot = SerialLink([L1 L2 L3 L4 L5 L6],'name','ER6C-C60')
T = bot.fkine(q)
likine(T)
q
L1 = Link('d',0.43,'a',0.165,'alpha',pi/2,'qlim',[-165,165]*deg);
L2 = Link('d',0,'a',0.55,'alpha',0,'qlim',[-60,180]*deg);
L3 = Link('d',0.00127,'a',0.21,'alpha',pi/2,'qlim',[-85,135]*deg);
L4 = Link('d',0.7,'a',0,'alpha',-pi/2,'qlim',[-180,180]*deg);
L5 = Link('d',0,'a',0,'alpha',pi/2,'qlim',[-135,135]*deg);
L6 = Link('d',0.115,'a',0,'alpha',0,'qlim',[-360,360]*deg);
bot = SerialLink([L1 L2 L3 L4 L5 L6],'name','ER6C-C60')
T = bot.fkine(q)
hikine(T)
q
L1 = Link('d',0.43,'a',0.165,'alpha',pi/2,'qlim',[-165,165]*deg);
L2 = Link('d',0,'a',0.55,'alpha',0,'qlim',[-60,180]*deg);
L3 = Link('d',0.00127,'a',0.21,'alpha',pi/2,'qlim',[-85,135]*deg);
L4 = Link('d',0.7,'a',0,'alpha',-pi/2,'qlim',[-180,180]*deg);
L5 = Link('d',0,'a',0,'alpha',pi/2,'qlim',[-135,135]*deg);
L6 = Link('d',0.115,'a',0,'alpha',0,'qlim',[-360,360]*deg);
bot = SerialLink([L1 L2 L3 L4 L5 L6],'name','ER6C-C60')
T = bot.fkine(q)
hikine(T)
q
hikine(T)
q = [pi/1.5 pi/4 pi/4 pi/5 pi/6 0]
bot.fkine(q)
T = bot.fkine(q)
hikine(T)
q
L1 = Link('d',0.43,'a',0.165,'alpha',pi/2,'qlim',[-165,165]*deg);
L2 = Link('d',0,'a',0.55,'alpha',0,'qlim',[-60,180]*deg);
L3 = Link('d',-0.00127,'a',0.21,'alpha',pi/2,'qlim',[-85,135]*deg);
L4 = Link('d',0.7,'a',0,'alpha',-pi/2,'qlim',[-180,180]*deg);
L5 = Link('d',0,'a',0,'alpha',pi/2,'qlim',[-135,135]*deg);
L6 = Link('d',0.115,'a',0,'alpha',0,'qlim',[-360,360]*deg);
bot = SerialLink([L1 L2 L3 L4 L5 L6],'name','ER6C-C60')
T = bot.fkine()
T = bot.fkine(q)
hikine(T)
q
2.0934    0.7854    0.7854    0.6269    0.5230    0.0016
0.001*180/3.1415926
%-- 2017/4/24/星期一 17:01 --%
startup_rvc
mdl_puma560
L1 = Link('d',0.430000,'a',0.163655,'alpha',pi/2,'qlim',[-165,165]*deg);
L2 = Link('d',0,'a',0.550739,'alpha',0,'qlim',[-60,180]*deg);
L3 = Link('d',-0.001279,'a',0.208847,'alpha',pi/2,'qlim',[-85,135]*deg);
L4 = Link('d',0.700029,'a',0,'alpha',-pi/2,'qlim',[-180,180]*deg);
L5 = Link('d',0,'a',0,'alpha',pi/2,'qlim',[-135,135]*deg);
L6 = Link('d',0.115000,'a',0,'alpha',0,'qlim',[-360,360]*deg);
bot = SerialLink([L1 L2 L3 L4 L5 L6],'name','ER6C-C60')
bot.fkine(qz)
bot.teach(qz)
q = [pi/3 pi/3 pi/5 -pi/2 -pi/2 pi]
T = bot.fkine(q)
hikine(T)
q
T = bot.fkine(q)
hikine(T)
bot.teach()
hikine(T)
q
hikine(T)
L1 = Link('d',0.43,'a',0.165,'alpha',pi/2,'qlim',[-165,165]*deg);
L2 = Link('d',0,'a',0.55,'alpha',0,'qlim',[-60,180]*deg);
L3 = Link('d',0,'a',0.21,'alpha',pi/2,'qlim',[-85,135]*deg);
L4 = Link('d',0.7,'a',0,'alpha',-pi/2,'qlim',[-180,180]*deg);
L5 = Link('d',0,'a',0,'alpha',pi/2,'qlim',[-135,135]*deg);
L6 = Link('d',0.115,'a',0,'alpha',0,'qlim',[-360,360]*deg);
bot = SerialLink([L1 L2 L3 L4 L5 L6],'name','ER6C-C60');
bot.teach();
q
T = bot.fkine(q)
likine(T)
L1 = Link('d',0.430000,'a',0.163655,'alpha',pi/2,'qlim',[-165,165]*deg);
L2 = Link('d',0,'a',0.550739,'alpha',0,'qlim',[-60,180]*deg);
L3 = Link('d',-0.001279,'a',0.208847,'alpha',pi/2,'qlim',[-85,135]*deg);
L4 = Link('d',0.700029,'a',0,'alpha',-pi/2,'qlim',[-180,180]*deg);
L5 = Link('d',0,'a',0,'alpha',pi/2,'qlim',[-135,135]*deg);
L6 = Link('d',0.115000,'a',0,'alpha',0,'qlim',[-360,360]*deg);
bot = SerialLink([L1 L2 L3 L4 L5 L6],'name','ER6C-C60')
T = bot.fkine(q)
hikine(T)
q
hikine(T)
q
hikine(T)
q
hikine(T)
q
hikine(T)
L1 = Link('d',0.43,'a',0.165,'alpha',pi/2,'qlim',[-165,165]*deg);
L2 = Link('d',0,'a',0.55,'alpha',0,'qlim',[-60,180]*deg);
L3 = Link('d',-0.001279,'a',0.21,'alpha',pi/2,'qlim',[-85,135]*deg);
L4 = Link('d',0.7,'a',0,'alpha',-pi/2,'qlim',[-180,180]*deg);
L5 = Link('d',0,'a',0,'alpha',pi/2,'qlim',[-135,135]*deg);
L6 = Link('d',0.115,'a',0,'alpha',0,'qlim',[-360,360]*deg);
bot = SerialLink([L1 L2 L3 L4 L5 L6],'name','ER6C-C60')
T = bot.fkine(q)
hikine(T)
q
atan2(1.279,864.484)- atan2(1.279,sqrt(864.4^2+1.279^2+1.279^2))
atan2(1.279,864.484)- atan2(-1.279,sqrt(864.4^2+1.279^2+1.279^2))
%-- 2017/4/28/星期五 9:21 --%
load('C:\Users\dell\Desktop\Robot\temp\Calibration\matlab.mat')
c3
L1
P1
%-- 2017/5/5/星期五 10:03 --%
startup_rvc
mdl_puma560
L1 = Link('d',0.430000,'a',0.163655,'alpha',pi/2,'qlim',[-165,165]*deg);
L2 = Link('d',0,'a',0.550739,'alpha',0,'qlim',[-60,180]*deg);
L3 = Link('d',-0.001279,'a',0.208847,'alpha',pi/2,'qlim',[-85,135]*deg);
L4 = Link('d',0.700029,'a',0,'alpha',-pi/2,'qlim',[-180,180]*deg);
L5 = Link('d',0,'a',0,'alpha',pi/2,'qlim',[-135,135]*deg);
L6 = Link('d',0.115000,'a',0,'alpha',0,'qlim',[-360,360]*deg);
bot = SerialLink([L1 L2 L3 L4 L5 L6],'name','ER6C-C60');
bot.teach();
bot.teach
qn
qz
bot.fkine(q)
bot.fkine(qz)
T = bot.fkine(qz)
trox(0,0 180*deg)
rotx(180,'deg')
rotx(90,'deg')
rpy2tr(0,0,180,'deg')
bot.teach()
bot.teach(qn)
qn
bot.teach(qn
bot.teach(qn)
bot.fkine(qn)
T = bot.teach(qn0
T = bot.teach(qn)
T = bot.fkine(qn)
tool = transl(0.0,0.0,0.5)
rot = rotx(pi/2)
T = T*tool*rot
T = T*tool
hkine(T)
hikine(T)
qn
hikine(T*inv(tool))
qn
hikine(T*inv(tool))
bot
hikine(T*inv(tool))
qn
toolbox
rbtdemo
rtbdemo
%-- 2017/5/17/星期三 16:15 --%
MyDataAns
%-- 2017/5/26/星期五 13:31 --%
startup_rvc
mdl_puma560
rbtdemo
rtbdemo
clf; tranimate(T)
%-- 2017/6/1/星期四 10:10 --%
plot(hello(;1),hello(;2),hello(;3))
plot(hello(;,1),hello(;,2),hello(;,3))
plot(hello(;,1),hello(;,2),hello(;,3),o)
plot(hello(;,1),hello(;,2),hello(;,3))
startup_rvc
mdl_puma560
plot(hello(;,1),hello(;,2),hello(;,3))
plot(hello(;,1),hello(;,2),hello(;,3),)
plot(hello(;,1),hello(;,2),hello(;,3))
plot(hello(;,1),hello(;,2),hello(;,3)
plot(hello(;,1),hello(;,2),hello(;,3))
plot(hello(;,1))
plot(hello(;1))
plot(hello(;1));
plot(hello(;,1),hello(;,2),hello(;,3));
plot(hello(:,2),hello(:,3),'o')
plot(hello(:,2),hello(:,3))
plot(hello(:,1),hello(:,2),hello(:,3))
plot3(hello(:,1),hello(:,2),hello(:,3))
plot3(eye(:,1),eye(:,2),eye(:,3))
%-- 2017/6/2/星期五 15:16 --%
mdl_puma560
rbt_demo
rtb_demo
rtbdemo
L1 = Link('d',0.43,'a',0.165,'alpha',pi/2,'qlim',[-165,165]*deg);
L2 = Link('d',0,'a',0.55,'alpha',0,'qlim',[-60,180]*deg);
L3 = Link('d',0,'a',0.21,'alpha',pi/2,'qlim',[-85,135]*deg);
L4 = Link('d',0.7,'a',0,'alpha',-pi/2,'qlim',[-180,180]*deg);
L5 = Link('d',0,'a',0,'alpha',pi/2,'qlim',[-135,135]*deg);
L6 = Link('d',0.115,'a',0,'alpha',0,'qlim',[-360,360]*deg);
bot = SerialLink([L1 L2 L3 L4 L5 L6],'name','ER6C-C60');
bot.plot(joint,workspace)
bot.plot(joint,'floorlevel',0)
bot.plot(joint)
P = rand(2,4);
plot_point(P);
P = rand(10,100);plot_point(P);
data = [1 2 4 8];
plot_point(P, ’printf’, {’ P%d’, data}, ’o’);
plot_point(P, 'printf', {' P%d', data}, 'o');
anim = Animate(’movie’);
for i=1:100
plot(...);
anim.add();
end
anim = Animate('movie');
for i=1:100
plot(...);
anim.add();
end
bot.teach(joint)
bot.plot3(joint)
bot.plot(joint)
bot.animate(joinnt)
bot.animate(joint)
run('C:\Users\dell\Desktop\puma560.m')
T = bot.fkine(jiont)
T = bot.fkine(joint)
clr
clrs
clf
clear
mdl_puma560
bot.fkine(joint);
L1 = Link('d',0.43,'a',0.165,'alpha',pi/2,'qlim',[-165,165]*deg);
L2 = Link('d',0,'a',0.55,'alpha',0,'qlim',[-60,180]*deg);
L3 = Link('d',0,'a',0.21,'alpha',pi/2,'qlim',[-85,135]*deg);
L4 = Link('d',0.7,'a',0,'alpha',-pi/2,'qlim',[-180,180]*deg);
L5 = Link('d',0,'a',0,'alpha',pi/2,'qlim',[-135,135]*deg);
L6 = Link('d',0.115,'a',0,'alpha',0,'qlim',[-360,360]*deg);
bot = SerialLink([L1 L2 L3 L4 L5 L6],'name','ER6C-C60');
bot.fkine(joint);
T = bot.fkine(joint);
rtbdemo
tranimate(T)
bot.fkine(joint)
T = bot.fkine(joint);
tranimate(T)
T = bot.fkine(joint);
tranimate(T)
clc
T(:,:,1)
trplot(T)
trplot2(T)
bot.plot(T)
p560.plot(joint);
bot.plot(joint)
[R,t] = tr2rt(T);
plot3(t(:,:,1),(t(:,:,2),(t(:,:,3))
plot3(t(:,:,1),t(:,:,2),t(:,:,3))
plot3(t(:,1),t(:,2),t(:,3))
bot.plot(T)
bot.plot(qn)
p560.plot(qn)
p560.plot(qz)
rtbdemo
T0 = p560.fkine(qn);
T1 = p560.fkine(qz);
T = ctraj(T0, T1, 50);
tranimate(T)
T
%-- 2017/6/3/星期六 11:17 --%
T1=bot.fkine(qc1);
pc1=transl(T1)*1000;
des1=[];
for i=1:1696
des1(i,:)=eye1(i,:);
end
for i=1:length(des1)
for j=1:length(pc1)
num(j,1)=j;
num(j,2)=sqrt((pc1(j,1)-des1(i,1))^2+(pc1(j,2)-des1(i,2))^2+(pc1(j,3)-des1(i,3))^2);
end
minnum=min(num(:,2));
[row,col]=find(num==minnum);
code=num(row,1);
nubo(i,1)=code;
nubo(i,2)=minnum;
end
T2=bot.fkine(qc2);
pc2=transl(T2)*1000;
des2=[];nubo2=[];num2=[];
for i=1:588
des2(i,:)=eye2(i,:);
end
for i=1:length(des2)
for j=1:length(pc2)
num2(j,1)=j;
num2(j,2)=sqrt((pc2(j,1)-des2(i,1))^2+(pc2(j,2)-des2(i,2))^2+(pc2(j,3)-des2(i,3))^2);
end
minnum=min(num2(:,2));
[row,col]=find(num2==minnum);
code=num2(row,1);
nubo2(i,1)=code;
nubo2(i,2)=minnum;
end
T3=bot.fkine(qc3);
pc3=transl(T3)*1000;
des3=[];nubo3=[];num3=[];
for i=1:373
des3(i,:)=eye3(i,:);
end
for i=1:length(des3)
for j=1:length(pc3)
num3(j,1)=j;
num3(j,2)=sqrt((pc3(j,1)-des3(i,1))^2+(pc3(j,2)-des3(i,2))^2+(pc3(j,3)-des3(i,3))^2);
end
minnum=min(num3(:,2));
[row,col]=find(num3==minnum);
code=num3(row,1);
nubo3(i,1)=code;
nubo3(i,2)=minnum;
end
subplot(2,2,1)
plot3(pc2(:,1),pc2(:,2),pc2(:,3))
hold on;
plot3(eye2(:,1),eye2(:,2),eye2(:,3))
subplot(2,2,2)
plot(nubo(:,1)*0.02,nubo(:,2))
subplot(2,2,3)
plot(nubo2(:,1)*0.02,nubo2(:,2))
subplot(2,2,4)
plot(nubo3(:,1)*0.02,nubo3(:,2))
mdl_puma560
T1=bot.fkine(qc1);
pc1=transl(T1)*1000;
des1=[];
for i=1:1696
des1(i,:)=eye1(i,:);
end
for i=1:length(des1)
for j=1:length(pc1)
num(j,1)=j;
num(j,2)=sqrt((pc1(j,1)-des1(i,1))^2+(pc1(j,2)-des1(i,2))^2+(pc1(j,3)-des1(i,3))^2);
end
minnum=min(num(:,2));
[row,col]=find(num==minnum);
code=num(row,1);
nubo(i,1)=code;
nubo(i,2)=minnum;
end
L1 = Link('d',0.43,'a', 0.160339,'alpha',pi/2,'qlim',[-165,165]*deg);
L2 = Link('d',0,'a', 0.550280,'alpha',0,'qlim',[-60,180]*deg);
L3 = Link('d',0,'a', 0.208440,'alpha',pi/2,'qlim',[-85,135]*deg);
L4 = Link('d', 0.702026,'a',0,'alpha',-pi/2,'qlim',[-180,180]*deg);
L5 = Link('d',0,'a',0,'alpha',pi/2,'qlim',[-135,135]*deg);
L6 = Link('d',0.115,'a',0,'alpha',0,'qlim',[-360,360]*deg);
bot = SerialLink([L1 L2 L3 L4 L5 L6],'name','ER6C-C60');
bot.tool=[0.89451981 -0.020255728 0.44656923 -0.066874184;-0.008481265 -0.99956208 -0.028349893 -0.0042466784;0.44694784 0.021572065 -0.89429992 0.29703156;0 0 0 1]
T1=bot.fkine(qc1);
pc1=transl(T1)*1000;
des1=[];
for i=1:1696
des1(i,:)=eye1(i,:);
end
for i=1:length(des1)
for j=1:length(pc1)
num(j,1)=j;
num(j,2)=sqrt((pc1(j,1)-des1(i,1))^2+(pc1(j,2)-des1(i,2))^2+(pc1(j,3)-des1(i,3))^2);
end
minnum=min(num(:,2));
[row,col]=find(num==minnum);
code=num(row,1);
nubo(i,1)=code;
nubo(i,2)=minnum;
end
T1=bot.fkine(qc1);
pc1=transl(T1)*1000;
des1=[];
for i=1:1696
des1(i,:)=eye1(i,:);
end
for i=1:length(des1)
for j=1:length(pc1)
num(j,1)=j;
num(j,2)=sqrt((pc1(j,1)-des1(i,1))^2+(pc1(j,2)-des1(i,2))^2+(pc1(j,3)-des1(i,3))^2);
end
minnum=min(num(:,2));
[row,col]=find(num==minnum);
code=num(row,1);
nubo(i,1)=code;
nubo(i,2)=minnum;
end
T2=bot.fkine(qc2);
pc2=transl(T2)*1000;
des2=[];nubo2=[];num2=[];
for i=1:588
des2(i,:)=eye2(i,:);
end
for i=1:length(des2)
for j=1:length(pc2)
num2(j,1)=j;
num2(j,2)=sqrt((pc2(j,1)-des2(i,1))^2+(pc2(j,2)-des2(i,2))^2+(pc2(j,3)-des2(i,3))^2);
end
minnum=min(num2(:,2));
[row,col]=find(num2==minnum);
code=num2(row,1);
nubo2(i,1)=code;
nubo2(i,2)=minnum;
end
T3=bot.fkine(qc3);
pc3=transl(T3)*1000;
des3=[];nubo3=[];num3=[];
for i=1:373
des3(i,:)=eye3(i,:);
end
for i=1:length(des3)
for j=1:length(pc3)
num3(j,1)=j;
num3(j,2)=sqrt((pc3(j,1)-des3(i,1))^2+(pc3(j,2)-des3(i,2))^2+(pc3(j,3)-des3(i,3))^2);
end
minnum=min(num3(:,2));
[row,col]=find(num3==minnum);
code=num3(row,1);
nubo3(i,1)=code;
nubo3(i,2)=minnum;
end
subplot(2,2,1)
plot3(pc2(:,1),pc2(:,2),pc2(:,3))
hold on;
plot3(eye2(:,1),eye2(:,2),eye2(:,3))
subplot(2,2,2)
plot(nubo(:,1)*0.02,nubo(:,2))
subplot(2,2,3)
plot(nubo2(:,1)*0.02,nubo2(:,2))
subplot(2,2,4)
plot(nubo3(:,1)*0.02,nubo3(:,2))
T1=bot.fkine(qc1);
pc1=transl(T1)*1000;
des1=[];
for i=1:1696
des1(i,:)=eye1(i,:);
end
for i=1:length(des1)
for j=1:length(pc1)
num(j,1)=j;
num(j,2)=sqrt((pc1(j,1)-des1(i,1))^2+(pc1(j,2)-des1(i,2))^2+(pc1(j,3)-des1(i,3))^2);
end
minnum=min(num(:,2));
[row,col]=find(num==minnum);
code=num(row,1);
nubo(i,1)=code;
nubo(i,2)=minnum;
end
T2=bot.fkine(qc2);
pc2=transl(T2)*1000;
des2=[];nubo2=[];num2=[];
for i=1:588
des2(i,:)=eye2(i,:);
end
for i=1:length(des2)
for j=1:length(pc2)
num2(j,1)=j;
num2(j,2)=sqrt((pc2(j,1)-des2(i,1))^2+(pc2(j,2)-des2(i,2))^2+(pc2(j,3)-des2(i,3))^2);
end
minnum=min(num2(:,2));
[row,col]=find(num2==minnum);
code=num2(row,1);
nubo2(i,1)=code;
nubo2(i,2)=minnum;
end
T3=bot.fkine(qc3);
pc3=transl(T3)*1000;
des3=[];nubo3=[];num3=[];
for i=1:373
des3(i,:)=eye3(i,:);
end
for i=1:length(des3)
for j=1:length(pc3)
num3(j,1)=j;
num3(j,2)=sqrt((pc3(j,1)-des3(i,1))^2+(pc3(j,2)-des3(i,2))^2+(pc3(j,3)-des3(i,3))^2);
end
minnum=min(num3(:,2));
[row,col]=find(num3==minnum);
code=num3(row,1);
nubo3(i,1)=code;
nubo3(i,2)=minnum;
end
length(pc3)
des3
clc
T3=bot.fkine(qc3);
pc3=transl(T3)*1000;
des3=[];nubo3=[];num3=[];
for i=1:373
des3(i,:)=eye3(i,:);
end
for i=1:length(des3)
for j=1:length(pc3)
num3(j,1)=j;
num3(j,2)=sqrt((pc3(j,1)-des3(i,1))^2+(pc3(j,2)-des3(i,2))^2+(pc3(j,3)-des3(i,3))^2);
end
minnum=min(num3(:,2));
[row,col]=find(num3==minnum);
code=num3(row,1);
nubo3(i,1)=code;
nubo3(i,2)=minnum;
end
T3=bot.fkine(qc3);
pc3=transl(T3)*1000;
des3=[];nubo3=[];num3=[];
for i=1:373
des3(i,:)=eye3(i,:);
end
for i=1:length(des3)
for j=1:length(pc3)
num3(j,1)=j;
num3(j,2)=sqrt((pc3(j,1)-des3(i,1))^2+(pc3(j,2)-des3(i,2))^2+(pc3(j,3)-des3(i,3))^2);
end
minnum=min(num3(:,2));
[row,col]=find(num3==minnum);
code=num3(row,1);
nubo3(i,1)=code;
nubo3(i,2)=minnum;
end
for i=1:length(des3)
for j=1:length(pc3)
num3(j,1)=j;
num3(j,2)=sqrt((pc3(j,1)-des3(i,1))^2+(pc3(j,2)-des3(i,2))^2+(pc3(j,3)-des3(i,3))^2);
end
end
length(des3)
length(pc3)
j=1
num3(j,2)=sqrt((pc3(j,1)-des3(i,1))^2+(pc3(j,2)-des3(i,2))^2+(pc3(j,3)-des3(i,3))^2);
i = 1
num3(j,2)=sqrt((pc3(j,1)-des3(i,1))^2+(pc3(j,2)-des3(i,2))^2+(pc3(j,3)-des3(i,3))^2);
pc3(j,1)
des3(i,1)
pc3(j,2)
des3(i,2)
T3=bot.fkine(qc3);
pc3=transl(T3)*1000;
des3=[];nubo3=[];num3=[];
for i=1:373
des3(i,:)=eye3(i,:);
end
T1=bot.fkine(qc1);
pc1=transl(T1)*1000;
des1=[];
for i=1:1696
des1(i,:)=eye1(i,:);
end
for i=1:length(des1)
for j=1:length(pc1)
num(j,1)=j;
num(j,2)=sqrt((pc1(j,1)-des1(i,1))^2+(pc1(j,2)-des1(i,2))^2+(pc1(j,3)-des1(i,3))^2);
end
minnum=min(num(:,2));
[row,col]=find(num==minnum);
code=num(row,1);
nubo(i,1)=code;
nubo(i,2)=minnum;
end
T2=bot.fkine(qc2);
pc2=transl(T2)*1000;
des2=[];nubo2=[];num2=[];
for i=1:588
des2(i,:)=eye2(i,:);
end
for i=1:length(des2)
for j=1:length(pc2)
num2(j,1)=j;
num2(j,2)=sqrt((pc2(j,1)-des2(i,1))^2+(pc2(j,2)-des2(i,2))^2+(pc2(j,3)-des2(i,3))^2);
end
minnum=min(num2(:,2));
[row,col]=find(num2==minnum);
code=num2(row,1);
nubo2(i,1)=code;
nubo2(i,2)=minnum;
end
T3=bot.fkine(qc3);
pc3=transl(T3)*1000;
des3=[];nubo3=[];num3=[];
for i=1:373
des3(i,:)=eye3(i,:);
end
for i=1:length(des3)
for j=1:length(pc3)
num3(j,1)=j;
num3(j,2)=sqrt((pc3(j,1)-des3(i,1))^2+(pc3(j,2)-des3(i,2))^2+(pc3(j,3)-des3(i,3))^2);
end
minnum=min(num3(:,2));
[row,col]=find(num3==minnum);
code=num3(row,1);
nubo3(i,1)=code;
nubo3(i,2)=minnum;
end
subplot(2,2,1)
plot3(pc2(:,1),pc2(:,2),pc2(:,3))
hold on;
plot3(eye2(:,1),eye2(:,2),eye2(:,3))
subplot(2,2,2)
plot(nubo(:,1)*0.02,nubo(:,2))
subplot(2,2,3)
plot(nubo2(:,1)*0.02,nubo2(:,2))
subplot(2,2,4)
plot(nubo3(:,1)*0.02,nubo3(:,2))
T1=bot.fkine(qc1);
pc1=transl(T1)*1000;
des1=[];
for i=1:1696
des1(i,:)=eye1(i,:);
end
for i=1:length(des1)
for j=1:length(pc1)
num(j,1)=j;
num(j,2)=sqrt((pc1(j,1)-des1(i,1))^2+(pc1(j,2)-des1(i,2))^2+(pc1(j,3)-des1(i,3))^2);
end
minnum=min(num(:,2));
[row,col]=find(num==minnum);
code=num(row,1);
nubo(i,1)=code;
nubo(i,2)=minnum;
end
T1=bot.fkine(qc1);
pc1=transl(T1)*1000;
des1=[];
for i=1:1696
des1(i,:)=eye1(i,:);
end
desl(:,3) = desl(:,3)-0.001
for i=1:length(des1)
for j=1:length(pc1)
num(j,1)=j;
num(j,2)=sqrt((pc1(j,1)-des1(i,1))^2+(pc1(j,2)-des1(i,2))^2+(pc1(j,3)-des1(i,3))^2);
end
minnum=min(num(:,2));
[row,col]=find(num==minnum);
code=num(row,1);
nubo(i,1)=code;
nubo(i,2)=minnum;
end
T1=bot.fkine(qc1);
pc1=transl(T1)*1000;
des1=[];
for i=1:1696
des1(i,:)=eye1(i,:);
end
des1(:,3) = desl(:,3)-0.001
for i=1:length(des1)
for j=1:length(pc1)
num(j,1)=j;
num(j,2)=sqrt((pc1(j,1)-des1(i,1))^2+(pc1(j,2)-des1(i,2))^2+(pc1(j,3)-des1(i,3))^2);
end
minnum=min(num(:,2));
[row,col]=find(num==minnum);
code=num(row,1);
nubo(i,1)=code;
nubo(i,2)=minnum;
end
des1(:,3)
clc
T1=bot.fkine(qc1);
pc1=transl(T1)*1000;
des1=[];
for i=1:1696
des1(i,:)=eye1(i,:);
end
des1(:,3) = des1(:,3)-0.001
for i=1:length(des1)
for j=1:length(pc1)
num(j,1)=j;
num(j,2)=sqrt((pc1(j,1)-des1(i,1))^2+(pc1(j,2)-des1(i,2))^2+(pc1(j,3)-des1(i,3))^2);
end
minnum=min(num(:,2));
[row,col]=find(num==minnum);
code=num(row,1);
nubo(i,1)=code;
nubo(i,2)=minnum;
end
clc
T1=bot.fkine(qc1);
pc1=transl(T1)*1000;
des1=[];
for i=1:1696
des1(i,:)=eye1(i,:);
end
des1(:,3) = des1(:,3)-0.001;
for i=1:length(des1)
for j=1:length(pc1)
num(j,1)=j;
num(j,2)=sqrt((pc1(j,1)-des1(i,1))^2+(pc1(j,2)-des1(i,2))^2+(pc1(j,3)-des1(i,3))^2);
end
minnum=min(num(:,2));
[row,col]=find(num==minnum);
code=num(row,1);
nubo(i,1)=code;
nubo(i,2)=minnum;
end
T2=bot.fkine(qc2);
pc2=transl(T2)*1000;
des2=[];nubo2=[];num2=[];
for i=1:588
des2(i,:)=eye2(i,:);
end
des2(:,3) = des2(:,3)-0.001
for i=1:length(des2)
for j=1:length(pc2)
num2(j,1)=j;
num2(j,2)=sqrt((pc2(j,1)-des2(i,1))^2+(pc2(j,2)-des2(i,2))^2+(pc2(j,3)-des2(i,3))^2);
end
minnum=min(num2(:,2));
[row,col]=find(num2==minnum);
code=num2(row,1);
nubo2(i,1)=code;
nubo2(i,2)=minnum;
end
clc
T2=bot.fkine(qc2);
pc2=transl(T2)*1000;
des2=[];nubo2=[];num2=[];
for i=1:588
des2(i,:)=eye2(i,:);
end
des2(:,3) = des2(:,3)-0.001
for i=1:length(des2)
for j=1:length(pc2)
num2(j,1)=j;
num2(j,2)=sqrt((pc2(j,1)-des2(i,1))^2+(pc2(j,2)-des2(i,2))^2+(pc2(j,3)-des2(i,3))^2);
end
minnum=min(num2(:,2));
[row,col]=find(num2==minnum);
code=num2(row,1);
nubo2(i,1)=code;
nubo2(i,2)=minnum;
end
clc
T2=bot.fkine(qc2);
pc2=transl(T2)*1000;
des2=[];nubo2=[];num2=[];
for i=1:588
des2(i,:)=eye2(i,:);
end
des2(:,3) = des2(:,3)-0.001
for i=1:length(des2)
for j=1:length(pc2)
num2(j,1)=j;
num2(j,2)=sqrt((pc2(j,1)-des2(i,1))^2+(pc2(j,2)-des2(i,2))^2+(pc2(j,3)-des2(i,3))^2);
end
minnum=min(num2(:,2));
[row,col]=find(num2==minnum);
code=num2(row,1);
nubo2(i,1)=code;
nubo2(i,2)=minnum;
end
clc
T2=bot.fkine(qc2);
pc2=transl(T2)*1000;
des2=[];nubo2=[];num2=[];
for i=1:588
des2(i,:)=eye2(i,:);
end
des2(:,3) = des2(:,3)-0.001;
for i=1:length(des2)
for j=1:length(pc2)
num2(j,1)=j;
num2(j,2)=sqrt((pc2(j,1)-des2(i,1))^2+(pc2(j,2)-des2(i,2))^2+(pc2(j,3)-des2(i,3))^2);
end
minnum=min(num2(:,2));
[row,col]=find(num2==minnum);
code=num2(row,1);
nubo2(i,1)=code;
nubo2(i,2)=minnum;
end
T3=bot.fkine(qc3);
pc3=transl(T3)*1000;
des3=[];nubo3=[];num3=[];
for i=1:373
des3(i,:)=eye3(i,:);
end
des3(:,3) = des3(:,3)-0.001;
for i=1:length(des3)
for j=1:length(pc3)
num3(j,1)=j;
num3(j,2)=sqrt((pc3(j,1)-des3(i,1))^2+(pc3(j,2)-des3(i,2))^2+(pc3(j,3)-des3(i,3))^2);
end
minnum=min(num3(:,2));
[row,col]=find(num3==minnum);
code=num3(row,1);
nubo3(i,1)=code;
nubo3(i,2)=minnum;
end
subplot(2,2,1)
plot3(pc2(:,1),pc2(:,2),pc2(:,3))
hold on;
plot3(eye2(:,1),eye2(:,2),eye2(:,3))
subplot(2,2,2)
plot(nubo(:,1)*0.02,nubo(:,2))
subplot(2,2,3)
plot(nubo2(:,1)*0.02,nubo2(:,2))
subplot(2,2,4)
plot(nubo3(:,1)*0.02,nubo3(:,2))
T3=bot.fkine(qc3);
pc3=transl(T3)*1000;
des3=[];nubo3=[];num3=[];
for i=1:373
des3(i,:)=eye3(i,:);
end
des3(:,3) = des3(:,3)-0.001;
for i=1:length(des3)
for j=1:length(pc3)
num3(j,1)=j;
num3(j,2)=sqrt((pc3(j,1)-des3(i,1))^2+(pc3(j,2)-des3(i,2))^2+(pc3(j,3)-des3(i,3))^2);
end
minnum=min(num3(:,2));
[row,col]=find(num3==minnum);
code=num3(row,1);
nubo3(i,1)=code;
nubo3(i,2)=minnum;
end
T3=bot.fkine(qc3);
pc3=transl(T3)*1000;
des3=[];nubo3=[];num3=[];
for i=1:373
des3(i,:)=eye3(i,:);
end
for i=1:length(des3)
for j=1:length(pc3)
num3(j,1)=j;
num3(j,2)=sqrt((pc3(j,1)-des3(i,1))^2+(pc3(j,2)-des3(i,2))^2+(pc3(j,3)-des3(i,3))^2);
end
minnum=min(num3(:,2));
[row,col]=find(num3==minnum);
code=num3(row,1);
nubo3(i,1)=code;
nubo3(i,2)=minnum;
end
T3=bot.fkine(qc3);
pc3=transl(T3)*1000;
des3=[];nubo3=[];num3=[];
for i=1:373
des3(i,:)=eye3(i,:);
end
des2(:,3) = des2(:,3)-0.001;
for i=1:length(des3)
for j=1:length(pc3)
num3(j,1)=j;
num3(j,2)=sqrt((pc3(j,1)-des3(i,1))^2+(pc3(j,2)-des3(i,2))^2+(pc3(j,3)-des3(i,3))^2);
end
minnum=min(num3(:,2));
[row,col]=find(num3==minnum);
code=num3(row,1);
nubo3(i,1)=code;
nubo3(i,2)=minnum;
end
T3=bot.fkine(qc3);
pc3=transl(T3)*1000;
des3=[];nubo3=[];num3=[];
for i=1:373
des3(i,:)=eye3(i,:);
end
des3(:,3) = des3(:,3)-0.001;
for i=1:length(des3)
for j=1:length(pc3)
num3(j,1)=j;
num3(j,2)=sqrt((pc3(j,1)-des3(i,1))^2+(pc3(j,2)-des3(i,2))^2+(pc3(j,3)-des3(i,3))^2);
end
minnum=min(num3(:,2));
[row,col]=find(num3==minnum);
code=num3(row,1);
nubo3(i,1)=code;
nubo3(i,2)=minnum;
end
T1=bot.fkine(qc1);
pc1=transl(T1)*1000;
des1=[];
for i=1:1696
des1(i,:)=eye1(i,:);
end
des1(:,3) = des1(:,3)-1.0;
for i=1:length(des1)
for j=1:length(pc1)
num(j,1)=j;
num(j,2)=sqrt((pc1(j,1)-des1(i,1))^2+(pc1(j,2)-des1(i,2))^2+(pc1(j,3)-des1(i,3))^2);
end
minnum=min(num(:,2));
[row,col]=find(num==minnum);
code=num(row,1);
nubo(i,1)=code;
nubo(i,2)=minnum;
end
T2=bot.fkine(qc2);
pc2=transl(T2)*1000;
des2=[];nubo2=[];num2=[];
for i=1:588
des2(i,:)=eye2(i,:);
end
des2(:,3) = des2(:,3)-1.0;
for i=1:length(des2)
for j=1:length(pc2)
num2(j,1)=j;
num2(j,2)=sqrt((pc2(j,1)-des2(i,1))^2+(pc2(j,2)-des2(i,2))^2+(pc2(j,3)-des2(i,3))^2);
end
minnum=min(num2(:,2));
[row,col]=find(num2==minnum);
code=num2(row,1);
nubo2(i,1)=code;
nubo2(i,2)=minnum;
end
T3=bot.fkine(qc3);
pc3=transl(T3)*1000;
des3=[];nubo3=[];num3=[];
for i=1:373
des3(i,:)=eye3(i,:);
end
des3(:,3) = des3(:,3)-1.0;
for i=1:length(des3)
for j=1:length(pc3)
num3(j,1)=j;
num3(j,2)=sqrt((pc3(j,1)-des3(i,1))^2+(pc3(j,2)-des3(i,2))^2+(pc3(j,3)-des3(i,3))^2);
end
minnum=min(num3(:,2));
[row,col]=find(num3==minnum);
code=num3(row,1);
nubo3(i,1)=code;
nubo3(i,2)=minnum;
end
subplot(2,2,1)
plot3(pc2(:,1),pc2(:,2),pc2(:,3))
hold on;
plot3(eye2(:,1),eye2(:,2),eye2(:,3))
subplot(2,2,2)
plot(nubo(:,1)*0.02,nubo(:,2))
subplot(2,2,3)
plot(nubo2(:,1)*0.02,nubo2(:,2))
subplot(2,2,4)
plot(nubo3(:,1)*0.02,nubo3(:,2))
T1=bot.fkine(qc1);
pc1=transl(T1)*1000;
des1=[];
for i=1:1696
des1(i,:)=eye1(i,:);
end
des1(:,3) = des1(:,3)+1.0;
for i=1:length(des1)
for j=1:length(pc1)
num(j,1)=j;
num(j,2)=sqrt((pc1(j,1)-des1(i,1))^2+(pc1(j,2)-des1(i,2))^2+(pc1(j,3)-des1(i,3))^2);
end
minnum=min(num(:,2));
[row,col]=find(num==minnum);
code=num(row,1);
nubo(i,1)=code;
nubo(i,2)=minnum;
end
T2=bot.fkine(qc2);
pc2=transl(T2)*1000;
des2=[];nubo2=[];num2=[];
for i=1:588
des2(i,:)=eye2(i,:);
end
des2(:,3) = des2(:,3)+1.0;
for i=1:length(des2)
for j=1:length(pc2)
num2(j,1)=j;
num2(j,2)=sqrt((pc2(j,1)-des2(i,1))^2+(pc2(j,2)-des2(i,2))^2+(pc2(j,3)-des2(i,3))^2);
end
minnum=min(num2(:,2));
[row,col]=find(num2==minnum);
code=num2(row,1);
nubo2(i,1)=code;
nubo2(i,2)=minnum;
end
T3=bot.fkine(qc3);
pc3=transl(T3)*1000;
des3=[];nubo3=[];num3=[];
for i=1:373
des3(i,:)=eye3(i,:);
end
des3(:,3) = des3(:,3)+1.0;
for i=1:length(des3)
for j=1:length(pc3)
num3(j,1)=j;
num3(j,2)=sqrt((pc3(j,1)-des3(i,1))^2+(pc3(j,2)-des3(i,2))^2+(pc3(j,3)-des3(i,3))^2);
end
minnum=min(num3(:,2));
[row,col]=find(num3==minnum);
code=num3(row,1);
nubo3(i,1)=code;
nubo3(i,2)=minnum;
end
subplot(2,2,1)
plot3(pc2(:,1),pc2(:,2),pc2(:,3))
hold on;
plot3(eye2(:,1),eye2(:,2),eye2(:,3))
subplot(2,2,2)
plot(nubo(:,1)*0.02,nubo(:,2))
subplot(2,2,3)
plot(nubo2(:,1)*0.02,nubo2(:,2))
subplot(2,2,4)
plot(nubo3(:,1)*0.02,nubo3(:,2))
T1=bot.fkine(qc1);
pc1=transl(T1)*1000;
des1=[];
for i=1:1696
des1(i,:)=eye1(i,:);
end
des1(:,3) = des1(:,3)+1.0;
for i=1:length(des1)
for j=1:length(pc1)
num(j,1)=j;
num(j,2)=sqrt((pc1(j,1)-des1(i,1))^2+(pc1(j,2)-des1(i,2))^2+(pc1(j,3)-des1(i,3))^2);
end
minnum=min(num(:,2));
[row,col]=find(num==minnum);
code=num(row,1);
nubo(i,1)=code;
nubo(i,2)=minnum;
end
T2=bot.fkine(qc2);
pc2=transl(T2)*1000;
des2=[];nubo2=[];num2=[];
for i=1:580
des2(i,:)=eye2(i,:);
end
des2(:,3) = des2(:,3)+1.0;
for i=1:length(des2)
for j=1:length(pc2)
num2(j,1)=j;
num2(j,2)=sqrt((pc2(j,1)-des2(i,1))^2+(pc2(j,2)-des2(i,2))^2+(pc2(j,3)-des2(i,3))^2);
end
minnum=min(num2(:,2));
[row,col]=find(num2==minnum);
code=num2(row,1);
nubo2(i,1)=code;
nubo2(i,2)=minnum;
end
T3=bot.fkine(qc3);
pc3=transl(T3)*1000;
des3=[];nubo3=[];num3=[];
for i=1:373
des3(i,:)=eye3(i,:);
end
des3(:,3) = des3(:,3)+1.0;
for i=1:length(des3)
for j=1:length(pc3)
num3(j,1)=j;
num3(j,2)=sqrt((pc3(j,1)-des3(i,1))^2+(pc3(j,2)-des3(i,2))^2+(pc3(j,3)-des3(i,3))^2);
end
minnum=min(num3(:,2));
[row,col]=find(num3==minnum);
code=num3(row,1);
nubo3(i,1)=code;
nubo3(i,2)=minnum;
end
subplot(2,2,1)
plot3(pc2(:,1),pc2(:,2),pc2(:,3))
hold on;
plot3(eye2(:,1),eye2(:,2),eye2(:,3))
subplot(2,2,2)
plot(nubo(:,1)*0.02,nubo(:,2))
subplot(2,2,3)
plot(nubo2(:,1)*0.02,nubo2(:,2))
subplot(2,2,4)
plot(nubo3(:,1)*0.02,nubo3(:,2))
T1=bot.fkine(qc1);
pc1=transl(T1)*1000;
des1=[];
for i=1:1696
des1(i,:)=eye1(i,:);
end
des1(:,3) = des1(:,3)+1.0;
for i=1:length(des1)
for j=1:length(pc1)
num(j,1)=j;
num(j,2)=sqrt((pc1(j,1)-des1(i,1))^2+(pc1(j,2)-des1(i,2))^2+(pc1(j,3)-des1(i,3))^2);
end
minnum=min(num(:,2));
[row,col]=find(num==minnum);
code=num(row,1);
nubo(i,1)=code;
nubo(i,2)=minnum;
end
T2=bot.fkine(qc2);
pc2=transl(T2)*1000;
des2=[];nubo2=[];num2=[];
for i=1:585
des2(i,:)=eye2(i,:);
end
des2(:,3) = des2(:,3)+1.0;
for i=1:length(des2)
for j=1:length(pc2)
num2(j,1)=j;
num2(j,2)=sqrt((pc2(j,1)-des2(i,1))^2+(pc2(j,2)-des2(i,2))^2+(pc2(j,3)-des2(i,3))^2);
end
minnum=min(num2(:,2));
[row,col]=find(num2==minnum);
code=num2(row,1);
nubo2(i,1)=code;
nubo2(i,2)=minnum;
end
T3=bot.fkine(qc3);
pc3=transl(T3)*1000;
des3=[];nubo3=[];num3=[];
for i=1:373
des3(i,:)=eye3(i,:);
end
des3(:,3) = des3(:,3)+1.0;
for i=1:length(des3)
for j=1:length(pc3)
num3(j,1)=j;
num3(j,2)=sqrt((pc3(j,1)-des3(i,1))^2+(pc3(j,2)-des3(i,2))^2+(pc3(j,3)-des3(i,3))^2);
end
minnum=min(num3(:,2));
[row,col]=find(num3==minnum);
code=num3(row,1);
nubo3(i,1)=code;
nubo3(i,2)=minnum;
end
subplot(2,2,1)
plot3(pc2(:,1),pc2(:,2),pc2(:,3))
hold on;
plot3(eye2(:,1),eye2(:,2),eye2(:,3))
subplot(2,2,2)
plot(nubo(:,1)*0.02,nubo(:,2))
subplot(2,2,3)
plot(nubo2(:,1)*0.02,nubo2(:,2))
subplot(2,2,4)
plot(nubo3(:,1)*0.02,nubo3(:,2))
T1=bot.fkine(qc1);
pc1=transl(T1)*1000;
des1=[];
for i=1:1696
des1(i,:)=eye1(i,:);
end
des1(:,3) = des1(:,3)+1.0;
for i=1:length(des1)
for j=1:length(pc1)
num(j,1)=j;
num(j,2)=sqrt((pc1(j,1)-des1(i,1))^2+(pc1(j,2)-des1(i,2))^2+(pc1(j,3)-des1(i,3))^2);
end
minnum=min(num(:,2));
[row,col]=find(num==minnum);
code=num(row,1);
nubo(i,1)=code;
nubo(i,2)=minnum;
end
T2=bot.fkine(qc2);
pc2=transl(T2)*1000;
des2=[];nubo2=[];num2=[];
for i=1:586
des2(i,:)=eye2(i,:);
end
des2(:,3) = des2(:,3)+1.0;
for i=1:length(des2)
for j=1:length(pc2)
num2(j,1)=j;
num2(j,2)=sqrt((pc2(j,1)-des2(i,1))^2+(pc2(j,2)-des2(i,2))^2+(pc2(j,3)-des2(i,3))^2);
end
minnum=min(num2(:,2));
[row,col]=find(num2==minnum);
code=num2(row,1);
nubo2(i,1)=code;
nubo2(i,2)=minnum;
end
T3=bot.fkine(qc3);
pc3=transl(T3)*1000;
des3=[];nubo3=[];num3=[];
for i=1:373
des3(i,:)=eye3(i,:);
end
des3(:,3) = des3(:,3)+1.0;
for i=1:length(des3)
for j=1:length(pc3)
num3(j,1)=j;
num3(j,2)=sqrt((pc3(j,1)-des3(i,1))^2+(pc3(j,2)-des3(i,2))^2+(pc3(j,3)-des3(i,3))^2);
end
minnum=min(num3(:,2));
[row,col]=find(num3==minnum);
code=num3(row,1);
nubo3(i,1)=code;
nubo3(i,2)=minnum;
end
subplot(2,2,1)
plot3(pc2(:,1),pc2(:,2),pc2(:,3))
hold on;
plot3(eye2(:,1),eye2(:,2),eye2(:,3))
subplot(2,2,2)
plot(nubo(:,1)*0.02,nubo(:,2))
subplot(2,2,3)
plot(nubo2(:,1)*0.02,nubo2(:,2))
subplot(2,2,4)
plot(nubo3(:,1)*0.02,nubo3(:,2))
T1=bot.fkine(qc1);
pc1=transl(T1)*1000;
des1=[];
for i=1:1696
des1(i,:)=eye1(i,:);
end
des1(:,3) = des1(:,3)+1.0;
for i=1:length(des1)
for j=1:length(pc1)
num(j,1)=j;
num(j,2)=sqrt((pc1(j,1)-des1(i,1))^2+(pc1(j,2)-des1(i,2))^2+(pc1(j,3)-des1(i,3))^2);
end
minnum=min(num(:,2));
[row,col]=find(num==minnum);
code=num(row,1);
nubo(i,1)=code;
nubo(i,2)=minnum;
end
T2=bot.fkine(qc2);
pc2=transl(T2)*1000;
des2=[];nubo2=[];num2=[];
for i=1:587
des2(i,:)=eye2(i,:);
end
des2(:,3) = des2(:,3)+1.0;
for i=1:length(des2)
for j=1:length(pc2)
num2(j,1)=j;
num2(j,2)=sqrt((pc2(j,1)-des2(i,1))^2+(pc2(j,2)-des2(i,2))^2+(pc2(j,3)-des2(i,3))^2);
end
minnum=min(num2(:,2));
[row,col]=find(num2==minnum);
code=num2(row,1);
nubo2(i,1)=code;
nubo2(i,2)=minnum;
end
T3=bot.fkine(qc3);
pc3=transl(T3)*1000;
des3=[];nubo3=[];num3=[];
for i=1:373
des3(i,:)=eye3(i,:);
end
des3(:,3) = des3(:,3)+1.0;
for i=1:length(des3)
for j=1:length(pc3)
num3(j,1)=j;
num3(j,2)=sqrt((pc3(j,1)-des3(i,1))^2+(pc3(j,2)-des3(i,2))^2+(pc3(j,3)-des3(i,3))^2);
end
minnum=min(num3(:,2));
[row,col]=find(num3==minnum);
code=num3(row,1);
nubo3(i,1)=code;
nubo3(i,2)=minnum;
end
subplot(2,2,1)
plot3(pc2(:,1),pc2(:,2),pc2(:,3))
hold on;
plot3(eye2(:,1),eye2(:,2),eye2(:,3))
subplot(2,2,2)
plot(nubo(:,1)*0.02,nubo(:,2))
subplot(2,2,3)
plot(nubo2(:,1)*0.02,nubo2(:,2))
subplot(2,2,4)
plot(nubo3(:,1)*0.02,nubo3(:,2))
T1=bot.fkine(qc1);
pc1=transl(T1)*1000;
des1=[];
for i=1:1696
des1(i,:)=eye1(i,:);
end
des1(:,3) = des1(:,3)+1.0;
for i=1:length(des1)
for j=1:length(pc1)
num(j,1)=j;
num(j,2)=sqrt((pc1(j,1)-des1(i,1))^2+(pc1(j,2)-des1(i,2))^2+(pc1(j,3)-des1(i,3))^2);
end
minnum=min(num(:,2));
[row,col]=find(num==minnum);
code=num(row,1);
nubo(i,1)=code;
nubo(i,2)=minnum;
end
T2=bot.fkine(qc2);
pc2=transl(T2)*1000;
des2=[];nubo2=[];num2=[];
for i=1:586
des2(i,:)=eye2(i,:);
end
des2(:,3) = des2(:,3)+1.0;
for i=1:length(des2)
for j=1:length(pc2)
num2(j,1)=j;
num2(j,2)=sqrt((pc2(j,1)-des2(i,1))^2+(pc2(j,2)-des2(i,2))^2+(pc2(j,3)-des2(i,3))^2);
end
minnum=min(num2(:,2));
[row,col]=find(num2==minnum);
code=num2(row,1);
nubo2(i,1)=code;
nubo2(i,2)=minnum;
end
T3=bot.fkine(qc3);
pc3=transl(T3)*1000;
des3=[];nubo3=[];num3=[];
for i=1:373
des3(i,:)=eye3(i,:);
end
des3(:,3) = des3(:,3)+1.0;
for i=1:length(des3)
for j=1:length(pc3)
num3(j,1)=j;
num3(j,2)=sqrt((pc3(j,1)-des3(i,1))^2+(pc3(j,2)-des3(i,2))^2+(pc3(j,3)-des3(i,3))^2);
end
minnum=min(num3(:,2));
[row,col]=find(num3==minnum);
code=num3(row,1);
nubo3(i,1)=code;
nubo3(i,2)=minnum;
end
subplot(2,2,1)
plot3(pc2(:,1),pc2(:,2),pc2(:,3))
hold on;
plot3(eye2(:,1),eye2(:,2),eye2(:,3))
subplot(2,2,2)
plot(nubo(:,1)*0.02,nubo(:,2))
subplot(2,2,3)
plot(nubo2(:,1)*0.02,nubo2(:,2))
subplot(2,2,4)
plot(nubo3(:,1)*0.02,nubo3(:,2))
%-- 2017/6/7/星期三 9:09 --%
mdl_p560
mdl_puma560
L1 = Link('d',0.43,'a',0.165,'alpha',pi/2,'qlim',[-165,165]*deg);
L2 = Link('d',0,'a',0.55,'alpha',0,'qlim',[-60,180]*deg);
L3 = Link('d',0,'a',0.21,'alpha',pi/2,'qlim',[-85,135]*deg);
L4 = Link('d',0.7,'a',0,'alpha',-pi/2,'qlim',[-180,180]*deg);
L5 = Link('d',0,'a',0,'alpha',pi/2,'qlim',[-135,135]*deg);
L6 = Link('d',0.115,'a',0,'alpha',0,'qlim',[-360,360]*deg);
bot = SerialLink([L1 L2 L3 L4 L5 L6],'name','ER6C-C60');
bot
tool = [0.8945,-0.020,0.4465,-66.874;-0.00848,-0.999,-0.0283,-4.246;0.4469,0.0215,-0.8942,297.0315]
tool = [0.8945,-0.020,0.4465,-66.874;-0.00848,-0.999,-0.0283,-4.246;0.4469,0.0215,-0.8942,297.0315;0,0,0,1]
bot.tool = [0.8945,-0.020,0.4465,-66.874;-0.00848,-0.999,-0.0283,-4.246;0.4469,0.0215,-0.8942,297.0315;0,0,0,1]
bot.teach()
bot.tool = [0.8945,-0.020,0.4465,-0.066874;-0.00848,-0.999,-0.0283,-0.004246;0.4469,0.0215,-0.8942,0.2970315;0,0,0,1]
bot.teach
bot.tool = bot.tool*rotz(90*pi/180)
rotz
bot.tool = bot.tool*rotz(90)
rotz(90)
trotz(90)
bot.tool = bot.tool*trotz(90)
bot.teach
bot.teach()
bot.tool = bot.tool*trotz(-90)
bot.teach()
bot.tool = bot.tool*trotz(-90)
bot.teach()
bot.tool = bot.tool*trotz(90)
bot.teach()
L1 = Link('d',0.43,'a',0.165,'alpha',pi/2,'qlim',[-165,165]*deg);
L2 = Link('d',0,'a',0.55,'alpha',0,'qlim',[-60,180]*deg);
L3 = Link('d',-0.03,'a',0.21,'alpha',pi/2,'qlim',[-85,135]*deg);
L4 = Link('d',0.7,'a',0,'alpha',-pi/2,'qlim',[-180,180]*deg);
L5 = Link('d',0,'a',0,'alpha',pi/2,'qlim',[-135,135]*deg);
L6 = Link('d',0.115,'a',0,'alpha',0,'qlim',[-360,360]*deg);
bot = SerialLink([L1 L2 L3 L4 L5 L6],'name','ER6C-C60');
bot.teach();
bot.tool = [0.8945,-0.020,0.4465,-0.066874;-0.00848,-0.999,-0.0283,-0.004246;0.4469,0.0215,-0.8942,0.2970315;0,0,0,1]
bot.teach();
bot.teach()
bot.teach(qz)
bot.teach(qn)
bot.tool
bot.teach(qz)
Target = transl(0,0.1,0.0)
Target*trotz(-90)
fkine(qz)
bot.fkine(qz)
T = fkine(qz)
T = bot.fkine(qz)
Target = transl(0,0.1,0.0)
T*Target
Target*trotz(-90)
T*Target
bot
bot.tool= bot.tool*trotz(-90)
bot.teach()
bot.tool = [0.8945,-0.020,0.4465,-0.066874;-0.00848,-0.999,-0.0283,0.004246;0.4469,0.0215,-0.8942,0.2970315;0,0,0,1]
bot.teach()
bot.tool = [0.8945,-0.020,0.4465,0.066874;-0.00848,-0.999,-0.0283,-0.004246;0.4469,0.0215,-0.8942,0.2970315;0,0,0,1]
bot.teach()
bot.tool = [0.8945,-0.020,0.4465,-0.066874;-0.00848,-0.999,-0.0283,-0.004246;0.4469,0.0215,-0.8942,0.2970315;0,0,0,1]
bot.teach()
%-- 2017/6/8/星期四 8:34 --%
puma560.m
puma560
mdl_puma560
puma560
L{1} = link([ pi/2 0	0	0	0], 'standard');
L{1} = Link([ pi/2 0	0	0	0], 'standard');
L{1} = link([ pi/2 0	0	0	0], 'standard');
L
puma560
%-- 2017/6/9/星期五 10:41 --%
L1 = Link('d',0.43,'a',0.165,'alpha',pi/2,'qlim',[-165,165]*deg);
L2 = Link('d',0,'a',0.55,'alpha',0,'qlim',[-60,180]*deg);
L3 = Link('d',-0.03,'a',0.21,'alpha',pi/2,'qlim',[-85,135]*deg);
L4 = Link('d',0.7,'a',0,'alpha',-pi/2,'qlim',[-180,180]*deg);
L5 = Link('d',0,'a',0,'alpha',pi/2,'qlim',[-135,135]*deg);
L6 = Link('d',0.115,'a',0,'alpha',0,'qlim',[-360,360]*deg);
bot = SerialLink([L1 L2 L3 L4 L5 L6],'name','ER6C-C60');
bot.teach();
mdl_puma560
L1 = Link('d',0.43,'a',0.165,'alpha',pi/2,'qlim',[-165,165]*deg);
L2 = Link('d',0,'a',0.55,'alpha',0,'qlim',[-60,180]*deg);
L3 = Link('d',-0.03,'a',0.21,'alpha',pi/2,'qlim',[-85,135]*deg);
L4 = Link('d',0.7,'a',0,'alpha',-pi/2,'qlim',[-180,180]*deg);
L5 = Link('d',0,'a',0,'alpha',pi/2,'qlim',[-135,135]*deg);
L6 = Link('d',0.115,'a',0,'alpha',0,'qlim',[-360,360]*deg);
bot = SerialLink([L1 L2 L3 L4 L5 L6],'name','ER6C-C60');
bot.teach();
bot
bot.tool = [0.8945,-0.020,0.4465,-0.066874;-0.00848,-0.999,-0.0283,0.004246;0.4469,0.0215,-0.8942,0.2970315;0,0,0,1]
bot.teach
t_sensor = [0.99931389,-0.033218067,-0.0011807,0.02859665;0.03290,0.99233,-0.102821,-0.004333566;0.0045872,0.11900304,0.99469918,0.1219506;0,0,0,1]
Robot_Er6c
clc
clear
Robot_Er6c
t_sensor_unit
clear
Robot_Er6c
clear
Robot_Er6c
qn
bot.teach(qn)
clear
clc
Robot_Er6c
bot.teach(qh)
clc
bot
t_sensor_old
t_sensor-new
t_sensor_new
bot.fkine(qh)
t_old = bot.fkine(qh)
t_s = transl(0,-0.028,-0.124)
t_old = t_old*t_s
bot.teach(qh)
t_old
t_new = fkine(qh)
t_new = bot.fkine(qh)
t_new = t_new*trotz(-90*pi/180.0);
t_new
t_new = t_new *t_sensor_new
t_s = transl(0.028,0,0.124)
t_new = t_new*t_s
clear
clc
Robot_Er6c
t_new = bot.fkine(qh)
t_old = bot.fkine(qh)
t_old = t_old*t_sensor_old
t_s = transl(0,-0.028,-0.124)
t_old = t_old*t_s
t_s = transl(0.028,0,0.124)
t_new = bot.fkine(qh);
t_new = t_new*trotz(-90*pi/180.0);
t_new
t_new = t_new*t_sensor_new
t_new = t_new*t_s
t_old
t_sensor_old
t_sensor_new
clc
bot
bot.teach
t_sensor_old
t_sensor_new
clc
clear
Robot_Er6c
bot.teach(qh)
t_old = bot.fkine(qh);
t_old
t_old = t_old*t_sensor_old
t_s = transl(0,-0.028,-0.124)l
t_s = transl(0,-0.028,-0.124);
t_old = t_old*t_s;
t_old
t_new = bot.fkine(qh)
t_new = t_new*trotz(-90*pi/180.0);
t_ne
t_new
t_new = t_new*t_sensor_new;
t_new
t_new = t_new*transl(0.028,0.0,-0.124)
t_old  = t_old*trotz(-90*pi/180.0)
%-- 2017/6/10/星期六 13:29 --%
Robot_Er6c
bot.teach(qh)
Robot_Er6c
bot.teach(qh)
t_old = bot.fkine(qh);
t_old = t_old*t_sensor_old
t_new = bot.fkine(qh);
t_new = t_new*t_sensor_old
t_new = t_new*t_sensor_new
t_s = transl(0.028,0,-0.124);
t_new = t_new*t_s
t_old = bot.fkine(qh);
t_old = t_old*t_sensor_old;
t_s = transl(0.0,-0.028,-0.124);
t_old = t_old*t_s
t_old = bot.fkine(qh);
t_old = t_old*trotz(-90*pi/180.0);
t_new = bot.fkine(qh)
t_new  = t_new*trotz(pi/2);
t_new = t_new*t_sensor_new
t_new = bot.fkine(qh);
t_new  = t_new*trotz(-pi/2);
t_new = t_new*t_sensor_new;
t_new = t_new*transl(0.028,0,-0.124);
t_new
t_old
t_old = bot.fkine(qh);
t_old = t_old*t_sensor_old
t_s = transl(0,-0.028,-0.124);
t_old = t_old*t_s;
t_old
t_new = bot.fkine(qh)
t_new = t_new*trotz(-90*pi/180.0);
t_new = t_new*t_sensor_new;
t_new = t_new*transl(0.028,0.0,-0.124)
t_old
t_new
t_new = t_new*trotz(30.0*pi/180);
t_new
t_old = t_old *trotz(-90*pi/180);
t_old = t_old*trotz(30*pi/180);
t_old
t_old = t_old*trotx(30*pi/180)
t_new = t_new*troty(30*pi/180)
t_old =
0.6897    0.0375    0.7234    0.7083
0.0415    0.9944   -0.0746    0.0065
-0.7227    0.0927    0.6861    0.5491
0         0         0    1.0000
t_old =
[0.6897    0.0375    0.7234    0.7083;]
[ 0.0415    0.9944   -0.0746    0.0065;]
[ -0.7227    0.0927    0.6861    0.5491;]
[  0         0         0    1.0000;]
t_old =
[0.6897    0.0375    0.7234    0.7083;
0.0415    0.9944   -0.0746    0.0065;
-0.7227    0.0927    0.6861    0.5491;
0         0         0    1.0000]
t_old =[0.6897   , 0.0375   , 0.7234  ,  0.7083; 0.0415  ,  0.9944 ,  -0.0746   , 0.0065; -0.7227   , 0.0927   , 0.6861   , 0.5491;0 , 0 , 0 , 1.0000]
t_new =
[ -0.0375   0.6897   0.7234    0.7084;
-0.9944    0.0415   -0.0746    0.0066;
-0.0927   -0.7227    0.6862    0.5491;
0         0         0    1.0000]
t_new =
[ -0.0375   , 0.6897    ,0.7234  ,  0.7084;
-0.9944   , 0.0415  , -0.0746 ,   0.0066;
-0.0927  , -0.7227   , 0.6862  ,  0.5491;
0     ,    0  ,       0 ,   1.0000]
t_new =[-0.0375    0.6897    0.7234    0.7084; -0.9944    0.0415   -0.0746    0.0066; -0.0927   -0.7227    0.6862    0.5491; 0   0         0    1.0000]
t_old
t_new
t_old*trotz(-90*pi/180.0)
t_new*trotx(30*pi/180.0);
t_new*trotx(30*pi/180.0)
t_old*trotz(-90*pi/180.0)*trotx(30*pi/180.0)
t_new
t_new*trotz(90*pi/180.0)
t_old
%-- 2017/6/12/星期一 13:28 --%
t_new =
t_new =[-0.0375    0.6897    0.7234    0.7084; -0.9944    0.0415   -0.0746    0.0066; -0.0927   -0.7227    0.6862    0.5491; 0   0         0    1.0000];
t_new =[-0.0375    0.6897    0.7234    0.7084; -0.9944    0.0415   -0.0746    0.0066; -0.0927   -0.7227    0.6862    0.5491; 0   0         0    1.0000]
t_new.inv
inv(t_new)
eye(3)
rand(3*3)
rand(3)
T = [ 0.8308    0.9172    0.7537  0.1; 0.5853    0.2858    0.3804  0.2;0.5497    0.7572    0.5678  0.3;0  0 0 2]
T = [ 0.8308    0.9172    0.7537  0.1; 0.5853    0.2858    0.3804  0.2;0.5497    0.7572    0.5678  0.3;0  0 0 1]
inv(T)
T = [0.866 -0.5 0 0.1;0.5 0.866 0 0.2;0 0 1 0;0 0 0 1]
T = [0.866 -0.5 0 0.1;0.5 0.866 0 0.2;0 0 1 0.3;0 0 0 1]
inv(T)
0.1*0.866+0.2*(-0.5)
0.1*0.866+0.2*(0.5)
mdl_puma560
trotx(30*pi/180)*troty(60*pi/180)*transl(0.1,0.2,0.3)
T = trotx(30*pi/180)*troty(60*pi/180)*transl(0.1,0.2,0.3)
inv(T)
T(1,1)*T(1,4)+T(2,1)*T(2,4)+T(3,1)*T(3,4)
%-- 2017/6/13/星期二 11:30 --%
Robot_Er6c
%-- 2017/6/14/星期三 16:36 --%
mdl_puma560
Robot_Er6c
bot.teach
bot.teach(qh)
Robot_Er6c
bot.teach(qh)
T = bot.fkine(qh)
hikine(T)
qh
T
tool = bot.tool;
T = T*inv(tool);
T
hikine(T)
qh
run('C:\Users\dell\Desktop\Robot\Hao_Program\Matlab\hikine.m')
hikine(T)
qh
qni= hikine(T);
bot.teach(qni)
T = bot.fkine(qh);
T = T*trotx(30*pi/180.0)*troty(-30*pi/180.0)*trotz(-100*pi/180.0);
T = T*inv(tool);
qni = hikine(T)
bot.teach(qni)
T = bot.fkine(qh);
T = T*trotx(30*pi/180.0)*troty(-30*pi/180.0)*trotz(-10*pi/180.0);
T = T*inv(tool);
qni = hikine(T);bot.teach(qni)
T = bot.fkine(qh);
T = T*trotz(-10*pi/180.0)*troty(-30*pi/180.0)*trotz(30*pi/180.0);
T = T*inv(tool);
qni = hikine(T);bot.teach(qni)
bot.tool
T = bot.fkine(qh);
T = T*trotz(-30*pi/180.0)*troty(-30*pi/180.0)*trotx(30*pi/180.0);
T = T*inv(tool);
qni = hikine(T);bot.teach(qni)
T = bot.fkine(qh);
T = T*troty(-30*pi/180.0)*trotx(30*pi/180.0)*trotz(-30*pi/180.0);
T = T*inv(tool);
qni = hikine(T);bot.teach(qni)
T = bot.fkine(qh);
T = T*troty(30*pi/180.0)*trotx(30*pi/180.0)*trotz(30*pi/180.0);
T = T*inv(tool);
qni = hikine(T);bot.teach(qni)
T = bot.fkine(qh);
T = T*trotx(30*pi/180.0)*troty(30*pi/180.0)*trotz(30*pi/180.0);
T = T*inv(tool);
qni = hikine(T);bot.teach(qni)
T = bot.fkine(qh);
T = T*trotz(30*pi/180.0)*troty(30*pi/180.0)*trotx(30*pi/180.0);
T = T*inv(tool);
qni = hikine(T);bot.teach(qni)
T = bot.fkine(qh);
T = T*troty(30*pi/180.0)*trotx(30*pi/180.0);
T = T*inv(tool);
qni = hikine(T);bot.teach(qni)
T = bot.fkine(qh);
T = T*troty(-30*pi/180.0)*trotx(-30*pi/180.0);
T = T*inv(tool);
qni = hikine(T);bot.teach(qni)
T = bot.fkine(qh);
T = bot.fkine(qh)
T = transl(0.8588,0.0258,0.5220)
T = transl(0.8588,0.0258,0.5220);
T = T*troty(-30*pi/180.0)*trotx(-30*pi/180.0);
T = T*inv(tool);
qni = hikine(T);bot.teach(qni)
T = T;
T = T*inv(tool);
qni = hikine(T);bot.teach(qni)
T
T = transl(0.8588,0.0258,0.5220);
T = T*inv(tool);
qni = hikine(T);bot.teach(qni)
T = transl(0.8588,0.0258,0.5220);
T = T*troty(-30.0*pi/180.0);
T = T*inv(tool);
qni = hikine(T);bot.teach(qni)
T = transl(0.8588,0.0258,0.5220);
T = T*troty(-30.0*pi/180.0)*trotx(-30*pi/180.0);
T = T*inv(tool);
qni = hikine(T);bot.teach(qni)
T = transl(0.8588,0.0258,0.5220);
T = T*trotx(-30.0*pi/180.0)*troty(-30*pi/180.0);
T = T*inv(tool);
qni = hikine(T);bot.teach(qni)
T = transl(0.8588,0.0258,0.5220);
T = T*trotx(-30.0*pi/180.0)*troty(-30*pi/180.0)*trotz(30.0*pi/180.0);
T = T*inv(tool);
qni = hikine(T);bot.teach(qni)
T = transl(0.8588,0.0258,0.5220);
T = T*trotz(30.0*pi/180.0)*trotx(-30.0*pi/180.0)*troty(-30*pi/180.0);
T = T*inv(tool);
qni = hikine(T);bot.teach(qni)
T = transl(0.8588,0.0258,0.5220);
T = T*trotx(-30.0*pi/180.0)*troty(-30*pi/180.0)*trotz(30.0*pi/180.0);
T = T*inv(tool);
qni = hikine(T);bot.teach(qni)
T = transl(0.8588,0.0258,0.5220);
T = T*trotz(30.0*pi/180.0)*trotx(-30.0*pi/180.0)*troty(-30*pi/180.0);
T = T*inv(tool);
qni = hikine(T);bot.teach(qni)
T = transl(0.8588,0.0258,0.5220);
T = T*trotx(-30.0*pi/180.0)*troty(-30*pi/180.0)*trotz(30.0*pi/180.0);
T = T*inv(tool);
qni = hikine(T);bot.teach(qni)
T = transl(0.8588,0.0258,0.5220);
T = T*troty(-30.0*pi/180.0)*trotx(-30*pi/180.0)*trotz(30.0*pi/180.0);
T = T*inv(tool);
qni = hikine(T);bot.teach(qni)
T = transl(0.8588,0.0258,0.5220);
T = T*trotz(30.0*pi/180.0)*troty(-30.0*pi/180.0)*trotx(-30*pi/180.0);
T = T*inv(tool);
qni = hikine(T);bot.teach(qni)
T = transl(0.8588,0.0258,0.5220);
T = T*troty(-30.0*pi/180.0)*trotx(-30*pi/180.0)*trotz(30.0*pi/180.0);
T = T*inv(tool);
qni = hikine(T);bot.teach(qni)
T = transl(0.8588,0.0258,0.5220);
T = T*trotz(30.0*pi/180.0)*troty(-30.0*pi/180.0)*trotx(-30*pi/180.0);
T = T*inv(tool);
qni = hikine(T);bot.teach(qni)
T = transl(0.8588,0.0258,0.5220);
T = T*trotx(-30.0*pi/180.0)*troty(-30*pi/180.0)*trotz(30.0*pi/180.0);
T = T*inv(tool);
qni = hikine(T);bot.teach(qni)
T = transl(0.8588,0.0258,0.5220);
;
T = T*inv(tool);
qni = hikine(T);bot.teach(qni)
Robot_Er6c
T = transl(0.8588,0.0258,0.5220);
T = T*trotx(-30.0*pi/180.0)*troty(-30*pi/180.0)*trotz(30.0*pi/180.0);
T = T*inv(tool);
qni = hikine(T);bot.teach(qni)
T = transl(0.8588,0.0258,0.5220);
;
T = T*inv(tool);
qni = hikine(T);bot.teach(qni)
trotx(10*pi/180)
trotx(10*pi/180)*trotx(10*pi/180)
trotx(20*pi/180)
%-- 2017/6/15/星期四 10:48 --%
information
Robot_Er6
Robot_Er6c
bot.teach
Robot_Er6c
bot.teach
record
information
bot.fkine(recordJoint)
record
bot.teach(recordJoint)
bot.teach(currentPos)
demo
robot_demo
rtbdemo
record
currentT = bot.fkine(currentPos)
T = ctraj(currentT, record, 50);
clf; tranimate(T)
T = ctraj(currentT, record, 20);clf; tranimate(T)
%-- 2017/6/15/星期四 20:54 --%
% 随机生成一组（x,y,z),这些点的坐标离一个空间平面比较近
x0=1,L1=2;
y0=1,L2=2;
x=x0+rand(20,1)*L1;
y=y0+rand(20,1)*L2;
z=1+2*x+3*y;
scatter3(x,y,z,'filled')
hold on;
X = [ones(length(x),1) x y];
% 拟合，其实是线性回归，但可以用来拟合平面
% 输出为 b = [b(1) b(2) b(3)] 表示 z = b(1) + b(2)*x + b(3)*y 是拟合出来的平面的方程
[b,bint,r,rint,stats] = regress(z,X,95);
% 图形绘制
xfit = min(x):0.1:max(x);
yfit = min(y):0.1:max(y);
[XFIT,YFIT]= meshgrid (xfit,yfit);
ZFIT = b(1) + b(2) * XFIT + b(3) * YFIT;
mesh(XFIT,YFIT,ZFIT);
[X,Y] = meshgrid(-3:.125:3);
>>Z = peaks(X,Y);
>>mesh(X,Y,Z);
[X,Y] = meshgrid(-3:.125:3);
Z = peaks(X,Y);
mesh(X,Y,Z);
X
clear
clc
[X,Y] = meshgrid(-3:.125:3);
Z = peaks(X,Y);
mesh(X,Y,Z);
xi=-10:0.5:10;yi=-10:0.5:10;
[x,y]=meshgrid(xi,yi);
z=sin(sqrt(x.^2+y.^2))./sqrt(x.^2+y.^2);
mesh(x,y,z);
xi=-10:0.5:10;yi=-10:0.5:10;
[x,y]=meshgrid(xi,yi);
z = sin(x.*y.);
z = sin(x.)
z = sin(x*y);
mesh(x,y,z)
z = sin(x*y*x); mesh(x,y,z)
%-- 2017/6/16/星期五 10:17 --%
function?linear_fit?%最小二乘法拟合直线?clear;?clc;?
prompt={'Name?of?data?file'};?title='Linear_fit';?lineNo=2;?
def={'Linearfit.dat'};?
outval=inputdlg(prompt,title,lineNo,def);?if?isempty(outval)==1,return,end?filename=outval{1};?data=load(filename);?x=data(:,1);?y=data(:,2);?
[a,b]=linearfit(x,y);?yy=a+b*x;?
func=['y=',num2str(a),'+',num2str(b),'*x'];?plot(x,y,'bx','markersize',10);?hold?on?
plot(x,yy,'r-','linewidth',1.5)?xlabel('T(^oC)');?ylabel('R(\Omega)');?
text(x(2),yy(length(yy)-1),func)
prompt={'Name?of?data?file'};?title='Linear_fit';?lineNo=2;?
def={'Linearfit.dat'};?
outval=inputdlg(prompt,title,lineNo,def);?if?isempty(outval)==1,return,end?filename=outval{1};?data=load(filename);?x=data(:,1);?y=data(:,2);?
[a,b]=linearfit(x,y);?yy=a+b*x;?
func=['y=',num2str(a),'+',num2str(b),'*x'];?plot(x,y,'bx','markersize',10);?hold?on?
plot(x,yy,'r-','linewidth',1.5)?xlabel('T(^oC)');?ylabel('R(\Omega)');?
text(x(2),yy(length(yy)-1),func)
linearCoef = polyfit(weight,proportion,1);
linearFit = polyval(linearCoef,weight);
plot(weight,proportion,'s', weight,linearFit,'r-', [2000 4500],[0 0],'k:', [2000 4500],[1 1],'k:')
xlabel('Weight'); ylabel('Proportion');
[cubicCoef,stats,ctr] = polyfit(weight,proportion,3);
cubicFit = polyval(cubicCoef,weight,[],ctr);
plot(weight,proportion,'s', weight,cubicFit,'r-', [2000 4500],[0 0],'k:', [2000 4500],[1 1],'k:')
xlabel('Weight'); ylabel('Proportion');
X=[163     123     150      123     141];
Y=[186     126     172      125     148];
n=5;                %一共5个变量
x2=sum(X.^2);       % 求Σ(xi^2)
x1=sum(X);          % 求Σ(xi)
x1y1=sum(X.*Y);     % 求Σ(xi*yi)
y1=sum(Y);          % 求Σ(yi)
a=(n*x1y1-x1*y1)/(n*x2-x1*x1);      %解出直线斜率b=(y1-a*x1)/n
b=(y1-a*x1)/n;                      %解出直线截距
%作图
% 先把原始数据点用蓝色十字描出来
figure
plot(X,Y,'+');
hold on
% 用红色绘制拟合出的直线
px=linspace(120,165,45);%这里直线区间根据自己实际需求改写
py=a*px+b;
plot(px,py,'r');
linspace(1,100)
linspace(120,165,45)
X = [1     73     150      210     250];
Y=[186     126     172      125     148];
n=5;
x2 = sum(X)
X2 = X^2
X2 = X.2
X2 = X.^2
x2 = sum(X2)
x1 = sum(X)
X*Y
x1y1 = sum(X.Y)
x1y1 = sum(X.*Y)
y1 = sum(Y)
a = (n*x1y1-x1*y1)/(n*x2-x1*x1);
b = (y1-a*x1)/n;
figure
plot(X,Y,'@');
plot(X,Y,'+');
hold on
px = linespace(0,30,300);
px = linspace(0,30,300);
py = px*a+b;
plot(px,py,'b');
X=[1     73     150      210     250];
Y=[186     126     172      125     148];
n=5;                %一共5个变量
x2=sum(X.^2);       % 求Σ(xi^2)
x1=sum(X);          % 求Σ(xi)
x1y1=sum(X.*Y);     % 求Σ(xi*yi)
y1=sum(Y);          % 求Σ(yi)
a=(n*x1y1-x1*y1)/(n*x2-x1*x1);      %解出直线斜率b=(y1-a*x1)/n
b=(y1-a*x1)/n;                      %解出直线截距
%作图
% 先把原始数据点用蓝色十字描出来
figure
plot(X,Y,'+');
hold on
% 用红色绘制拟合出的直线
px=linspace(120,165,45);%这里直线区间根据自己实际需求改写
py=a*px+b;
plot(px,py,'r');
X=[1     73     150      210     250];
Y=[186     126     172      125     148];
n=5;                %一共5个变量
x2=sum(X.^2);       % 求Σ(xi^2)
x1=sum(X);          % 求Σ(xi)
x1y1=sum(X.*Y);     % 求Σ(xi*yi)
y1=sum(Y);          % 求Σ(yi)
a=(n*x1y1-x1*y1)/(n*x2-x1*x1);      %解出直线斜率b=(y1-a*x1)/n
b=(y1-a*x1)/n;                      %解出直线截距
%作图
% 先把原始数据点用蓝色十字描出来
figure
plot(X,Y,'+');
hold on
% 用红色绘制拟合出的直线
px=linspace(0,300,45);%这里直线区间根据自己实际需求改写
py=a*px+b;
plot(px,py,'r');
X=[1     73     150      210     250];
Y=[186     126     172      125     148];
n=5;                %一共5个变量
x2=sum(X.^2);       % 求Σ(xi^2)
x1=sum(X);          % 求Σ(xi)
x1y1=sum(X.*Y);     % 求Σ(xi*yi)
y1=sum(Y);          % 求Σ(yi)
a=(n*x1y1-x1*y1)/(n*x2-x1*x1);      %解出直线斜率b=(y1-a*x1)/n
b=(y1-a*x1)/n;                      %解出直线截距
%作图
% 先把原始数据点用蓝色十字描出来
figure
plot(X,Y,'+');
hold on
% 用红色绘制拟合出的直线
px=linspace(120,165,300);%这里直线区间根据自己实际需求改写
py=a*px+b;
plot(px,py,'r');
linspace(120,165,300)
X=[1     73     150      210     250];
Y=[186     126     172      125     148];
n=5;                %一共5个变量
x2=sum(X.^2);       % 求Σ(xi^2)
x1=sum(X);          % 求Σ(xi)
x1y1=sum(X.*Y);     % 求Σ(xi*yi)
y1=sum(Y);          % 求Σ(yi)
a=(n*x1y1-x1*y1)/(n*x2-x1*x1);      %解出直线斜率b=(y1-a*x1)/n
b=(y1-a*x1)/n;                      %解出直线截距
%作图
% 先把原始数据点用蓝色十字描出来
figure
plot(X,Y,'+');
hold on
% 用红色绘制拟合出的直线
px=linspace(0,300,300);%这里直线区间根据自己实际需求改写
py=a*px+b;
plot(px,py,'r');
ni
%-- 2017/6/16/星期五 11:06 --%
nihe
buge
Bug2
nihe
ni
buhe
nihe
X=[1     73     150      210     250];
Y=[186     126     172      125     148];
n=5;                %一共5个变量
x2=sum(X.^2);       % 求Σ(xi^2)
x1=sum(X);          % 求Σ(xi)
x1y1=sum(X.*Y);     % 求Σ(xi*yi)
y1=sum(Y);          % 求Σ(yi)
a=(n*x1y1-x1*y1)/(n*x2-x1*x1);      %解出直线斜率b=(y1-a*x1)/n
a
%-- 2017/6/17/星期六 13:46 --%
Robot_Er6c
bot.teach()
Robot_Er6c
bot.teach()
%-- 2017/6/19/星期一 20:09 --%
Robot_Er6c
bot.tool
Robot_Er6c
bot.too
bot.tool
t_sensor
Robot_Er6c
t_sensor
bot.fkine(Joint_XZ(1:6));
T = bot.fkine(Joint_XZ(1:6))
T = bot.fkine(Joint_XZ(1:6:))
T = bot.fkine(Joint_XZ(1,6:))
T = bot.fkine(Joint_XZ(1,6,:))
Joint_XZ
for i=1:498
joint(i,:) = Joint_XZ;
end
for i=1:498
joint(i,:) = Joint_XZ(i:6);
end
for i=1:498
joint(i,1:6) = Joint_XZ(i,1:6);
end
for i=1:498
joint(i,:) = Joint_XZ(i,6);
end
joint
for i = 1:498
xz(i,:) = Joint_XZ(i,7:8);
end
xz
xz = xz/1000
bot.fkine(joint)
T = bot.fkine(joint);
rtb_demo
rtbdemo
T = bot.fkine(joint);
clf; tranimate(T)
clc
ts_joint_XZ
clf; tranimate(T)
xz
T = T*t_sensor
t_sensor
for i = 1:198
Tse_origin(:,:,i) = T(:,:,i)*t_sensor;
ens
end
for i = 1:198
Tse_origin(:,:,i) = T(:,:,i)*t_sensor;
end
Tse_origin
for i = 1:498
Tse_origin(:,:,i) = T(:,:,i)*t_sensor;
end
Tse_origin
t_ssss = transl(0,-xz(1,:))
[0,-xz(1,:)]
t_ssss = transl([0,-xz(1,:)])
for i = 1:498
t_ssss = transl([0,-xz(1,:)]);
t_ssss = transl([0,-xz(i,:)]);
end
t_ssss
for i = 1:498
t_ssss(:,:,i) = transl([0,-xz(i,:)]);
end
t_ssss
ts_joint_XZ
clc
ts_joint_XZ
clc
ts_joint_XZ
for i = 1:498
T(:,:,i) = T(:,:,i) * Tse_origin(:,:,i);
end
T = bot.fkine(joint)
for i = 1:498
T(:,:,i) = T(:,:,i) * t_ssss(:,:,i);
end
T
xz
for i = 1:498
t_ssss(:,:,i) = transl([0,-xz(i,:)]);
end
t_ssss
bot.fkine(joint);
T = bot.fkine(joint);
for i = 1:498
T(:,:,i) = T(:,:,i) * t_ssss(:,:,i);
end
T
clf; tranimate(T)
plot(xz(:,1),xz(:,2))
plot3(xz(:,1),0,xz(:,2))
plot3(xz(:,1),:,xz(:,2))
plot(xz(:,1),xz(:,2))
a=T(:,4)'
a=T(:,4,:)
a=T(:,1:3,:)
a=T(:,:,:)
a=T(:,1:3,:)
a=T(1:3,4,:)
a=T(:,4,:)
a=T(1:3:,4,:)
a=T(1:3,4,:)
ts_joint_XZ
plot3(T_toolPos(:,1),T_toolPos(:,2),T_toolPos(:,3))
ts_joint_XZ
plot3(T_toolPos(:,1),T_toolPos(:,2),T_toolPos(:,3));
plot3(T_sensorPos(:,1),T_sensorPos(:,2),T_sensorPos(:,3));
T_sensorPos
ts_joint_XZ
plot3(T_toolPos(:,1),T_toolPos(:,2),T_toolPos(:,3));
hold on
plot3(T_sensorPos(:,1),T_sensorPos(:,2),T_sensorPos(:,3));
ts_joint_XZ
%-- 2017/6/19/星期一 21:55 --%
Robot_E6c
Robot_Er6c
plot3(T_toolPos(:,1),T_toolPos(:,2),T_toolPos(:,3));
ts_joint_XZ
plot3(T_toolPos(:,1),T_toolPos(:,2),T_toolPos(:,3));
plot(xz(:,1),xz(:,2))
clf; tranimate(T)
T_sensorPos(:,1)
T_sensorPos(1,:)
k = T_sensorPos(3,:)/T_sensorPos(1,:)
k = T_sensorPos(3,:)./T_sensorPos(1,:)
T_sensorPos(3,:)
atan2(T_sensorPos(3,:)./T_sensorPos(1,:))
atan2(T_sensorPos(3,:)./,1T_sensorPos(1,:))
atan2(T_sensorPos(3,:)./,1T_sensorPos(1,:),1)
atan2(T_sensorPos(3,:)./1T_sensorPos(1,:),1)
atan2(T_sensorPos(3,:)./T_sensorPos(1,:),1)
atan2(T_sensorPos(3,:)./T_sensorPos(1,:),1)*180/pi
-xz(i,:)
%-- 2017/6/20/星期二 8:32 --%
ts_joint_XZ
Robot_Er6c
ts_joint_XZ
bot.teach(joint)
clc
plot3(T_toolPos(:,1),T_toolPos(:,2),T_toolPos(:,3));
plot3(T_sensorPos(:,1),T_sensorPos(:,2),T_sensorPos(:,3));
plot(xz(:,1),xz(:,2))
pc
pc = transl(T)*1000
plot3(pc(:,1),pc(:,2),pc(:,3))
pc1 = transl(Tse_origin)
plot3(pc1(:,1),pc1(:,2),pc1(:,3))
k = pc1(:,1)/pc1(:,3);
k
k = pc1(1,:)/pc1(3,:);
clc
for i = 1:498
k(i,:) = pc1(i,1)/pc1(i,3);
end
for i = 1:498
k(i,:) = pc1(i,3)/pc1(i,1);
end
atan2(k,1)
angle = atan2(k,1);
angle = angle*180/pi;
angle
ts_joint_XZ
plot3(T_sensorPos(:,1),T_sensorPos(:,2),T_sensorPos(:,3));
k = T_sensorPos(:,3)/T_sensorPos(:,1);
for i = 1:498
k(i,:) = T_sensorPos(i,3)/T_sensorPos(i,1);
end
for i = 1:498
m(i,:) = T_sensorPos(i,3)/T_sensorPos(i,1);
end
nihe
a
YRotate(498)
ts_joint_XZ
YRotate(498)
YRotate(498,Joint_XZ)
YRotate
[206.809319720173]-[206.811806168719]
for i = 1:498
k(i,:) = T_sensorPos_temp(i,2)/T_sensorPos_temp(i,1);
end;
YRotate
for i = 1:497
k(i,1) = T_sensorPos_temp(i,2)/T_sensorPos_temp(i,1);
end;
angle = atan2(k,1);angle = angle*180/pi;
for i = 1:497
k(i,1) = T_sensorPos_temp(i,2)/T_sensorPos_temp(i,1);
end;angle = atan2(k,1);angle = angle*180/pi;
for i = 1:497
k(i) = T_sensorPos_temp(i,2)/T_sensorPos_temp(i,1);
end;
for i = 1:497
k(i) = T_sensorPos_temp(i,2)./T_sensorPos_temp(i,1);
end;
k=T_sensorPos_temp(:,2)./T_sensorPos_temp(:,1)
angle = atan2(k,1)
angle = angle*180/pi;
YRotate
Fnihe
X=[1     73     150      210     250];
Y=[186     126     172      125     148];
a = Fnihe(X,Y,5)
a=Fnihe(X,Y,5)
a = Fnihe(T_sensorPos(:,1),T_sensorPos(:,2),498)
atan2(a,1)
a = Fnihe(T_sensorPos(:,1),T_sensorPos(:,3),498)
atan2(a,1)
an = atan2(a,1);
an = an*180.0/pi
YRotate
plot3(T_sensorPos(:,1),T_sensorPos(:,2),T_sensorPos(:,3));
a = Fnihe(T_sensorPos(1:20,1),T_sensorPos(1:20,3),20);
a
an = atan2(a,1);
an = an*180.0/pi
plot3(T_sensorPos(:,1),T_sensorPos(:,2),T_sensorPos(:,3));
plot3(T_sensorPos(:,1),T_sensorPos(:,2),T_sensorPos(:,3),'*');
plot3(T_sensorPos(:,1),T_sensorPos(:,2),T_sensorPos(:,3));
a = Fnihe(T_sensorPos(1:20,1),T_sensorPos(1:20,3),20);
a
an = atan2(a,1);
an = an*180.0/pi
YRotate
%-- 2017/6/20/星期二 14:27 --%
Robot_Er6c
YRotate
plot(an)
YRotate
plot(an)
plot(T_sensorpos(:,3))
plot(T_sensorPos(:,3))
plot(T_sensorPos(:,1))
plot(T_sensorPos(:,1),T_sensorPos(:,3))
plot(T_sensorPos(:,1),T_sensorPos(:,3),'*')
interp3
plot(an)
hold on
plot3(T_sensorPos(:,1),T_sensorPos(:,2),T_sensorPos(:,3));
YRotate
plot(0an
plot(an)
YRotate
plot(an)
%-- 2017/6/20/星期二 15:38 --%
x=[ones(10,1) (1:10)’]
y=x*[10;1]+normrnd(0,0.1,10,1)
[b,bint]=regress(y,x,0.05)
x=0:.1:1;
y=[.3 .5 1 1.4 1.6 1.9 .6 .4 .8 1.5 2]
n=3;
p=polyfit(x,y,n)
xi=linspace(0,1,100);
z=polyval(p,xi); %多项式求值
plot(x,y,’o’,xi,z,’k:’,x,y,’b’)
legend(‘原始数据’,’3阶曲线’)
x=0:.1:1;
y=[.3 .5 1 1.4 1.6 1.9 .6 .4 .8 1.5 2]
n=3;
p=polyfit(x,y,n)
xi=linspace(0,1,100);
z=polyval(p,xi); %多项式求值
plot(x,y,'o',xi,z,'k:',x,y,'b')
legend(‘原始数据’,’3阶曲线’)
x=0:.1:1;
y=[.3 .5 1 1.4 1.6 1.9 .6 .4 .8 1.5 2]
n=3;
p=polyfit(x,y,n)
xi=linspace(0,1,100);
z=polyval(p,xi); %多项式求值
plot(x,y,'o',xi,z,'k:',x,y,'b')
x=1:20;
y=x+3*sin(x);
p=polyfit(x,y,6)
xi=1inspace(1,20,100);
z=poyval(p,xi);%多项式求值函数
plot(x,y,'o',xi,z,'k:',x,y,'b')
x=1:20;
y=x+3*sin(x);
p=polyfit(x,y,6)
xi=linspace(1,20,100);
z=poyval(p,xi);%多项式求值函数
plot(x,y,'o',xi,z,'k:',x,y,'b')
x=1:20;
y=x+3*sin(x);
p=polyfit(x,y,6)
xi=linspace(1,20,100);
z=ployval(p,xi);%多项式求值函数
plot(x,y,'o',xi,z,'k:',x,y,'b')
x=1:20;
y=x+3*sin(x);
p=polyfit(x,y,6)
xi=linspace(1,20,100);
z=polyval(p,xi);%多项式求值函数
plot(x,y,'o',xi,z,'k:',x,y,'b')
YRotate
X = 1:20
k = Fnihe(X,T_sensorPos(1:20,1))
k = Fnihe(X,T_sensorPos(1:20,1),20)
T_sensorPos(1:20,1)
Y = (T_sensorPos(1:20,1))'
k = Fnihe(X,Y,20)
Fnihe
k = Fnihe(X,Y,20);
YRotate
X = 1:20
Y
X = 1:20
Y = tsensorNihePos(1:20,1);
Y = Y'
[a,b ] = Fnihe(X,Y,20);
Y_1 = aX+b
Y_1 = a*X+b
plot(Y_1)
hold on
plot(Y)
[a_True,b_True] = Fnihe(Y_1,tsensorNihePos(1:20,2),20)
[a_True,b_True] = Fnihe(Y_1,(tsensorNihePos(1:20,2))',20)
an = atan2(a_True,1);
an
an*180/pi
plot3(T_sensorPos(:,1),T_sensorPos(:,2),T_sensorPos(:,3));
YRotate
plot(an)
plot(an,'*')
plot3(T_sensorPos(:,1),T_sensorPos(:,2),T_sensorPos(:,3),'*');
YRotate
YRotate
plot(an,'*')
plot3(T_sensorPos(:,1),T_sensorPos(:,2),T_sensorPos(:,3),'*');
%-- 2017/6/20/星期二 20:13 --%
ts
for i = 1:479
X = i:19+i;
[a,b] = Fnihe(X,(tsensorWorldPosXZ(i:(20+i),1))',20);
Xnihe = a*X+b;
end;
X
for i = 1:479
X = 1+i:19+i;
[a,b] = Fnihe(X,(tsensorWorldPosXZ(i:(20+i),1))',20);
Xnihe = a*X+b;
end;
for i = 1:479
X = i:19+i;
[a,b] = Fnihe(X,(tsensorWorldPosXZ(i:(19+i),1))',20);
Xnihe = a*X+b;
end;
X
ts
plot(a_angle)
plot(a_angle,'*')
plot(an,'*')
ts
clc
ts
9.831121962981721e+02
9.838015778184060e+02
%-- 2017/6/21/星期三 8:41 --%
Robot_Er6c
YRotate
plot(an,'*')
ts
plot(a_angle,'*')
%-- 2017/6/24/星期六 16:00 --%
mdl_puma560
trotz(90)
T= trotz(90)
tr2rpy(T)
T= trotz(90*pi/180)
tr2rpy(T)
T = trotz(90*pi/180)*troty(0)*trotx(0);
T
T = trotz(0)*troty(30*pi/180)*trotx(60*pi/180);
tr2rpy(T)
trotx(60*pi/180)*troty(30*pi/180)*trotz(0);
trotx(60*pi/180)*troty(30*pi/180)*trotz(0)
T = trotx(60*pi/180)*troty(30*pi/180)*trotz(0);
tr2rpy(T)
T = T*trotz(90*pi/180)
tr2rpy(T)
T = T*trotz(-90*pi/180)
tr2rpy(T)
T = trotz(-90*pi/180)*T;
tr2rpy(T)
T =trotx(60*pi/180)*troty(30*pi/180)*trotz(0)
tr2rpy(T)
T = trotz(90*pi/180)*T;
tr2rpy(T)
syms theta1,theta2;
syms theta1;theta2;
syms theta1 theta2;
T = trotx(theta1)*troty(theta2)
T =trotx(60*pi/180)*troty(30*pi/180)*trotz(0)
trplot2(T)
trplot2(T, 'frame', 'A')
trplot(T, 'frame', 'A')
T =trotx(60*pi/180)*troty(0*pi/180)*trotz(0);trplot(T, 'frame', 'A')
T =trotx(60*pi/180)*troty(60*pi/180)*trotz(0);trplot(T, 'frame', 'A')
rtbdemo
T1 =trotx(60*pi/180)*troty(0*pi/180)*trotz(0);
T2 =trotx(60*pi/180)*troty(90*pi/180)*trotz(0);
T = ctraj(T0, T1, 50);
clf; tranimate(T)
clf; tranimate(T)
T2 =trotx(60*pi/180)*troty(90*pi/180)*trotz(0);
tr2rpy(T2)
T2 =trotx(60*pi/180)*troty(60*pi/180)*trotz(0);
tr2rpy(T2)
T2'
tr2rpy(T2')
T2 =trotx(60*pi/180)*troty(90*pi/180)*trotz(0);
tr2rpy(T2')
%-- 2017/6/28/星期三 8:49 --%
Robot_Er6c
bot.teach()
bot.teach(qh)
%-- 2017/7/20/星期四 17:34 --%
Robot_Er6c
tool =[ 0.89451981 -0.020255728 0.44656923 -66.874184;-0.008481265 -0.99956208 -0.028349893 -4.2466784;
0.44694784 0.021572065 -0.89429992 297.03156;1 1 1 0];
too;l
tool
tr2rpy(tool)
q =tr2rpy(tool)
q = q*180.0/pi
bot.teach
Robot_Er6c
bot.teach
T = rpy2tr(10.937*pi/180,58.935*pi/180,-166.764*pi/180)
T = [1:3,1:3]
T = rpy2tr(10.937*pi/180,58.935*pi/180,-166.764*pi/180)
abc=[T(1:3,:),T(1:3,:)]
abc = [-0.5023    0.1181    0.8566   -0.0668741;-0.3830   -0.9185   -0.0979  -0.004246678;0.7752   -0.3773    0.5066  0.29703156;0         0         0    1.0000]
Robot_Er6c
bot.teach
%-- 2017/7/26/星期三 15:40 --%
Robot_Er6c
bot.teach()
Robot_Er6c
bot.teach
plot3(worldPos(:,1),worldPos(:,2),worldPos(:,3))
plot(SensorPos(:,1),SensorPos(:,2))
plot3(SensorPos(:,1),SensorPos(:,2),SensorPos(:,3))
plot3(worldPos(:,1),worldPos(:,2),worldPos(:,3))
hold on
figure(2)
plot3(worldPosHAO(:,1),worldPosHAO(:,2),worldPosHAO(:,3))
figure(3)
plot3(worldPosGUO2(:,1),worldPosGUO2(:,2),worldPosGUO2(:,3))
plot3(worldPosHAO(:,1),worldPosHAO(:,2),worldPosHAO(:,3),'+')
%-- 2017/7/27/星期四 21:48 --%
X=[
1396.9052734 479.8496704 382.6190796
1396.9687500 479.1510315 382.6306152
1396.5256348 478.4855652 382.6644287
1396.6359863 477.5772400 382.6843262
1396.9044189 476.7710876 382.6812134
1396.9764404 476.3500061 382.6887207
1396.9667969 475.4877319 382.6899414
1396.9558105 474.6402893 382.7146606
1396.9697266 474.2078247 382.7210999
1396.9261475 473.4684143 382.7059021
1396.9002686 472.5960083 382.7182617
1396.9093018 472.1655273 382.7496948
1396.8865967 471.3634949 382.7509766
1396.8674316 470.5397644 382.7633057
1396.8463135 469.7594910 382.7348938
1396.8455811 469.3470154 382.7400818
1396.8306885 468.5460510 382.7882385
1396.8098145 467.6860352 382.7598572
1396.7950439 467.2223511 382.7800598
1396.7720947 466.4399109 382.7951965
1396.7800293 465.6373596 382.8052063
1396.7545166 465.1569214 382.8005371
1396.7407227 464.3718567 382.8264160
1396.7259521 463.5401306 382.8320618
1396.7238770 462.7652893 382.8787842
1396.7000732 462.3568420 382.8821411
1396.6893311 461.4635010 382.9262085
1396.6818848 460.7026062 383.0016785
1396.6749268 460.2734375 383.0182800
1396.6430664 459.4630127 383.1295166
1396.6265869 458.6637268 383.1667786
1396.6387939 458.2487183 383.2354126
1396.6381836 457.3626404 383.3208923
1396.6102295 456.5794067 383.4241028
1396.6015625 456.1732178 383.5575256
1396.6097412 455.3346252 383.6977234
1396.6191406 454.5568237 383.7292480
1396.6015625 453.7587280 383.9198914
1396.5876465 453.2797241 384.1559143
1396.5937500 452.5150146 384.3821716
1396.5760498 451.6958618 384.5521545
1396.5640869 451.2714844 384.7475891
1396.5550537 450.4879150 384.9449768
1396.5620117 449.6637573 385.1808167
1396.5350342 448.8712769 385.4366150
1396.5205078 448.4333496 385.6960144
1396.5109863 447.6467285 385.9860535
1396.5069580 446.8686829 386.2577820
1396.5052490 446.4111633 386.5580750
1396.4968262 445.6318054 386.8885498
1396.4855957 444.8401489 387.2375183
1396.4947510 444.3794250 387.5952759
1396.5015869 443.5815430 387.9921265
1396.5004883 442.8058777 388.3947144
1396.4896240 442.4147644 388.8147888
1396.4725342 441.5455933 389.2334290
1396.4732666 440.7490234 389.6421204
1396.4829102 439.9221191 390.1174927
1396.4802246 439.5780334 390.6252747
1396.4752197 438.7753601 391.0883179
1396.4820557 438.0057373 391.6291809
1396.4652100 437.6180115 392.1656799
1396.4707031 436.7188110 392.7028809
1396.4844971 436.0426025 393.2608337
1396.4895020 435.5699463 393.8176880
1396.4970703 434.8258362 394.3826599
1396.4739990 433.9690247 394.9404297
1396.4725342 433.2185364 395.4955444
1396.4798584 432.7318726 396.1010742
1396.4858398 431.9999695 396.6796265
1396.4876709 431.2144165 397.2271423
1396.4799805 430.8494263 397.8042297
1396.4708252 430.0785522 398.3796082
1396.4613037 429.2455750 398.9625854
1396.4766846 428.8436890 399.5047913
1396.4775391 428.0598755 400.1304321
1396.4428711 427.2183533 400.6844177
1396.4277344 426.8174133 401.1965027
1396.4302979 426.0569153 401.8496704
1396.4558105 425.2690125 402.4010925
1396.4176025 424.4695129 402.9444580
1396.4285889 424.0605164 403.4941406
1396.4128418 423.2854309 404.0940247
1396.4091797 422.4976501 404.6570435
1396.3902588 422.0942993 405.2384644
1396.3903809 421.2262268 405.8353577
1396.3856201 420.4956665 406.3933716
1396.3968506 420.0925293 406.9780579
1396.3736572 419.3249512 407.5054016
1396.3767090 418.5281067 408.0539856
1396.3759766 417.6741028 408.6749878
1396.3570557 417.2762756 409.2177124
1396.3591309 416.5086670 409.7967834
1396.3454590 415.7448120 410.3701172
1396.3651123 415.2936401 410.9404602
1396.3894043 414.5529175 411.4913330
1396.3570557 413.7666016 412.0346375
1396.3603516 413.2872620 412.5664063
1396.3582764 412.5085754 413.1364441
1396.3541260 411.7080383 413.6931458
1396.3259277 410.9147644 414.2379150
1396.3494873 410.5509338 414.7533569
1396.3613281 409.7635803 415.3029175
1396.3446045 408.9622192 415.8151855
1396.3597412 408.3850708 416.3208618
1396.3735352 407.5356140 416.8138123
1396.3842773 407.0795898 417.2810364
1396.3723145 406.3496704 417.7491455
1396.3779297 405.5814209 418.1991882
1396.3682861 405.1271667 418.5957947
1396.3612061 404.3573608 419.0077820
1396.3696289 403.5218506 419.3987427
1396.3720703 403.1213989 419.7411804
1396.4011230 402.2854614 420.0910339
1396.3941650 401.4784851 420.4451294
1396.3829346 400.7288208 420.7734680
1396.3895264 400.3115845 421.0634155
1396.4635010 399.5148315 421.3510742
1396.3751221 398.7225037 421.6030273
1396.3876953 398.2763977 421.8483276
1396.3780518 397.4512024 422.1008301
1396.3605957 396.6244202 422.3301086
1396.3879395 396.2335510 422.5470276
1396.3790283 395.3827820 422.7424011
1396.3563232 394.6447754 422.9500732
1396.3773193 393.7920837 423.0994873
1396.3881836 393.4009705 423.2847595
1396.3902588 392.5823364 423.4276428
1396.3955078 391.7307434 423.5643616
1396.3989258 391.3522644 423.7172241
1396.3854980 390.4866943 423.8534241
1396.3720703 389.7403259 424.0060425
1396.1401367 389.3263550 424.0948181
1395.9442139 388.5274048 424.1940308
1395.7915039 387.6709900 424.3192444
1395.6677246 387.2772217 424.3959045
1395.2528076 386.4960632 424.3333435
1395.8291016 385.6062317 424.3985596
1395.5172119 385.2428894 424.4949951
1395.5665283 384.3444824 424.5677795
1395.6140137 383.6213989 424.5236511
1395.7452393 382.7390137 424.4695740
1396.0266113 382.3236084 424.5196533
1396.1315918 381.5238037 424.5219727
1396.3367920 380.6359253 424.4763489
1396.4210205 380.2284241 424.2965088
1396.4095459 379.3439026 424.2452698
1396.3901367 378.5929871 424.2239685
1396.3919678 378.1643677 424.1572266
1396.3704834 377.3728027 424.0701294
1396.3681641 376.5411682 423.9894714
1396.3653564 375.6914063 423.9053345
1396.3577881 375.2514954 423.7918396
1396.3670654 374.4467163 423.6651306
1396.3565674 373.6403503 423.5541992
1396.3237305 373.0963745 423.4054871
1396.3402100 372.3851624 423.2598267
1396.3378906 371.5628052 423.1134949
1396.3267822 371.1228943 422.9069214
1396.3229980 370.2951965 422.6969604
1396.3105469 369.4493713 422.4613037
1396.2838135 368.5376587 422.2231140
1396.3118896 368.1207581 421.9458618
1396.2657471 367.3612061 421.6679993
1396.2498779 366.5409851 421.3827209
1396.2523193 366.1221313 421.1044312
1396.2530518 365.2915955 420.7710571
1396.2391357 364.4466248 420.4644165
1396.2421875 363.9392395 420.0958252
1396.2188721 363.1270447 419.7277527
1396.1960449 362.3298035 419.3305054
1396.1777344 361.8917847 418.9152222
1396.1977539 361.0614929 418.5096741
1396.1718750 360.2399597 418.0222473
1396.1856689 359.3642578 417.5964661
1396.1583252 358.8847656 417.0534363
1396.1540527 358.0957336 416.5859375
1396.1391602 357.2212524 416.0697327
1396.1231689 356.7609253 415.5231323
1396.1314697 355.9594421 414.8947144
1396.0855713 355.1368713 414.3041077
1396.1038818 354.6267395 413.6621399
1396.1065674 353.7955017 413.0013733
1396.0539551 352.9413757 412.2760010
1396.0218506 352.5037231 411.5676270
1396.0512695 351.6575623 410.8547058
1396.0267334 350.7861633 410.1370239
1396.0307617 349.9400330 409.4298401
1395.9802246 349.4843140 408.6203918
1395.9575195 348.6545105 407.9555664
1395.9527588 347.8160706 407.1332703
1395.9780273 347.1368408 406.4082031
1395.9323730 346.3023071 405.6250610
1395.9392090 345.7954712 404.9392395
1395.9233398 345.0177307 404.2278442
1395.9027100 344.1593323 403.4298096
1395.9050293 343.6962280 402.6870728
1395.9041748 342.8461304 401.9758911
1395.8964844 341.9419861 401.2254028
1395.8737793 341.4506836 400.4655151
1395.8447266 340.6606445 399.6753235
1395.8406982 339.8450928 398.9630737
1395.8405762 339.0072937 398.2638245
1395.8289795 338.5221252 397.5130310
1395.8072510 337.6951294 396.7251587
1395.8054199 336.7970276 395.9818115
1395.7803955 336.3609924 395.2403259
1395.7896729 335.5296326 394.5087585
1395.7680664 334.6018372 393.7522583
1395.7456055 334.1752930 393.0072327
1395.7490234 333.3316040 392.2952576
1395.7275391 332.5321655 391.5827637
1395.7338867 331.6809692 390.9058228
1395.7166748 331.1471863 390.2721252
1395.6936035 330.3518982 389.6098938
1395.6867676 329.4815674 389.0002747
1395.6630859 329.0456238 388.4571228
1395.6571045 328.2673340 387.9372864
1395.6555176 327.3663025 387.4318848
1395.6560059 326.9379883 386.9328003
1395.6640625 326.1240234 386.4875793
1395.6348877 325.2896423 386.0664368
1395.6220703 324.8388367 385.6494141
1395.6271973 324.0010681 385.2365417
1395.6240234 323.1461182 384.8888855
1395.6173096 322.3413391 384.4816895
1395.6110840 321.8998718 384.1637573
1395.6085205 321.0333862 383.8229065
1395.5836182 320.2425232 383.5217285
1395.5776367 319.7480774 383.2343445
1395.5595703 318.9141541 382.9660339
1395.5667725 318.1256714 382.7092896
1395.5531006 317.7051392 382.4618530
1395.5452881 316.8758545 382.2341309
1395.5510254 316.0668335 382.0098877
1395.5445557 315.5798950 381.8048096
1395.5180664 314.7403259 381.6877747
1395.5394287 313.9386902 381.4817200
1395.5190430 313.0690002 381.3049622
1395.5489502 312.7055969 381.1782837
1395.5324707 311.9129639 381.0773315
1395.5231934 311.0154419 380.9645386
1395.5177002 310.6373901 380.8371887
1395.5187988 309.7657776 380.7371826
1395.5064697 308.9846497 380.6735840
1395.4423828 308.5100098 380.7578125
1395.4178467 307.7391663 380.9364929
1395.4887695 306.9205017 380.9751282
1395.5395508 306.1008606 380.9450073
1395.5356445 305.5823975 381.0479126
1395.5340576 304.8759766 380.9989929
1395.5186768 304.0508728 380.9997864
1395.5148926 303.6230774 381.1027832
1395.5174561 302.7902222 381.0070190
1395.5213623 301.9949341 380.9407959
1395.5308838 301.5085754 380.9832764
1395.5069580 300.7461853 380.8986816
1395.5268555 299.9476929 381.0345154
1395.5162354 299.0674133 380.8931580
1395.5062256 298.6648865 380.8771362
1395.5198975 297.8384705 380.9645386
1395.5466309 297.0142822 381.0717468
1395.5332031 296.6264954 381.2138672
1395.5205078 295.8188477 381.3795776
1395.5468750 295.0252380 381.5083313
1395.5198975 294.4915771 381.7292175
1395.5584717 293.7193604 381.9341431
1395.5543213 292.9382019 382.1535645
1395.5671387 292.5415649 382.3919983
1395.5645752 291.6850891 382.6093750
1395.5751953 290.8779907 382.8223877
1395.5891113 290.0391541 383.1190796
1395.5952148 289.6595459 383.3882751
1395.5968018 288.9050293 383.6782532
1395.6005859 288.0915527 383.9733887
1395.5944824 287.6873169 384.3023071
1395.6032715 286.7878723 384.6647949
1395.6094971 286.0334473 384.9611206
1395.6291504 285.4935913 385.3315430
1395.6159668 284.6748047 385.7106323
1395.6396484 284.2604370 386.1015015
1395.6129150 283.4064331 386.5447083
1395.6259766 282.6330566 386.9920959
1395.6365967 282.2448120 387.4258423
1395.6406250 281.3971863 387.9027100
1395.6505127 280.6289368 388.3636169
1395.6678467 279.8415833 388.8667908
1395.6773682 279.4327698 389.3860779
1395.6772461 278.6439514 389.9489441
1395.7045898 277.8659668 390.5302734
1395.7041016 277.4015503 391.0991211
1395.7043457 276.6166992 391.6781006
1395.7152100 275.8524475 392.2299805
1395.7423096 275.0584412 392.8295288
1395.7208252 274.6819458 393.3799744
1395.7550049 273.8163452 393.9561157
1395.7553711 273.0691833 394.5806274
1395.7576904 272.6622620 395.1858215
1395.7791748 271.8749390 395.7349854
1395.7879639 271.1082458 396.3363342
1395.8040771 270.6206665 396.8870239
1395.8175049 269.8579407 397.4865112
1395.8282471 269.1120605 398.0741577
1395.8531494 268.2842407 398.7088623
1395.8363037 267.8679504 399.3150635
1395.8509521 267.0803528 399.9041138
1395.8825684 266.3268433 400.5000000
1395.8955078 265.9176941 401.1618958
1395.9078369 265.1313171 401.7055054
1395.9100342 264.2523499 402.3384705
1395.9432373 263.8538513 402.9436035
1395.9506836 263.1188354 403.5123901
1395.9737549 262.3583374 404.1511536
1395.9750977 261.5664673 404.7398071
1396.0122070 261.1681213 405.3276367
1396.0164795 260.3019104 405.8925476
1396.0035400 259.5734863 406.5301514
1396.0367432 259.1605835 407.1251526
1396.0506592 258.3722534 407.7263794
1396.0537109 257.5828247 408.3200989
1396.0836182 257.0655823 408.9635620
1396.0882568 256.3340759 409.5611267
1396.1091309 255.5872955 410.1196289
1396.1287842 255.1851044 410.6979675
1396.1403809 254.4083862 411.3263855
1396.1694336 253.6060638 411.9014893
1396.2138672 252.7351685 412.4960632
1396.2058105 252.3944855 413.0365906
1396.2038574 251.5932617 413.5994263
1396.2519531 250.8280029 414.1231995
1396.2607422 250.3339691 414.6031799
1396.2630615 249.5666504 415.0971680
1396.2873535 248.8087769 415.5386047
1396.3177490 248.0066071 416.0085449
1396.3186035 247.5494385 416.4541626
1396.3211670 246.7470245 416.8612671
1396.3306885 245.9627686 417.2433777
1396.3314209 245.5692596 417.6021118
1396.3656006 244.7393188 417.9627686
1396.3724365 243.9895325 418.2832336
1396.3668213 243.5643768 418.6310120
1396.3586426 242.7551880 418.9317017
1396.3802490 241.9374237 419.2425232
1396.4068604 241.5282288 419.5195618
1396.3894043 240.6808167 419.7702332
1396.4252930 239.9028473 420.0366211
1396.4311523 239.1240845 420.2922974
1396.4190674 238.6878662 420.4856873
1396.4378662 237.8711243 420.7149658
1396.4219971 237.0747528 420.8934937
1396.4185791 236.5689087 421.0340881
1396.4530029 235.7978363 421.2138367
1396.4455566 235.0213165 421.3638916
1396.4561768 234.1792603 421.4884338
1396.4565430 233.7700195 421.6326599
1396.4644775 232.9794769 421.7125854
1396.4635010 232.1595612 421.8419189
1396.4708252 231.7360535 421.9377136
1396.4688721 230.8360748 421.9961548
1396.4783936 230.1059570 422.0858765
1396.4752197 229.6873932 422.1566162
1396.4951172 228.8841553 422.1740723
1396.5444336 228.0639191 422.2076416
1396.4771729 227.5953217 422.2426758
1396.4776611 226.5828552 422.2657776
1396.4836426 226.1749573 422.2593994
1396.4766846 225.3789063 422.2521973
1396.4864502 224.5212250 422.2396545
1396.4384766 224.1201172 422.2123108
1396.4896240 223.2766876 422.2184753
1396.4862061 222.4399567 422.1520691
1396.4949951 221.6608276 422.1057129
1396.4913330 221.1561127 422.0359192
1396.4875488 220.3725128 421.9611511
1396.4517822 219.5890350 421.8830566
1396.4669189 219.1456757 421.7839050
1396.4720459 218.2872467 421.6540527
1396.4713135 217.4564362 421.5558777
1396.4713135 217.0803833 421.4271545
1396.4663086 216.2362518 421.2710876
1396.4537354 215.4303741 421.1108093
1396.4650879 214.6162720 420.9292603
1396.4394531 214.1875305 420.7573547
1396.4342041 213.3172302 420.5434265
1396.4470215 212.4799957 420.3266296
1396.4323730 212.0719299 420.0776367
1396.4318848 211.2168884 419.8540039
1396.4285889 210.4181519 419.5927429
1396.4041748 209.9927826 419.3073730
1396.4040527 209.1261139 419.0028076
1396.3957520 208.3009033 418.6890564
1396.3922119 207.4434357 418.3804932
1396.3619385 206.9956512 418.0139465
1396.3718262 206.2223969 417.6752319
1396.3664551 205.3619537 417.2633057
1396.3265381 204.9408569 416.8956909
1396.3251953 204.0620880 416.4512329
1396.3199463 203.2699280 416.0329895
1396.3287354 202.4426422 415.5693054
1396.3068848 201.9387512 415.0874634
1396.2946777 201.1221466 414.5921021
1396.2684326 200.3061066 414.0465698
1396.2347412 199.8341217 413.5149841
1396.2449951 199.0180206 412.9698181
1396.2382813 198.1963806 412.4029236
1396.2060547 197.6991882 411.7844849
1396.1945801 196.8376160 411.1623535
1396.1925049 196.0021057 410.4761963
1396.1601563 195.5321045 409.7835083
1396.1491699 194.7056732 409.1224060
1396.1326904 193.8362427 408.3950806
1396.1235352 193.0244293 407.6963196
1396.1013184 192.5303345 407.0144958
1396.0905762 191.6967926 406.2944031
1396.0666504 190.8662262 405.5807800
1396.0515137 190.4169159 404.8753052
1396.0416260 189.5239868 404.1959534
1396.0427246 188.7094421 403.4996033
1396.0084229 188.2641754 402.8640442
1396.0009766 187.4069977 402.1989441
1395.9855957 186.5439606 401.4232178
1395.9628906 185.2462616 399.9742737
1395.9367676 184.4194489 399.2436523
1395.9206543 183.0864868 397.7880859
1395.9068604 182.2075806 397.0598755
1395.8962402 181.3924561 396.3646545
1395.8763428 180.9644928 395.6363525
1395.8643799 180.1228180 394.9399719
1395.8393555 179.2724762 394.1950684
1395.8264160 178.4231720 393.4949036
1395.8183594 177.9296112 392.7894592
1395.8160400 177.0974274 392.0992126
1395.8043213 176.2762451 391.3445435
1395.7741699 175.8224182 390.6506042
1395.7700195 174.9683533 389.9220276
1395.7333984 174.0768585 389.2167969
1395.7292480 173.6203766 388.5722961
1395.7180176 172.8108215 387.9706116
1395.6787109 171.9882965 387.3258667
1395.6871338 171.0578766 386.7557983
1395.6633301 170.6411896 386.2449646
1395.6738281 169.8624115 385.7024231
1395.6450195 169.0068970 385.2258606
1395.6254883 168.5619812 384.7540283
1395.6209717 167.6348419 384.3397827
1395.6179199 166.8233795 383.8934326
1395.6069336 166.4412231 383.5122986
1395.5917969 165.6048279 383.1367493
1395.5893555 164.7852631 382.7784119
1395.5714111 164.0808563 382.4602661
1395.5657959 163.2856293 382.1430054
1395.5700684 162.8735809 381.8197327
1395.5443115 161.9933167 381.5188904
1395.5341797 161.1767578 381.2597046
1395.5363770 160.7980499 380.9942322
1395.5390625 159.9155884 380.7409668
1395.5240479 159.1397705 380.5189514
1395.5240479 158.2989960 380.2662354
1395.5213623 157.8247528 380.1079102
1395.5218506 157.0381775 379.9010925
1395.4984131 156.1874390 379.7593689
1395.5008545 155.7757263 379.5782776
1395.4920654 154.9626312 379.4602661
1395.4930420 154.1368256 379.3092346
1395.4970703 153.6547546 379.2254639
1395.4919434 152.8585358 379.1023865
1395.4790039 152.0218811 378.9964294
1395.4707031 151.2268372 378.9214172
1395.4906006 150.8066864 378.8463440
1395.4235840 149.9510956 378.8399658
1395.4742432 149.1547699 378.9378052
1395.4355469 148.7193298 378.9080200
1395.4715576 147.8982086 378.9209900
1395.4532471 147.0998993 378.8873901
1395.4063721 146.6175995 378.9223022
1395.4764404 145.8041840 379.1122437
1395.4748535 145.0195923 379.1600037
1395.4898682 144.2099304 379.3216553
1395.4782715 143.7601318 379.3923950
1395.4053955 142.9508514 379.2831421
1395.4234619 142.1636810 379.3579407
1395.3999023 141.7400360 379.4498291
1395.4925537 140.9330750 379.6453857
1395.4356689 140.1228333 379.3638306
1395.4885254 139.6356506 379.7645874
1395.4827881 138.8380585 379.8157654
1395.4791260 138.0644226 379.7771912
1395.4678955 137.2432098 379.9389343
1395.4930420 136.8186493 380.0536804
1395.4960938 136.0242310 380.1150208
1395.4915771 135.1631775 380.2748718
1395.5013428 134.7446899 380.5130005
1395.5112305 133.9529877 380.7646179
1395.5156250 133.1350708 381.0039673
1395.5058594 132.6905975 381.2543945
1395.5169678 131.9270172 381.5222473
1395.5292969 131.1414185 381.7728882
1395.5339355 130.2746429 382.1087952
1395.5456543 129.8967285 382.4339600
1395.5665283 129.0752106 382.7764282
1395.5799561 128.2950897 383.1015625
1395.5729980 127.8810730 383.4750671
1395.5986328 127.0808411 383.8632202
1395.5991211 126.2368774 384.2663879
1395.6086426 125.7995682 384.7074280
1395.6141357 125.0566330 385.1295166
1395.6398926 124.2901840 385.5263062
1395.6641846 123.4864960 385.9905701
1395.6728516 122.9998932 386.4839172
1395.6859131 122.2561646 386.9662170
1395.6845703 121.4299393 387.5130005
1395.7128906 121.0400848 388.0342712
1395.7125244 120.2760544 388.5729980
1395.7314453 119.4863739 389.1388855
1395.7231445 119.1019211 389.6940002
1395.7204590 118.1859131 390.2913208
1395.7689209 117.5072327 390.8800659
1395.7880859 116.6689224 391.4676208
1395.8028564 116.2948685 392.0270386
1395.8112793 115.5058289 392.6100159
1395.8134766 114.7356186 393.1836548
1395.8142090 114.3176193 393.7421265
1395.8251953 113.5264664 394.3631592
1395.8454590 112.6709747 394.9000244
1395.8558350 112.2722626 395.4978333
1395.8776855 111.5052414 396.0766907
1395.8875732 110.7279129 396.6713257
1395.9058838 110.3156586 397.2793579
1395.9273682 109.4966736 397.8614502
1395.9265137 108.7033234 398.4263916
1395.9418945 107.9486771 399.0292969
1395.9570313 107.5332642 399.6205750
1395.9774170 106.7356873 400.2391357
1396.0019531 105.9611511 400.7999878
1396.0052490 105.5671921 401.3936768
1396.0319824 104.7412796 401.9814453
1396.0347900 104.1910858 402.6050415
1396.0284424 103.2620621 403.1921997
1396.0541992 102.5729065 403.8109131
1396.0681152 102.1046829 404.4380493
1396.0762939 101.3794174 405.0261841
1396.0985107 100.5884628 405.6195068
1396.1046143 100.1967773 406.2095642
1396.1334229 99.3948822 406.7912292
1396.1293945 98.6100998 407.4144287
1396.1737061 98.1478653 408.0101318
1396.1981201 97.3373108 408.5925903
1396.2069092 96.6106033 409.1682434
1396.2246094 95.7765045 409.7407837
1396.2414551 95.3800278 410.2760315
1396.2412109 94.6314087 410.8357544
1396.2397461 93.7759247 411.3536072
1396.2683105 93.3423386 411.8706970
1396.2738037 92.5282898 412.3510132
1396.2956543 91.7244263 412.8208618
1396.2957764 91.3855743 413.2694702
1396.2944336 90.6080933 413.6752625
1396.3085938 89.7675934 414.0946655
1396.3391113 88.9522781 414.5090942
1396.3334961 88.5429077 414.8871765
1396.3537598 87.7635956 415.2665405
1396.3546143 86.9817581 415.6073608
1396.3621826 86.5248413 415.9295959
1396.3631592 85.7544861 416.2469177
1396.3674316 84.9845276 416.5544434
1396.3741455 84.5299988 416.8405762
1396.3804932 83.7486649 417.1157227
1396.3815918 82.8844833 417.3654175
1396.3947754 82.0987015 417.6349792
1396.4049072 81.6834564 417.8670654
1396.4123535 80.8873596 418.0949402
1396.3951416 80.0919113 418.2977295
1396.3859863 79.6860504 418.5002136
1396.4080811 78.7992935 418.6978455
1396.4233398 78.0416260 418.8750305
1396.4288330 77.6138687 419.0298157
1396.4211426 76.7549744 419.1493225
1396.4215088 75.9948807 419.2738953
1396.4310303 75.1793060 419.3956299
1396.4318848 74.7763290 419.5408630
1396.4401855 73.9757919 419.7391663
1396.3327637 73.1597824 419.8305664
1396.2033691 72.6309662 419.9218140
1396.1835938 71.8537140 419.9693604
1396.0521240 71.1100464 419.9993286
1395.8699951 70.6972504 420.0873718
1396.1329346 69.8783951 420.0687866
1396.0211182 69.0475845 420.1780090
1396.0513916 68.1983261 420.1518250
1395.7988281 67.7773132 420.1055908
1395.8413086 66.9783096 420.1122742
1396.3538818 66.1572189 420.1556702
1396.2902832 65.6191940 420.0850830
1396.2989502 64.9141769 419.9772644
1396.4421387 64.0467300 419.9018250
1396.4381104 63.6109238 419.7989197
1396.4417725 62.8044815 419.7138367
1396.4289551 61.9803810 419.5959778
1396.4244385 61.1725883 419.4725342
1396.4394531 60.7424736 419.3569336
1396.4097900 59.8638878 419.1948853
1396.4302979 59.1054382 419.0790710
1396.4125977 58.6630554 418.8911743
1396.4165039 57.8422012 418.7210083
1396.4708252 57.0028610 418.5209656
1396.4090576 56.5111351 418.3242798
1396.3970947 55.7092781 418.0854492
1396.3996582 54.8923836 417.8802185
1396.3752441 54.0613098 417.5997620
1396.3912354 53.6361809 417.3380432
1396.3793945 52.7551537 417.0573730
1396.3621826 51.9804916 416.7503052
1396.3568115 51.5282326 416.4434204
1396.3395996 50.7177849 416.1180725
1396.3376465 49.8897781 415.7882385
1396.3293457 49.3496552 415.4317017
1396.3082275 48.5767021 415.0354309
1396.3123779 47.7363586 414.6546631
1396.2871094 47.3150406 414.2604675
1396.3000488 46.4852295 413.8114624
1396.2783203 45.6528664 413.3779907
1396.2683105 45.2157669 412.9049377
1396.2479248 44.3458176 412.4264832
1396.2427979 43.7477837 411.8935547
1396.2407227 42.8577003 411.3270264
1396.2087402 42.0053520 410.7580261
1396.1821289 41.1795235 410.1880493
1396.1697998 40.7470360 409.5375366
1396.1519775 39.8953323 408.8774414
1396.1223145 39.0708504 408.1882629
1396.1085205 38.5871429 407.5365906
1396.1048584 37.7369957 406.7800293
1396.0830078 36.9189682 406.1190491
1396.0639648 36.4102936 405.4035950
1396.0355225 35.5784836 404.6965942
1396.0272217 34.7524872 403.9605103
1396.0079346 33.8687019 403.2576599
1396.0239258 33.4500923 402.5772095
1396.0046387 32.5650368 401.8363037
1395.9819336 31.7759781 401.1194763
1395.9827881 31.3060570 400.4221802
1395.9564209 30.4427547 399.6658936
1395.9343262 29.5960770 398.9351196
1395.9261475 29.1489735 398.2752991
1395.9156494 28.2398815 397.5822754
1395.8870850 27.4299145 396.8724060
1395.8760986 26.9925613 396.1336670
1395.8677979 26.1260891 395.4218140
1395.8627930 25.2610588 394.6670532
1395.8446045 24.4398346 393.9615784
1395.8295898 23.9761734 393.2455750
1395.8133545 23.1595020 392.5458374
1395.7864990 22.2086220 391.8163147
1395.7864990 21.7587223 391.0924988
1395.7746582 20.9290180 390.4064026
1395.7504883 20.1379528 389.6649475
1395.7414551 19.6728706 388.9297485
1395.7271729 18.8355503 388.2450256
1395.7257080 17.9860611 387.5561829
1395.6828613 17.0997467 386.8587952
1395.7083740 16.6784134 386.2621460
1395.6790771 15.8650179 385.6616211
1395.6802979 15.0288496 385.0739136
1395.6507568 14.5236225 384.4717407
1395.6597900 13.7348585 383.9858398
1395.6530762 12.8422585 383.4894104
1395.6405029 12.4317932 383.0126953
1395.6507568 11.6049814 382.5756531
1395.6319580 10.7921133 382.1684875
1395.6177979 10.3379288 381.7221680
1395.6313477 9.4551611 381.3131714
1395.6256104 8.6447868 380.9677734
1395.6209717 7.8047323 380.6321411
1395.6210938 7.3818078 380.2986145
1395.5989990 6.4730740 379.9990540
1395.5881348 5.7420764 379.6679993
1395.5773926 5.2260380 379.3977051
1395.5708008 4.4497418 379.1038513
1395.5676270 3.6208358 378.8486938
1395.5509033 2.7874303 378.5669250
1395.5538330 2.2647433 378.3365173
1395.5491943 1.5392528 378.1103821
1395.5142822 0.7132757 377.9419861
1395.5222168 0.2366388 377.8080139
1395.5119629 -0.5588580 377.5562439
1395.4843750 -1.4141233 377.4097290
1395.4892578 -1.8419236 377.2843018
1395.4748535 -2.6422813 377.1336975
1395.4837646 -3.4389679 377.0457458
1395.4841309 -3.9246132 376.9404907
1395.4649658 -4.7234845 376.8478394
1395.4642334 -5.5624247 376.7680969
1395.4613037 -5.9859247 376.7139282
1395.4522705 -6.7891965 376.6474304
1395.4401855 -7.5949879 376.5548096
1395.4332275 -8.4687414 376.5392761
1395.4359131 -8.9036837 376.5278625
1395.4219971 -9.6727715 376.5406494
1395.4268799 -10.4734735 376.5219727
1395.4259033 -10.8967276 376.5594788
1395.4007568 -11.7973175 376.5393066
1395.3432617 -12.5629349 376.6324158
1395.2500000 -13.0096884 376.7782288
1395.3048096 -13.7923021 376.9529419
1395.3143311 -14.5662813 377.0346375
1395.2791748 -15.3980551 377.3169250
1395.3249512 -15.8555050 377.3773499
1395.3212891 -16.6798229 377.5247498
1395.3212891 -17.4753304 377.5081177
1395.2979736 -17.8838196 377.4987793
1395.3930664 -18.8718624 377.8191528
1395.3314209 -19.2892036 377.9600830
1395.3695068 -20.0864048 378.1206970
1395.3647461 -20.9101543 378.2084961
1395.4023438 -21.3259563 378.4589844
1395.4224854 -22.1862755 378.5282288
1395.4411621 -22.9633121 378.6883240
1395.4530029 -23.4357758 378.9186401
1395.4460449 -24.1925240 379.2024231
1395.4699707 -25.0755806 379.4605408
1395.4622803 -25.4560184 379.7563782
1395.4653320 -26.2064362 380.0608521
1395.4835205 -27.0296440 380.3845825
1395.4997559 -27.8315067 380.6723938
1395.4952393 -28.3628159 381.0325317
1395.5075684 -29.0822792 381.4489136
1395.5140381 -29.8464012 381.8063660
1395.5430908 -30.2567749 382.2229614
1395.5474854 -31.0504532 382.6171265
1395.5432129 -31.8493881 383.0534058
1395.5677490 -32.3082695 383.5097351
1395.5708008 -33.1283760 384.0144043
1395.5905762 -33.9053383 384.4667969
1395.5996094 -34.6934128 384.9854736
1395.6162109 -35.0706139 385.5351257
1395.6312256 -35.8873177 386.0784607
1395.6311035 -36.6519203 386.6288757
1395.6545410 -37.0544128 387.1778870
1395.6801758 -37.8996544 387.7338867
1395.6987305 -38.6627731 388.2870483
1395.6983643 -39.0629654 388.8949890
1395.7255859 -39.8592873 389.4548340
1395.7443848 -40.6172104 390.0554810
1395.7529297 -41.0790443 390.5954590
1395.7502441 -41.8315086 391.1460571
1395.7774658 -42.6573105 391.7761230
1395.7961426 -43.4535828 392.3884583
1395.8103027 -43.8353844 392.9704895
1395.8330078 -44.6080589 393.5115662
1395.8640137 -45.4423943 394.0855408
1395.8642578 -45.8380165 394.6772766
1395.8763428 -46.6384048 395.2363892
1395.8956299 -47.4290886 395.8563538
1395.9224854 -47.8070831 396.4562683
1395.9230957 -48.6624527 397.0415344
1395.9448242 -49.4084854 397.6350403
1395.9788818 -50.1652069 398.1960144
1395.9794922 -50.6096382 398.7836609
1395.9884033 -51.4040756 399.3868103
1396.0014648 -52.1790810 400.0132446
1396.0333252 -52.5895042 400.6191406
1396.0375977 -53.3818474 401.2057800
1396.0416260 -54.1690102 401.8073120
1396.0505371 -54.5675888 402.3812561
1396.0780029 -55.3914108 402.9559631
1396.0895996 -56.1568146 403.5430298
1396.1168213 -56.9387589 404.1658630
1396.1037598 -57.4092407 404.7394104
1396.1269531 -58.1450615 405.3200684
1396.1547852 -59.0042648 405.8892822
1396.1613770 -59.3953781 406.4679565
1396.1651611 -60.1495132 407.0236511
1396.1759033 -60.9147491 407.5694885
1396.1822510 -61.4286690 408.1429138
1396.2193604 -62.1260719 408.6856384
1396.2452393 -62.9224586 409.2407532
1396.2446289 -63.7717743 409.7043457
1396.2504883 -64.1473389 410.2152100
1396.2637939 -64.9411697 410.6853027
1396.2733154 -65.7385101 411.1184692
1396.2854004 -66.1290817 411.5603333
1396.2973633 -66.9962921 411.9585266
1396.3216553 -67.7813416 412.3782349
1396.3203125 -68.2006836 412.7614136
1396.3393555 -69.0050583 413.1325073
1396.3380127 -69.7686462 413.4630737
1396.3679199 -70.5940170 413.7748413
1396.3791504 -71.0467529 414.1070557
1396.4204102 -71.7915878 414.4124756
1396.3813477 -72.6191483 414.6793518
1396.3963623 -73.0419617 414.9502258
1396.4416504 -73.8370972 415.2121887
1396.4403076 -74.6934586 415.4818420
1396.4538574 -75.0658722 415.6901245
1396.4516602 -75.9188995 415.8973694
1396.4530029 -76.6910706 416.1102905
1396.4809570 -77.3376007 416.3016968
1396.4764404 -78.0999374 416.4779663
1396.4937744 -78.5329971 416.6484985
1396.4880371 -79.3357697 416.7867737
1396.4989014 -80.1309280 416.9413452
1396.5004883 -80.6527863 417.0588684
1396.5300293 -81.4218826 417.1732178
1396.5180664 -82.2427673 417.2812500
1396.5245361 -83.0031052 417.3950500
1396.5360107 -83.4352036 417.4912720
1396.5385742 -84.2467499 417.5412292
1396.5560303 -85.0407944 417.6208801
1396.5682373 -85.5122604 417.6590576
1396.5657959 -86.3286209 417.7016296
1396.5673828 -87.0861130 417.7458191
1396.5655518 -87.9374695 417.7818298
1396.6009521 -88.3603745 417.7874756
1396.6164551 -89.1816330 417.7703552
1396.6086426 -90.0607681 417.7374878
1396.6153564 -90.4415894 417.6996765
1396.6173096 -91.3105850 417.6682739
1396.6248779 -92.0591812 417.6026306
1396.6086426 -92.4988861 417.5290833
1396.6110840 -93.3114700 417.4646912
1396.6267090 -94.1543198 417.3889160
1396.6186523 -94.9915695 417.2634888
1396.6300049 -95.4225845 417.1797791
1396.6273193 -96.2262955 417.0385437
1396.6398926 -97.0229874 416.9266663
1396.6340332 -97.4830856 416.7189636
1396.6315918 -98.2794647 416.5682678
1396.6166992 -99.1731491 416.3836975
1396.6093750 -99.5637283 416.1864014
1396.6049805 -100.4191971 415.9469299
1396.6035156 -101.2117462 415.7414246
1396.6148682 -101.6484833 415.5132141
1396.5866699 -102.4568481 415.2728577
1396.6011963 -103.3972931 414.9785767
1396.5958252 -104.1241913 414.7276001
1396.5892334 -104.6358566 414.4339294
1396.5881348 -105.4093399 414.1063843
1396.5773926 -106.2382278 413.7881165
1396.5860596 -106.7004318 413.4100342
1396.5682373 -107.5210037 413.0705872
1396.5681152 -108.3936768 412.7050476
1396.5584717 -108.7954941 412.3183289
1396.5411377 -109.6247253 411.9084167
1396.5389404 -110.4491806 411.4796753
1396.5319824 -111.4008255 410.9558105
1396.5350342 -111.8605423 410.5300598
1396.5183105 -112.5727158 410.0168152
1396.4995117 -113.4753647 409.4776611
1396.4884033 -113.8582153 408.9536133
1396.4787598 -114.7102432 408.3478699
1396.4682617 -115.5471878 407.7679443
1396.4495850 -116.4046707 407.1085510
1396.4104004 -116.9106140 406.4820557
1396.4135742 -117.7226563 405.7884827
1396.3962402 -118.5565109 405.1149902
1396.4003906 -118.9887161 404.4356384
1396.3813477 -119.9617157 403.7298889
1396.3435059 -120.7058792 403.0130005
1396.3300781 -121.1778564 402.2950745
1396.3162842 -122.0133286 401.5815735
1396.3262939 -122.8510895 400.8711548
1396.2983398 -123.6980667 400.1885071
1396.2763672 -124.1462784 399.5189209
1396.2713623 -125.0260468 398.8749084
1396.2440186 -125.8759384 398.0915833
1396.2357178 -126.3056717 397.4054260
1396.2248535 -127.1619720 396.6991882
1396.2049561 -128.0455627 395.9240112
1396.1883545 -128.4638977 395.1581116
1396.1741943 -129.3574677 394.4477234
1396.1583252 -130.1716919 393.7406311
1396.1394043 -130.9938965 392.9797974
1396.1060791 -131.4992828 392.2943115
1396.0936279 -132.3137665 391.5670776
1396.0865479 -133.1558685 390.8309021
1396.0432129 -133.6795197 390.0543518
1396.0416260 -134.4962769 389.2446899
1396.0299072 -135.3244629 388.5239868
1396.0206299 -136.2000732 387.8606567
1395.9924316 -136.6314545 387.1736755
1395.9713135 -137.4583893 386.4357300
1395.9617920 -138.3247986 385.7795410
1395.9520264 -138.7698059 385.1408691
1395.9227295 -139.8211670 384.4776306
1395.9096680 -140.3322906 383.8338928
1395.9031982 -141.1109009 383.3079834
1395.8632813 -141.9417725 382.8415527
1395.8763428 -142.3750916 382.3421936
1395.8703613 -143.2158966 381.8255310
1395.8613281 -144.0802765 381.2694702
1395.8592529 -144.5211945 380.8536987
1395.8511963 -145.4315948 380.4414673
1395.8441162 -146.2250519 380.0789490
1395.8225098 -147.0332947 379.7385254
1395.8248291 -147.4714050 379.4165039
1395.8215332 -148.2633820 379.0308228
1395.8077393 -149.1619873 378.7067566
1395.8054199 -149.6033478 378.3947449
1395.7725830 -150.3780212 378.0689697
1395.7915039 -151.2383728 377.7933960
1395.7847900 -151.6660461 377.5854187
1395.7769775 -152.4720764 377.3323364
1395.7803955 -153.2933502 377.1056213
1395.7749023 -154.1758881 376.9216614
1395.7729492 -154.5899963 376.6600342
1395.7805176 -155.5403748 376.4594421
1395.7412109 -156.2418518 376.3369751
1395.7895508 -156.6620483 376.1306152
1395.7719727 -157.5158691 376.0544434
1395.7542725 -158.3329468 375.9449158
1395.7628174 -158.7809296 375.7692261
1395.7801514 -159.5704498 375.6567078
1395.7873535 -160.4371033 375.6038818
1395.7795410 -161.2433014 375.4315186
1395.7474365 -161.6708832 375.4049072
1395.7679443 -162.4627991 375.3447571
1395.7774658 -163.3012085 375.3273010
1395.7595215 -163.6865082 375.2763367
1395.7556152 -164.5608215 375.3224487
1395.7630615 -165.3269958 375.3507080
1395.7600098 -165.8252258 375.5106201
1395.7235107 -166.6066132 375.5072021
1395.7360840 -167.3772278 375.6962891
1395.7769775 -168.2254486 375.8888550
1395.7700195 -168.6450348 375.9528809
1395.7808838 -169.4347839 376.0452271
1395.6507568 -170.2365570 375.9060974
1395.6634521 -170.7881317 375.9116211
1395.7773438 -171.4872589 376.1757507
1395.7907715 -172.3759766 376.2482605
1395.7757568 -172.7388458 376.3734741
1395.7818604 -173.5601959 376.3723755
1395.7569580 -174.3559570 376.5173950
1395.7647705 -174.7736969 376.5859985
1395.8002930 -175.5840302 376.6822205
1395.8269043 -176.4755096 376.8044739
1395.8459473 -177.2702637 377.0085144
1395.8435059 -177.6613617 377.2335510
1395.8375244 -178.5003662 377.4150391
1395.8541260 -179.2459106 377.6545715
1395.8659668 -179.6576843 377.9290771
1395.8619385 -180.5239563 378.1788635
1395.8843994 -181.2778015 378.5376892
1395.8848877 -181.7281189 378.7855835
1395.9005127 -182.5676422 379.1638794
1395.9221191 -183.3190308 379.5239563
1395.9202881 -183.7674255 379.9038391
1395.9492188 -184.5345917 380.2295227
1395.9703369 -185.4051971 380.6357422
1395.9565430 -186.1412354 381.0298157
1395.9819336 -186.5330353 381.4730225
1395.9683838 -187.3661804 381.8843689
1395.9812012 -188.1397247 382.3732910
1396.0167236 -188.5932007 382.8106689
1396.0332031 -189.3501740 383.3034668
1396.0366211 -190.1251526 383.7887878
1396.0460205 -190.5667267 384.3362732
1396.0625000 -191.3396301 384.9137573
1396.0682373 -192.1430359 385.4629822
1396.0974121 -192.9440002 386.0556335
1396.1030273 -193.3478851 386.6410217
1396.1204834 -194.1228180 387.2037048
1396.1240234 -194.9112549 387.8701172
1396.1607666 -195.3358765 388.4375000
1396.1752930 -196.1282196 389.0245361
1396.1931152 -196.9371490 389.6308899
1396.2307129 -197.7208252 390.2033691
1396.2008057 -198.1010590 390.8446655
1396.2543945 -198.9428558 391.5000916
1396.2628174 -199.6984711 392.0330200
1396.2752686 -200.2742920 392.6470642
1396.2802734 -201.1410370 393.2375488
1396.3067627 -201.5097351 393.8450623
1396.3348389 -202.2745819 394.5049133
1396.3489990 -203.0808563 395.0719910
1396.3468018 -203.4691315 395.6793518
1396.3664551 -204.2758331 396.2829590
1396.3785400 -205.0528412 396.8984680
1396.4050293 -205.5356903 397.4471130
1396.4367676 -206.2951050 398.0716248
1396.4354248 -207.0251770 398.6343079
1396.4805908 -207.4389038 399.2924500
1396.4655762 -208.2577362 399.9215088
1396.4959717 -209.0993347 400.5354919
1396.4989014 -209.8620300 401.1123657
1396.5206299 -210.2655487 401.7009888
1396.5317383 -211.0220337 402.2765503
1396.5346680 -211.8090973 402.8918457
1396.5460205 -212.2240753 403.5141907
1396.5748291 -213.0061035 404.1267395
1396.5762939 -213.8818207 404.7663879
1396.5800781 -214.6257935 405.2807922
1396.6026611 -215.0271301 405.9470520
1396.5948486 -215.8020782 406.5317383
1396.6065674 -216.5503235 407.0895386
1396.6180420 -217.0154724 407.6618347
1396.6256104 -217.7976685 408.2411194
1396.6319580 -218.6042480 408.8168030
1396.6331787 -219.0105743 409.2725220
1396.6473389 -219.7911987 409.8117371
1396.6464844 -220.6359100 410.3065491
1396.6666260 -221.0487976 410.7959290
1396.6773682 -221.7981415 411.2417297
1396.6817627 -222.5908966 411.6722107
1396.6903076 -223.3993073 412.1258545
1396.6776123 -223.7857513 412.4848938
1396.7005615 -224.6440125 412.8710022
1396.6927490 -225.4228210 413.2781677
1396.7056885 -225.8384247 413.6314087
1396.7008057 -226.6532745 413.9669189
1396.7304688 -227.4765472 414.2713928
1396.7272949 -227.8492584 414.5896606
1396.7299805 -228.6342010 414.8660889
1396.7269287 -229.4249725 415.1535950
1396.7353516 -230.3492279 415.4305115
1396.7559814 -230.7804260 415.7181396
1396.7497559 -231.5222321 415.9539185
1396.7501221 -232.3226318 416.1618347
1396.7696533 -232.7158356 416.3649292
1396.7478027 -233.5004578 416.5567627
1396.7489014 -234.3262482 416.7014465
1396.7407227 -234.8135681 416.8372803
1396.7159424 -235.5768433 417.0050964
1396.7624512 -236.3665466 417.1545410
1396.6561279 -237.1790009 417.2982483
1396.3554688 -237.6796417 417.4129639
1396.1485596 -238.3650970 417.5220642
1396.0180664 -239.1927032 417.6515503
1395.7276611 -239.5914917 417.6833496
1395.9206543 -240.4531403 417.7616577
1395.8024902 -241.2482452 417.7803955
1395.9300537 -241.7786560 417.8755493
1396.0208740 -242.5210266 417.9358521
1396.0194092 -243.3126373 417.9490051
1396.0791016 -244.1081390 417.9537659
1396.3005371 -244.5960236 417.9382935
1396.5524902 -245.4661713 417.9460449
1396.7250977 -246.2033691 417.9330444
1396.7250977 -246.6854553 417.8470459
1396.7476807 -247.5133362 417.8120422
1396.7504883 -248.3041840 417.7194519
1396.7489014 -248.7227478 417.6665649
1396.7559814 -249.5417786 417.6157837
1396.7521973 -250.3569336 417.5270081
1396.7637939 -250.7841339 417.4561157
1396.7663574 -251.6442719 417.3152161
1396.7559814 -252.4560089 417.1687622
1396.7618408 -253.3054047 417.0406799
1396.7487793 -253.7263184 416.9329224
1396.7602539 -254.5389404 416.7638550
1396.7363281 -255.3310547 416.6164856
1396.7510986 -255.8147888 416.3733215
1396.7318115 -256.6410828 416.1820068
1396.7220459 -257.4900208 415.9450684
1396.7143555 -257.9172363 415.7687378
1396.7257080 -258.7497253 415.5257568
1396.7719727 -259.4252014 415.2936401
1396.7653809 -260.1855774 414.9800110
1396.7188721 -261.0427856 414.7174683
1396.7025146 -261.4176331 414.4142456
1396.6967773 -262.2436218 414.1275024
1396.6853027 -263.1303406 413.8052979
1396.6849365 -263.9486084 413.4884644
1396.6567383 -264.3940735 413.1038208
1396.6419678 -265.2233582 412.6966248
1396.6325684 -266.0486450 412.2858276
1396.6221924 -266.4830017 411.8821716
1396.6300049 -267.3493347 411.4394836
1396.6000977 -268.1747437 411.0200195
1396.5812988 -268.6153564 410.5278320
1396.5744629 -269.4747925 410.0545044
1396.5539551 -270.2803650 409.5161743
1396.5579834 -270.7311096 408.9969788
1396.5332031 -271.6502380 408.4120178
1396.5314941 -272.4265137 407.8327332
1396.5052490 -272.9086914 407.2022400
1396.4677734 -273.6993103 406.5786133
1396.4503174 -274.5305786 405.8731079
1396.4273682 -275.4417419 405.1840210
1396.3933105 -275.8759766 404.4723206
1396.3853760 -276.7486877 403.7750244
1396.3677979 -277.5783997 403.0184326
1396.3472900 -278.0142517 402.3291931
1396.3366699 -278.9056396 401.6215820
1396.3253174 -279.7171631 400.9010925
1396.3212891 -280.1798706 400.1559143
1396.3034668 -281.0074768 399.4820557
1396.2954102 -281.8944397 398.7519836
1396.2928467 -282.7246094 398.0455933
1396.2705078 -283.1817627 397.2809143
1396.2368164 -284.0063477 396.6327820
1396.2416992 -284.8570557 395.9267273
1396.2249756 -285.3093567 395.2239990
1396.2044678 -286.2203674 394.4656982
1396.1802979 -287.0396729 393.7373047
1396.1887207 -287.4688110 393.0221252
1396.1614990 -288.3317566 392.2987976
1396.1550293 -289.2051392 391.5419922
1396.1497803 -290.0209045 390.7774048
1396.1253662 -290.5057068 390.0913086
1396.1269531 -291.3712158 389.3340454
1396.1070557 -292.1581116 388.6647034
1396.0781250 -292.6452026 387.9252625
1396.0583496 -293.4950562 387.2194824
1396.0416260 -294.3234558 386.4815063
1396.0205078 -295.2273865 385.8108826
1396.0148926 -295.6846313 385.1285706
1396.0025635 -296.4811096 384.5730896
1395.9808350 -297.3428345 384.0054016
1395.9753418 -297.7410889 383.4681396
1395.9653320 -298.6198730 382.9618835
1395.9481201 -299.4671936 382.4490356
1395.9504395 -299.8994446 381.9677429
1395.9206543 -300.7411194 381.5681763
1395.9174805 -301.5532532 381.1362610
1395.9169922 -302.0440979 380.7005005
1395.9075928 -302.8434143 380.3612061
1395.9080811 -303.6734619 380.0043640
1395.8823242 -304.4877625 379.6555481
1395.8818359 -304.9372253 379.3745117
1395.8559570 -305.7977600 379.1042175
1395.8686523 -306.6041565 378.7417908
1395.8652344 -307.0446777 378.4815369
1395.8570557 -307.8721008 378.2303467
1395.8624268 -308.6752930 377.9775696
1395.8588867 -309.1906128 377.7743530
1395.8585205 -309.9455261 377.5215454
1395.8438721 -310.7805176 377.3011169
1395.8306885 -311.1972961 377.1669006
1395.8100586 -312.0861816 376.9640198
1395.8002930 -312.9601135 376.7971497
1395.7929688 -313.7360229 376.6128845
1395.8068848 -314.1647949 376.5221863
1395.7866211 -314.9462280 376.4821472
1395.7972412 -315.7380981 376.4047241
1395.6926270 -316.2810364 376.2944336
1395.7741699 -316.9978027 376.4503784
1395.7224121 -317.8558655 376.5356750
1395.6815186 -318.2948608 376.3607788
1395.7371826 -319.0906677 376.3832397
1395.6806641 -319.8775330 376.2901001
1395.6486816 -320.3246460 376.2943726
1395.5673828 -321.1604309 376.1575317
1395.7202148 -321.9162903 377.2173157
1395.7551270 -322.7717285 376.6421509
1395.7199707 -323.1791382 376.4578247
1395.5814209 -324.0085144 376.1862488
1395.6396484 -324.8234863 376.1881104
1395.5572510 -325.3325195 376.2672729
1395.4334717 -326.0856323 376.1172485
1395.5760498 -326.8724976 376.2517395
1395.5035400 -327.2959595 376.3802185
1395.5494385 -328.1185913 376.5151062
1395.4918213 -329.0055237 376.5027466
1395.6043701 -329.7646484 376.7730408
1395.5960693 -330.1962891 376.8257141
1395.6113281 -330.9813232 376.9184875
1395.7061768 -331.7932129 376.9919128
1395.7789307 -332.3244934 377.1623230
1395.8027344 -333.0374756 377.3975220
1395.8133545 -333.8236084 377.5957947
1395.8249512 -334.2968750 377.8405457
1395.8338623 -335.0826416 378.0674744
1395.8444824 -335.9830627 378.2736511
1395.8482666 -336.7194824 378.5594482
1395.8487549 -337.1319275 378.8784180
1395.8824463 -337.8975525 379.2296753
1395.8681641 -338.6964417 379.4818726
1395.8870850 -339.2058105 379.8006287
1395.8933105 -339.9450989 380.1972656
1395.9072266 -340.7217712 380.5330200
1395.9246826 -341.1951904 380.9371643
1395.9265137 -341.9796143 381.3296814
1395.9228516 -342.7546387 381.7346802
1395.9465332 -343.2034912 382.1167297
1395.9458008 -343.9512024 382.5864868
1395.9418945 -344.7350464 383.0422974
1395.9559326 -345.5842896 383.5106812
1395.9478760 -345.9943542 384.0847168
1395.9498291 -346.7966003 384.5916748
1395.9810791 -347.5529480 385.1264954
1395.9824219 -348.0193787 385.6985779
1395.9816895 -348.8095093 386.2337952
1395.9986572 -349.5559998 386.8092041
1395.9960938 -349.9254761 387.4423218
1396.0046387 -350.7656860 388.0289612
1395.9902344 -351.5162659 388.5704651
1395.9926758 -352.3313599 389.1306458
1395.9970703 -352.7254333 389.7532349
1396.0032959 -353.5733948 390.3445435
1396.0072021 -354.4041748 390.9872131
1396.0124512 -354.7986755 391.6013794
1396.0047607 -355.5205383 392.1423645
1395.9914551 -356.2829590 392.7456360
1395.9951172 -356.6909790 393.3037415
1395.9810791 -357.4844971 393.8911438
1395.9870605 -358.2996216 394.5317383
1395.9619141 -358.7265320 395.1334534
1395.9829102 -359.4891357 395.7805176
1395.9597168 -360.2878723 396.3834839
1395.9509277 -361.0549011 396.8935852
1395.9537354 -361.5476074 397.4659119
1395.9477539 -362.2241516 398.0701599
1395.9527588 -363.0985718 398.6726074
1395.9395752 -363.4469604 399.3051147
1395.9362793 -364.2519836 399.9742126
1395.9270020 -365.0317688 400.5463257
1395.9002686 -365.4333801 401.1072083
1395.9101563 -366.2724915 401.7149353
1395.9030762 -367.0357971 402.2631836
1395.8767090 -367.4018860 402.8652954
1395.8649902 -368.1958313 403.4216003
1395.8289795 -369.0093994 403.2908020
];
plot3(X(:,1),X(:,2),X(:,3))
figure(2);
Y=[1396.9615479 -368.4909363 402.6506348
1396.1766357 -367.4660339 403.1353760
1396.2320557 -366.8731384 403.4559937
1396.2495117 -365.8495178 402.7019653
1396.2722168 -364.8211975 401.9244385
1396.2714844 -363.8149719 401.0842285
1396.3032227 -363.2824097 400.2905273
1396.3010254 -362.2720642 399.4886475
1396.3291016 -361.2253418 398.6900940
1396.3254395 -360.6532898 397.9025574
1396.3138428 -359.6426086 397.1124268
1396.3526611 -358.6003113 396.3292542
1396.3404541 -358.0921326 395.5360107
1396.3499756 -357.0747375 394.7863464
1396.3276367 -355.9900513 394.0140381
1396.3432617 -355.4484863 393.1762390
1396.3614502 -354.4881897 392.4254456
1396.3450928 -353.4348755 391.6573792
1396.3471680 -352.4187317 390.8948975
1396.3533936 -351.9003601 390.0875854
1396.3181152 -350.8664551 389.3510742
1396.3444824 -349.8717346 388.6127319
1396.3369141 -349.3073120 387.8766479
1396.3392334 -348.3218994 387.0984497
1396.3173828 -347.2721558 386.3768616
1396.2926025 -346.7055359 385.5921326
1396.2927246 -345.6395569 384.9239197
1396.2819824 -344.6979675 384.2592773
1396.2784424 -344.1720276 383.6002502
1396.2999268 -343.1204529 383.0081482
1396.2642822 -342.3505249 382.4109802
1396.2661133 -341.2592163 381.8413086
1396.2526855 -340.3015137 381.3897400
1396.2294922 -339.7516479 380.8716431
1396.2033691 -338.7152710 380.3716431
1396.2001953 -337.7052307 379.9620972
1396.1951904 -336.5902405 379.5572510
1396.1673584 -336.0964661 379.1408997
1396.1601563 -335.0735474 378.7628174
1396.1339111 -334.0688782 378.3978271
1396.1064453 -333.5097656 378.0644226
1396.1168213 -332.5276184 377.8116150
1396.1204834 -331.4499512 377.5405273
1396.0478516 -330.8896790 377.2709656
1395.8505859 -329.8823242 377.1567078
1395.7473145 -328.8444214 377.0629578
1395.8461914 -328.3031311 376.9445190
1395.6136475 -327.2531738 376.7801514
1395.7322998 -326.2081299 376.5211792
1395.7233887 -325.7026672 376.4318237
1395.8522949 -324.7019653 376.3249207
1395.7122803 -323.6701355 376.2304688
1395.6096191 -322.6014099 376.1913757
1395.9284668 -322.0295105 376.3231506
1395.8317871 -321.0326538 376.4310913
1395.8830566 -320.0299072 376.3978577
1395.9788818 -319.4392700 376.4644775
1395.9219971 -318.4604492 376.3625183
1395.8657227 -317.3709412 376.5183716
1396.0101318 -316.8225098 376.7257690
1396.0858154 -315.8009338 376.6966858
1396.0571289 -314.7565002 376.5343628
1396.0955811 -314.2359924 376.7672424
1396.0969238 -313.2039795 376.8312683
1396.1054688 -312.1461792 376.9407349
1396.1152344 -311.1201477 377.0994568
1396.1063232 -310.5394592 377.3595886
1396.0949707 -309.5095520 377.5353088
1396.1123047 -308.5084839 377.7919617
1396.1124268 -307.9670105 378.0427856
1396.1187744 -306.8557434 378.3752747
1396.1143799 -305.8731079 378.6853638
1396.1239014 -305.3141479 379.0825500
1396.1477051 -304.2528687 379.4721069
1396.1579590 -303.2424927 379.8845215
1396.1622314 -302.6126404 380.3190613
1396.1713867 -301.6080933 380.7431946
1396.1954346 -300.6037292 381.2279663
1396.2022705 -300.0591125 381.7257080
1396.2076416 -298.9998474 382.2335510
1396.2041016 -297.9633179 382.8010864
1396.2192383 -296.8777466 383.4426880
1396.2248535 -296.3807983 384.1136169
1396.2598877 -295.3518066 384.7822266
1396.2608643 -294.2732849 385.5110168
1396.2661133 -293.7178955 386.3203125
1396.2818604 -292.5896912 387.1328125
1396.3167725 -291.6352234 388.0092163
1396.3376465 -291.0864563 388.8689270
1396.3421631 -290.0210266 389.7585449
1396.4144287 -288.9891357 390.6468201
1396.4084473 -288.4408875 391.5506287
1396.4582520 -287.3109131 392.4962158
1396.4569092 -286.3353577 393.4029236
1396.4752197 -285.2805176 394.2328796
1396.4978027 -284.6971741 395.1166077
1396.5419922 -283.7027588 395.9840393
1396.5272217 -282.6139526 396.8471985
1396.5504150 -282.0390930 397.7460632
1396.5946045 -281.0221252 398.6052856
1396.5865479 -279.9519043 399.4721375
1396.6138916 -279.4193726 400.3470459
1396.6058350 -278.3878784 401.2007751
1396.6480713 -277.3118591 402.0639343
1396.6564941 -276.7935181 402.9320984
1396.6904297 -275.7077942 403.8204346
1396.6893311 -274.6668396 404.6730347
1396.7084961 -273.6328735 405.5574951
1396.7926025 -273.0383911 406.3745117
1396.7633057 -272.0012207 407.2282715
1396.7753906 -270.9997253 407.9685669
1396.7844238 -270.4210815 408.6908875
1396.8051758 -269.3744812 409.3791504
1396.8032227 -268.3510742 410.0579529
1396.8298340 -267.7533875 410.6873169
1396.8388672 -266.7744751 411.2373352
1396.9249268 -265.7354126 411.8094482
1396.8612061 -264.9479980 412.3655090
1396.8643799 -263.8546448 412.8769531
1396.8922119 -263.3003235 413.3620911
1396.8859863 -262.2341614 413.8103333
1396.8995361 -261.2459717 414.2305908
1396.9002686 -260.6870422 414.6112366
1396.9027100 -259.6474609 414.9843445
1396.8983154 -258.6145935 415.3153381
1396.9060059 -258.0366821 415.6632996
1396.9167480 -257.0233765 415.9905701
1396.9270020 -255.9497070 416.2875061
1396.9384766 -255.4289703 416.5152283
1396.9284668 -254.4026642 416.7697754
1396.9398193 -253.3488312 417.0140076
1396.9372559 -252.3090210 417.1586609
1396.9360352 -251.7813416 417.3121338
1396.9245605 -250.7491302 417.4800415
1396.9274902 -249.6820679 417.6402283
1396.9173584 -249.1691895 417.7519226
1396.9173584 -248.0841217 417.8648376
1397.0024414 -247.0954742 417.9529419
1396.9224854 -246.5540466 418.0076294
1396.8863525 -245.5030212 418.0852051
1396.8356934 -244.4720306 418.1027527
1396.1492920 -243.4035645 418.1250610
1395.8505859 -242.8486023 418.0636597
1395.8339844 -241.8713379 418.1218567
1396.4254150 -240.8238525 417.9871826
1394.7365723 -240.2765808 417.9638062
1395.3441162 -239.2211761 417.9181519
1394.9934082 -238.1279449 417.8380737
1395.7121582 -237.6534576 417.7495117
1396.1785889 -236.6438141 417.5585632
1396.9091797 -235.5906067 417.4591675
1396.9508057 -235.0631561 417.2497864
1396.9412842 -233.9870758 417.0398254
1396.9399414 -232.9673920 416.7957764
1396.9479980 -231.9718323 416.5621338
1396.9422607 -231.4145660 416.3165588
1396.9407959 -230.3968201 416.0614014
1396.9410400 -229.3761902 415.7617188
1396.9365234 -228.8070068 415.4259644
1396.9445801 -227.7950439 415.0806885
1396.9291992 -226.7829895 414.6877747
1396.9160156 -226.2096863 414.3090820
1396.9420166 -225.2023773 413.9027710
1396.9412842 -224.1364746 413.4591370
1396.9368896 -223.6005402 412.9989624
1396.9132080 -222.6125488 412.4996033
1396.9240723 -221.5583191 411.9790649
1396.9167480 -220.5535583 411.4104919
1396.9011230 -220.0191345 410.8175659
1396.9057617 -218.9858246 410.2154846
1396.8984375 -217.9827118 409.5674133
1396.8811035 -217.4246826 408.9314270
1396.8577881 -216.3984833 408.1795349
1396.8218994 -215.3903046 407.4227905
1396.8034668 -214.8076782 406.6958618
1396.8081055 -213.7652283 405.9507446
1396.7882080 -212.8273773 405.1823425
1396.7648926 -212.2568054 404.3973083
1396.7489014 -211.2338867 403.6749268
1396.7421875 -210.2148285 402.8522949
1396.7286377 -209.1667938 402.1028137
1396.6926270 -208.6777802 401.3000488
1396.7034912 -207.6789703 400.5803528
1396.6680908 -206.6163940 399.7665405
1396.6568604 -206.0916901 398.9595642
1396.6601563 -204.9940338 398.2237244
1396.6287842 -204.0163879 397.4333496
1396.6020508 -203.5086823 396.6299744
1396.6157227 -202.4883423 395.8527832
1396.5852051 -201.4763336 395.0735168
1396.5725098 -200.9136200 394.2879944
1396.5637207 -199.8395844 393.5729065
1396.5538330 -198.8540344 392.7391052
1396.5518799 -197.8406677 391.9664001
1396.5093994 -197.3321381 391.1782837
1396.4938965 -196.3240051 390.4245911
1396.4794922 -195.2238464 389.6259155
1396.4615479 -194.6592102 388.8141174
1396.4411621 -193.7196960 388.0257874
1396.4194336 -192.6903992 387.2453308
1396.3934326 -192.1652527 386.5023499
1396.3811035 -191.1446686 385.7614746
1396.3614502 -190.0892334 385.0386047
1396.3402100 -189.5852966 384.3479309
1396.3149414 -188.2787476 383.6138611
1396.3165283 -187.7664337 382.9737854
1396.2844238 -186.7244415 382.3768921
1396.2863770 -185.6856842 381.7796631
1396.2548828 -184.7058716 381.2469482
1396.2564697 -184.1788025 380.7473145
1396.2426758 -183.1338959 380.2757568
1396.2226563 -182.0954590 379.7256470
1396.2088623 -181.5239868 379.3181152
1396.2088623 -180.4682007 378.9187622
1396.2048340 -179.5115356 378.5579529
1396.2039795 -178.9709778 378.1710510
1396.1918945 -177.9211426 377.8458862
1396.1733398 -176.8831635 377.5419617
1396.1636963 -176.3552246 377.2608337
1396.1142578 -175.2546692 376.9999695
1396.0844727 -174.3153992 376.9505615
1396.0611572 -173.2776947 376.9606934
1396.0626221 -172.6984406 376.5651550
1395.9997559 -171.6742554 376.7748413
1395.9813232 -170.5916748 376.3530579
1395.8566895 -170.1024780 376.2385559
1395.9569092 -169.1019135 376.0289001
1396.0024414 -168.0513458 375.8439636
1395.9278564 -167.5211639 375.7784729
1395.9294434 -166.4354553 375.8527222
1395.9559326 -165.4352722 375.7409668
1396.0532227 -164.8963776 375.6492004
1396.0433350 -163.8581390 375.6081238
1396.0307617 -162.8402100 375.4504395
1396.0299072 -162.3075256 375.4969482
1396.0294189 -161.1857147 375.5783997
1396.0344238 -160.2201691 375.6110840
1396.0407715 -159.1753998 375.7519226
1396.0449219 -158.5967255 375.8562927
1396.0491943 -157.5922699 376.0270081
1396.0567627 -156.5492096 376.1760254
1396.0640869 -155.9797363 376.3217163
1396.0822754 -154.9555359 376.5393982
1396.0803223 -153.9183502 376.7732849
1396.0822754 -153.3802490 377.0523987
1396.0863037 -152.3103485 377.3106384
1396.0938721 -151.2793884 377.5734558
1396.0909424 -150.2715759 377.8680725
1396.0820313 -149.7213745 378.1956482
1396.0795898 -148.6894836 378.5514832
1396.0966797 -147.6285706 378.9106140
1396.0872803 -147.0788116 379.2744446
1396.0991211 -146.0517273 379.7038269
1396.1116943 -144.9919434 380.1716003
1396.1113281 -144.4575043 380.6317749
1396.1356201 -143.4139404 381.1289978
1396.1374512 -142.3826141 381.6647034
1396.1127930 -141.7408142 382.2459717
1396.1406250 -140.7999725 382.8391724
1396.1434326 -139.7569275 383.4897156
1396.1530762 -139.1738434 384.2088013
1396.1633301 -138.1140289 384.9928284
1396.1632080 -137.0626526 385.7540588
1396.1696777 -136.0446625 386.6069336
1396.2050781 -135.4671173 387.4511414
1396.2088623 -134.4536896 388.3033142
1396.2312012 -133.3929443 389.1940613
1396.2546387 -132.8481598 390.1266785
1396.2535400 -131.7018280 390.9839478
1396.2878418 -130.7556915 391.9306335
1396.3088379 -130.1987305 392.8321228
1396.3353271 -129.1453705 393.6896667
1396.3250732 -128.1058197 394.5477600
1396.3824463 -127.5509567 395.4433289
1396.3579102 -126.4597702 396.3525696
1396.4083252 -125.4149780 397.2427368
1396.4144287 -124.8959427 398.0604248
1396.4194336 -123.8217316 398.8645935
1396.4187012 -122.7972488 399.7229614
1396.4470215 -121.7329330 400.5957642
1396.4530029 -121.1965027 401.4453430
1396.4642334 -120.1514359 402.3382568
1396.4986572 -119.0774231 403.2092285
1396.5054932 -118.5549469 404.0756531
1396.5334473 -117.4730377 404.9212952
1396.5560303 -116.4265823 405.6879578
1396.5601807 -115.8855515 406.5153503
1396.5904541 -114.8196106 407.3630981
1396.6014404 -113.7898407 408.1140442
1396.6066895 -113.2547073 408.8225098
1396.6187744 -112.2001038 409.5042419
1396.6223145 -111.4334335 410.1334839
1396.6523438 -110.3435059 410.7763367
1396.6450195 -109.3208694 411.3526611
1396.6763916 -108.7627792 411.8906860
1396.6887207 -107.6884384 412.4310608
1396.6872559 -106.6242599 412.8905334
1396.6983643 -106.1370087 413.3498535
1396.7161865 -105.0670853 413.8029785
1396.7366943 -104.0397873 414.2324829
1396.7211914 -103.4977646 414.6160889
1396.7414551 -102.3921280 415.0233154
1396.7229004 -101.4454803 415.3379517
1396.7579346 -100.3851547 415.7000427
1396.7612305 -99.8115311 415.9807434
1396.7786865 -98.7656326 416.2467346
1396.7778320 -97.7084274 416.5084534
1396.7578125 -97.1511917 416.7432556
1396.7517090 -96.1724625 416.9536743
1396.7645264 -95.1480026 417.1336060
1396.7614746 -94.5690155 417.3014832
1396.7419434 -93.5371094 417.4533691
1396.7561035 -92.4671936 417.5440369
1396.7539063 -91.9289932 417.6557007
1396.7562256 -90.9277191 417.7254944
1396.7452393 -89.8899765 417.8034363
1396.7491455 -88.8610229 417.8388367
1396.7432861 -88.3172379 417.8905029
1396.7453613 -87.2502823 417.9246521
1396.7253418 -86.2374725 417.9203186
1396.7324219 -85.6730270 417.8926697
1396.7166748 -84.6858826 417.8448181
1396.7099609 -83.6493378 417.7663879
1396.6976318 -83.0122147 417.7032776
1396.6895752 -82.0510864 417.5736084
1396.6818848 -80.9947128 417.4766235
1396.6784668 -80.4851456 417.3096924
1396.6866455 -79.4503326 417.1938477
1396.6599121 -78.3978348 417.0020142
1396.6579590 -77.8333435 416.8016357
1396.6649170 -76.8329468 416.5695190
1396.7298584 -75.8077393 416.3493958
1396.6527100 -74.7616043 416.0750122
1396.7045898 -74.2465363 415.8282471
1396.6186523 -73.1731033 415.5346069
1396.6009521 -72.1706467 415.2355957
1396.5965576 -71.6271973 414.8876343
1396.6030273 -70.5907974 414.5179749
1396.5799561 -69.5836487 414.1317444
1396.5772705 -69.0560455 413.7299805
1396.5937500 -67.9556656 413.3032227
1396.5725098 -66.9925308 412.8394775
1396.5393066 -65.9506607 412.3378601
1396.5291748 -65.4027252 411.8280945
1396.5029297 -64.3620300 411.3052979
1396.4956055 -63.3052177 410.7120361
1396.4879150 -62.7936020 410.1124878
1396.4774170 -61.8327599 409.4617615
1396.4427490 -60.7672005 408.8240356
1396.4426270 -60.2484436 408.1088562
1396.4235840 -59.2149124 407.3724060
1396.3765869 -58.1632881 406.6037598
1396.3422852 -57.6719818 405.8698120
1396.3470459 -56.6398239 405.1138916
1396.3303223 -55.6216469 404.3905029
1396.3095703 -55.0957756 403.6320190
1396.2719727 -53.9781227 402.8596802
1396.2843018 -53.0581665 402.0939026
1396.2491455 -52.4980850 401.2867432
1396.2283936 -51.4934273 400.5150757
1396.1873779 -50.4437256 399.7606506
1396.1759033 -49.3747711 398.9620972
1396.1791992 -48.8564606 398.2246094
1396.1557617 -47.8926811 397.4330750
1396.1225586 -46.8470764 396.6981506
1396.0970459 -46.3232727 395.9253845
1396.0877686 -45.3175774 395.1674805
1396.0667725 -44.2018051 394.4079285
1396.0457764 -43.6902618 393.6144714
1396.0141602 -42.7128143 392.8325806
1396.0002441 -41.7161331 392.0858765
1395.9732666 -41.1802521 391.3351440
1395.9566650 -40.1338730 390.5443115
1395.9367676 -39.0957184 389.8675232
1395.9055176 -38.5801773 389.1297302
1395.9239502 -37.5205879 388.3370056
1395.8851318 -36.5287857 387.6129761
1395.8701172 -35.5144081 386.8974609
1395.8455811 -34.9459038 386.1875305
1395.8298340 -34.1911964 385.4798279
1395.8289795 -33.1644669 384.7845764
1395.8046875 -32.1251831 384.1865540
1395.8099365 -31.6231308 383.5782471
1395.7895508 -30.5986462 383.0309143
1395.7884521 -29.5359535 382.5466309
1395.7722168 -28.5275307 382.0218811
1395.7734375 -27.9890537 381.5285034
1395.7430420 -26.9429359 381.1038208
1395.7523193 -25.9425316 380.6518250
1395.7464600 -25.3781757 380.2281189
1395.7203369 -24.3180008 379.8435059
1395.7246094 -23.3259239 379.5097046
1395.7126465 -22.2728329 379.1588745
1395.7080078 -21.7603722 378.8706665
1395.6346436 -20.7521572 378.7599182
1395.6007080 -19.6351070 378.5004272
1395.5789795 -19.1365719 378.3530579
1395.4678955 -18.1105194 378.1933594
1395.4047852 -17.0714989 377.9533081
1395.5677490 -16.5385742 377.7830811
1395.4552002 -15.4951982 377.6665039
1395.4038086 -14.5145798 377.4329529
1395.3797607 -13.9778261 377.3755798
1395.3668213 -12.9026899 377.0773315
1395.3846436 -11.8934097 376.8960571
1395.5546875 -11.3462133 376.8372498
1395.6313477 -10.2358522 376.7380066
1395.6251221 -9.3083134 376.7341919
1395.6049805 -8.2371426 376.7763062
1395.6042480 -7.6783729 376.7815857
1395.6169434 -6.6364059 376.7939758
1395.6083984 -5.6001291 376.8580627
1395.6239014 -5.0485735 376.9323730
1395.6226807 -4.0878806 377.0498657
1395.6107178 -3.0292113 377.1374817
1395.6192627 -2.4651198 377.2906189
1395.6402588 -1.4288174 377.4172668
1395.6245117 -0.3367632 377.6193237
1395.6350098 0.1509369 377.8051147
1395.6447754 1.1789815 378.0110779
1395.6639404 2.2380357 378.3001709
1395.6613770 3.2703581 378.5302429
1395.6754150 3.8555298 378.7674866
1395.6622314 4.8584957 379.1178894
1395.6759033 5.9182901 379.4295349
1395.6968994 6.4386225 379.7991943
1395.6940918 7.4819384 380.1562195
1395.7199707 8.5829859 380.5793457
1395.7393799 9.1420326 380.9946289
1395.7454834 10.1571302 381.4298706
1395.7641602 11.1443729 381.9102783
1395.7635498 11.7206526 382.3949280
1395.7867432 12.7659473 382.9517517
1395.7829590 13.8151455 383.5643616
1395.8016357 14.8441668 384.2014465
1395.8068848 15.4301071 384.8908386
1395.8298340 16.4443913 385.5668640
1395.8510742 17.4756279 386.3063354
1395.8619385 18.0566463 387.0521545
1395.8671875 19.1753635 387.8822632
1395.8872070 20.1257019 388.7624207
1395.9130859 20.7249146 389.6180420
1395.9494629 21.7395420 390.5269775
1395.9700928 22.7653999 391.3789978
1395.9752197 23.3374882 392.2816772
1395.9996338 24.4068851 393.1313782
1396.0236816 25.4476910 394.0189819
1396.0329590 26.4997330 394.9041138
1396.0670166 27.0487499 395.7632141
1396.0864258 28.0649910 396.6507263
1396.1036377 29.2022285 397.5197754
1396.1291504 29.6715584 398.3790283
1396.1361084 30.7213249 399.2481079
1396.1553955 31.7964687 400.1397095
1396.2001953 32.3423615 401.0192261
1396.1890869 33.4551926 401.8793945
1396.2191162 34.4231949 402.7207031
1396.2215576 34.9863968 403.6296387
1396.2476807 36.0493240 404.5020447
1396.2708740 37.0916939 405.3369751
1396.2950439 38.1868515 406.1807251
1396.3250732 38.7535133 407.0162964
1396.3392334 39.7290459 407.8330688
1396.3684082 40.8004341 408.6667175
1396.3950195 41.3372421 409.4938049
1396.3905029 42.3759346 410.2640991
1396.4067383 43.2462387 410.9586792
1396.4107666 44.2361069 411.6708374
1396.4521484 44.7707787 412.3180847
1396.4499512 45.8299522 412.9739685
1396.4523926 46.8754044 413.5550842
1396.4647217 47.9178429 414.1325684
1396.4798584 48.4943504 414.6730957
1396.4916992 49.4794998 415.1653748
1396.4913330 50.5416031 415.6340332
1396.5087891 51.0825081 416.0988464
1396.4830322 52.1413879 416.5261841
1396.5095215 53.2179184 416.9355469
1396.5111084 53.7597694 417.3285522
1396.5114746 54.7385216 417.6617126
1396.5324707 55.7730598 417.9908142
1396.5299072 56.3287735 418.2860718
1396.5480957 57.4021645 418.5656128
1396.5507813 58.4905548 418.8311768
1396.5603027 59.4640961 419.0954590
1396.5632324 59.9934044 419.3269043
1396.5828857 61.0110168 419.5349121
1396.5729980 62.0789719 419.7051392
1396.5618896 62.6434937 419.8750610
1396.5831299 63.6875877 420.0164795
1396.5744629 64.6937637 420.1572571
1396.5942383 65.2291946 420.2671509
1396.3988037 66.2973328 420.4646606
1396.1083984 67.3083496 420.4349976
1395.9721680 67.9605942 420.2810059
1396.1524658 68.9143524 420.5289001
1396.3829346 69.9303513 420.5586853
1395.9809570 70.9564896 420.5641479
1396.0361328 71.4964523 420.4932556
1396.1466064 72.5649796 420.2708130
1396.1486816 73.5930634 420.1119080
1396.1328125 74.1352081 420.3309937
1396.5119629 75.1371231 420.1529236
1396.6054688 76.1819763 419.8776550
1396.5781250 76.7064514 419.7109680
1396.5792236 77.7889175 419.5422363
1396.5814209 78.7761307 419.3313599
1396.5833740 79.3555908 419.1427307
1396.5675049 80.3668289 418.9005127
1396.5739746 81.3663559 418.6447754
1396.5524902 81.9372330 418.3854980
1396.5493164 83.0154800 418.0710144
1396.5328369 84.0017624 417.7668457
1396.5294189 85.0422211 417.4374695
1396.5317383 85.5765381 417.0798035
1396.5294189 86.5667191 416.6823120
1396.5156250 87.6685867 416.2818604
1396.5002441 88.1348877 415.8482971
1396.4908447 89.1872253 415.3530884
1396.4710693 90.2415161 414.8864136
1396.4774170 90.7409592 414.3592224
1396.4654541 91.8073196 413.8049011
1396.4627686 92.8136826 413.2445679
1396.4301758 93.8153000 412.6060486
1396.4178467 94.3631134 411.9748230
1396.3999023 95.3817368 411.3128357
1396.3957520 96.4091492 410.5978394
1396.3685303 96.9604111 409.9037170
1396.3409424 97.9570236 409.1801147
1396.3508301 98.9896469 408.4218140
1396.3205566 99.5352707 407.6498718
1396.2950439 100.5727997 406.8739014
1396.2916260 101.6198273 406.1542358
1396.2617188 102.1463776 405.3647156
1396.2325439 103.1293182 404.5853271
1396.2419434 104.1552582 403.8177795
1396.1995850 104.6930389 403.0379944
1396.1906738 105.7490997 402.2435608
1396.1614990 106.8094330 401.4806213
1396.1654053 107.7356262 400.7198486
1396.1274414 108.2779846 399.9814453
1396.0904541 109.2975769 399.1810913
1396.0928955 110.3559341 398.3815918
1396.0620117 110.8665619 397.6054993
1396.0478516 111.9231186 396.8756104
1396.0230713 112.9217758 396.1032715
1396.0017090 113.4373093 395.3405762
1395.9906006 114.4859924 394.5628052
1395.9793701 115.5145874 393.8191528
1395.9555664 116.0646973 393.0395203
1395.9284668 117.0624008 392.3315735
1395.9317627 118.0507736 391.5567017
1395.9093018 118.6215439 390.7932739
1395.8936768 119.8854980 390.0501099
1395.8826904 120.4118881 389.2941589
1395.8616943 121.5099182 388.5788574
1395.8410645 122.4526062 387.8841553
1395.8187256 122.9800186 387.2356567
1395.8110352 124.0358582 386.6184692
1395.8194580 125.0435486 385.9961243
1395.7947998 126.1252060 385.4076233
1395.7779541 126.6303482 384.8599243
1395.7630615 127.6340027 384.3170166
1395.7553711 128.6795197 383.8423157
1395.7441406 129.1868439 383.3808289
1395.7385254 130.2425079 382.9019470
1395.7148438 131.2951202 382.4942017
1395.7244873 131.8061523 382.0617676
1395.7272949 132.8380890 381.6960449
1395.7016602 133.8493042 381.3836060
1395.6889648 134.3801422 381.0531921
1395.6876221 135.4411163 380.7456055
1395.6768799 136.4806976 380.4786682
1395.6740723 136.9896545 380.2287903
1395.6727295 138.0255280 380.2447815
1395.6470947 139.0351563 380.1906128
1395.6223145 140.1413879 379.9152222
1395.6158447 140.7021332 379.7097168
1395.5987549 141.6668854 379.4600525
1395.5677490 142.7337799 379.5958862
1395.4626465 143.2558594 379.5585938
1395.6038818 144.2565002 379.3558655
1395.6068115 145.3664398 379.2905579
1395.4199219 145.9078522 379.0984802
1395.6323242 146.8937073 379.1680603
1395.4680176 147.9222870 379.1126709
1395.4442139 148.7072601 378.9624329
1395.6256104 149.5148773 379.1000366
1395.6447754 150.5594788 379.0890808
1395.6008301 151.5522919 378.9862366
1395.6574707 152.1303864 379.0271301
1395.6608887 153.1524963 379.1123047
1395.6577148 154.1677246 379.2377625
1395.6508789 154.7841949 379.3974609
1395.6542969 155.7357178 379.5363770
1395.6850586 156.7869110 379.6781311
1395.6739502 157.3833008 379.9188232
1395.6871338 158.3862305 380.1033936
1395.6915283 159.4593658 380.4036255
1395.7026367 160.0035248 380.6430969
1395.7066650 160.9935608 380.9273987
1395.7100830 162.0593262 381.2221985
1395.7122803 162.5858612 381.5360718
1395.7412109 163.6396179 381.9491882
1395.7263184 164.6777954 382.3271790
1395.7370605 165.6941223 382.7489929
1395.7465820 166.2796936 383.1741333
1395.7741699 167.3166809 383.6491699
1395.7696533 168.3479462 384.1853638
1395.7790527 168.9347687 384.7197876
1395.8103027 170.0292969 385.2758789
1395.8150635 170.9611359 385.8581848
1395.8000488 171.5565491 386.5395203
1395.8452148 172.5877533 387.1737061
1395.8449707 173.6401520 387.8926086
1395.8632813 174.2556610 388.7093811
1395.8756104 175.2564392 389.4702454
1395.9116211 176.2634277 390.2897034
1395.9259033 177.3063202 391.1224060
1395.9530029 177.9004669 392.0555420
1395.9515381 178.9324036 392.9054260
1395.9737549 180.0683899 393.7791443
1396.0047607 180.5237885 394.6394958
1396.0262451 181.5623779 395.5566101
1396.0263672 182.6312561 396.3897095
1396.0361328 183.1973877 397.2781372
1396.0781250 184.2629242 398.1522522
1396.1009521 185.2907410 399.0409851
1396.1137695 185.8694458 399.9043884
1396.1303711 186.8965302 400.7773132
1396.1425781 187.9155579 401.6754456
1396.1751709 188.4833221 402.5883179
1396.1761475 189.6307831 403.4516296
1396.1981201 190.5840759 404.3185425
1396.2160645 191.6460114 405.1139221
1396.2331543 192.1771088 405.9644470
1396.2524414 193.2152710 406.7983704
1396.2706299 194.3467712 407.6513367
1396.2813721 194.9100342 408.5134583
1396.3168945 195.9013672 409.3732605
1396.3298340 196.6919250 410.2285767
1396.3405762 197.7204742 411.0137329
1396.3597412 198.8547516 411.7944336
1396.3767090 199.3686218 412.5592346
1396.4101563 200.4164581 413.3327637
1396.4056396 201.4579926 413.9768372
1396.4141846 201.9861145 414.6200256
1396.4302979 202.9833069 415.2463989
1396.4459229 204.1051636 415.8003540
1396.4492188 204.6733704 416.3819275
1396.4604492 205.6907196 416.9425659
1396.4749756 206.6915588 417.4581604
1396.4780273 207.2735901 417.8841248
1396.5229492 208.2934570 418.3230591
1396.4510498 209.3896179 418.7516785
1396.5351563 209.8932495 419.1529541
1396.5375977 210.9250793 419.5425720
1396.5429688 212.0001221 419.8643188
1396.5626221 213.0191956 420.1962280
1396.5721436 213.5830078 420.5061951
1396.5531006 214.6820679 420.7582092
1396.5784912 215.6208954 420.9818726
1396.5753174 216.1764374 421.2263794
1396.5611572 217.2241516 421.4277039
1396.5878906 218.2647400 421.6037292
1396.5954590 218.8182831 421.7730408
1396.5864258 219.8294983 421.9190063
1396.5938721 220.8564301 422.0388489
1396.6121826 221.4088745 422.1425781
1396.5983887 222.4599915 422.2330017
1396.6724854 223.5482025 422.3146362
1396.5954590 224.0556641 422.3612671
1396.4923096 225.0607605 422.4046936
1396.5953369 226.0909119 422.4324341
1396.5839844 227.1470032 422.4367371
1396.5688477 227.6824493 422.4163208
1396.5800781 228.7288666 422.3875427
1396.5745850 229.7223816 422.3511047
1396.5927734 230.2989197 422.3051758
1396.5665283 231.3276367 422.2283020
1396.5745850 232.3512115 422.1455383
1396.5621338 232.9629517 422.0461426
1396.5736084 233.9613037 421.8901367
1396.5573730 234.9514771 421.7686462
1396.5480957 235.9767303 421.6130371
1396.5603027 236.5637360 421.4080811
1396.5301514 237.5715942 421.2227173
1396.4786377 238.6374207 420.9699402
1396.5207520 239.1331482 420.7308350
1396.4970703 240.1651917 420.4732666
1396.5056152 241.1835175 420.1969910
1396.4854736 241.7533417 419.8736572
1396.4738770 242.8237457 419.5329590
1396.4870605 243.8023834 419.1985168
1396.4628906 244.3218689 418.7886047
1396.4456787 245.3662720 418.3637085
1396.4586182 246.3794861 417.9190674
1396.4156494 246.9253693 417.4533081
1396.4105225 248.0389557 416.9582825
1396.4035645 249.0055542 416.4276733
1396.4060059 250.0089722 415.8644104
1396.3793945 250.5287018 415.2836609
1396.3936768 251.5595703 414.6313782
1396.3387451 252.6645813 413.9481506
1396.3302002 253.2135315 413.2750854
1396.3339844 254.1821289 412.5592346
1396.3260498 255.1745300 411.8396301
1396.3004150 255.7265778 411.1127014
1396.2988281 256.7399902 410.3712158
1396.2825928 257.7781677 409.6206360
1396.2661133 258.7923584 408.8405762
1396.2307129 259.3175659 408.0317078
1396.2182617 260.3289185 407.2658081
1396.2233887 261.3554993 406.4614563
1396.1823730 261.9643250 405.7029724
1396.1546631 262.9518433 404.9048462
1396.1527100 263.9471130 404.1120605
1396.1221924 264.4828186 403.3375244
1396.1051025 265.4785156 402.5664673
1396.0771484 266.4992065 401.8163147
1396.0603027 267.0718689 401.0090332
1396.0562744 268.0929565 400.2450867
1396.0244141 269.1004639 399.4339294
1396.0023193 269.6679382 398.6413269
1395.9932861 270.6642151 397.8822327
1395.9653320 271.6878967 397.0749207
1395.9409180 272.6959534 396.3461304
1395.9163818 273.4720154 395.5418701
1395.8990479 274.0361328 394.7798462
1395.8739014 275.0626526 393.9849854
1395.8566895 276.0544128 393.1567688
1395.8542480 277.1417236 392.4270020
1395.8345947 277.6146851 391.7162476
1395.8295898 278.6206360 390.9281006
1395.8048096 279.6842651 390.2320862
1395.7814941 280.1992493 389.5270996
1395.7662354 281.2909241 388.8168640
1395.7647705 282.2512512 388.1435852
1395.7495117 282.7730103 387.5295410
1395.7117920 283.8119507 386.9452820
1395.6994629 284.8316040 386.3416443
1395.7160645 285.9103394 385.8370667
1395.7001953 286.4542236 385.3069763
1395.6951904 287.4438171 384.8528137
1395.6816406 288.4822388 384.3911438
1395.6524658 289.0033875 384.0150452
1395.6629639 290.0394592 383.6250305
1395.6513672 291.1401062 383.2564087
1395.6389160 291.6810608 382.9037170
1395.6474609 292.6319580 382.6168518
1395.6223145 293.6486511 382.3210144
1395.6097412 294.6916504 382.0512695
1395.6051025 295.2414856 381.7953491
1395.6047363 296.2930603 381.5333862
1395.6099854 297.2866516 381.2991638
1395.6066895 297.8527832 381.1478271
1395.5976563 298.8605347 380.9841614
1395.5892334 299.8937073 380.8354797
1395.5400391 300.5208740 380.9785461
1395.5565186 301.5318909 380.7962036
1395.5803223 302.5345764 380.8790588
1395.6097412 303.0518494 380.7229614
1395.6069336 304.0959167 380.6292114
1395.5732422 305.1307678 380.9103394
1395.5844727 305.6988525 380.6068420
1395.5531006 306.7254028 380.9561768
1395.6274414 307.7334595 380.8973999
1395.4687500 308.7651672 380.9143982
1395.5551758 309.2962952 380.7962341
1395.6020508 310.3601685 380.6990356
1395.6185303 311.3858643 380.7929077
1395.6361084 311.9563599 380.9368286
1395.6403809 312.9918213 381.0781250
1395.6500244 313.9835205 381.2632446
1395.6361084 314.5671387 381.4353638
1395.6643066 315.6453857 381.6070862
1395.6784668 316.6173096 381.8571472
1395.6950684 317.1920776 382.0565491
1395.6881104 318.2234497 382.3706970
1395.7021484 319.2453918 382.6591492
1395.7208252 320.3069763 382.9760437
1395.7221680 320.9057922 383.2956238
1395.7351074 321.8653564 383.6638184
1395.7409668 322.9393005 384.0790405
1395.7414551 323.4700317 384.4978943
1395.7615967 324.5268555 384.9474182
1395.7561035 325.5891724 385.4132996
1395.7712402 326.1085815 385.9252930
1395.8090820 327.1747131 386.4432068
1395.8065186 328.1995239 387.0289001
1395.8004150 328.7476196 387.6365967
1395.8128662 329.8349304 388.2921143
1395.8343506 330.8362427 388.9433289
1395.8255615 331.8723450 389.6964722
1395.8570557 332.4304199 390.5147400
1395.8752441 333.4718933 391.2955933
1395.8785400 334.5300293 392.1806335
1395.8947754 335.1203918 393.0487061
1395.9285889 336.1027527 393.9544678
1395.9415283 337.1792603 394.8296509
1395.9399414 337.7230225 395.7286377
1395.9686279 338.7866516 396.6378174
1395.9608154 339.8732300 397.5430603
1395.9914551 340.4347839 398.4609680
1396.0139160 341.4294739 399.3771057
1396.0135498 342.4878235 400.2936401
1396.0101318 343.0316162 401.1501465
1396.0378418 344.0932617 402.1030273
1396.0566406 345.1610107 402.9992676
1396.0704346 346.1893616 403.9034729
1396.0837402 346.7643738 404.8294983
1396.1156006 347.7946472 405.6569214
1396.1279297 348.8305969 406.5982666
1396.1412354 349.4133301 407.4934082
1396.1375732 350.7117615 408.4145813
1396.1879883 351.2433777 409.3606873
1396.1623535 352.2669067 410.1881104
1396.1905518 353.3417664 411.1189270
1396.1735840 353.8835754 411.9126587
1396.1894531 354.9687805 412.7848206
1396.1992188 355.9867554 413.6190796
1396.2095947 356.5775452 414.3565369
1396.2368164 357.5925293 415.0840149
1396.2124023 358.6197510 415.7885742
1396.1909180 359.1976929 416.4079895
1396.2598877 360.3147278 417.0419006
1396.2504883 361.2860107 417.6870422
1396.2360840 361.8243713 418.1955261
1396.2966309 362.8890686 418.7176514
1396.2431641 363.9092712 419.2495422
1396.2220459 364.9816895 419.7230225
1396.2268066 365.4966431 420.1588440
1396.2502441 366.5296021 420.5957947
1396.2514648 367.5903015 420.9969177
1396.2586670 368.1329956 421.3738708
1396.2990723 369.2481689 421.7343445
1396.2965088 370.2356873 422.0280457
1396.3026123 370.7635498 422.3401794
1396.3236084 371.8043213 422.5942383
1396.3216553 372.8720398 422.8670349
1396.3382568 373.8875732 423.1060791
1396.3438721 374.4570007 423.2841797
1396.3361816 375.4353027 423.4574585
1396.3723145 376.4849243 423.6331787
1396.3906250 377.0677185 423.7427673
1396.3874512 378.0882568 423.8870544
1396.4291992 379.1452637 423.9710693
1396.4223633 379.6928101 424.0533447
1396.4520264 380.6873779 424.1280518
1396.4515381 381.7465515 424.1946106
1396.1390381 382.2882996 424.3760986
1396.0445557 383.3303833 424.4777222
1396.2646484 384.3660889 424.4696350
1396.2523193 384.9013977 424.3099670
1396.3297119 385.9335022 424.4722595
1396.2642822 386.9566345 424.3558350
1395.7203369 388.0273743 424.4642639
1396.2956543 388.5764160 424.5425415
1396.2966309 389.6323853 424.3675842
1396.1186523 390.6142883 424.1776733
1396.4517822 391.1287842 423.8898926
1396.4722900 392.1817932 423.6860657
1396.4665527 393.2141113 423.5269470
1396.4547119 393.7866821 423.3484192
1396.4589844 394.7969666 423.1533508
1396.4337158 395.8391113 422.8910522
1396.4359131 396.8394165 422.7056580
1396.4106445 397.3697510 422.4131165
1396.4197998 398.4364929 422.1339722
1396.4279785 399.4695740 421.8186035
1396.4252930 399.9869995 421.5069275
1396.4001465 401.0338440 421.1619873
1396.4317627 402.0249023 420.7963257
1396.4266357 402.5603027 420.4223022
1396.4272461 403.6671753 419.9740906
1396.4260254 404.6251221 419.5110474
1396.4163818 405.6778259 419.0352478
1396.4372559 406.2311401 418.5146790
1396.4365234 407.2452087 417.9983215
1396.4346924 408.2879944 417.4410706
1396.4033203 408.8520508 416.8621826
1396.4172363 409.8061523 416.1779175
1396.3977051 410.8604126 415.5252686
1396.4139404 411.3779907 414.8418884
1396.4329834 412.4177856 414.1443481
1396.4562988 413.4790344 413.4417114
1396.4539795 413.9782715 412.7272644
1396.4532471 414.9889221 412.0281982
1396.4489746 416.0406799 411.2762146
1396.4566650 416.5611572 410.5295410
1396.4523926 417.6033325 409.7671509
1396.4388428 418.6050720 409.0714417
1396.4526367 419.6092529 408.3698730
1396.4399414 420.1587830 407.6086121
1396.4520264 421.1723938 406.8693237
1396.4442139 422.2100525 406.1079407
1396.4522705 422.7683716 405.3096008
1396.4514160 423.7373352 404.6223755
1396.4201660 424.7815552 403.9208374
1396.4180908 425.2926636 403.1702576
1396.4477539 426.3329163 402.4183960
1396.4255371 427.1223145 401.6737061
1396.4394531 428.1982117 400.8980713
1396.4493408 429.1615906 400.1548462
1396.4348145 429.6885986 399.4096069
1396.4602051 430.7117004 398.7404175
1396.4431152 431.7353210 397.9651794
1396.4694824 432.2932434 397.2361755
1396.4520264 433.3041077 396.4584045
1396.4769287 434.3381958 395.7245483
1396.4744873 434.8572083 395.0466309
1396.4776611 435.9063721 394.3225403
1396.4838867 436.9539185 393.5946045
1396.5000000 437.9674988 392.9187622
1396.4908447 438.4681396 392.1283264
1396.5151367 439.5100098 391.4896851
1396.5119629 440.5123901 390.8558044
1396.5147705 441.0401001 390.3160400
1396.5222168 442.0959167 389.7073975
1396.5178223 443.0959473 389.1654358
1396.5332031 443.6703186 388.5694275
1396.5488281 444.6836853 388.0794067
1396.5504150 445.6860046 387.5768738
1396.5567627 446.2373657 387.1345825
1396.5599365 447.3279724 386.7213440
1396.5410156 448.2973633 386.3090210
1396.5552979 448.8133240 385.9417419
1396.5668945 449.8764648 385.5749817
1396.6102295 450.8905029 385.2749023
1396.5941162 451.9346313 384.9423218
1396.6121826 452.4610901 384.6838379
1396.6112061 453.4638672 384.4098816
1396.6273193 454.5270996 384.1823425
1396.6445313 455.0596008 384.0029297
1396.6589355 456.1033630 383.8043823
1396.6910400 457.1927490 383.7342529
1396.7141113 457.6463013 383.4912415
1396.7095947 458.6936340 383.3498535
1396.7069092 459.7546997 383.2318115
1396.7238770 460.2982178 383.1527710
1396.7413330 461.3941650 383.0630493
1396.7412109 462.3390198 383.0841980
1396.7639160 462.8652954 382.9754333
1396.7735596 463.9125366 383.0122986
1396.7843018 464.9303284 382.9169922
1396.7946777 466.0466003 382.8630371
1396.8024902 466.5488892 382.8353577
1396.8056641 467.5560608 382.8245850
1396.8195801 468.6108398 382.7856140
1396.8308105 469.1187744 382.7985535
1396.8476563 470.1600952 382.8073730
1396.8298340 471.2570801 382.7293091
1396.8627930 471.8338013 382.6744995
1396.8505859 472.8027039 382.6610718
1396.8934326 473.7983093 382.6602173
1396.8756104 474.3685303 382.6423950
1396.9007568 475.4023743 382.6294556
1396.9031982 476.4517212 382.5919800
1396.9218750 477.4715881 382.5893250
1396.9451904 478.0465088 382.6026001
1396.9761963 479.0608215 382.6200867
1396.9953613 480.2646484 382.6278687
1397.0465088 481.1899414 382.5682983
];
plot3(Y(:,1),Y(:,2),Y(:,3))
plot3(Y(:,1),Y(:,2),Y(:,3),'+')
%-- 2017/8/4/星期五 17:09 --%
Robot_Er6c
T = bot.fkine(Joint);
p = transl(T)
plot3(p(:,1),p(:,2),p(:,3),'*');
plot3(p(:,1),p(:,2),p(:,3));
plot3(p(:,1),p(:,2),p(:,3),'*');
bot.teach(T)
rtb_demo
rtbdemo
clf; tranimate(T)
T
T = bot.fkine(Joint);
clf; tranimate(T)
plot3(p(:,1),p(:,2),p(:,3),'*');
p = transl(T)
plot3(p(:,1),p(:,2),p(:,3),'*');
%-- 2017/8/10/星期四 17:25 --%
Robot_Er6c
bot.fkine(Joint)
T = transl(bot.fkine(Joint));
p = transl(T)
plot3(p(:,1),p(:,2),p(:,3),'*');
transl(T)
%-- 2017/8/15/星期二 9:36 --%
mex -setup
mex -setup C++
%-- 2017/8/16/星期三 9:52 --%
Robot_Er6c
T = bot.fkine(Joint);
p = transl(T)
plot3(p(:,1),p(:,2),p(:,3),'*');
%-- 2017/8/17/星期四 8:49 --%
Robot_Er6c
T = bot.fkine(Joint);
p = transl(T)
plot3(p(:,1),p(:,2),p(:,3),'*');
clf; tranimate(T)
T = bot.fkine(Joint);
p = transl(T)
plot3(p(:,1),p(:,2),p(:,3),'*');
T = bot.fkine(Joint);
p = transl(T)
plot3(p(:,1),p(:,2),p(:,3),'*');
T = bot.fkine(Joint);
p = transl(T)
plot3(p(:,1),p(:,2),p(:,3),'*');
clf; tranimate(T)
T = bot.fkine(Joint);
p = transl(T)
plot3(p(:,1),p(:,2),p(:,3),'*');
clf; tranimate(T)
T = bot.fkine(Joint);
p = transl(T);
plot3(p(:,1),p(:,2),p(:,3),'*');
T = bot.fkine(Joint);
p = transl(T);
plot3(p(:,1),p(:,2),p(:,3),'*');
T = bot.fkine(Joint);
p = transl(T);
plot3(p(:,1),p(:,2),p(:,3),'*');
T = bot.fkine(Joint);
p = transl(T);
plot3(p(:,1),p(:,2),p(:,3),'*');
T = bot.fkine(Joint);
p = transl(T);
plot3(p(:,1),p(:,2),p(:,3),'*');
T = bot.fkine(Joint);
p = transl(T);
plot3(p(:,1),p(:,2),p(:,3),'*');
clf; tranimate(T)
plot3(p(:,1),p(:,2),p(:,3),'*');
T = bot.fkine(Joint);
p = transl(T);
plot3(p(:,1),p(:,2),p(:,3),'*');
T = bot.fkine(Joint);
p = transl(T);
plot3(p(:,1),p(:,2),p(:,3),'*');
clf; tranimate(T)
T = bot.fkine(Joint);
p = transl(T);
plot3(p(:,1),p(:,2),p(:,3),'*');
T = bot.fkine(Joint);
p = transl(T);
plot3(p(:,1),p(:,2),p(:,3),'*');
Robot_Er6c
T = bot.fkine(Joint);
p = transl(T);
plot3(p(:,1),p(:,2),p(:,3),'*');
clf; tranimate(T)
plot3(p(:,1),p(:,2),p(:,3),'*');
T = bot.fkine(Joint);
p = transl(T);
plot3(p(:,1),p(:,2),p(:,3),'*');
T = bot.fkine(Joint);
p = transl(T);
plot3(p(:,1),p(:,2),p(:,3),'*');
T = bot.fkine(Joint);
p = transl(T);
plot3(p(:,1),p(:,2),p(:,3),'*');
T = bot.fkine(Joint);
p = transl(T);
plot3(p(:,1),p(:,2),p(:,3),'*');
plot(T_1,'DisplayName','T_1')
plot3(T_1(:,1),T_1(:,2),T_1(:,3),'*');
clf; tranimate(T)
%-- 2017/8/18/星期五 9:04 --%
plot3(p(:,1),p(:,2),p(:,3),'*');
acos(0.1)
acos(0.2)
acos(0.5)
acos(0.8)
acos(1.0)
acos(1.1)
Robot_Er6c
T = bot.fkine(Joint);
clf; tranimate(T)
%-- 2017/8/21/星期一 14:03 --%
Robot_Er6c
rtbdemo
%-- 2017/8/22/星期二 16:04 --%
Robot_Er6c
clf; tranimate(T)
plot3(T(:,1),T(:,2),T(:,3),'*');
clf; tranimate(T)
T = bot.fkine(Joint);
clf; tranimate(T)
rpy2tr(2.78*pi/180.0,-1.02*pi/180.0,1.67655*pi/180.0)
t_sensor
t_sensor_new
t_sensor_unit_new
t_sensor_old
rpy2tr(2.78*pi/180.0,-1.02*pi/180.0,1.67655*pi/180.0)
rpy2tr(178.6*pi/180.0,-26.54*pi/180.0,-0.54*pi/180.0)
bot.tool
%-- 2017/8/22/星期二 20:48 --%
Robot_Er6c
bot.fkine([-134.9*pi/180.0 73.46*pi/180.0 7.16*pi/180.0 75.54*pi/180.0 -92.49*pi/180.0 -14.77*pi/180.0])
bot.fkine([-133.3*pi/180.0 82.40*pi/180.0 -3.19*pi/180.0 81.10*pi/180.0 -46.77*pi/180.0 -51.89*pi/180.0] )
rpy2tr(249.09*pi/180.0,-48.05*pi/180.0,159.6)
rpy2tr(256.13*pi/180.0,-4.35*pi/180.0,-128.9*pi/180.0)
rpy2tr(234.52*pi/180.0,-30.21*pi/180.0,-141.44*pi/180.0)
rpy2tr(238.52*pi/180.0,-16.21*pi/180.0,-134.44*pi/180.0)
%-- 2017/9/5/星期二 15:22 --%
Robot_Er6c
bot.fkine(qz)
%-- 2017/9/23/星期六 17:18 --%
bot
%-- 2017/10/16/星期一 15:29 --%
A = [1 0 1 ;0 1 1 ;1 1 2]
norm(A)
norm(A,2)
norm(A,inf
norm(A,inf)
norm(A,'fro')
Q = orth(A)
B = Q'*A
%-- 2017/10/20/星期五 15:46 --%
clear
plot3(zuobiao(:,1),zuobiao(:,2),zuobiao(:,3));
plot(zuobiao(:,1),zuobiao(:,2));
plot(zuobiao(:,1),zuobiao(:,2),'*');
plot(picdata(:,1),picdata(:,2));
plot(picdata(:,1),picdata(:,2),'*');
%-- 2017/10/20/星期五 16:14 --%
plot(zuobiao(:,1),zuobiao(:,2));
plot(zuobiao(:,1),zuobiao(:,2),'*');
%-- 2017/10/31/星期二 16:11 --%
vertices=[0.8 0.8 0;1.4 0.6 0;1.5 0.7 0.5;1.5 1.5 .5;0.6 1.4 0;1.5 1.5 0]';
bezier( vertices )
vertices=[0.8 0.2 0;1.2 0.6 0;1.8 0.7 0.5;1.5 1.5 .5;0.2 1.4 0;1.5 1.4 0]'
bezier( vertices )
vertices=[0.8 0.8 0;1.4 0.6 0;10.5 0.7 0.5;1.5 1.5 .5;0.6 1.4 0;1.5 1.5 0]';
bezier( vertices )
%-- 2017/12/4/星期一 15:12 --%
Robot_er6c
Robot_Er6c
bot.teach
rtbdemo
%-- 2018/1/4/星期四 9:33 --%
pid
pid -help
%-- 2018/1/4/星期四 14:55 --%
Robot_er6c
Robot_Er6c
ones(3)
eye(3)
T = eye(3)
tr2rpy(T)
%-- 2018/1/10/星期三 9:18 --%
Robot_Er6c
bot.fkine(qz)
T = bot.fkine(qz)
hikine(T)
ikine(T)
likine(T)
ikine(T)
likine(T)
bot.ikine(T)
T= bot.kine(qh)
T= bot.fkine(qh)
bot.ikine(T)
mdl_puma560
p560.teach()
p560.fkine(qz)
T = p560.fkine(qz)
p560.ikine(T)
qz
p560.teach(qz)
T = p560.fkine(qz)
p560.ikine(T)
bot.teah
bot.teach
Untitiled
Untitled2
%-- 2018/1/18/星期四 10:22 --%
Robot_er6c
Robot_Er6c
mdl_p560
mdl_puma560
p560.teach
p560.fkine(qz)
bot.fkine(qz)
bot.teach(qz)
p560.fkine(qz)
bot.teach(qz)
x0 = 0; y0 = 0; z0 = 0;
plot3(x0,y0,z0,'*k','linewidth',2,'markersize',10);
plot3(indexcol,indexrow,z0,'*k','linewidth',2,'markersize',10);
plot3(indexcol,indexrow,maxScore,'*k','linewidth',2,'markersize',10);
xx2(1) = x0; xx2(2) = indexcol;
yy2(1) = y0; yy2(2) = indexrow;
zz2(1) = z0; zz2(2) = z0;
plot3(xx2, yy2, zz2, 'r','linewidth',2);
x=-1:0.1:1;
y=-1:0.1:1;
[xx,yy]=meshgrid(x,y);
zz=xx.*exp(-xx.^2-yy.^2);
surf(xx,yy,zz);
x=-100:0.1:100;
y=-100:0.1:100;
[xx,yy]=meshgrid(x,y);
zz=xx^2+yy^2+4*y-96;surf(xx,yy,zz);
zz=xx^2.+yy^2.+4*y-96;surf(xx,yy,zz);
xx = xx^2;
yy = yy^2
yy = yy^2;
zz = xx+yy;
surf(xx,yy,zz);
[xx,yy]=meshgrid(x,y);
x=-1:0.1:1;
y=-1:0.1:1;
[xx,yy]=meshgrid(x,y);
zz=xx^2+yy^2+4*y;
surf(xx,yy,zz);
zz=xx^2+yy^2+4*yy;
surf(xx,yy,zz);
x=-10:0.1:10;
y=-10:0.1:10;
[xx,yy]=meshgrid(x,y);
zz=xx^2+yy^2+4*yy;surf(xx,yy,zz);
x=-100:1:100;
y=-100:1:100;
[xx,yy]=meshgrid(x,y);
zz=xx^2+yy^2+4*yy;surf(xx,yy,zz);
x=-100:1:100;
y=-100:1:100;
[xx,yy]=meshgrid(x,y);
zz=yy^2+4*yy;surf(xx,yy,zz);
x0 = 0; y0 = 0; z0 = 0;
plot3(x0,y0,z0,'*k','linewidth',2,'markersize',10);
plot3(indexcol,indexrow,z0,'*k','linewidth',2,'markersize',10);
plot3(indexcol,indexrow,maxScore,'*k','linewidth',2,'markersize',10);
xx2(1) = x0; xx2(2) = indexcol;
yy2(1) = y0; yy2(2) = indexrow;
zz2(1) = z0; zz2(2) = z0;
plot3(xx2, yy2, zz2, 'r','linewidth',2);
%-- 2018/1/22/星期一 9:35 --%
Robot_Er6c
mdl_puma560
L1 = Link('d',0.43,'a',0.163655,'alpha',pi/2,'qlim',[-165,165]*deg);
L2 = Link('d',0,'a',0.550739,'alpha',0,'qlim',[-60,180]*deg);
L3 = Link('d',-0.001279,'a',0.208847,'alpha',pi/2,'qlim',[-85,135]*deg);
L4 = Link('d',0.700029,'a',0,'alpha',-pi/2,'qlim',[-360,360]*deg);
L5 = Link('d',0,'a',0,'alpha',pi/2,'qlim',[-135,135]*deg);
L6 = Link('d',0.115,'a',0,'alpha',0,'qlim',[-360,360]*deg);
bot = SerialLink([L1 L2 L3 L4 L5 L6],'name','ER6C-C60');
T = bot.fkine(qz)
hikine(T)
likine(T)
hikine(T)
bot.fkine(qn)
T = bot.fkine(qn)
hikine(T)
qn
hikine(T)
qn
bot.teach(qn)
clc
clear
mdl_puma560
L1 = Link('d',0.43,'a',0.163655,'alpha',pi/2,'qlim',[-165,165]*deg);
L2 = Link('d',0,'a',0.550739,'alpha',0,'qlim',[-60,180]*deg);
L3 = Link('d',-0.001279,'a',0.208847,'alpha',pi/2,'qlim',[-85,135]*deg);
L4 = Link('d',0.700029,'a',0,'alpha',-pi/2,'qlim',[-360,360]*deg);
L5 = Link('d',0,'a',0,'alpha',pi/2,'qlim',[-135,135]*deg);
L6 = Link('d',0.115,'a',0,'alpha',0,'qlim',[-360,360]*deg);
bot = SerialLink([L1 L2 L3 L4 L5 L6],'name','ER6C-C60');
T = bot.fkine(qn)
hikine(T)
qn
bot.fkine(qn)
likine(T)
mdl_puma560
L1 = Link('d',0.43,'a',0.163655,'alpha',pi/2,'qlim',[-165,165]*deg);
L2 = Link('d',0,'a',0.550739,'alpha',0,'qlim',[-60,180]*deg);
L3 = Link('d',0,'a',0.208847,'alpha',pi/2,'qlim',[-85,135]*deg);
L4 = Link('d',0.700029,'a',0,'alpha',-pi/2,'qlim',[-360,360]*deg);
L5 = Link('d',0,'a',0,'alpha',pi/2,'qlim',[-135,135]*deg);
L6 = Link('d',0.115,'a',0,'alpha',0,'qlim',[-360,360]*deg);
bot = SerialLink([L1 L2 L3 L4 L5 L6],'name','ER6C-C60');
bot.fkine(qn)
T = bot.fkine(qn)
likine(T)
qn
L1 = Link('d',0.43,'a',0.165,'alpha',pi/2,'qlim',[-165,165]*deg);
L2 = Link('d',0,'a',0.55,'alpha',0,'qlim',[-60,180]*deg);
L3 = Link('d',-0.03,'a',0.21,'alpha',pi/2,'qlim',[-85,135]*deg);
L4 = Link('d',0.7,'a',0,'alpha',-pi/2,'qlim',[-180,180]*deg);
L5 = Link('d',0,'a',0,'alpha',pi/2,'qlim',[-135,135]*deg);
L6 = Link('d',0.115,'a',0,'alpha',0,'qlim',[-360,360]*deg);
bot = SerialLink([L1 L2 L3 L4 L5 L6],'name','ER6C-C60');
bot.fkine(qn)
T = bot.fkine(qn)
likine(T)
qn
q = [pi/3,pi/2,pi/3,pi/4,-pi/2,0]
T = bot.fkine(q)
hikine(T)
likine(T)
q = [pi/3,pi/2,pi/3,pi/4,-pi/2,0]
L1 = Link('d',0.430000,'a',0.163655,'alpha',pi/2,'qlim',[-165,165]*deg);
L2 = Link('d',0,'a',0.550739,'alpha',0,'qlim',[-60,180]*deg);
L3 = Link('d',-0.001279,'a',0.208847,'alpha',pi/2,'qlim',[-85,135]*deg);
L4 = Link('d',0.700029,'a',0,'alpha',-pi/2,'qlim',[-180,180]*deg);
L5 = Link('d',0,'a',0,'alpha',pi/2,'qlim',[-135,135]*deg);
L6 = Link('d',0.115000,'a',0,'alpha',0,'qlim',[-360,360]*deg);
bot = SerialLink([L1 L2 L3 L4 L5 L6],'name','ER6C-C60');
T = bot.fkine(q)
hikine(T)
q
L1 = Link('d',0.430000,'a',0.163655,'alpha',pi/2,'qlim',[-165,165]*deg);
L2 = Link('d',0,'a',0.550739,'alpha',0,'qlim',[-60,180]*deg);
L3 = Link('d',-0.1279,'a',0.208847,'alpha',pi/2,'qlim',[-85,135]*deg);
L4 = Link('d',0.700029,'a',0,'alpha',-pi/2,'qlim',[-180,180]*deg);
L5 = Link('d',0,'a',0,'alpha',pi/2,'qlim',[-135,135]*deg);
L6 = Link('d',0.115000,'a',0,'alpha',0,'qlim',[-360,360]*deg);
bot = SerialLink([L1 L2 L3 L4 L5 L6],'name','ER6C-C60')
T = fkine(q)
T = bot.fkine(q)
hikine(T)
q
L1 = Link('d',0.430000,'a',0.163655,'alpha',pi/2,'qlim',[-165,165]*deg);
L2 = Link('d',0,'a',0.550739,'alpha',0,'qlim',[-60,180]*deg);
L3 = Link('d',-0.03,'a',0.208847,'alpha',pi/2,'qlim',[-85,135]*deg);
L4 = Link('d',0.700029,'a',0,'alpha',-pi/2,'qlim',[-180,180]*deg);
L5 = Link('d',0,'a',0,'alpha',pi/2,'qlim',[-135,135]*deg);
L6 = Link('d',0.115000,'a',0,'alpha',0,'qlim',[-360,360]*deg);
bot = SerialLink([L1 L2 L3 L4 L5 L6],'name','ER6C-C60')
T = bot.fkine(q)
hikine(T)
q
q = [pi/1.5 pi/4 pi/4 pi/5 pi/6 0]
bot.fkine(q)
T = bot.fkine(q)
hikine(T)
q
L1 = Link('d',0.43,'a',0.165,'alpha',pi/2,'qlim',[-165,165]*deg);
L2 = Link('d',0,'a',0.55,'alpha',0,'qlim',[-60,180]*deg);
L3 = Link('d',-0.00127,'a',0.21,'alpha',pi/2,'qlim',[-85,135]*deg);
L4 = Link('d',0.7,'a',0,'alpha',-pi/2,'qlim',[-180,180]*deg);
L5 = Link('d',0,'a',0,'alpha',pi/2,'qlim',[-135,135]*deg);
L6 = Link('d',0.115,'a',0,'alpha',0,'qlim',[-360,360]*deg);
bot = SerialLink([L1 L2 L3 L4 L5 L6],'name','ER6C-C60')
T = bot.fkine(q)
hikine(T)
q
Robot_Er6c
mdl_puma560
L1 = Link('d',0.43,'a',0.163655,'alpha',pi/2,'qlim',[-165,165]*deg);
L2 = Link('d',0,'a',0.550739,'alpha',0,'qlim',[-60,180]*deg);
L3 = Link('d',-0.001279,'a',0.208847,'alpha',pi/2,'qlim',[-85,135]*deg);
L4 = Link('d',0.700029,'a',0,'alpha',-pi/2,'qlim',[-180,180]*deg);
L5 = Link('d',0,'a',0,'alpha',pi/2,'qlim',[-135,135]*deg);
L6 = Link('d',0.115,'a',0,'alpha',0,'qlim',[-360,360]*deg);
bot = SerialLink([L1 L2 L3 L4 L5 L6],'name','ER6C-C60')
T = bot.fkine(qn
T = bot.fkine(qn)
hikine(T)
qn
q = [pi/1.5 pi/4 pi/4 pi/5 pi/6 0]
T = bot.fkine(q)
hikine(T)
q
qn
q
bot.teach(qn
bot.teach(qn)
q
T = bot.fkine(q)
hikine(T)
q
qn
bot.teach(qn)
q = [pi/1.5 pi/4 pi/4 pi/5 pi/6 0]
q = [pi/1.5 pi/4 3*pi/5 pi/5 pi/6 0]
T = bot.fkine(q);
hikine(T)