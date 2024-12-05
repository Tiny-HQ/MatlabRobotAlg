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

% ��ɢ������� discreate


function [n,jerk] = s_curve_cal_param_disper(Disp,Vel,Acc,Jerk)

    global MIN_DISP Ts;
    MIN_DISP = 0.001;
    Ts = 0.004;
    t = linspace(0.0,0.0,7);
    
    if Disp<MIN_DISP
        
        n = [0 0 0 0 0 0 0];
        jerk = 0.0;
        return;
    end

    tj_c=Acc/Jerk;
    Vel_c=Jerk*tj_c*tj_c;
    Disp_c=2*Jerk*tj_c*tj_c*tj_c;
%     Jerk_dct = 0.0;na = 0;nj = 0;tj_dct = 0;ta_dct =0;tv_dct = 0;nv = 0;
    
    if (Vel_c>=Vel && Disp_c<abs(Disp))
        tj=sqrt(Vel/Jerk);
        ta=0;
        tv=(abs(Disp)-2*Jerk*tj^3)/Vel;
        %��ɢ
        nj = ceil(tj / Ts);
        tj_dct = nj*Ts;
        na = ceil(ta / Ts);
        ta_dct = na*Ts;
        nv = ceil(tv / Ts);
        tv_dct = nv*Ts;
        Jerk_dct = abs(Disp)/(tv_dct+2*tj_dct)/tj_dct^2;
    elseif (Vel_c<Vel && Disp_c>=abs(Disp))
        tj = (abs(Disp)/2/Jerk)^(1/3);
        ta = 0.0;
        tv = 0.0;
        %��ɢ
        nj = ceil(tj / Ts);
        tj_dct = nj*Ts;
        na = ceil(ta / Ts);
        ta_dct = na*Ts;
        nv = ceil(tv / Ts);
        tv_dct = nv*Ts;
        Jerk_dct = abs(Disp)/2/tj_dct^3;
    elseif (Vel_c>=Vel && Disp_c>=abs(Disp)) 
        tj_v=(Vel/Jerk)^0.5;
        tj_d=(abs(Disp)/2/Jerk)^(1/3);
        if(tj_d>=tj_v)
            tj=tj_v;
            tv=(abs(Disp)-2*Jerk*tj^3)/Vel;
            ta=0;
            %��ɢ
            nj = ceil(tj / Ts);
            tj_dct = nj*Ts;
            na = ceil(ta / Ts);
            ta_dct = na*Ts;
            nv = ceil(tv / Ts);
            tv_dct = nv*Ts;
            Jerk_dct = abs(Disp)/(tv_dct+2*tj_dct)/tj_dct^2;
        else
            tj=tj_d;
            ta=0;
            tv=0;
            %��ɢ
            nj = ceil(tj / Ts);
            tj_dct = nj*Ts;
            na = ceil(ta / Ts);
            ta_dct = na*Ts;
            nv = ceil(tv / Ts);
            tv_dct = nv*Ts;
            Jerk_dct = abs(Disp)/2/tj_dct^3;
        end
    else
        tj=tj_c;
        ta_v=(Vel-Jerk*tj*tj)/Jerk/tj;
        ta_d=-1.5*tj+0.5*sqrt(tj*tj+4*abs(Disp)/Jerk/tj);
        if(ta_v>=ta_d)
            ta=ta_d;
            tv=0;
            %��ɢ
            nj = ceil(tj / Ts);
            tj_dct = nj*Ts;
            na = ceil(ta / Ts);
            ta_dct = na*Ts;
            nv = ceil(tv / Ts);
            tv_dct = nv*Ts;
            Jerk_dct = 4 * abs(Disp) / (4 * (ta_dct + 1.5*tj_dct)^2 - tj_dct^2) / tj_dct;
        else
            ta=ta_v;
            tv=(abs(Disp)-2*Jerk*tj^3-3*Jerk*tj^2*ta-Jerk*tj*ta^2)/Vel;
            %��ɢ
            nj = ceil(tj / Ts);
            tj_dct = nj*Ts;
            na = ceil(ta / Ts);
            ta_dct = na*Ts;
            nv = ceil(tv / Ts);
            tv_dct = nv*Ts;
            Jerk_dct = abs(Disp) / (2 * tj_dct^3 + (tv_dct + 3 * ta_dct)*tj_dct^ 2 + (ta_dct*tv_dct + ta_dct^2)*tj_dct);
        end
    end
    t(1) = tj_dct; n(1) = nj;
    t(2) = t(1) + ta_dct; n(2) = n(1) + na;
    t(3) = t(2) + tj_dct; n(3) = n(2) + nj;
    t(4) = t(3) + tv_dct; n(4) = n(3) + nv;
    t(5) = t(4) + tj_dct; n(5) = n(4) + nj;
    t(6) = t(5) + ta_dct; n(6) = n(5) + na;
    t(7) = t(6) + tj_dct; n(7) = n(6) + nj;
   jerk = Jerk_dct; 
end




















