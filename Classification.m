% Load data
load energyefficiency.mat;
load meanResponseClass.mat;
attributes = energyefficiency(:,1:8);
responses = meanResponseClass;

% Attaching categorical responses
tempData = [attributes, responses];
% Shuffling rows
tempData = tempData(randperm(end),:);
% Selecting 60% of the data to train, 40% to test
trainData = tempData(1:480,:);
testData = tempData(480:768,:);
% Splitting up attributes and responses
trainDataAttributes = trainData(:,1:8);
trainDataResponses = trainData(:,9);
testDataAttributes = testData(:,1:8);
testDataResponses = testData{:,9};
% For Naive Bayes cut paramters with insufficient variance
trainDataAttributesVariance = trainDataAttributes(:,1:3);
testDataAttributesVariance = testDataAttributes(:,1:3);

% Decision Tree Model using 60:40 to train and test
% Train using trainData
tree_model = fitctree(trainDataAttributes,trainDataResponses);
% Predict using testData
tree_labels = predict(tree_model, testDataAttributes);
% Check error
tree_error = loss(tree_model, testDataAttributes, testDataResponses);
%Check results with testData
conf_mat_tree = confusionmat(tree_labels,testDataResponses);

% K Nearest Neighbour model using 60:40 to train and test
knn_model = fitcknn(trainDataAttributes,trainDataResponses);
knn_labels = predict(knn_model, testDataAttributes);
knn_error= loss(knn_model,  testDataAttributes, testDataResponses);
conf_mat_knn = confusionmat(knn_labels,testDataResponses);

% Naive Bayes model using 60:40 to train and test
nb_model = fitcnb(trainDataAttributesVariance,trainDataResponses);
nb_labels = predict(nb_model, testDataAttributesVariance);
nb_error = loss(nb_model, testDataAttributesVariance, testDataResponses);
conf_mat_nb = confusionmat(nb_labels ,testDataResponses);