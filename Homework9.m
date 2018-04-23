%Ryan Plante
%ECE498 Homework 9
%4/9/2018
%% Question 1: Linear Programming
%Acres: 75
%Profit: P(x,y) = 143x + 69y
%Storage Space: 110x + 30y <= 4000
%Finance Budget: 120x + 210y <= 15000
%Area: x >= 0, y >= 0, (x+y) <= 75

%% Question 2: Linear Programming

%% Question 3: Minimizing multi-variable function
%Minimize: f(x,y,z) = (x^2 + y^2)^2 - x^2 - y + z^2
x0 = [0 0 0];
[x, fval] = fminunc(@myfunc, x0);
fprintf('\t\tMinimum values:\n\t\tX\t\tY\t\tZ\n')
disp(x)
function f = myfunc(x)
    f = (x(1)^2 + x(2)^2)^2 - x(1)^2 - x(2) + x(3)^2;
end
%% Question 4: Minimizing multi-variable function
%Minimize: f(x,y) = 2x^2 + 20y^2 + 6xy + 5x
%Constraint: x - y = -2
