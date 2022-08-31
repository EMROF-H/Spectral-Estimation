function steeringVector = GenerateSteeringVector(frequency, m)
    steeringVector = ones(m, 1);
    Factor = exp(1i * frequency);
    for row = 2:m
        steeringVector(row) = steeringVector(row - 1) * Factor;
    end
end