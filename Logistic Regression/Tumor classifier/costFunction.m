## Copyright (C) 2018 adeet
## Cost and Gradient function
## Created: 2018-12-25

function [J,grad] = costFunction (theta, X, y)

J = 0;
grad = zeros(size(theta));


  
m = length(y);
hx = sigmoid(X*theta);

p1 = -y .* log(hx);
p2 = (1.-y).*log(1.-hx); 
J = (1/m) * sum(p1 .- p2);


grad = (1/m)* (X'*(hx -y));


endfunction
