function steeringMatrix = GenerateSteeringMatrix(phaseVector, m)
    steeringMatrix = ones(m, length(phaseVector));
    FactorVector = exp(1i * phaseVector);
    for row = 2:m
        steeringMatrix(row,:) = steeringMatrix(row - 1,:) .* FactorVector';
    end
end
