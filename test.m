clear all
close all
 
% Maine Population 1790 - 2010
% Year, Maine Population, US Population
% Source: http://maineanencyclopedia.com/population-since-1741/
population = [
1790 	96540 	3929214 
1800 	151719 	5308483 	
1810 	228705 	7239881 	
1820 	298335 	9638453 	
1830 	399455 	12866020 	
1840 	501793 	17069453 	
1850 	583169 	23191876 
1860 	628279 	31443321 	
1870 	626915 	39818449 	
1880 	648936 	50155783 	
1890 	661086 	62947714 	
1900 	694466 	75994575 	
1910 	742371 	91972266 	
1920 	768014 	105710620 	
1930 	797423 	122775046 	
1940 	847226 	131669275 
1950 	913774 	150697361 
1960 	969000 	179323175 
1970 	994000 	203302031 
1980 	1124660 	226545805 
1990 	1227928 	248709873 
2000 	1274923 	281421906 
2010 	1328361 	308745538
];
 
% the years
cdate = population(:, 1);
 
% Maine's population
pop = population(:, 2);
 
% Load Maine's population
% cdate is a column vector containing the years 1790 to 2010 in 10-year increments
% pop is a column vector with the population figures that correspond to the years in cdate
 
% Plot the Data
figure(1)
plot( cdate, pop, 'o' )
grid on
 
% Create and Plot a Quadratic
figure(2)
[population2, gof] = fit( cdate, pop, 'poly2' );
plot( population2, cdate, pop );
% Move the legend to the top left corner.
legend( 'Location', 'NorthWest' );
 
% Create and Plot a Selection of Polynomials
population3 = fit( cdate, pop, 'poly3', 'Normalize', 'on' );
population4 = fit( cdate, pop, 'poly4', 'Normalize', 'on' );
population5 = fit( cdate, pop, 'poly5', 'Normalize', 'on' );
population6 = fit( cdate, pop, 'poly6', 'Normalize', 'on' );
populationExp = fit( cdate, pop, 'exp1' );
 
% Plot all the fits at once, and add a meaningful legend in the top left corner 
hold on
plot( population3, 'b' );
plot( population4, 'g' );
plot( population5, 'm' );
plot( population6, 'b--' );
plot( populationExp, 'r--' );
grid on
hold off
legend( 'pop', 'poly2', 'poly3', 'poly4', 'poly5', 'poly6', 'exp1', ...
    'Location', 'NorthWest' );
 
% To plot residuals, specify 'residuals' as the plot type in the plot method.
figure(3)
plot( population2, cdate, pop, 'residuals' );
grid on
% The fits and residuals for the polynomial equations are all similar, making it difficult to choose the best one.
% If the residuals display a systematic pattern, it is a clear sign that the model fits the data poorly.
 
% The fit and residuals for the single-term exponential equation indicate it is a poor fit overall. Therefore, it is a poor choice and you can remove the exponential fit from the candidates for best fit.
figure(4)
plot( populationExp, cdate, pop, 'residuals' );
grid on
 
% Examine the behavior of the fits up to the year 2050
 
 
% Plot Prediction Intervals
 
figure(5)
plot( cdate, pop, 'o' );
xlim( [1900, 2050] )
hold on
plot( population2, 'predobs' );
title('poly2', 'FontSize', 14)
grid on
hold off
 
figure(6)
plot( cdate, pop, 'o' );
xlim( [1900, 2050] )
hold on
plot( population3, 'predobs' );
title('poly3', 'FontSize', 14)
grid on
hold off
 
figure(7)
plot( cdate, pop, 'o' );
xlim( [1900, 2050] );
hold on
plot( population4, 'predobs'  );
title('poly4', 'FontSize', 14)
grid on
hold off
 
figure(8)
plot( cdate, pop, 'o' );
xlim( [1900, 2050] );
hold on
plot( population6, 'predobs'  );
title('poly6', 'FontSize', 14)
grid on
hold off

figure(9)
cdateFuture = (2000:10:2020).';
popFuture = population2( cdateFuture )
 
% To compute 95% confidence bounds on the prediction for the population in the future, use the predint method
ci = predint( population2, cdateFuture, 0.95, 'observation' )
 
% Plot the predicted future population, with confidence intervals, against the fit and data.
plot( cdate, pop, 'o' );
xlim( [1900, 2040] )
hold on
plot( population2 )
h = errorbar( cdateFuture, popFuture, popFuture-ci(:,1), ci(:,2)-popFuture, '.' );
hold off
legend( 'cdate v pop', 'poly2', 'prediction', ...
    'Location', 'NorthWest' )