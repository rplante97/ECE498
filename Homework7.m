%Ryan Plante
%ECE 498 Homework 7
%4/1/2018

%% Question 1
place = 1;
fun = @f;
for i = -5:1:5
z(place) = fzero(fun, i)
place = place +1;
end
roots = [max(z), 0, min(z)]

%% Question 2
clear all
coeffs = [1 2 -7 -8 10 0 8 0];
roots = roots(coeffs)

%% Question 3
x0 = [1;1;1] %initial guess in form (x; y; z)

[x, residuals] = fsolve(@func, x0) %Solution is returned in x vector

%% Function Declarations

%Question 1
function y = f(x)
y = 0.05*x - sin(x);
end

%Question 2
function F = func(x)
F = [3*x(1)*x(2)+x(2)-x(3)-12;
 x(1)+x(2)*x(1)*x(1)+x(3)-12;
 x(1)-x(2)-x(3)+2];
end

