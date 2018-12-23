## Copyright (C) 2018 adeet

function [x_n meen stdd] = Normalizedata(x)
  
meen = mean(x);
stdd = std(x);
x_n = (x-meen)./stdd;


  
endfunction
