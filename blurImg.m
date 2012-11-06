function [u, ublur] = blurImg(img_name, dt)
%% Read an image from a file
u = imread(img_name);
%u = imread('ellipse_blur2.png');
%u = imread('eye.png');
% convert image to double and scale to [0,1]
u = double(u) / 255;

[n,n2] = size(u);
if (n ~= n2)
  error('by default, this only supports square images')
end


%% Build a discrete 2D Laplace operator
e = ones(n,1);
L1 = spdiags([e  -2*e  e], [-1 0 1], n, n);
I = speye(n,n);
L = kron(L1, I) + kron(I, L1);

% "stretch" the matrix representation of the image into one long
% vector.
v = reshape(u, n*n, 1);

% Do 10 steps of blurring
for i=1:10
  v = v + dt*(L*v);
end

% convert the long vector back into a matrix
ublur = reshape(v, n, n);
