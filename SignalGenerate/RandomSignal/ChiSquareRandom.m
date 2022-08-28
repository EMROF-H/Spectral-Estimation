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