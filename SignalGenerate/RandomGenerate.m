%名字：随机过程采样函数
%功能：用于随机过程的采样
%参数：
%   type:随机过程分布类型
%   parameters:随机过程分布参数
%   size:采样点数量，即样本容量
%返回：随机过程样本结构体

function randomSignal = RandomGenerate(type,parameters,size)
    if      (strcmp(type,'Normal'))
        randomSignal = NormalRandom(parameters,size);
    elseif  (strcmp(type,'ComplexNormal'))
        randomSignal = ComplexNormalRandom(parameters,size);
    elseif  (strcmp(type,'ChiSquare'))
        randomSignal = ChiSquareRandom(parameters,size);
    elseif  (strcmp(type,'Uniform'))
        randomSignal = UniformRandom(parameters,size);
    end
end

%——————————————————————————————————————————————————————————————

%名字：高斯随机过程采样
%功能：用于高斯随机过程采样
%参数：
%   parameters:随机过程分布参数结构体
%       mean:均值
%       variance:方差
%   size:采样点数量，即样本容量
%返回：随机过程样本结构体

function normalRandom = NormalRandom(parameters,size)
    normalRandom = randn(1,size);
    normalRandom = parameters.mean + sqrt(parameters.variance) .* normalRandom;
end

%名字：复高斯随机过程采样
%功能：用于高斯随机过程采样
%参数：
%   parameters:随机过程分布参数结构体
%       mean:均值
%       variance:方差
%   size:采样点数量，即样本容量
%返回：随机过程样本结构体

function complexNormalRandom = ComplexNormalRandom(parameters,size)
    complexNormalRandom = randn(1,size) + 1i*randn(1,size);
    complexNormalRandom = parameters.mean + sqrt(parameters.variance) .* complexNormalRandom;
end

%名字：卡方随机过程采样
%功能：用于卡方随机过程采样
%参数：
%   parameters:随机过程分布参数结构体
%       freedomDegree:自由度
%       mean:均值
%       variance:方差
%   size:采样点数量，即样本容量
%返回：随机过程样本结构体

function chiSquareRandom = ChiSquareRandom(parameters,size)
    lamda = sqrt(parameters.mean^2-(parameters.freedomDegree/2)*parameters.variance);
    varianceNormal = (parameters.mean-lamda)/parameters.freedomDegree;

    chiSquareRandom = NormalRandom(struct('mean',sqrt(lamda),'variance',varianceNormal),size).^2;
    for n = 1:parameters.freedomDegree-1
        chiSquareRandom = chiSquareRandom + NormalRandom(struct('mean',0,'variance',varianceNormal),size).^2;
    end
end

%名字：均匀随机过程采样
%功能：用于均匀随机过程采样
%参数：
%   parameters:随机过程分布参数结构体
%       a:下界
%       b:上界
%   size:采样点数量，即样本容量
%返回：[随机过程样本结构体,更新的参数结构体]

function uniformRandom = UniformRandom(parameters,size)
    long = parameters.b-parameters.a;
    
    uniformRandom = rand(1,size);
    uniformRandom = parameters.a+uniformRandom*long;
end