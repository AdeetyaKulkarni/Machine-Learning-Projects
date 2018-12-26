data = dlmread('cdata.txt',',');

x = data(:,2:size(data,2)-1); %radius and texture
y = data(:,size(data,2)); %2=benign 4=malignant

%changine outcome vals to 0 and 1 instead of 2 & 4
for i= (1:length(y))
  if(y(i)==2)
  y1(i)=0;
  else
  y1(i)=1;
end
end  
y = y1';

plotdata(x,y);
hold off;

%Compute Cost and Gradient:

% M, N values M= no of examples N= no of features
[m,n] = size(x);

%Adding ones to the x dataset:
X = [ones(m,1) x];

%init thetas;
i_theta = zeros(size(X,2),1);


[J,grad] = costFunction(i_theta,X,y);


%Optimizing using fminunc method
%Setting up options for fminunc
options = optimset('GradObj', 'on', 'MaxIter', 400); 
%fminunc - 
%  Run fminunc to obtain the optimal theta
%  This function will return theta and the cost
[theta, cost] = fminunc(@(t)(costFunction(t, X, y)), i_theta, options);

%Predict

%Sample data features:
%a) radius (mean of distances from center to points on the perimeter)
%b) texture (standard deviation of gray-scale values)
%c) perimeter
%d) area
%e) smoothness (local variation in radius lengths)
%f) compactness (perimeter^2 / area - 1.0)
%g) concavity (severity of concave portions of the contour)
%h) concave points (number of concave portions of the contour)
%i) symmetry 
%j) fractal dimension ("coastline approximation" - 1)


sample1 = [1 5 1 1 1 2 1 3 1 1];
sample2 = [1 8 10 10 8 7 10 9 7 1];

prob = sigmoid( sample1 * theta);
fprintf('\nSample1:\n\n radius = 5\n texture = 1\n perimeter = 1\n area = 1\n smoothness = 2\n compactness = 1\n concavity = 3\n') 
fprintf(' concave points = 1\n symmetry = 1\n');

fprintf([' Probability of tumor being malignant = %f \n'], prob);

prob = sigmoid(sample2 * theta);

fprintf('\nSample2:\n\n radius = 8\n texture = 10\n perimeter = 10\n area = 8\n smoothness = 7\n compactness = 10\n concavity = 9\n') 
fprintf(' concave points = 7\n symmetry = 1\n');
fprintf([' Probability of tumor being malignant = %f \n'], prob);


% Compute accuracy on our training set
p = predict(theta, X,y);

  
fprintf('\nTrain Accuracy: %f\n', mean(double(p == y)) * 100);




