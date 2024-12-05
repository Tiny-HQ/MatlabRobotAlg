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
function [Nik,dNik,ddNik] = mnurbs_cal_basis_func_matrix(u,k,u_vec)

    n = length(u_vec)-k-k+1;
    Nik = zeros(n,1);
    dNik = zeros(n,1);
    ddNik = zeros(n,1);
    index = mnurbs_cal_index(u,u_vec);

    for i = 1:n
       if((i > index+k+3)||(i<index-k-3)||(i+k+1)>length(u_vec))
        ;
       else
            [Nik(i),dNik(i)] = mnurbs_cal_basis_functions_Nik_dNik(u,i,k,u_vec) ;
            ddNik(i) = mnurbs_cal_basis_func_sec_dderivative(u,i,k,u_vec);
        end
    end
end

