%Ryan Plante
%Homework 1
%1/22/2018

%Starter Code
clear
clc
roster = [
        8000          80
        8001          39
        8002          24
        8003          40
        8004          10
        8005          13
        8006          94
        8007          96
        8008          58
        8009          16
        8010          23
        8011          35
        8012          82
        8013          12
        8014          34
        8015          17
        8016          65
        8017          73
        8018          65
        8019          4];
    
    %Question 1 (Number of students)
    sizeofMatrix = size(roster, 1)
    %Question 2 (Max score)
    maxVal = max(roster(:,2))
    %Question 3 (ID of max score)
    maxID = roster(find(roster(:,2) == max(roster(:,2))))
    %Question 4 (Lowest score)
    minVal = min(roster(:,2))
    %Question 5 (Median score)
    medianVal = median(roster(:,2))
    %Question 6 (Mean score)
    meanVal = mean(roster(:,2))
    %Question 7 (Sum of all scores)
    sum = sum(roster(:,2))
    %Question 8 (Number of scores >60)
    %Note: for some reason the plain old sum() function was returing an
    %"Index exceeds matrix dimensions error" why is this??
    over60 = sumabs((roster(:,2) > 60))
    %Question 9 (Scores sorted in descending order)
    sortedMatrix = sortrows(roster, 2, 'descend')
    %Question 10 (Row with highest score removed)
    roster(find(roster(:,2) == max(roster(:,2))), :) = []
    