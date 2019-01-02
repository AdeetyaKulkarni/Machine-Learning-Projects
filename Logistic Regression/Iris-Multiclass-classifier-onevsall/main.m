%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Name- Adeetya P. Kulkarni                                                  %
%   One-vs-all Logistic regression example                                     %
%   Iris classification dataset                                                %
%   Dataset attributes : (copy+paste)  
%                                                                              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Import and modify data according to need:

[x1,x2,x3,x4,y] = textread('irisdata.txt','%f,%f,%f,%f,%s');

x = [x1 x2 x3 x4];

m = size(x,1);

k = [];

%Changing text values to integer vals:

num_labels = 3;

for i=(1:m)
  if(strcmp (y(i),'Iris-setosa')==1)
  k(i)=1;
  end
  if(strcmp (y(i),'Iris-versicolor')==1)
  k(i)=2;
  end
  if(strcmp (y(i),'Iris-virginica')==1)
  k(i)=3;
  end
  endfor

  
%Setting y to classes (0=Iris-setosa ; 1=Iris-versicolor ;2=Iris-virginica)  
y = k';


%Plotting data to understand:
%plotData(x,y)

%mapFeatures of X(also adds the 1's column)
%X = mapFeatures(x)

%init thetas:
theta = zeros(size(X,2),1);

%Cost-function & gradient
lambda = 1;
all_theta = OneVsAll(x, y, num_labels, lambda);

%Prediction:
pred = Predict(x,y,num_labels,all_theta);

%prediction accuracy:
fprintf('\nTraining Set Accuracy: %f\n', mean(double(pred == y)) * 100);

% NEW SAMPLES ::
%sample 1:
fprintf("\nSample 1-")
x1 = [4.9 3.1 1.5 0.1];
pred1 = Predict(x1,y,num_labels,all_theta);
checkwhich(pred1);

%sample 2:
fprintf("\nSample 2-")
x1 = [5.8 2.6 4.0 1.2];
pred1 = Predict(x1,y,num_labels,all_theta);
checkwhich(pred1);

%sample 3:
fprintf("\nSample 3-")
x1 = [6.3 3.3 6.0 2.5];
pred1 = Predict(x1,y,num_labels,all_theta);
checkwhich(pred1);


