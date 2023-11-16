% runTwoParallelLinkSim.m

function result = runTwoParallelLinkSim(K, p, N)
    % Function to simulate a two-parallel link network

    simResults = ones(1, N); % a place to store the result of each simulation

    for i = 1:N
        txAttemptCount = 0; % transmission count
        pktSuccessCount = 0; % number of packets that have made it across

        while pktSuccessCount < K
            % Attempt to transmit on the first parallel link
            r1 = rand; % gen random num to determine if packet is successful (r1 > p)
            txAttemptCount = txAttemptCount + 1; % count 1st attempt

            % while packet transmissions on the first parallel link are not successful (r1 < p)
            while r1 < p
                r1 = rand; % transmit again, generate new success check value r1
                txAttemptCount = txAttemptCount + 1; % count additional attempt
            end

            % Attempt to transmit on the second parallel link
            r2 = rand; % gen random num to determine if packet is successful (r2 > p)
            txAttemptCount = txAttemptCount + 1; % count 1st attempt on the second parallel link

            % while packet transmissions on the second parallel link are not successful (r2 < p)
            while r2 < p
                r2 = rand; % transmit again, generate new success check value r2
                txAttemptCount = txAttemptCount + 1; % count additional attempt
            end

            pktSuccessCount = pktSuccessCount + 1; % increase success count after success on both parallel links
        end

        simResults(i) = txAttemptCount; % record the total number of attempted transmissions before the entire application message (K successful packets) is transmitted
    end

    result = mean(simResults); % return the average result across all simulations
end
