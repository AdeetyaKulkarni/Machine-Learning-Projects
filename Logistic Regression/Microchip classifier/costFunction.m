## Copyright (C) 2018 adeet
## Cost function along with regularization
## Created: 2018-12-26

function [J,grad] = costFunction (theta, X, y, lambda)

J = 0;
grad = zeros(size(theta));
m = length(y);

  
t_theta = theta;
t_theta(1) = 0;

hx = sigmoid(X*theta);
J = (-1/m)*sum(y.*log(hx) .+ (1.-y).*log(1.-hx)) + (lambda/(2 * m)) * sum(t_theta.^2);

grad = (1/m)* (X'*(hx -y))+ (lambda/m)*t_theta;



endfunction
