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
function [u,w] = eigenvector_v2(a,n)
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
    if(dbmax<1e-10)
        break;
    end
    if(count>n*n*30)
        break;
    end
    count=count+1;
    %«ÛA(k+1)=R(k+1)*A(k)*R(k+1)
    dbApp=ma(nrow,nrow);
    dbApq=ma(nrow,ncol);
    dbAqq=ma(ncol,ncol);
    %º∆À„R
     dbAngle = 0.5*atan2(-2*dbApq,dbAqq-dbApp);
     %dbAngle = 0.5*atan(-2*dbApq/(dbAqq-dbApp));
     dbSinTheta = sin(dbAngle);
     dbCosTheta = cos(dbAngle);
     dbSin2Theta = sin(2*dbAngle);
     dbCos2Theta = cos(2*dbAngle);
     ma(nrow,nrow)=dbApp*dbCosTheta*dbCosTheta + dbAqq*dbSinTheta*dbSinTheta + 2*dbApq*dbCosTheta*dbSinTheta;
     ma(ncol,ncol)=dbApp*dbSinTheta*dbSinTheta + dbAqq*dbCosTheta*dbCosTheta - 2*dbApq*dbCosTheta*dbSinTheta;
     ma(nrow,ncol)=0.5*(dbAqq-dbApp)*dbSin2Theta + dbApq*dbCos2Theta;
     ma(ncol,nrow)=ma(nrow,ncol);
     for i=1:n
         if((i~=nrow)&&(i~=nrow))
            dbmax=ma(i,nrow);
            ma(i,nrow)=ma(i,ncol)* dbSinTheta + dbmax * dbCosTheta; 
            ma(i,ncol)=ma(i,ncol)* dbCosTheta - dbmax * dbSinTheta;
         end
     end
      for j=1:n
         if((j~=nrow)&&(j~=nrow))
            dbmax=ma(nrow,j);
            ma(nrow,j)=ma(ncol,j)* dbSinTheta + dbmax * dbCosTheta; 
            ma(ncol,j)=ma(ncol,j)* dbCosTheta - dbmax * dbSinTheta;
         end
      end
     for i=1:n
         dbmax=u(i,nrow);
         u(i,nrow)=u(i,ncol)* dbSinTheta + dbmax*dbCosTheta; 
         u(i,ncol)=u(i,ncol)* dbCosTheta - dbmax*dbSinTheta;
     end
end
w=diag(ma);
end

