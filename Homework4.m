%Ryan Plante
%ECE 498 Matlab Homework 4
%2/26/2018

%% Leap Years
leapyears = 0;
for year = 1:5000
   if((mod(year,4)) ~= 0)
   elseif ((mod(year, 100)) ~= 0)
        leapyears = leapyears + 1;
   elseif ((mod(year,400)) ~= 0) 
   else
       leapyears = leapyears + 1;
   end
end
numOfLeapYears = leapyears

%% Table Tennis Tournament
%Team 1
A = 1; B = 2; C = 3;
team1 = [A B C];
%Team 2
X = 4; Y = 5; Z = 6;
team2 = [X Y Z];

%keys
key1 = ['A' 'B' 'C'];
key2 = ['X' 'Y' 'Z'];
for n = 1:length(team2)
    for i = 1:length(team1)
        if((n == 1) && (i == 1)) %A and X cannt play
        elseif((n == 1) && (i == 3)) %X and C cannot play
        elseif((n == 3) && (i == 3)) %Z and C cannot play
        else
            fprintf('Team 2s player %c will play team 1s player %c \n', key2(n), key1(i))
        end
    end
end