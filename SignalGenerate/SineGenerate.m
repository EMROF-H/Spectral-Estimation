%名字：正弦信号生成函数
%功能：用于生成正弦信号
%参数：
%   type:类型
%   parameters:参数
%   size:采样点数量，即样本容量
%返回：正弦信号

function sineSignal = SineGenerate(type,parameters,size)
    if      (strcmp(type,'Real'))
        sineSignal = RealSine(parameters,size);
    elseif  (strcmp(type,'Complex'))
        sineSignal = ComplexSine(parameters,size);
    end
end

%——————————————————————————————————————————————————————————————

%名字：实正弦信号生成函数
%功能：用于生成实正弦信号
%参数：
%   parameters:参数结构体
%       amplitude:幅度
%       frequency:频率
%       parse:初相位
%   size:采样点数量，即样本容量
%返回：实正弦信号

function realSineSignal = RealSine(parameters,size)
    t = 0:1:(size-1);
    realSineSignal = parameters.amplitude * cos(parameters.frequency * t + parameters.parse);
end

%名字：复正弦信号生成函数
%功能：用于生成复正弦信号
%参数：
%   parameters:参数结构体
%       amplitude:幅度
%       frequency:频率
%       parse:初相位
%   size:采样点数量，即样本容量
%返回：复正弦信号

function complexSineSignal = ComplexSine(parameters,size)
    t = 0:1:(size-1);
    complexSineSignal = parameters.amplitude * (cos(parameters.frequency * t + parameters.parse)...
                                        + 1j *  sin(parameters.frequency * t + parameters.parse));
end