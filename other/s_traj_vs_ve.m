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
%% DoubleSTrajectory Planner Function
%
%
% T_s ... Sample Time for Trajectory Planning (for example 0.001 => 1 Millisecond)
%
% q_0 ... Startposition for Trajectory Planning
% q_1 ... Endposition for Trajectory Planning
% v_0 ... Velocity at Starting of new Trajectory
% v_1 ... Velocity at End of Trajectory
%
% v_min, v_max ... Velocity Limits for Trajectory
% a_min, a_max ... Acceleration Limits for Trajectory
% j_min, j_max ... Jerk Limits for Trajectory Planning
%
function [qd, qdp, qdpp, qdppp] = s_traj_vs_ve( T_s, q_0, q_1, v_0, v_1, v_max, v_min, a_max, a_min, j_max, j_min )

Ts = T_s;

qd_0 = q_0; qd_1 = q_1;
vd_0 = v_0; vd_1 = v_1;

vd_max = v_max;  vd_min = v_min;
ad_max = a_max;  ad_min = a_min;
jd_max = j_max;  jd_min = j_min;

%% Given the initial conditions (qd_0, qd_1, vd_0, vd_1) compute 
% BLOCK 1
%q_0, q_1, v_0, v_1, where sigma is direction of motion

sigma = sign(qd_1-qd_0);

q_0 = sigma * qd_0;
q_1 = sigma * qd_1;
v_0 = sigma * vd_0;
v_1 = sigma * vd_1;

v_max = (sigma+1)/2*vd_max + (sigma-1)/2*vd_min;
v_min = (sigma+1)/2*vd_min + (sigma-1)/2*vd_max;
a_max = (sigma+1)/2*ad_max + (sigma-1)/2*ad_min;
a_min = (sigma+1)/2*ad_min + (sigma-1)/2*ad_max;
j_max = (sigma+1)/2*jd_max + (sigma-1)/2*jd_min;
j_min = (sigma+1)/2*jd_min + (sigma-1)/2*jd_max;

%% Assuming that v_max and a_max are reached compute the time intervals
%

% acceleration part
if( ((v_max - v_0)*j_max) < a_max^2 ) 
  Tj_1 = sqrt((v_max-v_0)/j_max);
  Ta = 2* Tj_1;
else
  Tj_1 = a_max/j_max;
  Ta = Tj_1 + (v_max - v_0)/a_max;
end

% deceleration part
if( ((v_max - v_1)*j_max) < a_max^2 )
  Tj_2 = sqrt((v_max-v_1)/j_max);
  Td = 2*Tj_2;
else
  Tj_2 = a_max/j_max;
  Td = Tj_2 + (v_max-v_1)/a_max;
end

% finally it is possible to determine the time duration of the constant
% velocity phase
Tv = (q_1-q_0)/v_max - Ta/2*(1+v_0/v_max) - Td/2*(1+v_1/v_max);

%% Now checking if Tv > 0 or smaller 0
%

% v_max is not reached 
if( Tv < 0 )
  % set Tv = 0 (because of errors in computation later)
  Tv = 0;
    
  % Reset the loop counter
  count = 0;
  
  % Do this loop until the break condition holds
  for gamma = 1:-0.001:0
    
    a_max = gamma * a_max;
    a_min = gamma * a_min;

    % v_max is not reached => check other things
    Tj_1 = a_max/j_max;
    Tj_2 = a_max/j_max;
    Tj = a_max/j_max;
    delta = a_max^4/j_max^2 + 2*(v_0^2+v_1^2) + a_max*(4*(q_1-q_0)-2*a_max/j_max*(v_0+v_1));
    Ta = (a_max^2/j_max - 2*v_0 + sqrt(delta))/(2*a_max);
    Td = (a_max^2/j_max - 2*v_1 + sqrt(delta))/(2*a_max);    
    
    if( Ta < 0 )   
      Ta = 0;
      Td = 2*(q_1-q_0)/(v_1+v_0);
      Tj_2 = (j_max*(q_1-q_0) - sqrt(j_max*(j_max*(q_1-q_0)^2+(v_1+v_0)^2*(v_1-v_0))))/(j_max*(v_1+v_0));
    elseif( Td < 0 )
      Td = 0;
      Ta = 2*(q_1-q_0)/(v_1+v_0);
      Tj_1 = (j_max*(q_1-q_0) - sqrt(j_max*(j_max*(q_1-q_0)^2-(v_1+v_0)^2*(v_1-v_0))))/(j_max*(v_1+v_0));
    else
      if( (Ta > 2*Tj) && (Td > 2*Tj) )
        break;
      else
        count = count + 1;
      end
    end
  end
