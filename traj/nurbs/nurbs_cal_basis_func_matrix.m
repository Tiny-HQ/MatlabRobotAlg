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
function [Nik,dNik,ddNik] = nurbs_cal_basis_func_matrix(u,k,u_vec)

    n = length(u_vec)-k-k-2;
%     Nik_ = zeros(1,n);
   % index = nurbs_cal_index(u,u_vec);%here is index of u_vector, not index of point;


%     Ni0 = 1;
%     Ni1_0 = 0;
%     Ni1 = (u-u_vec(index))/(u_vec(index+k)-u(index))*Ni0 + (u_vec(index+k+1)-u)/(u_vec(index+k+1)-u(index+1))*Ni1_0;

    Nik = zeros(n,1);
    dNik = zeros(n,1);
    ddNik = zeros(n,1);
    index = nurbs_cal_index(u,u_vec);

    for i = 1:n
       if((i > index+k+2)||(i<index-k-2)||(i+k+1)>length(u_vec))
        ;
       else
%             Nik(i) = nurbs_cal_basis_functions(u,i+k-1,k,u_vec) ;
%             dNik(i) = nurbs_cal_basis_functions_derivative(u,i+k-1,k,u_vec)  ;
            [Nik(i),dNik(i)] = nurbs_cal_basis_functions_Nik_dNik(u,i+k-1,k,u_vec) ;
%             dNik(i) = nurbs_cal_basis_functions_derivative(u,i+k-1,k,u_vec)  ;
            ddNik(i) = nurbs_cal_basis_func_sec_dderivative(u,i+k-1,k,u_vec);
        end
    end


end

