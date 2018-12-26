## Copyright (C) 2018 adeet
## Plot data
## Created: 2018-12-26

function retval = plotData (x, y)

pos = find(y==1); neg = find(y==0);
plot(x(pos,1),x(pos,2),'ko');
hold on;
plot(x(neg,1),x(neg,2),'kx');

legend('accepted','rejected')
xlabel('x1')
ylabel('y1')

endfunction

