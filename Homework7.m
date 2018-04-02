%Ryan Plante
%ECE 498 Homework 7
%4/1/2018

%% Question 1

x = linspace(0,50,200);
y = @(x) 0.05.*x - sin(x);
zx = x(y(x).*circshift(y(x),[0 -1]) <= 0);  
zx = zx(1:end-1);                           
for k1 = 1:length(zx)
    fz(k1) = fzero(y, zx(k1));
end
fz
%% Question 2
clear all
coeffs = [1 2 -7 -8 10 0 8 0];
roots = roots(coeffs)

%% Question 3
x0 = [1;1;1] %initial guess in form (x; y; z)

[x, residuals] = fsolve(@func, x0) %Solution is returned in x vector

function F=func(x)
F=[3*x(1)*x(2)+x(2)-x(3)-12;
 x(1)+x(2)*x(1)*x(1)+x(3)-12;
 x(1)-x(2)-x(3)+2];
end

