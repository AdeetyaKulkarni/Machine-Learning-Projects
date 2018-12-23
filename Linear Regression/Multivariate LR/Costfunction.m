## Copyright (C) 2018 adeet

function J = Costfunction (X,y,hx,m)
  
  J = (1/2*m) * sum((hx-y).^2);
  

endfunction
