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



Ts = 0.0001;


Vel = 2000;
Acc = 50000;
Jerk = 250000;
Disp = 100;

figure;
for mm = 1:10
    
    ov = 10/100*mm;
    override = 0.95;
    
    [t,jerk] = s_curve_cal_param_con(Disp,Vel*ov*override,Acc*ov*override,Jerk*ov*override);
    [p,v,a,jerk] = s_curve_cal_pvaj_con_ext(t,jerk,Ts);

    max_no = ceil(t(3)/Ts);
    trstop_d = linspace(0,0,max_no);
    trstop_v = linspace(0,0,max_no);
    trstop_a = linspace(0,0,max_no);

    for i = 1:max_no
        trstop_v(i) = v(i);
        trstop_a(i) = a(i);
    end

    A_set = Acc*ov*override;J = Jerk*ov*override;
   % A_set = Acc;J = Jerk;
    for i = 1:max_no
        [t1,j1] = stop_cal_param_sim_ext(trstop_v(i),trstop_a(i),A_set,J);
        [p1,v1,a1,jerk1] = stop_cal_pvaj_ext(t1,j1,trstop_v(i),trstop_a(i),0,Ts);
        l = length(p1);
        trstop_d(i) = p1(l);  
    end

    hold on;
    plot3(trstop_v,trstop_a,trstop_d,'*');
    
    
end

legend('override 10%','override 20%','override 30%','override 40%','override 50%','override 60%','override 70%','override 80%','override 90%','override 100%');
xlabel('Vel');
ylabel('Acc');
zlabel('Stop Dis');




