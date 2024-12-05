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




function [p_acc,p_dec] = cal_single_seg_acc_dec(p1,p2,T,Ts)

    
    

    
    t_acc = T(1);
    t_dec = T(2);
    
    
    n1 = ceil(t_acc/Ts);   %��Ҫ��ɢ����������Բ�������΢�Ĳ�������;It needs to be discretely processed, otherwise there will be slight fluctuations in the pair;
    n2 = ceil(t_dec/Ts);
    
    p_acc = n1*Ts/T(3)*(p2-p1)+p1;
    p_dec = n2*Ts/T(3)*(p2-p1)+p1;










end


