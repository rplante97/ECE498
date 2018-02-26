year = 1:5000;
x = leapyear(year);
y = x(x>0);
size(y) %expected answer

% y = year(mod(year, 4) > 0);
% y = mod(y, 100) > 0