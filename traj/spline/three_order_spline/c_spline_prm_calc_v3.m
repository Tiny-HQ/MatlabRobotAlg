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
function [a,b,c,d] = c_spline_prm_calc_v3(t,x,flag)
	t_length = length(t);
    x_length = length(x);

    a= zeros(1,t_length);
    b= zeros(1,t_length);
    c= zeros(1,t_length);
    d= zeros(1,t_length);
  
    a(t_length)=t(t_length)-t(t_length-1);
    b(1)=2*(t(2)-t(1));
    b(t_length)=2*(t(t_length)-t(t_length-1));
    c(1)=0.5*b(1);
    d(1)=6*(x(2)-x(1))/(t(2)-t(1));
    d(t_length)=-6*(x(t_length)-x(t_length-1))/(t(t_length)-t(t_length-1));
	
	if flag==1
		%???»±?????????????????????????????0?????a(1),b(1),c(1),d(1),a(n),b(n),c(n),d(n)
		d(1)=0;d(t_length)=0;
		a(t_length)=0;
		b(1)=1;b(t_length)=1;
		c(1)=0;
	end
	
	c(1)=c(1)/b(1);
	d(1)=d(1)/b(1);
	for i=2:(t_length)
		if(i<t_length)
			a(i)=t(i)-t(i-1);
			b(i)=2*(t(i+1)-t(i-1));
			c(i)=t(i+1)-t(i);
			d(i)=6*(x(i+1)-x(i))/c(i) - 6*(x(i)-x(i-1))/a(i);
		end
		fm = b(i)-a(i)*c(i-1);
		c(i)=c(i)/fm;
		d(i)=(d(i)-a(i)*d(i-1))/fm;
    end

	a(t_length)=d(t_length);
	for i=1:(t_length-1)
		a(t_length-i)=d(t_length-i)-a(t_length-i+1)*c(t_length-i);
	end

	for i=1:(t_length-1)
		 hi = t(i+1) - t(i);
		 di = (x(i+1) - x(i))/hi;
	   
		 b(i) = 0.5*a(i);
		 c(i) = di - hi*(a(i+1) + 2*a(i))/6;
		 a(i) = (a(i+1) - a(i))/(6*hi);    
		 d(i) = x(i);      
	end
end