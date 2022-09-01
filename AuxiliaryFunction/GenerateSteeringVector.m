function steeringVector = GenerateSteeringVector(phase, m)
    steeringVector = ones(m, 1);
    Factor = exp(1i * phase);
    for row = 2:m
        steeringVector(row) = steeringVector(row - 1) * Factor;
    end
end
