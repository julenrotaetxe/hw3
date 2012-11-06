%% Problem 2
% A little more Least squares
clear;close all;
m = 50; n = 5;

[X, labels, error, kappa_5] = moreLeastSquares(m, n);

format long 
X
error

% Minimum error obtained with
me = min(error);
idx = find(error == me);
labels{idx}

% Maximum error obtained with
ME = max(error);
idx = find(error == ME);
labels{idx}

%% Problem 3 Condition Numbers
% Explain the observations
m = 50; n = 10;
[~, ~, ~, kappa_10] = moreLeastSquares(m, n);
kappa_5
kappa_10
f_digits_lost = @(k)(log10(k));
f_digits_lost(kappa_5)
f_digits_lost(kappa_10)
