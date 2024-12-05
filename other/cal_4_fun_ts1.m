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



%?????????0??;
%????????0???;

function [x] = cal_4_fun_ts1(a,b,c,d,e)

    ep = 0.0001;
    onediv3 = (1/3);
    D=3*b-8*a*c;
    E=-b+4*a*b*c-8*a*d;
    F=3*b+16*a*c-16*a*b*c+16*a*b*d-64*a*e;
    A=D-3*F;
    B=D*F-9*E;
    C=F-3*D*E;
    
    T = B^2-4*A*C;

    if((abs(D)<ep)&&(abs(E)<ep)&&(abs(F)<ep))
        x = -b/(4*a);
    end
    
    if((abs(D*E*F)>ep)&&(abs(A)<ep)&&(abs(B)<ep)&&(abs(C)<ep))
        x1 = (-b*D+9*E)/(4*a*D);
        x2 = (-b*D-3*E)/(4*a*D);
        if((x1<0)&&(x2>0))
            x = x2;
        elseif((x2<0)&&(x1>0))
            x = x1;
        elseif((x2>0)&&(x1>0))
            if(x1>x2)
                x = x2;
            else
                x = x1;
            end
        end
    end

    if((abs(E)<ep)&&(abs(F)<ep)&&abs(D)>ep)
        x1 = (-b+D^0.5)/(4*a);x2 = (-b-D^0.5)/(4*a);
        if((x1<0)&&(x2>0))
            x = x2;
        elseif((x2<0)&&(x1>0))
            x = x1;
        elseif((x2>0)&&(x1>0))
            if(x1>x2)
                x = x2;
            else
                x = x1;
            end
        end
    end
    
    if((abs(A*B*C)>0)&&(abs(T)<ep))
        if(A*B>0)
            x1 = ((-b+sgn(A*B*E)*(D-B/A)^0.5)+(2*B/A)^0.5)/(4*a);
            x2 = ((-b+sgn(A*B*E)*(D-B/A)^0.5)-(2*B/A)^0.5)/(4*a);
        else
            x1 = (-b-sgn(A*B*E)*(D-B/A)^0.5)/(4*a);
            x2 = -1.0;
        end
        if((x1<0)&&(x2>0))
            x = x2;
        elseif((x2<0)&&(x1>0))
            x = x1;
        elseif((x2>0)&&(x1>0))
            if(x1>x2)
                x = x2;
            else
                x = x1;
            end
        end
    end
    
    if(T>0)
       
        z1 = A*D+3/2*(-B+T^0.5);
        z2 = A*D+3/2*(-B-T^0.5);
        z1 = -z1;z2 = -z2;
        z = D^2-D*(-z1^onediv3-z2^onediv3)+(-z1^onediv3-z2^onediv3)^2-3*A;
        
        x1 = (-b+sgn(E)*((D-z1^onediv3-z2^onediv3)/3)^0.5+((2*D-(-z1^onediv3-z2^onediv3)+2*z^0.5)/3.0)^0.5)/(4*a);
        x2 = (-b+sgn(E)*((D-z1^onediv3-z2^onediv3)/3)^0.5-((2*D-(-z1^onediv3-z2^onediv3)+2*z^0.5)/3.0)^0.5)/(4*a);
        if((x1<0)&&(x2>0))
            x = x2;
        elseif((x2<0)&&(x1>0))
            x = x1;
        elseif((x2>0)&&(x1>0))
            if(x1>x2)
                x = x2;
            else
                x = x1;
            end
        end
        
        
    else
        
        theta = arccos((3*B-2*A*D)/(2*A*A^0.5));
        y1 = (D-2*A^0.5*cos(theta/3))/3.0;
        y2 = (D+A^0.5*(cos(theta/3)+3^0.5*sin(theta/3)))/3;
        y3 = (D+A^0.5*(cos(theta/3)-3^0.5*sin(theta/3)))/3;
        
        if((abs(E)<ep)&&(D>0)&&(F>0))
            x1 = (-b+(D+2*F^0.5)^0.5)/(4*a);
            x2 = (-b-(D+2*F^0.5)^0.5)/(4*a);
            x3 = (-b+(D-2*F^0.5)^0.5)/(4*a);
            x4 = (-b-(D-2*F^0.5)^0.5)/(4*a);
            
        elseif(abs(E)>ep)
           % y2 = max(y1,y2,y3);
            x1 = (-b+sgn(E)*y1^0.5+(y2^0.5+y3^0.5))/(4*a);
            x2 = (-b+sgn(E)*y1^0.5-(y2^0.5+y3^0.5))/(4*a);
            x3 = (-b-sgn(E)*y1^0.5+(y2^0.5-y3^0.5))/(4*a);
            x4 = (-b-sgn(E)*y1^0.5-(y2^0.5-y3^0.5))/(4*a);
        end
    end


end






function x = sgn(x1)
    
    ep = 0.0001;

    if(abs(x1)<ep)
        x = 0;
    elseif(x1>0)
        x = 1;
    else
        x = -1;
    end

end
























