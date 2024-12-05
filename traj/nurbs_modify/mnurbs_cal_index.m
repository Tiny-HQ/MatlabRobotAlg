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

function [index] = mnurbs_cal_index(u,u_vec)


    for i = 1:length(u_vec)
         if((u>=u_vec(i))&&(u<u_vec(i+1)))
             index = i;
             break;
             
          elseif((abs(u-u_vec(length(u_vec)))<0.0000000001)&&(u>=u_vec(i))&&(u<=u_vec(i+1)))
         % elseif((abs(u-u_vec(length(u_vec)))<eps)&&())
             index = i;
             break;
         end
    end
    
    if(i == length(u_vec))
       index = 1;        
    end



end

% function [index] = nurbs_cal_index(u,u_vec)
% 
% 
%     for i = 1:length(u_vec)
%          if((u>=u_vec(i))&&(u<u_vec(i+1)))
%              index = i;
%              break;
%              
%          elseif((abs(u-u_vec(length(u_vec)))<0.0000000001)||u>u_vec(length(u_vec)))
%              index = i;
%              break;
%          end
% 
%     end
% 
% 
% 
% end