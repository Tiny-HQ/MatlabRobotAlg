
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

function [vector,w] = eigenvector(a)

length=size(a);
if(length(1)~=length(2))
    return;
end
% if(rank(a-a')~=0)
%     return;
% end
n=length(1);
count=0;
u=eye(n,n);
ma=a;
while true
    dbmax=0.0;
    for i=2:n
        for j=1:(i-1)
            d=abs(ma(j,i));
            if(d>dbmax)
                dbmax=d;
                nrow=j;
                ncol=i;
            end
        end
    end
    if(abs(dbmax)<1e-10)
        break;
    end
    if(count>n*n*30)
        break;
    end
    count=count+1;

    dbApp=ma(nrow,nrow);
    dbApq=ma(nrow,ncol);
    dbAqq=ma(ncol,ncol);

     dbAngle = 0.5*atan2(-2*dbApq,dbAqq-dbApp);
     dbSinTheta = sin(dbAngle);
     dbCosTheta = cos(dbAngle);
     rpq=eye(n,n);
     rpq(nrow,nrow)=dbCosTheta;
     rpq(ncol,ncol)=dbCosTheta;
     rpq(ncol,nrow)=-dbSinTheta;
     rpq(nrow,ncol)=dbSinTheta;
     ma=rpq*ma*(rpq');
     u=rpq*u;
end
vector=u';
w=diag(ma);

for i=1:n
    for j=1:(n-i)
        if(abs(w(j))<abs(w(j+1)))
            tempw=w(j+1);
            w(j+1)=w(j);
            w(j)=tempw;
            tempu=vector(1:n,j+1);
            vector(1:n,j+1)=vector(1:n,j);
            vector(1:n,j)=tempu;
        end
    end
end