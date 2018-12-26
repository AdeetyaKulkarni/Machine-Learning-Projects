## Copyright (C) 2018 adeet
## Mapfeatures
## Created: 2018-12-26

function out = mapFeatures (X1, X2)

degree = 6;
out = ones(size(X1(:,1)));
for i = 1:degree
    for j = 0:i
        out(:, end+1) = (X1.^(i-j)).*(X2.^j);
    end
end

end


