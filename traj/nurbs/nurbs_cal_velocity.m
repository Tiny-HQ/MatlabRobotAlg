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


% forward - backward scanning;


function [v,ss] = nurbs_cal_velocity(s,k_cc,V_max,A_max,J_max)

    n = length(s);
    v = zeros(1,n+1);
    ss = zeros(1,n+1);
    v_f = zeros(1,n+1);
    v_b = zeros(1,n+1);
    
    s_f = s;
    k_cf = k_cc;
    
    s_b = zeros(1,n);
    k_cb = zeros(1,n-1);
    for i = 1:n
       s_b(i) = s(n-i+1);   
    end
    
    for i = 1:n-1
         k_cb(i) = k_cc(n-i);
    end

    %forward
    for i = 1:n
        A = 1;B = v_f(i);C = -v_f(i)^2;D = -v_f(i)^3-J_max*s(i);
        v_f(i+1) =  newton_method(A, B, C, D, v_f(i), 0.1, 20,J_max,A_max,s_f(i));
    end

    %backward
   for i = 1:n
        A = 1;B = v_b(i);C = -v_b(i)^2;D = -v_b(i)^3-J_max*s(i);
        v_b(i+1) =  newton_method(A, B, C, D, v_b(i), 0.1, 20,J_max,A_max,s_b(i));
   end


    for i = 1:n+1
        if((i ~= 1)&&(i~=n+1))
%             GG = [v_f(i) v_b(n-i+2) sqrt(A_max/k_cf(i-1)) (J_max/(k_cf(i-1)*k_cf(i-1)))^(1/3) V_max];
%             disp(GG);
            v(i) = min([v_f(i) v_b(n-i+2) sqrt(A_max/k_cf(i-1)) (J_max/(k_cf(i-1)*k_cf(i-1)))^(1/3) V_max] ) ; 
        else
            v(i) = min([v_f(i) v_b(n-i+2) V_max] ) ; 
        end
        if i~= n+1
            ss(i+1) = ss(i)+s(i);
        end
    end


end



function root = newton_method(a, b, c, d, x0, tol, max_iter,J_max,A_max,S)
    
    f = @(x) a*x^3 + b*x^2 + c*x + d;
    df = @(x) 3*a*x^2 + 2*b*x + c;
    
    x00 = x0;
    iter = 0;
    if((abs(b)<eps)&&(abs(c)<eps))
        root = (-d/a)^(1/3);
        if (root<0)% that is impossible;
           root = 0; 
        end
        return;
    end
    
    while iter < max_iter
        
        x1 = x0 - f(x0) / df(x0);
        if abs(x1 - x0) < tol
            root = x1;
            return;
        end
        x0 = x1;
        Vi1 = x1;Vi = x00;
        if (abs(Vi-Vi1)<=A_max^2/J_max)
            continue;
        else
            A = J_max^2;
            B = A_max^2;
            C = -J_max*Vi^2+A_max^2*Vi-2*J_max*A_max*S;
            Delta = B^2-4*A*C;
            r1 = (-B+sqrt(Delta))/(2*A);
            r2 = (-B-sqrt(Delta))/(2*A);
            root = judge_root(r1,r2);
            return;
        end
        
        iter = iter + 1;
    end
    
    error('????????????');
end

function [r] = judge_root(r1,r2)
    if((r1>0) &&(r2<0))
        r = r1;
    elseif ((r1<0) &&(r2>0))
        r = r2;
    elseif ((r1>0) &&(r2>0))
        if(r1>r2)
            r = r2;
        else
            r = r1;
        end
        
    else
        r = 0;
    end
    
end

