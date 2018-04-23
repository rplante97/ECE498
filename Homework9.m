%Ryan Plante
%ECE498 Homework 9
%4/9/2018
%% Question 1: Linear Programming
%Acres: 75
%Profit: P(x,y) = 143x + 69y
%Storage Space: 110x + 30y <= 4000
%Finance Budget: 120x + 210y <= 15000
%Area: x >= 0, y >= 0, (x+y) <= 75

profit = [-143 -69];
constraints = [110 30; 120 210; 1 1];
constraintsInequality = [4000; 15000; 75];

x = linprog(profit, constraints, constraintsInequality);
fprintf('Crop A optimal acres: %f \nCrop B optimal acres: %f\n', x(1), x(2))

%Graph
[constraints, constraintsInequality] = meshgrid(linspace(0,30,200), linspace(0,60,400));
profit = 143.*constraints + 69 .* constraintsInequality;
figure(1)
mesh(constraints, constraintsInequality, profit);
title('Question 1 Graph Verification')
xlabel('Crop A')
ylabel('Crop B')
zlabel('Profit')

%% Question 2: Linear Programming
profit = [-4 -5];
deptTime = [.75 1.25; 1 1];
totTime = [200; 200];
marketSat = [200; 150];
marketMin = [0; 0];

equivA = [0, 0];
equivB = 0;

x = linprog(profit, deptTime, totTime, equivA, equivB, marketMin, marketSat);
fprintf('Product A optimal num: %f\nProduct B optimal num: %f\n', x(1),x(2))

%Graph
figure(2)
a = 1:200;
b= 1:150;
[a,b] = meshgrid(a, b);
profit = 4.*a+5.*b;
mesh(a,b,profit);
title('Graph Verification Problem 2')
xlabel('A')
ylabel('B')
zlabel('Profit')

%% Question 3: Minimizing multi-variable function
%Minimize: f(x,y,z) = (x^2 + y^2)^2 - x^2 - y + z^2
x0 = [0 0 0];
[x, fval] = fminunc(@myfunc, x0);
fprintf('\t\tMinimum values:\n\t\tX\t\tY\t\tZ\n')
disp(x)

%% Question 4: Minimizing multi-variable function
%Minimize: f(x,y) = 2x^2 + 20y^2 + 6xy + 5x
%Constraint: x - y = -2

x0 = [0 0];
x = fmincon(@myfunc2, x0, [0 0], 0, [1 -1], -2);
fprintf('Min at: %f\n', x)

%Graph

[x,y] = meshgrid(linspace(-3,3,200),linspace(-3,3,200));
eq = 2.*x.*2 + 20.*y.^2+6.*x.*y+5.*x;
mesh(x,y,eq);
xlabel('x1')
title('Problem 4 Graph Verification')
ylabel('x2')
zlabel('f')
%% Functions
function f = myfunc(x)
    f = (x(1)^2 + x(2)^2)^2 - x(1)^2 - x(2) + x(3)^2;
end

function f = myfunc2(x)
    f = 2*x(1)^2+20*x(2)^2+6*x(1)*x(2)+5*x(1);
end

