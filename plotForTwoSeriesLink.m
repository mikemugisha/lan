% main.m

% Define parameters
K_values = [1, 5, 15, 50, 100];
N = 1000;
p_values = linspace(0, 0.99, 100); % 100 values of p between 0 and 1

% Initialize figures
figure;

% Loop over different values of K
for k = 1:length(K_values)
    K = K_values(k);

    % Calculate results (assuming a perfect channel without transmission errors)
    calcResults = K * ones(size(p_values));

    % Simulate results using the new function
    simResults = zeros(size(p_values));
    for i = 1:length(p_values)
        p = p_values(i);
        simResults(i) = runTwoSeriesLinkSim(K, p, N);
    end

    % Plot the results
    loglog(p_values, calcResults, 'r-', 'LineWidth', 2); % Calculated results (solid line)
    hold on;
    loglog(p_values, simResults, 'o', 'MarkerEdgeColor', 'b'); % Simulated results (hollow circles)
end

% Configure plot for all K values
title('Calculated vs. Simulated Results for Two-Series Link Network');
xlabel('Probability of Unsuccessful Transmission (p)');
ylabel('Average Number of Transmissions');
legend('K=1', 'Sim K=1', 'K=5', 'Sim K=5', 'K=15', 'Sim K=15', 'K=50', 'Sim K=50', 'K=100', 'Sim K=100');
grid on;
