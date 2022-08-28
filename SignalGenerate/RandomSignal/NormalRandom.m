%名字：高斯随机过程采样
%功能：用于高斯随机过程采样
%参数：
%   parameters:随机过程分布参数结构体
%       mean:均值
%       variance:方差
%   size:采样点数量，即样本容量
%返回：随机过程样本结构体

function normalRandom = NormalRandom(parameters,size)
    normalRandom = randn(size,1);
    normalRandom = parameters.mean + sqrt(parameters.variance) .* normalRandom;
end