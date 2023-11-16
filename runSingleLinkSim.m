% runSingleLinkSimu.m

function result = runSingleLinkSimu(K, p, N)
    % Function to simulate a single-link network

    simResults = ones(1, N); % a place to store the result of each simulation

    for i = 1:N
        txAttemptCount = 0; % transmission count
        pktSuccessCount = 0; % number of packets that have made it across

        while pktSuccessCount < K
            r = rand; % gen random num to determine if packet is successful (r > p)
            txAttemptCount = txAttemptCount + 1; % count 1st attempt

            % while packet transmissions are not successful (r < p)
            while r < p
                r = rand; % transmit again, generate new success check value r
                txAttemptCount = txAttemptCount + 1; % count additional attempt
            end

            pktSuccessCount = pktSuccessCount + 1; % increase success count after success (r > p)
        end

        simResults(i) = txAttemptCount; % record the total number of attempted transmissions before the entire application message (K successful packets) is transmitted
    end

    result = mean(simResults); % return the average result across all simulations
end
