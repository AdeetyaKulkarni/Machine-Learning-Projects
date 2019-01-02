## Copyright (C) 2018 adeet
## calculate sigmoid given z = X*theta
## g = 1/(1+e^(-z))
## Created: 2018-12-26

function g = sigmoid(z)

g = zeros(size(z));
g = 1./(1 .+ (e.^(-z)));


endfunction
