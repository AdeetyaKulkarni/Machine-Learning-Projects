## Copyright (C) 2018 adeet
## costFunction & gradient
## Created: 2018-12-31

function [J, grad] = costFunction (theta, X, y, lambda)
  
ttheta = theta; %for the purpose of regularization 
ttheta(1) = 0;

  
  m = length(y);
  hx = sigmoid(X*theta);

  J = (-1/m)*sum(y.*log(hx) .+ (1.-y).*log(1.-hx)) + (lambda/(2 * m)) * sum(ttheta.^2);;
  grad = (1/m)* (X'*(hx -y)) + (lambda/m)*ttheta;
  
  
endfunction
