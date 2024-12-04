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



function [Cux,dCux,ddCux,Cuy,dCuy,ddCuy,Cuz,dCuz,ddCuz] = nurbs_cal_ddcu_derivative(u,k,u_vec,Px,Wix,Py,Wiy,Pz,Wiz)

    [Nik,dNik,ddNik] = nurbs_cal_basis_func_matrix(u,k,u_vec);
    
    Nik = Nik';
    dNik = dNik';
    ddNik = ddNik';
    
    if(nargin == 5)
        Ax = Nik*(Wix.*Px);
        Wx = Nik*Wix;
        Ax_ = dNik*(Wix.*Px);
        Wx_ = dNik*Wix;
        Ax__ = ddNik*(Wix.*Px);
        Wx__ = ddNik*Wix;

        if abs(Wx)<eps
            Cx = Ax;
            Cx_ = Ax_-Cx*Wx_;
            Cx__ = Ax__-2*Cx_*Wx_-Cx*Wx__;
        else
            Cx = Ax/Wx;
            Cx_ = (Ax_-Cx*Wx_)/Wx;
            Cx__ = (Ax__-2*Cx_*Wx_-Cx*Wx__)/Wx;
        end
        Cux = Cx;
        dCux  =Cx_; 
        ddCux = Cx__;
    elseif(nargin == 7)
        Ax = Nik*(Wix.*Px);
        Wx = Nik*Wix;
        Ax_ = dNik*(Wix.*Px);
        Wx_ = dNik*Wix;
        Ax__ = ddNik*(Wix.*Px);
        Wx__ = ddNik*Wix;

        if abs(Wx)<eps
            Cx = Ax;
            Cx_ = Ax_-Cx*Wx_;
            Cx__ = Ax__-2*Cx_*Wx_-Cx*Wx__;
        else
            Cx = Ax/Wx;
            Cx_ = (Ax_-Cx*Wx_)/Wx;
            Cx__ = (Ax__-2*Cx_*Wx_-Cx*Wx__)/Wx;
        end
        Cux = Cx;
        dCux  =Cx_; 
        ddCux = Cx__;
        
        Ay = Nik*(Wiy.*Py);
        Wy = Nik*Wiy;
        Ay_ = dNik*(Wiy.*Py);
        Wy_ = dNik*Wiy;
        Ay__ = ddNik*(Wiy.*Py);
        Wy__ = ddNik*Wiy;

        if abs(Wy)<eps
            Cy = Ay;
            Cy_ = Ay_-Cy*Wy_;
            Cy__ = Ay__-2*Cy_*Wy_-Cy*Wy__;
        else
            Cy = Ay/Wy;
            Cy_ = (Ay_-Cy*Wy_)/Wy;
            Cy__ = (Ay__-2*Cy_*Wy_-Cy*Wy__)/Wy;
        end
        Cuy = Cy;
        dCuy  =Cy_; 
        ddCuy = Cy__;
        
    elseif (nargin == 9)
        Ax = Nik*(Wix.*Px);
        Wx = Nik*Wix;
        Ax_ = dNik*(Wix.*Px);
        Wx_ = dNik*Wix;
        Ax__ = ddNik*(Wix.*Px);
        Wx__ = ddNik*Wix;

        if abs(Wx)<eps
            Cx = Ax;
            Cx_ = Ax_-Cx*Wx_;
            Cx__ = Ax__-2*Cx_*Wx_-Cx*Wx__;
        else
            Cx = Ax/Wx;
            Cx_ = (Ax_-Cx*Wx_)/Wx;
            Cx__ = (Ax__-2*Cx_*Wx_-Cx*Wx__)/Wx;
        end
        Cux = Cx;
        dCux  =Cx_; 
        ddCux = Cx__;
        
        Ay = Nik*(Wiy.*Py);
        Wy = Nik*Wiy;
        Ay_ = dNik*(Wiy.*Py);
        Wy_ = dNik*Wiy;
        Ay__ = ddNik*(Wiy.*Py);
        Wy__ = ddNik*Wiy;

        if abs(Wy)<eps
            Cy = Ay;
            Cy_ = Ay_-Cy*Wy_;
            Cy__ = Ay__-2*Cy_*Wy_-Cy*Wy__;
        else
            Cy = Ay/Wy;
            Cy_ = (Ay_-Cy*Wy_)/Wy;
            Cy__ = (Ay__-2*Cy_*Wy_-Cy*Wy__)/Wy;
        end
        Cuy = Cy;
        dCuy  =Cy_; 
        ddCuy = Cy__; 
        
        Az = Nik*(Wiz.*Pz);
        Wz = Nik*Wiz;
        Az_ = dNik*(Wiz.*Pz);
        Wz_ = dNik*Wiz;
        Az__ = ddNik*(Wiz.*Pz);
        Wz__ = ddNik*Wiz;

        if abs(Wz)<eps
            Cz = Az;
            Cz_ = Az_-Cz*Wz_;
            Cz__ = Az__-2*Cz_*Wz_-Cz*Wz__;
        else
            Cz = Az/Wz;
            Cz_ = (Az_-Cz*Wz_)/Wz;
            Cz__ = (Az__-2*Cz_*Wz_-Cz*Wz__)/Wz;
        end
        Cuz = Cz;
        dCuz  =Cz_; 
        ddCuz = Cz__;
            
    end
%     Nik = Nik';
%     dNik = dNik';
%     
%     if(abs(Nik*W)<eps)
%         dcu1 = dNik*(W.*P);
%         dcu2 = (Nik*(W.*P)*(dNik*W));
%         dCu = dcu1-dcu2;
%     else
%         cu = Nik*(W.*P)/(Nik*W);
%         dcu1 = dNik*(W.*P)/(Nik*W);
% %         dcu2 = (Nik*(W.*P)*(dNik*W))/(Nik*W)^2;
%         dcu2 = cu*(dNik*W)/(Nik*W);
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