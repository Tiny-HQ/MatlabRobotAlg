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

format long g;

v = 30*400;


t = [0:0.004*5:10];

p = v*t;

subplot(2,1,1);

plot(p);

% y_formatstring = '%3.4f';
% ytick = get(gca,'ytick');
% set(gca,'yticklabel',ytick);
% yticklabel = linspace(0,0,length(ytick));

% for i = 1:length(ytick)
%     yticklabel(i) = sprintf(y_formatstring,ytick(i));
% 
% end




p_ = linspace(0,0,length(p));

for i = 1:length(p_)

    p_(i) = p(i)+10*sin(rand()*100-50);
    
    
end

p_ = -p_;
    
hold on;
plot(p_);
    
p_ = p_';
fid = fopen('res.txt','wt');
fprintf(fid,'%.3f\n',p_);
fclose(fid);
    

v_ = diff(p_)/(0.004*5)/400;
subplot(2,1,2);
plot(v_);  

v__= smooth(v_);


hold on;
plot(v__,'r');  


alg_v = load('alg_res.txt');
alg_v = alg_v(3:length(alg_v-2),1);
hold on;
plot(alg_v,'y'); 
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    