% runCustomCompoundNetworkSim.m

function result = runCustomCompoundNetworkSim(K, p1, p2, p3, N)
    % Function to simulate a compound network with custom failure probabilities

    simResults = zeros(1, N); % a place to store the result of each simulation

    for i = 1:N
        txAttemptCount = 0; % transmission count
        pktSuccessCount = 0; % number of packets that have made it across

        while pktSuccessCount < K
            % Attempt to transmit on the first parallel link
            r1 = rand; % gen random num to determine if packet is successful (r1 > p1)
            txAttemptCount = txAttemptCount + 1; % count 1st attempt

            % while packet transmissions on the first parallel link are not successful (r1 < p1)
            while r1 < p1
                r1 = rand; % transmit again, generate new success check value r1
                txAttemptCount = txAttemptCount + 1; % count additional attempt
            end

            % Attempt to transmit on the second parallel link
            r2 = rand; % gen random num to determine if packet is successful (r2 > p2)
            txAttemptCount = txAttemptCount + 1; % count 1st attempt on the second parallel link

            % while packet transmissions on the second parallel link are not successful (r2 < p2)
            while r2 < p2
                r2 = rand; % transmit again, generate new success check value r2
                txAttemptCount = txAttemptCount + 1; % count additional attempt
            end

            % Attempt to transmit on the series link
            r3 = rand; % gen random num to determine if packet is successful (r3 > p3)
            txAttemptCount = txAttemptCount + 1; % count 1st attempt on the series link

            % while packet transmissions on the series link are not successful (r3 < p3)
            while r3 < p3
                r3 = rand; % transmit again, generate new success check value r3
                txAttemptCount = txAttemptCount + 1; % count additional attempt
            end

            pktSuccessCount = pktSuccessCount + 1; % increase success count after success on all links
        end

        simResults(i) = txAttemptCount; % record the total number of attempted transmissions before the entire application message (K successful packets) is transmitted
    end

    result = mean(simResults); % return the average result across all simulations
end
