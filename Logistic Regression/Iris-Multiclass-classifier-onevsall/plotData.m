## Copyright (C) 2018 adeet
## Plotdata
## Created: 2018-12-30

function retval = plotData (x, y)


  
%For plotting 0 = o
figure(1)
pos = find(y==0); neg = find(y==(1|2));

plot(x(pos,1),x(pos,2),'ko')
hold on
plot(x(neg,1),x(neg,2),'kx',1)
hold off

%For plotting 1 = o
figure(2)
pos = find(y==1); neg = find(y==(0|2));

plot(x(pos,1),x(pos,2),'ko')
hold on
plot(x(neg,1),x(neg,2),'kx')
hold off;

%For plotting 2 = o
figure(3)
pos = find(y==2); neg = find(y==(0|1));

plot(x(pos,1),x(pos,2),'ko')
hold on
plot(x(neg,1),x(neg,2),'kx')



endfunction
