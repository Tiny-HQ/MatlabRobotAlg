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




clear    
clc;
N=200;    
w(1)=0;                     %w?????  
w=randn(1,N);    
x(1)=25;    
a=1;                        %a????A(k)  
for k=2:N;    
x(k)=a*x(k-1)+w(k-1);    
end    
V=randn(1,N);               %V?????  
q1=std(V);    
Rvv=q1.^2;    
q2=std(x);    
Rxx=q2.^2;     
q3=std(w);    
Rww=q3.^2;    
c=0.8;                      %c????H(k)  
Y=c*x+V;                    %Y????  
p(1)=0;    
s(1)=0;    
for t=2:N;    
p1(t)=a.^2*p(t-1)+Rww;     %p1????p'  
b(t)=c*p1(t)/(c.^2*p1(t)+Rvv);    
s(t)=a*s(t-1)+b(t)*(Y(t)-a*c*s(t-1));    
p(t)=p1(t)-c*b(t)*p1(t);    
end    
t=1:N;    
plot(t,s,'r',t,Y,'g',t,x,'b'); 