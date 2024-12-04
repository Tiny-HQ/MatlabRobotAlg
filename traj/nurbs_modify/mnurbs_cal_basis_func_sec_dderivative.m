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
% define nurbs second derivative; 


%u:variable;
%i:index;
%k:degree decrease;
%u_vec:knot;


function [ddNik] = mnurbs_cal_basis_func_sec_dderivative(u,i,k,u_vec)

    index = mnurbs_cal_index(u,u_vec);
    if((i > index+k+1)||(i<index-k-1)||(i+k+1)>length(u_vec))
         ddNik = 0.0; return ;
    end
    length1 = u_vec(i+k)-u_vec(i);
    length2 = u_vec(i+k+1)-u_vec(i+1);



    if(abs(length1)<eps)
        length1 = 1.0;
    end
    if(abs(length2)<eps)
        length2 = 1.0;
    end
%     dNik = k/length1*mnurbs_cal_basis_functions(u,i,k-1,u_vec)-k/length2*mnurbs_cal_basis_functions(u,i+1,k-1,u_vec);
    ddNik = k/length1*mnurbs_cal_basis_functions_derivative(u,i,k-1,u_vec)-k/length2*mnurbs_cal_basis_functions_derivative(u,i+1,k-1,u_vec);



end