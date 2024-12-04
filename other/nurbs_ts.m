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


clc;
clear;

close all;

% control points ;
P = [0 1 2.5 4 5 ;
    0 2 4 9 4 ];
n = size(P,2) - 1;


% order
k = 3;

% knot vector;
t = [0 0 0 1 2 3 3 3 ];

% weight vector;
h = 1;

w = [1 1 h 1 1 ];

% paramater range

u = linspace(min(t),max(t),200);

% Rational B - spline Basis Function % ================================== 
% All order Belending Function calculation 
% Blending Function Formula % 
%          (u - t(i))*N(i,k-1)(u) + (t(i+k) - u)*N(i+1,k-1)(u) 
%N(i,k)(u) = ----------------------   -------------------------- 
%          t(i+k-1) - t(i)             t(i+k) - t(i+1) 
%                     ^                             ^ 
%                     |                             | 
%                     |                             | 
%                     |                             | 
% Let's assume        a                             b 
N = cell(n + k,k); % Defining blending function array 

for i=1:k      
	if i==1      
		for j=1:n+k          
			for l=1:length(u)             
				if u(l)>t(j) && u(l)<t(j+1)                 
					 N{j,i}(l)=1;             
				else                
					 N{j,i}(l)=0;             
				end         
			end     
		end     
	else                           
		for j=1:(length(N(:,i-1))-(i-1))                          	
			 for l=1:length(u)            
				 if (t(j+i-1)-t(j))==0                 
					temp1=0;              
				else                 
					 temp1=((u(l)-t(j))*N{j,i-1}(l))/(t(j+i-1)-t(j));              
				end             
				if (t(j+i)-t(j+1))==0                 
					temp2=0;              
				else                 
					temp2=((t(j+i)-u(l))*N{j+1,i-1}(l))/(t(j+i)-t(j+1));             
				end             
				N{j,i}(l)=temp1+temp2;         
			end     
		end     
	end 
end 
% Plotting B - Spline Blending functions 
% ======================================
% figure('units','normalized','outerposition',[0 0 1 1]); 
% hold on 
% for i=1:n+1     
% 	subplot(n+1,1,i)     
% 	plot(u,N{i,end},'b','LineWidth',2)     
% 	grid on; 
% end
% hold off 
% grid on 
% disp('execution paused to display figure, "enter" to continue'); %pause 
% close; 
% Formula for Rational B - Spline curve 
% ===================================== 
% 
%                     w(i) * N(i,k)(u) 
% R(i,k)(u)  =  --------------------------- 
%               Sum(i=1:n+1)w(i) * N(i,k)(u) 
% 
% Defining a cell array for R(i,k)(u) 
% ================================== 
R = cell(n + 1,1);  
% Denominator Calculation 
% ======================= 
denom = zeros(1,length(u)); 
for i = 1:n+1     
	denom = w(i) * N{i,k} + denom; 
end

 % Ratio calculation and plotting Basis Function 
% =============================================

%  figure('units','normalized','outerposition',[0 0 1 1]);
%  hold on 
for i = 1:n+1     
	num = w(i) * N{i,k};     
	R{i,1} = num./denom;    
% 	plot(u,R{i,end},'k','LineWidth',2);     
% 	grid on;     
% 	title('NURBS Basis Function');     
% 	hold on; 
end 
% hold off 
% grid on 
% disp('execution paused to display figure, "enter" to continue'); %pause 
% close; 
% NURBS curve plotting 
% ====================
 
B = zeros(2,length(u)); % Defing a matrix to store all points 
for i = 1:n+1     
	B(1,:) = P(1,i) * R{i,1} + B(1,:);
end 
for j = 1:n+1     
	B(2,:) = P(2,j) * R{j,1} + B(2,:); 
end 
% To add first and last control points, to get continous curve

 B(:,1) = P(:,1);
 B(:,end) = P(:,end); 
% Ploting the B - Spline Curve 
% ============================ 
figure('units','normalized','outerposition',[0 0 1 1]); 
hold on; 
plot(P(1, :), P(2, :), 'ro','LineWidth',4); 
plot(P(1, :), P(2, :), 'b','LineWidth',2); 
plot(B(1,:),B(2,:),'o'); 
title('Rational B - Spline Curve');
hold off
grid on
disp('execution paused to display figure, "enter" to continue'); %pause 
% close;






















