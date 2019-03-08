%% Matlab Workshop
% Script 1 - Basic Syntax and Examples

close all; clear all;
%% First Principles
% As you can see, you can comment with % and create a new section with %%

% Hide output by ending a line with ;
x = 15;

% Print output directly without using ;
y = x^2

% Or save outputs for later, and "display them:" in one go.
sentence= ['If x is ', num2str(x), ' then x^2 is ', num2str(y)];
disp(sentence)

%% For loops are simple to implement
result = 0;
for i=1:5
    result = result + i;
end
result

% While loops can do "and" &&, and "or" ||
otherThing = 1;
while(result > 0 && otherThing < 10)
    result = result -1;
    otherThing = otherThing*5;
end
result

% But, matlab can do loops implicitly (i.e. with built on commands)
% using the 'from:by:to' syntax: for example
x = 1:1:10

triangularNumber10 = sum(x)

%% Practice Questions on Loops, basic operations, and printing:
% Consider the following infinite sum:
% sum from n = 1 to infinity of 1/(n(ln(n))^2.

% i) What does this seem to approach / converge to?

% ii) How many terms do you need in your sum for the Nth sum and (N+1)th
% sum to differ by )10)^(-3) ?


%% Plotting
% given some set of (x,y) coordinates, we can easily plot them!
figure(1)
xVals = 0:0.01:2*pi;
yVals = sin(xVals);
plot(xVals,yVals)

% To make figures look nice you can add labels, colors, and so on!
figure(2)
xVals = 0:1:10;
yVals = 2*rand(1,11);
plot(xVals,yVals,'--*r');
xlabel('Labels for the x values')
ylabel('Labels for the y values')
title('Title here')
legend('Function')


%% Advanced Plots 
% You can also plot surfaces!
xVals = -2*pi:0.1:2*pi;
yVals = -2*pi:0.1:2*pi;

% z = f(x,y) = sin(xy)/xy
zVals = sin( xVals'*(yVals))./ (xVals' * yVals);

% Surf plots (x,y,z) triples!
figure(3)
surf(xVals,yVals,zVals);

% See also: pcolor , plot3, scatter, contour etc, etc. 
% Matlab can plot in every conceivably useful way! See:
% https://www.mathworks.com/help/matlab/creating_plots/types-of-matlab-plots.html

%% Practice plotting

% Plot the function f(x) = sin(x)/cos(sqrt(x)) between 0 and 10
% (with whatever colors and style you'd like!)

%% Vectors and Matrices
% vectors and matrices we can define either as above or with prebuilt commands

% Here, pay attention to the arguments!
x = ones(3,1)
x = zeros(1,3)
x = randn(3,3)

% Or we can define them directly

x = [1 1 1]'
% Aside:  ' is transpose
A = [1 2 3 ; 2 2 2 ; 7 1 1]

% And we can multiply vectors and matrices easily with *
b = A*x

% Accessing arries can be done entry-wise or 'block'wise
A(2,3)
A(1:3,1:2)

%% You can also find the (geometric length) of vectors
% Or its width and height as a matrix!
norm(b)
[height,width] = size(b)
%% Solving linear systems is easy! Behold, \

A\b

% For those interested, see the documentation of \ , this thing is a
% powerhouse!

%% What else can we do? Everything you've seen in linear algebra!

null(A)

rank(A)

eigs(A)


%% Practice: 
% Here are some special matrices

P = pascal(8);
H = hadamard(8);

%First visualize P,H using the 'spy' command, then ompute the eigenvectors
%and eigenvalues of P,H, and PH.

%% What about function / subroutines? 
% These have to be defined at the end on the script, or in a seperate file.

%first let's go to the end of the file to see the syntax!

m=1; n = 2;
% mess about with the inputs (m and n) and figure out what this function
% does (or see the file!)
[answer1 , answer2] = Function_in_another_file(n,m);

%% Practice: Bringing it all together 
% at the bottom of the file, define a function that:
% Takes as input a matrix A
% computes the largest eigenvalue lambda_1 of A, A^2, A^3, and so on.
% plots the result!


% Extra: Look at the documentation of eigs to find the corresponfing
% eigenvector x_1 to this eigenvalue lambda_1, and take the vector y of all
% ones. examine what happens to the sequence
% Ay, A^2y, ... A^ky compared to x_1.
% (Make sure to normalize your vectors so things dont blowup!)

%% Function definitions

function [output] = functionName(input)
% Note we don't have to specify what input / putput are - these can be
% numbers, strings, matrices, etc.
    output = input^3
end



%% References and Further Resources

%{ 
    https://www.mathworks.com/content/dam/mathworks/mathworks-dot-com/moler/intro.pdf
    https://www.mathworks.com/help/matlab/creating_plots/types-of-matlab-plots.html
    D.J. Higham and N.J. Higham. MATLAB Guide. SIAM, 2000.
    MACM 203 Notes, Spring 2017, Dr. Cedric Chauve
%}
