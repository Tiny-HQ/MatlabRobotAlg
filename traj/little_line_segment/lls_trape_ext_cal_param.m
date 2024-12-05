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


function [t,acc,vc,error] = lls_trape_ext_cal_param(vs,ve,v,a,s)


        tempvs = vs;tempve = ve;
        vs = min(tempvs,tempve);
        ve = max(tempvs,tempve);
        T = (ve-vs)/a;
        sa_min = 0.5*T*(ve+vs);
        error = 0;
        
        if(s<sa_min)
%             t_min = 2*s/(ve+vs);
%             t1 = t_min/2;
%             t3 = t_min/2;
%             t2 = 0;
%             a = (ve-vs)/t_min;v = (vs+ve)/2;
           % error('gg');
           error = 1;
        elseif(v<=vs)
            t1 = (vs-v)/a;
            t3 = (ve-v)/a;
            sa = (v+vs)*t1/2+(v+ve)*t3/2;
            if sa>s  
                b = vs/a-ve/a;
                A = -2*a;B = 2*vs-2*a*b+2*ve;C = 2*vs*b-a*b^2-2*s;
                t3 = (-B+sqrt(B^2-4*A*C))/(2*A);
                t1 = t3+b;
                t2 = 0.0;
            
            else
                t2 = (s-(vs+v)*t1/2-(ve+v)*t3/2)/v;
            end
        elseif (v<=ve)&&(v>vs)
            t1 = (v-vs)/a;
            t3 = (ve-v)/a;
            sa = (vs+ve)*(t1+t3)/2;
            if sa>s
%                 T = 2*s/(vs+ve);
%                 a = (ve-vs)/T;
%                 t1 = (v-vs)/a;
%                 t3 = (ve-v)/a;
%                 t2 = 0.0;
                error = 1;
            else
                t2 = (s-(v+vs)*t1/2-(v+ve)*t3/2)/v;
            end
        else
            t1 = (v-vs)/a;
            t3 = (v-ve)/a;
            sa = (v+vs)*t1/2+(v+ve)*t3/2;
            if sa>s
                b = ve/a-vs/a;
                A = 2*a;B = vs+3*ve+a*b;C = b*(vs+ve)-2*s;
                t3 = (-B+sqrt(B^2-4*A*C))/(2*A);
                t1 = t3+b;
                t2 = 0.0;     
            else
                t2 = (s-(v+vs)*t1/2-(v+ve)*t3/2)/v;
            end
            
        end
          
        

        
        if(error == 0)
            if tempvs>tempve
                T1 = t1;T2 = t2;T3 = t3;
                t1 = T3;t2 = T2; t3 = T1;
            end
            t(1) = t1;
            t(2) = t(1)+t2;
            t(3) = t(2)+t3;    
            acc = a; 
            vc = v;

        else
            t(1) = 0.0;
            t(2) = 0.0;
            t(3) = 0.0;    
            acc = a; 
            vc = v;
        end
%     end




end

















