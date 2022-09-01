function Plotdb(input, titleString, xlabelString, ylabelString)
    [~, number] = size(input);
    hold on;

    for index = 2:number
        plot(input(:, 1), 10 * log10(input(:, index)));
    end

    grid on;
    xlabel(xlabelString);
    ylabel(ylabelString);
    title(titleString);
    hold off;
end
