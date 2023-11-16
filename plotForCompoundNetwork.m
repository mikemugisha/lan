% main.m

% Define parameters
K_values = [1, 5, 15, 50, 100];
N = 1000;
p_values = linspace(0.1, 0.99, 100); % 100 values of p between 0.1 and 0.99

% Initialize figures
figure;

% Loop over different values of K
for k = 1:length(K_values)
    K = K_values(k);

    % Simulate results using the new function
    simResults = zeros(size(p_values));
    for i = 1:length(p_values)
        p = p_values(i);
        simResults(i) = runCompoundNetworkSim(K, p, N);
    end

    % Plot the results for each K value
    loglog(p_values, simResults, 'o-', 'MarkerEdgeColor', 'b'); % Simulated results (hollow circles)
    hold on;
end

% Configure plot for all K values
title('Simulated Results for Compound Network');
xlabel('Probability of Unsuccessful Transmission (p)');
ylabel('Average Number of Transmissions');
legend('K=1', 'K=5', 'K=15', 'K=50', 'K=100');
grid on;
