## Copyright (C) 2018 adeet
## Created: 2018-12-23

function theta = Gradientdescent (X, y, theta, alpha, iters)

m = length(y);
J_hist = zeros(iters,1);
  
for iter = 1:iters
  
hx = X*theta;
predel = ((hx-y)' * X);
theta = theta - ((alpha/m)* predel');

J_history(iter) = Costfunction(X, y, hx, m);


end;

figure('name','iters vs Cost');
plot(1:iters,J_history);
xlabel('iters');
ylabel('Cost(J)');
title('Descent of cost');
hold on;



endfunction
