function steeringMatrix = GenerateSteeringMatrix(frequencyVector, m)
    steeringMatrix = ones(length(frequencyVector), m);
    FactorVector = exp(1i * frequencyVector);
    for row = 2:m
        steeringMatrix(row,:) = steeringMatrix(row - 1,:) .* FactorVector';
    end
end