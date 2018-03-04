%Ryan Plante
%ECE 498 Matlab Homework 5
%2/26/2018

%% REGEX

%% Tables


%% Added Question
clear
ece271 = [ % ID, Score
900, 34;
801, 90;
700, 77;
400, 33]
 
ece473 = [ % ID, Score
900, 67;
802, 99;
700, 35;
500, 88]

id = [ece271(:,1); ece473(:,1)]
id = unique(id)
scores = NaN*ones(length(id),3)
scores(:,1) = id (:,1)

[c, ia, ib] = intersect(id, ece271(:,1))
scores(ia, 2) = ece271(ib,2)
[c, ia, ib] = intersect(id, ece473(:,1))
scores(ia,3) = ece473(ib, 2)
