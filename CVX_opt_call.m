%% CVX function call
% Created by Phoenix_TAN  
% Aug, 10, 2018
function [Th, Ttr, R, throughput] = CVX_opt_call( N, B, Pnoise, Ptr, h, T, Pcf, Pr, Tse, sigma, Pse, Ph, Qos )

Th = 0.000;
Ttr = zeros(1,N); 

%% Convex Optimization begins
cvx_begin
    variable Th
    variable Ttr(1,N)  
    for i = 1:N
        R(i) = Ttr(i)*B*log2(1+Ptr*h(i)^2/Pnoise)*(1-Pcf)*Pr;
    end
    throughput = sum(R)    
    maximize ( throughput ) 
    subject to
        Th + Tse + sum(Ttr) <= T;  % Time Constraint
        for i=1:N  % Use for loop to constraint the Ttr(i)
            Ttr(i) * Ptr + Tse * sigma(i) * Pse <= Th * Ph(i) + Tse * (1-sigma(i)) * Ph(i); % Energy Constraint
            Ttr(i)>=0;
            Th >= 0;
            R(i) >= Qos(i);  % Qos Constraint
        end
        
cvx_end
