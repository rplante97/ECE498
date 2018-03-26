%Ryan Plante
%Matlab Prelim 1
%3/24/18

%% Question 1

%a
a = [1 2 3];
b = [3 4 5];

distance = sqrt(sum((a-b).^2))

%b 
m1 = [1 2 3 4 5; 5 6 7 8 9]

m2 = m1(:, 2:4)

%% Question 2
ece271 = [% ID, Scores
 101, 98;
 121, 50;
 157, 43;
 189, 80;
 176, 75;
 107, 99;
 120, 30;
 175, 61;
 135, 60]

ece498 = [% ID, Scores
 101, 21;
 131, 70;
 157, 93;
 189, 100;
 176, 75;
 107, 99;
 120, 30;
 175, 61; ]

%a 
index = find(ece271(:,2) == max(ece271(:,2)));
highestScoringStudentID = ece271(index, 1)

%b
id = [ece271(:,1); ece498(:,1)];
id = unique(id);
scores = NaN*ones(length(id),3);
scores(:,1) = id (:,1);

[c, ia, ib] = intersect(id, ece271(:,1));
scores(ia, 2) = ece271(ib,2);
[c, ia, ib] = intersect(id, ece498(:,1));
%Student ID | ece271 score | ece498 score
scores(ia,3) = ece498(ib, 2)

%% Question 3
%a
a = {'abc', [1 2 3; 4 5 6]; 4, [9 8 7; 6 5 4; 3 2 1]};
a{1, 2}(2, :) = a{1, 2}(2, :)+4

%b
a = reshape(a, 1, 4)

%% Question 4
data = readtable('myPatients.dat');

avgAge = mean(data{:,3})

%% Question 5
%define whatever single row/column matrix you want here, this one covers
%all function conditions
matrix = [-2 -1 0 1 2 3 4 5 6 7 8 9 10];
myFunction(matrix)


