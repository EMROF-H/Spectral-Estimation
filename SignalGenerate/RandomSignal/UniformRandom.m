%名字：均匀随机过程采样
%功能：用于均匀随机过程采样
%参数：
%   parameters:随机过程分布参数结构体
%       a:下界
%       b:上界
%   size:采样点数量，即样本容量
%返回：[随机过程样本结构体,更新的参数结构体]

function [uniformRandom,parameters] = UniformRandom(parameters,size)
    long = parameters.b-parameters.a;
    
    uniformRandom = rand(size,1);
    uniformRandom = parameters.a+uniformRandom*long;

    parameters.mean = (parameters.a+parameters.b)/2;
    parameters.variance = long^2/12;
end