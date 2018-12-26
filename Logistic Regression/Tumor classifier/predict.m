## Copyright (C) 2018 adeet
## prediction accuracy
## Created: 2018-12-25

function p = predict(theta, X,y)

m = size(X, 1); % Number of training examples


p = zeros(m, 1);


pred = sigmoid(X*theta);
iter = size(pred,1);
for i=(1:iter)
  if(pred(i) >= 0.5)
  p(i) = 1.+ p(i);
  %fprintf('malig');
  else
  p(i) = 0.+p(i);
  %fprintf('benign');
  end
endfor

