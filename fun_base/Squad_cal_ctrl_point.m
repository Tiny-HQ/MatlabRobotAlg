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
function [si] = Squad_cal_ctrl_point(qi,qi_m1,qi_p1)
     conq = Quat_Conj(qi);
     
     qii_1 = conq.*qi_m1;
     qii__1 = conq.*qi_p1;   
    lnq = Quat_Log(qii_1)+Quat_Log(qii__1);
    lnq = lnq* ( -0.25);  
    si = qi.*Quat_Exp(lnq);
end