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










function [yn,W,en]=LMS(xn,dn,M,mu)
    itr = length(xn);
    en = zeros(itr,1);             % �������,en(k)��ʾ��k�ε���ʱԤ�������ʵ����������
    W  = zeros(M,itr);             % ÿһ�д���һ����Ȩ����,ÿһ�д���-�ε���,��ʼΪ0
    % ��������
    for k = M:itr                  % ��k�ε���
        x = xn(k:-1:k-M+1);        % �˲���M����ͷ������
        y = W(:,k-1).' * x;        % �˲��������
        en(k) = dn(k) - y;         % ��k�ε��������
        % �˲���Ȩֵ����ĵ���ʽ
        W(:,k) = W(:,k-1) + 2*mu*en(k)*x;
    end
    % ������ʱ�˲������������  r���û��yn���ز������Բ�Ҫ�����
    yn = inf * ones(size(xn)); % inf ����������˼
    for k = M:length(xn)
        x = xn(k:-1:k-M+1);
        yn(k) = W(:,end).'* x;%�����õ�����ѹ��Ƶõ����
    end

end
