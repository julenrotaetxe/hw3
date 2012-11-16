%% Custom function backSub
function x = backSub(U, b)
%BACKSUB 
n = length(b);
x = zeros(n, 1);
for i=n:-1:1
   x(i) = ( b(i) - U(i, :)*x ) / U(i, i);
end

end

