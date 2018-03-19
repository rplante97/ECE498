%Ryan Plante
%ECE498 Homework 6, Curve Fitting
%3/18/2018
clear
%Given Data
enrollment = [
% Year	
1995	1996	1997	1998	1999	2000	2001	2002	2003	2004	2005	2006	2007	2008	2009	2010	2011	2012	2013	2014	2015    2016
% UM	
9996	9928	9213	9451	9945	10282	10698	11135	11222	11358	11435	11797	11912	11818	11867	11501	11168	10901	11247	11286   10922   11219
% UMA	
6023	5496	5248	5130	5612	5617	5575	5722	5943	5538	5494	5257	5101	4974	5054	5074	4974	4990	4770	4664    4683    4416
% UMF	
2510	2512	2446	2507	2479	2413	2435	2395	2420	2349	2452	2424	2265	2227	2238	2322	2269	2179	2061	1960    2016    2000
% UMFK	
731	767	690	827	926	886	897	827	924	1076	1193	1339	1269	1102	1126	1073	1080	1169	1209	1327    1559    1904
% UMM	
856	915	884	899	908	927	1017	1068	1313	1191	1149	1259	1093	1023	964	951	863	925	892	810     786     745
% UMPI	
1278	1347	1307	1344	1378	1427	1367	1560	1546	1652	1548	1655	1533	1455	1436	1434	1453	1463	1263	1138    1289    1326
% USM	
9721	9966	10230	10462	10645	10820	10966	11382	11007	11089	10974	10478	10453	10009	9655	9654	9301	9385	8923	8428    7739    7855
];

year = enrollment(1, :)';
UMO = enrollment(2, :)';


%Conventionally stable natural populations are governed by a negative
%feedback loop that will osciallate in a sinusoidal fashion around the
%carrying capacity of said population. In the case of UMO the model that
%best fits is that of a "new" population. That is to say that a period of
%high (often exponential) growth is intially seen as the population grows
%towards carry capacity. The population continues to grow until it
%overshoots its carrying capacity at which point the negative feedback
%kicks in and the population begins to decrease and stabilize.

%If we plot the curve of UMO enrollment we can see that this model
%theoretically fits pretty well
figure(1);
plot(year, UMO/1000)
title('UMO Population Over Time')
xlabel('Year')
ylabel('Enrollment (thousands)')

%As such a sinusoidal curve fitting algorithm should provide a realtively good
%fit with a good prediction value, as a population is naturally expected to
%oscillate
figure(2)
[population, gof] = fit(year, UMO/1000, 'sin4')
%looks like a pretty decent fit
plot( population, year, UMO/1000 )
title('Sin4 Fitted Curve')
xlabel('Year')
ylabel('Enrollment (thousands)')


%Residual appears to be very random and follow no specific pattern, so we 
%can assume that our curve our curve fits decently
figure(3)
plot(population, year, UMO/1000, 'residual' )
title('Residual of Fit')
xlabel('Year')

%Despite a good residual and inital fit, our prediction bounds are huge and
%don't seem to offer much prediction value
figure(4)
plot(year, UMO/1000, 'o')
xlim( [1980, 2050] )
hold on
plot(population, 'predobs')
xlabel('Year')
ylabel('Enrollment (thousands)')
title('Enrollment Prediction out to 2050')
grid on
hold off

%The 95% confidence interval confirms that our fit has basically no
%prediction power, with bounds so large the initial data looks like a
%straight line
figure(5)
futureyears= (2000:10:2050).';
popFuture = population(futureyears)
ci = predint(population, futureyears, 0.95, 'observation' )
plot(year, UMO/1000, 'o')
xlim( [1980, 2050] )
hold on
plot(population)
h = errorbar( futureyears, popFuture, popFuture-ci(:,1), ci(:,2)-popFuture, '.' );
xlabel('Year')
ylabel('Enrollment (thousands)')
title('95% Confidence Interval of Fit')
legend( 'Year v UMO Pop', 'sin4', 'prediction')
%Overall it seems as if the sinusoidal function was a very bad choice and
%has almost no prediction power. This is surprising due to the face that
%populations are naturally expected to oscillate. That being said the data
%set we are fitting is relatively small and so a good fit is unlikely.