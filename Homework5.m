%Ryan Plante
%ECE 498 Matlab Homework 5
%2/26/2018

%% Set Operations
clear
ece271 = [ % ID, Score
900, 34;
801, 90;
700, 77;
400, 33];
 
ece473 = [ % ID, Score
900, 67;
802, 99;
700, 35;
500, 88];

id = [ece271(:,1); ece473(:,1)];
id = unique(id);
scores = NaN*ones(length(id),3);
scores(:,1) = id (:,1);

[c, ia, ib] = intersect(id, ece271(:,1));
scores(ia, 2) = ece271(ib,2);
[c, ia, ib] = intersect(id, ece473(:,1));
scores(ia,3) = ece473(ib, 2)

%% REGEX
str = 'Welcome to ECE 498! My phone number is 207-581-2499. My email is hello@maine.edu. How to contact you?';
 
addr1 = '5713 Chadbourne Hall, Orono, ME 04469-5713';
addr2 = '73 Harlow St, Bangor, ME 04401';
addr3 = '141 Center St, Old Town, ME 04468';
addr{1} = addr1;
addr{2} = addr2;
addr{3} = addr3;

%Words in str
words = '[^a-zA-Z0-9 ]';
newstring = regexprep(str, words, "");
words = '\w*';
numWords = length(regexp(newstring, words))

%Sentences in str
sentences = '[A-Z][a-z]{1}';
numSentences = length(regexp(str, sentences))

%Email address in str
email = '[a-z_]+@[a-z]+\.(edu|net|com)';
email = regexp(str, email, 'match')

%Phone number in str
phonenum = '[0-9][0-9-]*-[0-9-]*[0-9]'
phonenum = regexp(str, phonenum, 'match')

%5 digit zip code of addr
zip = '(?:\d{5})?';
addr1 = regexp(addr{1}, zip, 'match')
addr2 = regexp(addr{2}, zip, 'match')
addr3 = regexp(addr{3}, zip, 'match')
%% Tables
clear
data = readtable('myPatients.dat')

avgAge = mean(data{:,3})

groupedGender = varfun(@mean, data, 'InputVariable', 'Age', 'GroupingVariable', 'Gender')

data.BMI = (data.Weight*0.453592)./(data.Height*0.0254).^2
writetable(data, 'myPatients2.dat');