end

%% Now compute the trajectory
%

a_lim_a = j_max * Tj_1;
a_lim_d = -j_max*Tj_2;
v_lim = v_0 + (Ta-Tj_1)*a_lim_a;

T=Ta+Tv+Td;

% round final time to discrete ticks
T=round(T*1000)/1000;

% time goes from zero in Ts (sample Time) steps to final time T
time=0:Ts:T;

% starting with tic 1
i = 1;

% reading size of time array
timeSize = size(time);

% preallocating memory
q = zeros(1,timeSize(1,2));
qp = zeros(1,timeSize(1,2));
qpp = zeros(1,timeSize(1,2));
qppp = zeros(1,timeSize(1,2));

% calculating the whole trajectory
for t = time

  % ACCELERATION PHASE
  % t element of [0, Tj_1]
  if( t <= Tj_1 )
    q(i) = q_0 + v_0*t + j_max * t^3/6;
    qp(i) = v_0 + j_max*t^2/2;
    qpp(i) = j_max * t;
    qppp(i) = j_max;
  end

  % t element of [Tj_1, Ta - Tj_1]
  if( (t > Tj_1) && (t <= (Ta-Tj_1)) )
    q(i) = q_0 + v_0*t + a_lim_a/6*(3*t^2-3*Tj_1*t+Tj_1^2);
    qp(i) = v_0 + a_lim_a*(t-Tj_1/2);
    qpp(i) = j_max*Tj_1;
    qppp(i) = 0;
  end
  
  % t element of [Ta-Tj_1, Ta]
  if( (t > (Ta-Tj_1)) && (t <= Ta) )
    q(i) = q_0 + (v_lim + v_0)*Ta/2 - v_lim*(Ta-t) - j_min*(Ta-t)^3/6;
    qp(i) = v_lim + j_min*(Ta-t)^2/2;
    qpp(i) = -j_min*(Ta-t);
    qppp(i) = j_min;
  end
  
  % CONSTANT VELOCITY PHASE
  % t element of [Ta, Ta+Tv]
  if( (t > Ta) && (t <= (Ta+Tv)) )
    q(i) = q_0 + (v_lim+v_0)*Ta/2 + v_lim*(t-Ta);
    qp(i) = v_lim;
    qpp(i) = 0;
    qppp(i) = 0;
  end
  
  % DECELERATION PHASE
  % t element of [T-Td,T-Td+Tj_2]
  if( (t > (Ta+Tv)) && (t <= (Ta+Tv+Tj_1)) )
    q(i) = q_1 - (v_lim+v_1)*Td/2 + v_lim*(t-T+Td) - j_max*(t-T+Td)^3/6;
    qp(i) = v_lim - j_max*(t-T+Td)^2/2;
    qpp(i) = -j_max*(t-T+Td);
    qppp(i) = j_min;
  end
  
  % t element of [T-Td+Tj_2, T-Tj_2]
  if( (t > (Ta+Tv+Tj_2)) && (t <= (Ta+Tv+(Td-Tj_2))) )
    q(i) = q_1-(v_lim+v_1)*Td/2+v_lim*(t-T+Td)+a_lim_d/6*(3*(t-T+Td)^2-3*Tj_2*(t-T+Td)+Tj_2^2); 
    qp(i) = v_lim + a_lim_d*(t-T+Td-Tj_2/2);
    qpp(i) = -j_max*Tj_2;
    qppp(i) = 0;
  end
  
  % t element of [T-Tj_2, T]
  if( (t > (Ta+Tv+(Td-Tj_2))) && (t <= T) )
    q(i) = q_1 - v_1*(T-t) - j_max*(T-t)^3/6;
    qp(i) = v_1 + j_max*(T-t)^2/2;
    qpp(i) = -j_max*(T-t);
    qppp(i) = j_max;
  end

  % mark the end of trajectory
  if( t > T )
    q(i) = q_1;
    qp(i) = v_1;
    qpp(i) = 0;
    qppp(i) = 0;
  end
  
  qd(i) = sigma*q(i);
  qdp(i) = sigma*qp(i);
  qdpp(i) = sigma*qpp(i);
  qdppp(i) = sigma*qppp(i);
  
  i=i+1;   
end