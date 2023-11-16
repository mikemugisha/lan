% Script to plot results
K_values = [1, 5, 15, 50, 100];
p_values = linspace(0.01, 0.99, 100); % Values of p from 0.01 to 0.99
iterations = 1000;

% Initialize matrix to store simulated results
simulated_results_matrix = zeros(length(K_values), length(p_values));

% Simulate results for each K value
for i = 1:length(K_values)
    K = K_values(i);
    
    % Simulated results
    for j = 1:length(p_values)
        simulated_results_matrix(i, j) = runSingleLinkSim(K, p_values(j), iterations);
    end
end

% Plot all K values on the same figure
figure;
for i = 1:length(K_values)
    K = K_values(i);
    plot(p_values, simulated_results_matrix(i, :), 'o-', 'LineWidth', 2, 'DisplayName', ['K = ', num2str(K)]);
    hold on;
end

title('Simulated Results for Different K Values');
xlabel('Probability (p)');
ylabel('Number of transmissions (log scale)');
set(gca, 'YScale', 'log');
legend('Location', 'Best');
grid on;
