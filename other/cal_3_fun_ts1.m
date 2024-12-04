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

%ax^3+bx^2+cx+d = 0;

function x = cal_3_fun_ts1(a,b,c,d)

    ep = 0.00001;

    A = b^2-3*a*c;
    B = b*c-9*a*d;
    C = c^2-3*b*d;
    
    
    if((abs(A)<ep)&&(abs(B)<ep))
        x = -b/3*a;
        return;
    end
    
    delta = B^2-4*A*C;
    
    if(abs(delta)<ep)
        x = -b/a+B/A;
    elseif(delta>0)
        Y1 = A*b+3*a*((-B+delta^0.5)/2);
        Y2 = A*b+3*a*((-B-delta^0.5)/2);
        count1 = 0;count2 = 0;
        if(Y1<0)
            Y1 = -Y1;count1 = 1;
        end
        if(Y2<0)
            Y2 = -Y2;count2 = 1;
        end  
        x = (-b-((-1)^count1*Y1^(1/3)+(-1)^count2*Y2^(1/3)))/(3*a);
    else
        T = (2*A*b-3*a*B)/(2*A^1.5);
        theta = arcos(T);
        x =( -b-2*A^0.5*cos(theta/3))/3*a;
    end
    
end
