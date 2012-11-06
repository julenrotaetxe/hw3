function [b, c, d] = ellipse(x, y)

if size(x, 2) ~= 1 || size(y, 2) ~= 1
    error('x and y should be column vectors')
end

A = [x.^2, x.*y, y.^2];
b = ones(size(x));

coeffs = A\b;
b = coeffs(1);
c = coeffs(2);
d = coeffs(3);