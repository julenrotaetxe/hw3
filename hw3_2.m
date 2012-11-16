%% Problem 2 and 3
%% Problem 2: A little more Least squares.
% For avoiding unnecessary copy and paste I have implemented the function 
% more least squares that performs all the
% required computations in exercises 2 and 3. The code of the function is
% shown at the end of the exercise.
clear;close all;clc;
m = 50; n = 5;

[X, labels, error, kappa_5] = moreLeastSquares(m, n);

%%
% Display the results for Problem 2. 
% The variable "labels" indicate the method followed
% for computing the results shown below. 
% The variable "X" contains the coefficient of the least square
% approximation.
% The variable "error" contains the norm2 error of the residuals, ie Ax - b.

format long 
labels
X
error

%%
% Minimum error, measured as the 2-norm of the residuals, obtained with the method
% To check which method stands out we check the magnitude of the log of errors.
log_error = log(error)

%%
% The minimum error is obtained with the method:
me = min(log_error);
idx = find(log_error == me);
labels{idx}

%%
% The maximum error is obtained with the method:
ME = max(log_error);
idx = find(log_error == ME);
labels{idx}

%%
% However the differences in the log errors being of the order of 10^-36,
% we could say that all of them perform similarly when looking at the norm
% 2 of the residuals.

%% Problem 3: Condition Numbers
% Calculate the condition number of each method for n = 10.
m = 50; n = 10;
[~, ~, ~, kappa_10] = moreLeastSquares(m, n);

%%
% The condition numbers for the different methods and values of n are
% contained on the table below.
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
% According to the rule in the homework let k be the number of digits lost and 
% K(A) the condition number of the problem, they are related by the following formula
% K(A) = 10^k, thus k = log10(K(A))
% The results are summarized in the table below. The worst results are for
% the case where we use the normal equations. This was expected as the use
% of the normal equations is an unstable method for doing least squares as
% K(A'*A) = K(A)^2 and not K(A)
f_digits_lost = @(k)(log10(k));
dig_lost_5 = f_digits_lost(kappa_5);
dig_lost_10 = f_digits_lost(kappa_10);

fprintf('\n\nMethods \t\t | \t\t 5 steps \t\t | \t\t 10 steps \n');
for it = 1:length(kappa_5)
    if it == length(kappa_5)
        fprintf('%s \t\t\t | \t\t %f \t\t | \t\t %f\n', labels{it}, dig_lost_5(it), dig_lost_10(it));
    elseif it == 3
        fprintf('%s \t | \t\t %f \t\t | \t\t %f\n', labels{it}, dig_lost_5(it), dig_lost_10(it));
    else 
        fprintf('%s \t\t | \t\t %f \t\t | \t\t %f\n', labels{it}, dig_lost_5(it), dig_lost_10(it));
    end
end
