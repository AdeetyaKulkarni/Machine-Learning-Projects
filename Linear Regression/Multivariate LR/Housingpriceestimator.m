%MULTIVARIATE LINEAR REGRESSION (HOUSING PRICE ESTIMATOR)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Adeetya P. Kulkarni                                   %
% Data captured from data.txt                           %
% Functions:                                            %
% 1) Normalize- features                                %
% 2) Costfunction                                       %              
% 3) Gradient Descent - prediction                      %
% 4) Normal eqn - prediction                            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%MAIN:

%Load data 

data = load('data.txt');
len = size(data,2);
x = data(:,1:len-1);
y = data(:,len);
m = length(y);

%Normalize data:
[x meen stdd ] = Normalizedata(x);

%Add extra column of X
X = [ones(m,1) x];

%Create random theta vals.
theta = ones(3,1);

%Hypothesis:
hx = X*theta;

%Costfunction:
J = Costfunction(X,y,hx,m);

%Gradient descent:
%Hyper-parameters
alpha = 0.1;
iters = 300;

theta = Gradientdescent (X, y, theta, alpha, iters);

%Prediction:
pred  = [1 1650 4];
%1) Normalize prediction:
pred(2) = (pred(2)-meen(1)) / stdd(1);
pred(3) = (pred(3)-meen(2)) / stdd(2);

fprintf('Prediction by Gradient Descent')
price = pred*theta


clear;

%Prediction using normal eqn:

%MAIN:

%Load data 

data = load('data.txt');
len = size(data,2);
x = data(:,1:len-1);
y = data(:,len);
m = length(y);

%Create random theta vals.
theta = ones(3,1);

%Add extra column of X:
X = [ones(m,1) x];

%Normal eqn:
theta = Normaleqn(X, y);

%Predict 
pred = [1 1650 4];

fprintf('Prediction by Normal Eqn')
price = pred*theta

