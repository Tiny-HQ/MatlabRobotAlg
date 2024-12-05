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




function [v_limit] = little_line_segment_cal_angle_limit(P,e,a,v_start)


    [m,n] = size(P); 

    theta = zeros(m,1);
    for i = 2:m-1
        theta(i) = angle_between_vectors(P(i,:)-P(i-1,:),P(i+1,:)-P(i,:));   
    end

    v_limit = zeros(1,m);v_limit(1) = v_start;
    for i = 2:m-1
        if(abs(1-cos(theta(i)/2)<0.001 ))
            v_limit(i) = 10000.0;
        else
            r = e*cos(theta(i)/2)/(1-cos(theta(i)/2));
            v_limit(i) = sqrt(a*r);      
        end
    end

end

function theta_rad = angle_between_vectors(A, B)
 
    if length(A) ~= length(B)
        error('����������ά�ȱ�����ͬ');
    end
    dot_product = dot(A, B);  
    norm_A = norm(A);
    norm_B = norm(B);    
    theta_rad = acos(dot_product / (norm_A * norm_B));
    
end








