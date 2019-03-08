%% ODE_applications

close all; clear all;

%% Matlab is a good first tool for numerical solves of ODE's
% but it can also solve ode's symbolically provided they are simple enough.

% consider dy/dt = ty
% first, define y as a funtion of t using the symbolic toolbox:
syms y(t)
% and also define what our ODE is symbolically:
ode = diff(y,t) == t*y

% Then, we can create the solution as a symbolic function
ySolution(t) = dsolve(ode)

% And, you can provide initial conditions for particular solutions!
IC = y(2) == 6;
ySolutionIC(t) = dsolve(ode,IC)

%And can plot these symbolic expressions using the fplot command
fplot(ySolutionIC,[-2,2])

%% 2nd order equations and higher are also solvable!
% Consider the 2nd order initial value problem:
% dy/dt = cos(t) + tsin(t)

% Solve this using the above strategy! (note d^2y/dx^2 = diff(y,x,2)

ode2= diff(y,t,2) == cos(t) + t*sin(t);

ySol(t) = dsolve(ode2);
% And, we can 'simplify' symbolic expressions!
ySol = simplify(ySol)

%% Practice:
% using this strategy, solve the ODE 
% d^2y/dx^2 = xy
% with initial conditions given as follows:
Dy = diff(y);
IC = [ y(1)==-1  , Dy(1) == 1 ];
% Note: you will get some very messy expression. Feel free to lookup the
% Airy function to see the power of symbolic solves!

% Now, plot your solution between -10 and 10.

% Once this is done, try using different initial conditions. How does the
% solution change?


%% So why doesnt this solve our our problems? Well, exact solutions are difficult to find generally!
% Numerical solutions are the next step, for ill-behaved or systems with no
% closed form solution. Trying to solve any sufficently complicated system
% symbolically will 'break' dsolve

% Unfortunately, the syntax between the symbolic toolbox and matlab's built
% in numerical software differ.

% Enter ode45 - this is a workhouse of a built in command
% What is this doing? A 4th order / 5th order alternating runke-kutta
% dicretization method (See e.g. MACM 416!)


% To solve a first order ODE numerically We need to define our ODE:
f = @(y,t) -sin(y) + cos(y)
% the arguments read: 'We are solving for y as a function of t, and y' = -sin(y) + cos(y)
% Then, specify the range over which to solve numerically
solverange = [0,5];
% and finally the initial conditions
IC = [1];
%Then we use ode45 to give a numerical solution, which automatically plots
% y and y' on the same plot
ode45(f,solverange,IC)
legend('y(t)')

%% Problem: 
% Consider the following 2nd order equation for y = (y(1),y(2))
% y(1)' = y(2)
% y(2)' = y(2)(1-y(1))^2 - y(1)
% with IC y(1) = 2, y(2) = 0 at t=0
% for t= 0 to 20


% Try to solve this using ode45!
% you will have to specify @f(y,t) = [y(1)'; y(2')]
% and inital conditions accordingly.

% Now, try to solve this symbolically. Does your answer make sense?

%% Problem (extension):
% consider the built in matlab solve ode23
% (this uses 2nd and 3rd order methods)
% Try solving the system above with this solver (same syntax)

% Using a plot, compare the results. Compare this to either your symbolic
% solve above (if it works!) or lookup the Van der Pol equation (see
% mathworks reference)
% Which method seems more accurate? Which took longer to run?


%% References 
%{
    https://www.mathworks.com/help/symbolic/solve-a-single-differential-equation.html
    https://www.mathworks.com/help/matlab/ref/ode45.html
    http://mathworld.wolfram.com/vanderPolEquation.html
%} 
