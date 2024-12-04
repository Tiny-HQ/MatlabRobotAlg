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
% define nurbs basical function;
%u:variable;
%i:index;
%k:degree decrease;
%k_t:degree total;
%u_vec:knot;
% can be optimized!!!!!!! repeat calculation, invailid recursion;
% optimize method:1.invailid recusion, 2.save all Nik, dont need to
% calculate twice.


function [Niku,dNiku] = mnurbs_cal_basis_functions_Nik_dNik(u,i,k,u_vec)  
   

%optimize 
%while k = 5, n = 10, if remove this code, will cause more 0.9 second.
%if n&k value is larger, time taken will be more.i suggest using save
%all Nik is the most niubi way.this will not write here, waste time.
    index = mnurbs_cal_index(u,u_vec);
    if((i > index+k+1)||(i<index-k-1))
         Niku = 0.0; dNiku = 0.0;return ;
    end
%optimize

    if((i + k + 1) >= length(u_vec))
         Niku = 0.0; dNiku = 0.0;return ;
    end

    
   if(k == 0)
        if((u>=u_vec(i))&&(u<u_vec(i+1)))
            Niku = 1.0;dNiku = 0.0;
        else
            Niku = 0.0;dNiku = 0.0;
        end       
   else 
        
        if(i == 0)
            length1 = u_vec(i+k)-0.0;
        else
            length1 = u_vec(i+k)-u_vec(i);
        end
    
        length2 = u_vec(i+k+1)-u_vec(i+1);
        
        if(abs(length1)<eps)
            length1 = 1.0;
        end
        if(abs(length2)<eps)
            length2 = 1.0;
        end
        c1 = mnurbs_cal_basis_functions(u,i,k-1,u_vec);%(u,i,k,u_vec)  
        c2 = mnurbs_cal_basis_functions(u,i+1,k-1,u_vec);%(u,i,k,u_vec)  
        if(i ==0)
            Niku = (u-0.0)/length1*c1+(u_vec(i+k+1)-u)/length2*c2;
        else
            Niku = (u-u_vec(i))/length1*c1+(u_vec(i+k+1)-u)/length2*c2;
        end     
        dNiku = k/length1*c1-k/length2*c2;

    end
end  