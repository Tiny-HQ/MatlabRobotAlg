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







function [p_acc,dir] =cal_arc_acc_pos(theta,pc,r,pos)


    p1 = pos(1,:);p2 = pos(2,:);p3 = pos(3,:);
    
    p1p2 = p2-p1;
    uni_p1p2 = p1p2/sqrt(sum(p1p2.^2));
    
    p2p3 = p3-p2;
    uni_p2p3 = p2p3/sqrt(sum(p2p3.^2));
    
    ve = cross(p1p2,p2p3);
    nor = ve/sqrt(sum(ve.^2));
    
%     nor = cross(uni_p1p2,uni_p2p3);
    
    p1pc = p1-pc;
    uni_p1pc = p1pc/sqrt(sum(p1pc.^2));
    
    vect_y = cross(nor,uni_p1pc);
    uni_y = vect_y/sqrt(sum(vect_y.^2));
    
    T_trans = [uni_p1pc(1) uni_y(1) nor(1) pc(1);
                uni_p1pc(2) uni_y(2) nor(2) pc(2);
                uni_p1pc(3) uni_y(3) nor(3) pc(3);
                0 0 0 1];
%     T_trans;
    det(T_trans);
    
    vect = [r*cos(theta*pi/180.0) r*sin(theta*pi/180.0) 0 1]';
    p_acc = T_trans*vect;
    
    p_acc = p_acc(1:3,:)';
    pcpacc = p_acc-pc;
    
    dir = cross(ve,pcpacc);
    
    dir = dir/sqrt(sum(dir.^2));


end














