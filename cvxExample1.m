%% A simple example from others
% CVX optimization
m = 20; n = 10; p = 4;
A = randn(m,n); b = randn(m,1);
C = randn(p,n); d = randn(p,1); e = rand;
cvx_begin
    variable x(n)  % Variables to be optimized
    minimize( norm( A * x - b, 2 ) )  % Target function
    subject to    % Constraints
        C * x == d
        norm( x, Inf ) <= e
cvx_end
