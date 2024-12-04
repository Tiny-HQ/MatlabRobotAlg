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






function [r,n]=mulNewton(x0,funcMat,var,eps)
% x0为两个变量的起始值,funcMat是两个方程,var为两个方程的两个变量,eps控制精度
% 牛顿迭代法解二元非线性方程组
    if nargin==0
        x0 = [0.2,0.6];
        funcMat=[sym('(15*x1+10*x2)-((40-30*x1-10*x2)^2*(15-15*x1*x1*x1))*5e-4')...
                 sym('(15*x1+10*x2)-((40-30*x1-10*x2)*(10-10*x2))*4e-2')

                 ];
        var=[sym('x1') sym('x2')];
        eps=1.0e-4;
    end

    n_Var = size(var,2);%变量的个数
    n_X = size(x0,2);%变量的个数
    n_Func = size(funcMat,2);%函数的个数

    if n_X ~= n_Var && n_X ~= n_Func
        fprintf('Expression Error!\n');
        exit(0);
    end

    %核心的计算过程，先执行第一遍
    r=x0-myf(x0, funcMat, var)*inv(dmyf(x0, funcMat, var));
    %迭代次数统计
    n=0;

    %设置初始的容差
    tol=1;
    while tol>=eps
        x0=r;
        r=x0-myf(x0, funcMat, var)*inv(dmyf(x0, funcMat, var));

        %得到本次的计算精度（多维的判断可以理解为多维向量长度的值为精度值）
        tol=norm(r-x0);
        n=n+1;
        if(n>100000)
            disp('迭代步数太多，方程可能不收敛');
            return;
        end
    end
end % end mulNewton

% 输入參数x为两个数值,func为1*2符号变量矩阵,var为1*2符号变量矩阵中的变量
% 返回值为1*2矩阵,内容为数值
function f=myf(x,funcMat, varMat)
    n_X = size(x,2);%变量的个数
    f_Val = zeros(1,n_X);
    for i=1:n_X
        tmp_Var = cell(1,n_X);
        tmp_X = cell(1,n_X);
        for j=1:n_X
            tmp_Var{j} = varMat(1,j);
            tmp_X{j} = x(1,j);
        end
        f_Val(i) = subs(funcMat(1, i), tmp_Var, tmp_X);
    end
    f=f_Val;
end % end myf

% 返回值为2*2矩阵,内容为数值
%df=[df1/x1, df1/x2;
%    df2/x1. df2/x2];
function df_val=dmyf(x, funcMat, varMat)
    n_X = size(x,2);%变量的个数
    df =cell(n_X, n_X);
    for i=1:n_X
        for j=1:n_X
            df{i,j} = diff(funcMat(1, i), varMat(1, j));
        end
    end

    df_val=zeros(n_X, n_X);

    for i=1:n_X
        for j=1:n_X
            tmp_Var = cell(1,n_X);
            tmp_X = cell(1,n_X);
            for k=1:n_X
                tmp_Var{k} = varMat(1,k);
                tmp_X{k} = x(1,k);
            end
            df_val(i,j) = subs(df{i,j}, tmp_Var, tmp_X);
        end
    end
end % end dmyf
