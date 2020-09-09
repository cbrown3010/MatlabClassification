energyefficiency;
% Break down data into individuals
dataset = energyefficiency{:,:};
relativeCompactness = energyefficiency{:,1};
surfaceArea = energyefficiency{:,2};
wallArea = energyefficiency{:,3};
roofArea = energyefficiency{:,4};
overallHeight = energyefficiency{:,5};
orientation = energyefficiency{:,6};
glazingArea = energyefficiency{:,7};
glazingAreaDistribution = energyefficiency{:,8};
heatingLoad = energyefficiency{:,9};
coolingLoad = energyefficiency{:,10};

% Group individuals into attributes and responses
attributes = energyefficiency{:,1:8};
responses = energyefficiency{:,9:10};

% Statistical data of data
minimums = min(dataset);
maximums = max(dataset);
averages = mean(dataset);
summary(energyefficiency);

% Plot relationship between resposnes
plot (heatingLoad, coolingLoad);
% Scatterplot effect of compactness on responses
scatter3 (heatingLoad, coolingLoad, relativeCompactness);
% Boxplot the ranges of the responses
boxplot(responses);
% Barplot the relationshio between the three area paramters
bar(surfaceArea);
hold on;
bar(wallArea);
bar(roofArea);
hold off;
% Scatter plot showing the effect of overall height
gscatter(coolingLoad, heatingLoad, overallHeight);

