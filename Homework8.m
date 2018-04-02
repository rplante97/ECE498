%Ryan Plante
%ECE498 Homework 8
%4/2/2018

%% Question 1

%a
y = dsolve('Dy = ((x^2)/y)', 'x');
fprintf('Solution (1a): \n')
disp(y)

%b
y = dsolve('Dy + y^2 * sin(x) = 0', 'x');
fprintf('Solution (1b): \n')
disp(y)

%c
y = dsolve('x*Dy = sqrt(1- y^2)', 'x');
fprintf('Solution (1c): \n')
disp(y)
%% Question 2

%a
f = inline('(-x*y)/(sqrt(2-y^2))');
[x, y] = ode45(f, [0 5], 1)
plot(x,y)

%b

%dy1/dx = 2*y1 + y2 + 5*y3 + e^(-2*x)
%dy2/dx = -3*y1 - 2*y2 - 8*y3 + 2*e^(-2*x)-cos(3*x)
%dy3/dx = 3*y1+3*y2+2*y3+cos(3*x)
%y1(0) = 1
%y2(0) = -1
%y3(0) = 1
% x [0, pi/2]
