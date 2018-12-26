## Copyright (C) 2018 adeetya
## Created: 2018-12-25

function retval = plotdata (x, y)
  
  pos = find(y==0); %benign
  neg = find(y==1); %malignant
  
  plot(x(pos,1),x(pos,2),'ko');
  hold on;
   

  plot(x(neg,1),x(neg,2),'kx');
 
% Labels and Legend
xlabel('Radius')
ylabel('Texture')

% Specified in plot order
legend('Benign', 'Malignant')
hold off;

endfunction
