%% Problem 2 and 3
%% A little more Least squares.
% For avoiding unnecessary copy and paste I have implemented the function 
% more least squares that performs all the
% required computations in exercises 2 and 3.
clear;close all;
m = 50; n = 5;

[X, labels, error, kappa_5] = moreLeastSquares(m, n);

format long 
labels
X
error

%%
% Minimum error obtained with the method
me = min(error);
idx = find(error == me);
labels{idx}

%%
% Maximum error obtained with the method
ME = max(error);
idx = find(error == ME);
labels{idx}

%% Condition Numbers
% Explain the observations
m = 50; n = 10;
[~, ~, ~, kappa_10] = moreLeastSquares(m, n);

%%
% The condition numbers
fprintf('Methods \t\t | \t\t 5 steps \t\t | \t\t 10 steps \n');
for it = 1:length(kappa_5)
    if it == length(kappa_5)
        fprintf('%s \t\t\t | \t\t %f \t\t | \t\t %f\n', labels{it}, kappa_5(it), kappa_10(it));
    elseif it == 3
        fprintf('%s \t | \t\t %f \t\t | \t\t %f\n', labels{it}, kappa_5(it), kappa_10(it));
    else 
        fprintf('%s \t\t | \t\t %f \t\t | \t\t %f\n', labels{it}, kappa_5(it), kappa_10(it));
    end
end

%%
% According to the rule in the homework let K(A) = 10^k, k digits are lost
f_digits_lost = @(k)(log10(k));
dig_lost_5 = f_digits_lost(kappa_5);
dig_lost_10 = f_digits_lost(kappa_10);

fprintf('Methods \t\t | \t\t 5 steps \t\t | \t\t 10 steps \n');
for it = 1:length(kappa_5)
    if it == length(kappa_5)
        fprintf('%s \t\t\t | \t\t %f \t\t | \t\t %f\n', labels{it}, dig_lost_5(it), dig_lost_10(it));
    elseif it == 3
        fprintf('%s \t | \t\t %f \t\t | \t\t %f\n', labels{it}, dig_lost_5(it), dig_lost_10(it));
    else 
        fprintf('%s \t\t | \t\t %f \t\t | \t\t %f\n', labels{it}, dig_lost_5(it), dig_lost_10(it));
    end
end
