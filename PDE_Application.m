%% PDE applications
% This application is intended as a final, more individual exercise for
% those who have worked through the ODE application file or are looking for
% a challenge.

% First, in the command window below, type: edit pdex1
% This should bring up an extremely detailed example of Matlab's built in
% PDE solver pdepe.

%% Problem:
% Using this example as a guideline, solve the PDE for u(x,t)
% du_1/dt = 0.024 d^2(u_1)/dx^2 - F(u_1 - u_2)
% du_2/dt = 0.17d^2(u_2)/dx^2 + F(u_1 = u_2)
% where F(x) = exp(5.72x) - exp(-11.46x)

% between 0 and 1, given the I.C.'s u_1(x,0) = 1, u_2(x,0) = 1
% And, B.C.'s :
% Left endpoint: du_1/dt(0,y) = 0, u_2(0,t) = 0
% Right endpoint:  u_1(1) = 1. u_2(1,t) = 0

% This example is one from electrodynamics, thus the oddly specific
% numbers!

% As a starting point,  below is the PDE in the needed for for pdepe:
% You need to implement the initial conditions, and the boudnary conditions
% for the left and right endpoints. 

% Compare to the provided example if you are stuck!


function [c,f,s] = pdeImplemented(x,t,u,DuDx)
    % as a Challenge, try to understand what this is doing (the code is
    % very sparse!)
    c = [1; 1];
    f = [0.024; 0.17] .* DuDx;
    y = u(1) - u(2);
    F = exp(5.73*y)-exp(-11.47*y);
    s = [-F; F];
end

%% Now, visualize the solution behaivor for u_1 and u_2