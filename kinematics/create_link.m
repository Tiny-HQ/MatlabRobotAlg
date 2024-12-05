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


%����dh����T;






function T = create_link(theta,d,alpha,a,option)

    if strcmp(option,'deg')
        theta = theta*pi/180.0;
        alpha = alpha*pi/180.0;
    elseif strcmp(option,'rad')
        ;
    else
        theta = theta*pi/180.0;
        alpha = alpha*pi/180.0;
    end

    T = eye(4);
  % T = transl(0,0,d)*trotz(theta)*transl(a,0,0)*trotx(alpha);
  T = trotx(alpha)*transl(a,0,0)*trotz(theta)*transl(0,0,d);
  
%    T(1,1) = cos(theta);     T(1,2) = -cos(alpha)*sin(theta);  T(1,3) =sin(alpha)*sin(theta);  T(1,4) = a*cos(theta);
%    T(2,1) = sin(theta); T(2,2) = cos(alpha)*cos(theta);T(2,3) = -sin(alpha)*cos(theta);T(2,4) = a*sin(theta);
%    T(3,2) = sin(alpha);T(3,3) = cos(alpha);T(3,4) = d;
  
    
    for i = 1:4
        for j = 1:4
            if abs(T(i,j))<eps
                T(i,j) = 0.0;
            end
        end
    end
        

end








