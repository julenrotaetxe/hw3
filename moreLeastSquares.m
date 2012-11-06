function [X, labels, error, kappa] = moreLeastSquares(m, n)

t = linspace(0, 1, m)';
A = zeros(m,n);
P = eye(n);
for it = 1:n
    A(:, it) = polyval(P(n-it+1, :), t); 
end

b = cos(4*t);

x_BS = A \ b;
x_LS = A'*A \ A'*b;

[Q, R] = qr(A, 0); % Q'*Q = Identity
R = R(1:size(R, 2), 1:end);
% normal equations A*x = b => Q*R*x = b => Q'*Q*R*x = Q'*b
% R*x = Q'*b
x_QR = backSub(R, Q'*b);

[U,S,V] = svd(A,0);
% A*x = b => (U*S*V')*x = b => U'*U*S*V'*x = U'*b =>
% V'*x = inv(S)*U'*b => x = V*inv(S)*U'*b => x = invS * (U'*b*V)
invS = diag(1./diag(S));
x_SVD = V*invS*U'*b;

labels = {'Back Slash', 'Least Squares', 'QR factorization', 'SVD'};
X = [x_BS, x_LS, x_QR, x_SVD];

col_X = size(X, 2);
error = zeros(1, col_X);
for it = 1:size(X, 2)
    error(it) = norm(A*X(:, it) - b, 2);
end


kappa = zeros(col_X, 1);
% Back-Slash
kappa(1) = cond(A);
% Normal Equations
kappa(2) = cond(A'*A);
% QR
kappa(3) = cond(R); % or it should be cond(Q*R)
% SVD
kappa(4) = cond(S); % or it should be cond(U*S*V')

end