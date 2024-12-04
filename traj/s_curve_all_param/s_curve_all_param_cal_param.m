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



function [t,w] = s_curve_all_param_cal_param(s0,s5,v0,v5,a0,a5,v,a,d)


    ss5 = s5;
    ss0 = s0;
    vv0 = v0;
    vv5 = v5;
    aa0 = a0;
    aa5 = a5;
    vv = abs(v);
    aa = abs(a);
    dd = abs(d);
    
    w = zeros(1,11);
    t = zeros(1,6);
    
    if(ss0>ss5)
        s5 = ss0;
        s0 = ss5;
        v0 = vv5;
        v5 = vv0;
        a0 = aa5;
        a5 = aa0;
        v = -vv;
        a = dd;
        d = aa;
    else
        a = aa;
        d = dd;
        v = vv;
    end
    

    a1 = a;
    a2 = 0;
    v2 = v;
    
    t02 = 6*(v2-v0)/(4*a1+a2+a0);  
    %t02 = abs(t02);
    w1 = s0;
    w2 = v0;
    w3 = a0/2;
    w4 = (4*a1-a2-3*a0)/6/t02;
    w5 = (a0-2*a1+a2)/6/t02^2;
%     t02 = abs(t02);

    s02 = s_curve_all_param_cal_s(w1,w2,w3,w4,w5,t02)-s_curve_all_param_cal_s(w1,w2,w3,w4,w5,0); 
    %s02 = abs(s02);
    %figure_plot(w1,w2,w3,w4,w5,abs(t02));
    a2 = 0;
    v2 = v;
    
    t35 = 6*(v2-v5)/(4*d+a2+a5);
    %t35 = abs(t35);
    w6 = s5;
    w7 = v5;
    w8 = a5/2;
    w9 = (4*d-a2-3*a5)/6/t35;
    w10 = (a5-2*d+a2)/6/t35^2;
%     t35 = abs(t35);

    s25 = s_curve_all_param_cal_s(w6,w7,w8,w9,w10,t35)-s_curve_all_param_cal_s(w6,w7,w8,w9,w10,0);%这里是从w5到w5+x;求轨迹的时候，需要关于y对称一下;
    %figure_plot(w6,w7,w8,w9,w10,abs(t35));
    %s25 = abs(s25);
    t23 = 0.0;
  
    if(s02+s25<s5-s0)
       t23 = (s5-s0-(s02+s25))/(v2);
        
    else    
       t23 = 0.0;
        a1 = abs(a1);d = abs(d);

        A = a0/2+(4*a1-3*a0)/6+(a0-2*a1)/6; B = v0; C = a5/2+(4*d-3*a5)/6+(a5-2*d)/6; D = v5; E = s0-s5;
        k1 = (4*a1+a0)/6; k2 = (4*d +a5)/6; k = k1/k2; b = (v0-v5)/k2;
        M = A+C*k^2;N = B+2*k*b*C+D*k;W = C*b^2+D*b+E;
        x1 = (-N+(N^2-4*M*W)^0.5)/2/M; x2 = (-N-(N^2-4*M*W)^0.5)/2/M;
        if((x1>0)&&(x2<0))
            t02 = x1;
        elseif((x2>0)&&(x1<0))
            t02 = x2;
        elseif ((x2>0)&&(x1>0))    
            if(x1>x2)
                 t02 = x2;
            else
                t02 = x1;
            end
        else
            %无解或者负解;一般不可能;
        end
        w1 = s0; w2 = v0; w3 = a0/2; w4 = (4*a1-a2-3*a0)/6/t02; w5 = (a0-2*a1+a2)/6/t02^2;
        t35 = k*t02+b; w6 = s5;  w7 = v5; w8 = a5/2;  w9 = (4*d-a2-3*a5)/6/t35;  w10 = (a5-2*d+a2)/6/t35^2;
      % a1 = abs(a1);d =abs(d);
 
    end
    w(1) = w1;    
    w(2) = w2;
    w(3) = w3;
    w(4) = w4;
    w(5) = w5;
    w(6) = w6;
    w(7) = w7;
    w(8) = w8;
    w(9) = w9;
    w(10) = w10;
    if(ss0>ss5)
        w(11) = 1;%反向规划;
    else
        w(11) = 0;%正向规划;
   end

    t(1) = abs(t02);
    t(2) = t(1)+abs(t23);
    t(3) = t(2)+abs(t35);
    
    t(4) = t02;
    t(5) = t(4)+t23;
    t(6) = t(5)+t35;

end


function [x] = s_curve_all_param_cal_s(w0,w1,w2,w3,w4,t)

    x = w0+w1*t+w2*t^2+w3*t^3+w4*t^4;

end


function [x] = figure_plot(w0,w1,w2,w3,w4,t)
    t_int = 0.001;
  
    T = 0.0:t_int:t;
    sum_no = length(T);
    a = linspace(0,0,sum_no);
    v = linspace(0,0,sum_no);
    s = linspace(0,0,sum_no-1);
    jerk = linspace(0,0,sum_no);
    for i = 1:sum_no
        temp_t = i*t_int;
        jerk(i) = 6*w3+24*w4*temp_t;
        a(i) = 2*w2+6*w3*temp_t+12*w4*temp_t^2;
        v(i) = w1+2*w2*temp_t+3*w3*temp_t^2+4*w4*temp_t^3;
        s(i) = w0+w1*temp_t+w2*temp_t^2+w3*temp_t^3+w4*temp_t^4;  
    end
      figure;
    subplot(4,1,1);
    plot(s,'g');
    subplot(4,1,2);
    plot(diff(s)/t_int);hold on;
    plot(v,'b');
    subplot(4,1,3);
    plot(diff(v)/t_int);hold on;
    plot(a,'r');
    subplot(4,1,4);
    plot(diff(a)/t_int);hold on;
    plot(jerk,'m');
    x = 0;
end


