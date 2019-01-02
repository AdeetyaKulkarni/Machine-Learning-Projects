## Copyright (C) 2019 adeet
## 
## Created: 2019-01-02

function index = Predict(x,y,num_labels,all_theta)
X = [ones(size(x,1),1) x];

pred = sigmoid(X*all_theta');

[val index] = max(pred');
index = index';


endfunction
