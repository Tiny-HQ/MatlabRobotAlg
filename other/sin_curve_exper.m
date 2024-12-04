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





start_pos = zeros(7,4);

start_pos(1,:) = [0 0 0 0];
start_pos(2,:) = [78.793 -64.4689 -93.798 -335.485 ];
start_pos(3,:) = [29.4431 71.26 -48.1772 158.931];
start_pos(4,:) = [-16.9752 97.6298 -150.443 -237.478];
start_pos(5,:) = [-69.4959 63.2827 -20.2931 282.838];
start_pos(6,:) = [-35.8887 -89.737 -132.486 -6.73393];
start_pos(7,:) = [ 0 0 0 0];

doverride = 0.3;

V = [375 600 925 1875]*0.95*doverride;
A = [3354 3848 17200 50000]*0.95*doverride;
D = [3354 3848 17200 50000]*0.95*doverride;
J = [33540 38480 172000 200000]*0.95*doverride;

fid1 = fopen('1.txt','wt');
fid2 = fopen('2.txt','wt');
fid3 = fopen('3.txt','wt');
fid4 = fopen('4.txt','wt');

count = [0 0 0 0];

for i = 1:4
    
    for k = 1:6
        
        delta_pos(k) = abs(start_pos(k+1,i)-start_pos(k,i));
        [t,j1] = sin_sim_cal_param(delta_pos(k),V(i),A(i),D(i),J(i));
        [ss,s,v,a,jerk] = sin_sim_cal_pvaj(t,j1,0.004);
        
        if start_pos(k+1,i)-start_pos(k,i)>0
            s = s + start_pos(k,i);
        else
            s = start_pos(k,i) - s  ;
        end
        count(i) = count(i)+length(s);
        s_ = s';
        
        if i == 1
          fprintf(fid1,'%.3f\n',s_);       
        elseif i == 2 
            fprintf(fid2,'%.3f\n',s_); 
        elseif i == 3  
            fprintf(fid3,'%.3f\n',s_);      
        elseif i == 4
            fprintf(fid4,'%.3f\n',s_); 
        end
        s_ =0;
        ss = 0;
        s = 0;
        v = 0;
        a = 0;
    end
    ze = zeros(4000-count(i),1);
    if i == 1
      fprintf(fid1,'%.3f\n',ze);       
    elseif i == 2 
        fprintf(fid2,'%.3f\n',ze); 
    elseif i == 3  
        fprintf(fid3,'%.3f\n',ze);      
    elseif i == 4
        fprintf(fid4,'%.3f\n',ze); 
    end
   
    
end


fclose(fid1);
fclose(fid2);
fclose(fid3);
fclose(fid4);














