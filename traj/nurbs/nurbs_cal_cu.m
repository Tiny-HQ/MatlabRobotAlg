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
%u:variable;
%k:degree;
%u_vec:knot vector;
%P:control point;
%W:weight;

function cu = nurbs_cal_cu(u,k,u_vec,P,W)

    de = 0;
    no = 0;
    index = nurbs_cal_index(u,u_vec);
    for i = 1:length(P)
        
%         index = nurbs_cal_index_in_uvec(u,u_vec);
        Nik = nurbs_cal_basis_functions(u,i+k-1,k,u_vec);
        no = no + Nik*W(i)*P(i);
        de = de +( Nik*W(i));
    end
    if(abs(de)<eps)
        de = 1;
    end
    cu =no/de;

end
