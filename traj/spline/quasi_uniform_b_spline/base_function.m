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


function [Nik_u] = base_function (i,k,u,NodeVector)


%%  方法一、标准递归 ,测试OK;
   if (i - 1 > 1)
        if ((u < NodeVector(i)))
            Nik_u = 0.0; return ;
        end
   end

    if ((i + k + 2) < length(NodeVector))
        if (u >= NodeVector(i + k + 2))
            Nik_u = 0.0; return ;
        end
    end

    
    if(k == 0)
        if((u>=NodeVector(i+1))&&(u<NodeVector(i+2)))
            Nik_u = 1.0;
        else
            Nik_u = 0.0;
        end       
    else 
        
        length1 = NodeVector(i+k+1)-NodeVector(i+1);
        length2 = NodeVector(i+k+2)-NodeVector(i+2);
        
        if(abs(length1)<eps)
            length1 = 1.0;
        end
        if(abs(length2)<eps)
            length2 = 1.0;
        end
        c1 = base_function(i,k-1,u,NodeVector);
        c2 = base_function(i+1,k-1,u,NodeVector);
        Nik_u = (u-NodeVector(i+1))/length1*c1+(NodeVector(i+k+2)-u)/length2*c2;

    end
 

end