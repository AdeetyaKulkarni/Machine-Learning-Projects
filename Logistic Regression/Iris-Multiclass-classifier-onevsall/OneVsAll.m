## Copyright (C) 2019 adeet


function all_theta = OneVsAll (x, y, num_labels, lambda)

X = [ones(size(x,1), 1) x];
m = size(X,1);
n = size(X,2);

initial_theta = zeros(n,1);

all_theta1 = zeros(num_labels, n);
all_theta = [];

fprintf('Learning...\n\n')
 for c = 1:num_labels
     
     
     % Set options for fminunc
     options = optimset('GradObj', 'on', 'MaxIter', 50);
 
     % Run fmincg to obtain the optimal theta
     % This function will return theta and the cost 
   
          
     
     [theta] = ...
         fmincg (@(t)(costFunction(t, X, (y == c), lambda)), ...
                 initial_theta, options);
     
     
     all_theta = [all_theta theta];
         
     endfor
     
     all_theta = all_theta';
    
  
endfunction
