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


function [x] = cal_4_fun_ts2(a,b,c,d,e)

    b = b/a;
    c = c/a;
    d = d/a;
    e = e/a;
    
    y = cal_3_fun_ts1(1,-c,(b*d-4*e),(4*c-b^2)*e-d^2);

    A1 = 2;
    B1 = b+(b^2+4*y-4*c)^0.5;
    C1 = y+(b*y-2*d)/(b^2+4*y-4*c)^0.5;

    A2 = 2;
    B2 = b-(b^2+4*y-4*c)^0.5;
    C2 = y-(b*y-2*d)/(b^2+4*y-4*c)^0.5;

    delta1 = B1^2-4*A1*C1;
    delta2 = B2^2-4*A2*C2;
    flag1 = 0;
    flag2 = 0;
    
    if(delta1>0)
        x1 = (-B1+delta1^0.5)/(2*A1);
        x2 = (-B1-delta1^0.5)/(2*A1);
        flag1 = 1;
    end

    if(delta2>0)
        x3 = (-B2+delta2^0.5)/(2*A2);
        x4 = (-B2-delta2^0.5)/(2*A2);
        flag2 = 1;
    end
    
    
    if((flag1 == 1)&&(flag2 == 0))
        if((x1>0)&&(x2<0))
            x = x1;
        elseif((x1<0)&&(x2>0))
            x = x2;
        elseif((x1>0)&&(x2>0))
            x = min(x1,x2);
        else 
            x = 0;
        end
    elseif((flag1 == 0)&&(flag2 == 1))
        if((x3>0)&&(x4<0))
            x = x3;
        elseif((x3<0)&&(x4>0))
            x = x4;
        elseif((x3>0)&&(x4>0))
            x = min(x3,x4);
        else 
            x = 0;
        end
    elseif((flag1 == 1)&&(flag2 == 1))
        M = [x1,x2,x3,x4];
        N = sort(M);
        for i = 1:3 
            if((N(i)<0)&&(N(i+1)>0)) 
                break;        
            end
        end
        if(i<=3)
            x = N(i+1);
        else
            x = 0;
        end
    else
            x = 0;
    end
      
end








