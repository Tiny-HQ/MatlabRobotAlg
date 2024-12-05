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



function [Cu,dCu] = nurbs_cal_dcu_derivative(u,k,u_vec,P,Wi)

    [Nik,dNik,ddNik] = nurbs_cal_basis_func_matrix(u,k,u_vec);
    
    
    Nik = Nik';
    dNik = dNik';
    
%         Nik = Nik';
%     dNik = dNik';
%     ddNik = ddNik';
    A = Nik*(Wi.*P);
    W = Nik*Wi;
    A_ = dNik*(Wi.*P);
    W_ = dNik*Wi;
%     A__ = ddNik*(Wi.*P);
%     W__ = ddNik*Wi;
    
    if abs(W)<eps
        C = A;
        C_ = A_-C*W_;
       % C__ = A__-2*C_*W_-C*W__;
    else
        C = A/W;
        C_ = (A_-C*W_)/W;
      %  C__ = (A__-2*C_*W_-C*W__)/W;
    end
    Cu = C;
    dCu  =C_; 
%     ddCu = C__;
    
%     if(abs(Nik*W)<eps)
%         dcu1 = dNik*(W.*P);
%         dcu2 = (Nik*(W.*P)*(dNik*W));
%         dCu = dcu1-dcu2;
%         Cu =Nik*(W.*P);
%     else
%         Cu = Nik*(W.*P)/(Nik*W);
%         dcu1 = dNik*(W.*P)/(Nik*W);
% %         dcu2 = (Nik*(W.*P)*(dNik*W))/(Nik*W)^2;
%         dcu2 = Cu*(dNik*W)/(Nik*W);
%         dCu = dcu1-dcu2;
%     end
    
%     for i = 1:length(P)
% %         index = nurbs_cal_index_in_uvec(u,u_vec);
%         dNik = nurbs_cal_basis_functions_derivative(u,i,k,u_vec);
%         no = no + dNik*W(i)*P(i);
%         de = de +( dNik*W(i));
%     end
%     dCu =no/de;
end