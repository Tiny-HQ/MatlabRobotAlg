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
%ss :start s;
%se :end s;
%vs: velocity of start point;
%ve: velocity of end point;
%v_max: max velocity;  v_max>=ve,vs
%A: acceleration;
%J:jerk


function [tt,j,error] = s_curve_all_parameter_cal_para(ss,se,vs,ve,v_max,A,J)

    error = 0;
    s = abs(ss-se);%se need to be always bigger then ss;
    t = zeros(1,7);
    tt = zeros(1,7);
    j = J;% if method is discrete, need to ajust,or error length is large need to discrete
   if((abs(vs-v_max)<eps )&&(abs(ve-v_max)<eps) )%ve = vs = v_max;
        t(4) = s/v_max;
   elseif((abs(vs-v_max)<eps)) %vs = v_max,ve<v_max;
        [sd1,td1] = s_curve_cal_para_sad(v_max,ve,A,J);
        if(sd1<s)
            t = td1;
            t(4) = (s-sd1)/vs;
        else%only adjust J and A;
           % there is a contradiction, ve vs A J should not be change, but not
           % satisfy the s condition. but need to adjust vs ve A J some of
           % them.....or report an error??
           t(5) = s/(vs+ve);
           t(6) = 0;
           t(7) = t(5);j = (vs-ve)/t(5)^2;
           error = 1;
        end
   elseif ((abs(ve-v_max)<eps))%ve = v_max,vs<v_max;
       [sa1,ta1] = s_curve_cal_para_sad(vs,v_max,A,J);
       if(sa1<s)
           t = ta1;
           t(4) = (s-sa1)/ve;
       else %only adjust J and A;
           % there is a contradiction, ve vs A J should not be change, but not
           % satisfy the s condition. but need to adjust vs ve A J one of
           % them.....or report an error??
           t(1) = s/(vs+ve);
           t(2) = 0;
           t(3) = t(1);j = (ve-vs)/t(1)^2;
           error = 1;
       end
   else%ve < v_max,vs<v_max;
        [sa2,ta2] = s_curve_cal_para_sad(vs,v_max,A,J);
        sa22 = sad(ta2(1),ta2(2),ta2(3),vs,v_max);
        [sd2,td2] = s_curve_cal_para_sad(v_max,ve,A,J);
        if(sa2+sd2<s)
            t(1) = ta2(1);t(2) = ta2(2);t(3) = ta2(3);
            t(5) = td2(5);t(6) = td2(6);t(7) = td2(7);
            t(4) = (s-sa2-sd2)/v_max;
        else
            vs1 = min(vs,ve);
            ve1 = max(vs,ve);
            [sa3,ta3] = s_curve_cal_para_sad(vs1,ve1,A,J);
            if(sa3<s)%exist a velocity v'>vs and v'>ve;-medium block
                v0 = max(vs,ve);v1 = v_max;  v = (v0+v1)/2.0;
                count = 0;
                while(1)            
                    [sa4,ta4] = s_curve_cal_para_sad(vs,v,A,J);
                    [sd4,td4] = s_curve_cal_para_sad(v,ve,A,J);
                    if(sa4+sd4-s>0.0001) %if s' unit is mm, keep 2 bit, if unit is m, keep 4 bit;
                        v1 = v;
                        v = (v0+v)/2.0;  
                    end
                    if(sa4+sd4-s<-0.0001)
                        v0 = v;
                        v = (v+v1)/2;
                    end
                    if(abs(sa4+sd4-s)<0.0001)
                        t(1) = ta4(1);t(2) = ta4(2);t(3) = ta4(3);
                        t(5) = td4(5);t(6) = td4(6);t(7) = td4(7);
                        break;
                    end   
                     count =  count +1;
                     if(count>1000)
                         error = 1;%iterator dump;
                     end
                end
                
            else%short block, only exist acceleration or deceleration segment;
                %error.....must be equal to s,otherwise gg;
                if (abs(sa3-s)<0.0001)% probability is too small;but dont show that is impossible;
                    if(ve>vs)
                        [sa5,ta5] = s_curve_cal_para_sad(vs,ve,A,J);
                        t(1) = ta5(1);t(2) = ta5(2);t(3) = ta5(3);
                    else
                        [sd5,td5] = s_curve_cal_para_sad(vs,ve,A,J);
                        t(5) = td5(5);t(6) = td5(6);t(7) = td5(7);
                    end
                else
                    error = 1;
                end
            end
        end   
   end
   
   
   tt(1) = t(1);
   tt(2) = tt(1)+t(2);
   tt(3) = tt(2)+t(3);
   tt(4) = tt(3)+t(4);
   tt(5) = tt(4)+t(5);
   tt(6) = tt(5)+t(6);
   tt(7) = tt(6)+t(7);
end

function [s,t] = s_curve_cal_para_sad(vs,ve,A,J)
    t = zeros(1,7);
    if(vs<ve) %acceleration
       if(ve-vs<= A^2/J)
           s = (vs+ve)*sqrt((ve-vs)/J);
           t(2) = 0;
           t(1) = sqrt((ve-vs)/J);
           t(3) = sqrt((ve-vs)/J);
       else
           s = 1/2*(vs+ve)*(2*A/J+(ve-vs-A^2/J)/A);
           t(1) = A/J;
           t(3) = A/J;
           t(2) = (ve-vs-A^2/J)/A;
       end
       
    else %deceleration
       if(vs-ve<= A^2/J)
           s = (vs+ve)*sqrt((vs-ve)/J);
           t(6) = 0;
           t(5) = sqrt((vs-ve)/J);
           t(7) = sqrt((vs-ve)/J);
       else
           s = 1/2*(vs+ve)*(2*A/J+(vs-ve-A^2/J)/A);
           t(6) = (vs-ve-A^2/J)/A;
           t(5) = A/J;
           t(7) = A/J;
       end
    end
    

end

function s = sad(t1,t2,t3,vs,ve)
    s = 1/2*(vs+ve)*(t1+t2+t3);
end