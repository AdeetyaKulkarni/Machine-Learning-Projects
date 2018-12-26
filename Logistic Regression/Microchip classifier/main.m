%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Name: Adeetya P Kulkarni                               %
% Dataset - microchip data from two build tests          %  
% Logistic regression using regularization               %
%                                                        %
%                                                        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Load the data set:
data = load('mcdata.txt');
x = data(:,1:2);
y = data(:,3);

%Plot data to understand:
plotData(x,y);

%Map all features to increase features: (Also adds the 1 column)
X = mapFeatures(x(:,1),x(:,2));

%init thetas:
theta = zeros(size(X,2),1);

%Cost function and gradient including regularization:
%Hyperparameter
lambda = 1;
[J,grad] = costFunction(theta,X,y,lambda);


%Optimize cost using fminunc
options = optimset('GradObj','on','MaxIter',400);
[theta, J, exit_flag] = fminunc(@(t)(costFunction(t, X, y, lambda)), theta, options);

%plot Decision Boundary
plotDecisionBoundary(theta, X, y);
hold on;
title(sprintf('lambda = %g', lambda))

% Labels and Legend
xlabel('Microchip Test 1')
ylabel('Microchip Test 2')

legend('y = 1', 'y = 0', 'Decision boundary')
hold off;

%Checking prediction accuracy:
% Compute accuracy on our training set
p = predict(theta, X);

fprintf('Train Accuracy: %f\n', mean(double(p == y)) * 100);





