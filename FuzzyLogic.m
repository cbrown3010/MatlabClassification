% attributes = energyefficiency{:,1:8};
% responses = energyefficiency{:,9};
% plotmatrix(attributes,responses);

R = corrcoef(energyefficiency{:,8},energyefficiency{:,9})