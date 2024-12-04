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




function [Pc,u_vec,error] = mnurbs_cal_inverse_point_error(Q,k,n)

    [mm,nn] = size(Q);
    R_n = Q(2:mm-1,:);

    le = zeros(mm-1,1);
    for i = 1:mm-1
        tmp1 = Q(i,:);
        tmp2 = Q(i+1,:);
        le(i) = sqrt(sum((tmp1(1)-tmp2(1))^2+(tmp1(2)-tmp2(2))^2));
    end

    u_ = zeros(mm,1);
    le_sum = sum(le);
    le_ = 0;
    for i = 2:mm
        le_ = le_+le(i-1);
       u_(i) = le_/le_sum;   
    end

    u_vec = mnurbs_inverse_cal_control_point_vector(n,mm,k,u_);
    T = zeros(mm-2,n-2);
    for i = 1:mm-2
        [Nik,dNik,ddNik] = mnurbs_cal_basis_func_matrix(u_(i+1),k,u_vec);
        T(i,:) = Nik(2:n-1)';
        if(nn ==2)
            R_n(i,1) = R_n(i,1)-Q(1,1)*Nik(1)-Q(mm,1)*Nik(length(Nik));
            R_n(i,2) = R_n(i,2)-Q(1,2)*Nik(1)-Q(mm,2)*Nik(length(Nik));
        elseif (nn == 3)
            R_n(i,1) = R_n(i,1)-Q(1,1)*Nik(1)-Q(mm,1)*Nik(length(Nik));
            R_n(i,2) = R_n(i,2)-Q(1,2)*Nik(1)-Q(mm,2)*Nik(length(Nik));
            R_n(i,3) = R_n(i,3)-Q(1,3)*Nik(1)-Q(mm,3)*Nik(length(Nik));
        end
    end

    R = zeros(n-2,nn);
    for i = 1:n-2
        R(i,:) = T(:,i)'*R_n(:,:);
        % R(i,2) = T(:,i)'*R_n(:,2);
        %R(i,3) = T(:,i)'*R_n(:,3);
    end
    if(nn == 2)
        Pc(1,1) = Q(1,1);Pc(1,2) = Q(1,2);Pc(n,1) = Q(mm,1);Pc(n,2) = Q(mm,2);
    elseif(nn ==3)
        Pc(1,1) = Q(1,1);Pc(1,2) = Q(1,2);Pc(1,3) = Q(1,3);Pc(n,1) = Q(mm,1);Pc(n,2) = Q(mm,2);Pc(n,3) = Q(mm,3);
    end
    
    Pc(2:n-1,:) = inv(T'*T)*R(:,:);
    %u_vec = mnurbs_cal_knot_ext(k,n,1);
    Cu= zeros(mm-2,nn);

    error = 0;
     for i = 1:mm-2
         [Nik,dNik,ddNik] = mnurbs_cal_basis_func_matrix(u_(i+1),k,u_vec);
         Cu(i,:) = Nik'*Pc(:,:); 
         if(nn == 2)
            error = error+sqrt((Cu(i,1)-Q(i+1,1))^2+(Cu(i,2)-Q(i+1,2))^2);
         elseif(nn == 3)
             error = error+sqrt((Cu(i,1)-Q(i+1,1))^2+(Cu(i,2)-Q(i+1,2))^2+(Cu(i,3)-Q(i+1,3))^2);     
         end
     end


end