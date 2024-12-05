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
function [a,b,c,d]=c_spline_prm_calc(t,x)
    t_length = length(t);
    x_length = length(x);
    aerfa = zeros(1,t_length);
    delta= zeros(1,t_length);
    acc= zeros(1,t_length);
    a= zeros(1,t_length);
    b= zeros(1,t_length);
    c= zeros(1,t_length);
    d= zeros(1,t_length);
    
	if(t_length ~= x_length)
		return;
    end
	
	for i=1:(t_length-1)
		if(i == 1)
			aerfa(1) = 0;
			delta(1) = 0;
			aerfa(t_length) = 0;
			delta(t_length) = 0;
		else
			hi = t(i) - t(i-1);      
			di = (x(i) - x(i-1))/hi;
		    hii = t(i + 1) - t(i);
			dii = (x(i + 1) - x(i)) / hii;

			del = 6 * (dii - di)/(hi+hii);
		    aer = hi/(hi+hii);
			fm = 2 - aer*aerfa(i-1);
			if(fm == 0) 
				return;
			end
			aerfa(i) = (1-aer)/fm;
			delta(i) = (del - aer*delta(i-1))/fm;
		end
		
	end
	
	for i=1:(t_length-1)
	    if(i==1)
			acc(t_length)=0;
        else
            acc(t_length-i+1)=delta(t_length-i+1)-acc(t_length-i+2)*aerfa(t_length-i+1);
        end
    end

	for i=1:(t_length-1)
		 hi = t(i+1) - t(i);
		 di = (x(i+1) - x(i))/hi;

		 a(i) = (acc(i+1) - acc(i)) / (6*hi);   
		 b(i) = 0.5*acc(i);
		 c(i) = di - hi*(acc(i + 1) + 2 * acc(i)) / 6; 
		 d(i) = x(i);      
	end
	
end