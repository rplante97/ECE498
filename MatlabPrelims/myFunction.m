function [y] = myFunction(x)
%MYFUNCTION Summary of this function goes here
%   Detailed explanation goes here
if isrow(x) == 1
    flipped = 0;
else
    x = x';
    flipped = 1;
end

len = length(x);
for i = 1:len
   if x(1,i) == 0
       y(1,i) = NaN;  
   elseif x(1, i) < 0          
       y(1,i) = x(1, i).^2;      
   elseif x(1, i) >= 0 && x(1,i) < 6      
           y(1, i) = 2.*x(1,i);               
   elseif x(1, i) >= 6
       y(1,i) = x(1,i) + 3;
   end
end
if flipped == 1
    y = y';
end
end
