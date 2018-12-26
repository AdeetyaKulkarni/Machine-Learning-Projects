## Copyright (C) 2018 adeet
## sigmoid function
## Created: 2018-12-25

function g = sigmoid (z)
  
g = zeros(size(z));

g = 1./(1 .+ (e.^(-z)));

endfunction
