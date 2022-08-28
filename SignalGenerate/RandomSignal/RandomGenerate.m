%名字：随机过程采样函数
%功能：用于随机过程的采样
%参数：
%   type:随机过程分布类型
%   parameters:随机过程分布参数
%   size:采样点数量，即样本容量
%返回：随机过程样本结构体

function randomSignal = RandomGenerate(type,parameters,size)
    if      (strcmp(type,'Normal'))
        randomSignals = NormalRandom(parameters,size);
    elseif  (strcmp(type,'ChiSquare'))
        randomSignals = ChiSquareRandom(parameters,size);
    elseif  (strcmp(type,'Uniform'))
        [randomSignals,parameters] = UniformRandom(parameters,size);
    end

    randomSignal = struct(                  ...
        'type',type,                        ...
        'value',randomSignals,              ...
        'theoreticalParameter',parameters,  ...
        'measuredParameter',struct          ...
        (                                   ...
            'mean',mean(randomSignals),     ...
            'variance',var(randomSignals)   ...
        ),                                  ...
        'size',size                         ...
    );
end