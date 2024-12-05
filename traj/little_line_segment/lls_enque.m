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

function pv = lls_enque(P,smooth)
 
    global buffer;
    for i = 1:smooth-1
        
       buffer(i,:) = buffer(i+1,:); 
    end
    buffer(smooth,:) = P;
    
    [m,n] = size(P);
    pv = zeros(1,n);
    for i = 1:n
        pv(:,i) = sum(buffer(:,i))/smooth;
    end

end