function autocorrelationMatrix = AutocorrelationMatrix(inputVectorSignal)
    [Dimension,N] = size(inputVectorSignal);
    autocorrelationMatrix = zeros(Dimension,Dimension);
    for n = 1:N
        autocorrelationMatrix = autocorrelationMatrix   ...
            + inputVectorSignal(:,n) * inputVectorSignal(:,n)';
    end
    autocorrelationMatrix = autocorrelationMatrix / N;
end