% main_custom.m

% Define parameters
K_values = [1, 5, 10, 15, 50, 100];
N = 1000;
p_values = linspace(0.1, 0.99, 100);

% Custom failure probabilities for each figure
custom_probs = [
    0.1, 0.6, 0.01;
    0.6, 0.1, 0.01;
    0.1, 0.01, 0.6;
    0.6, 0.01, 0.1;
    0.01, 0.6, 0.1;
    0.01, 0.1, 0.6
];

% Initialize figures
figure;

% Loop over different figures
for fig = 1:size(custom_probs, 1)
    % Simulate results using the custom function
    simResults = zeros(length(K_values), length(p_values));
    for k = 1:length(K_values)
        K = K_values(k);
        for i = 1:length(p_values)
            p = p_values(i);
            p_values_custom = custom_probs(fig, :);
            simResults(k, i) = runCustomCompoundNetworkSim(K, p_values_custom(1), p_values_custom(2), p_values_custom(3), N);
        end
    end

    % Plot the results for each figure
    subplot(2, 3, fig);
    for k = 1:length(K_values)
        loglog(p_values, simResults(k, :), 'o-', 'MarkerEdgeColor', 'b'); % Simulated results (hollow circles)
        hold on;
    end

    % Configure plot for each figure
    title(['Figure ' num2str(fig)]);
    xlabel('Probability of Unsuccessful Transmission (p)');
    ylabel('Average Number of Transmissions');
    legend('K=1', 'K=5', 'K=10', 'K=15', 'K=50', 'K=100');
    grid on;
end
