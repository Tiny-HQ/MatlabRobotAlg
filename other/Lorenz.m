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
 function dx = Lorenz( t , x )
 dx1 = 10*(x(2)-x(1));
 dx2 = 28*x(1)-x(2)-x(1)*x(3);
 dx3 = -(8/3)*x(3)+x(1)*x(2) ;
 dx = [ dx1 dx2 dx3 ]' ;
 end