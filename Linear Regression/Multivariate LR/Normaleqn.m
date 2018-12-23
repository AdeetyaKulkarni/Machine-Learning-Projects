## Copyright (C) 2018 adeet
## Created: 2018-12-23

function theta = Normaleqn (X, y)
  
theta = pinv(X'*X) * X' * y;

endfunction
