%% 初始化
addpath(genpath(pwd)); % 引用工程文件
Initialize();

%% 参数定义
SampleFrequency = 5000; % 采样频率
SamplePoints = 2000; % 采样点数

M = 10; % 测量装置数量
P = 8; % 信号数量
AmplitudeVector = [10, 5, 0, 8, 0, 12, 0, 5]'; % 信号幅度矢量
AnalogFrequencyVector = [500, 1000, 1500, 2000, 2500, 3000, 3500, 4500]'; % 信号频率矢量
PhaseVector = [0, 0, 0, 0, 0, 0, 0, 0]; % 信号相位矢量

SignalToNoiseRatio = 0.1; % 信噪比

%% 常量定义

tau = 2 * pi;

%% 参数生成
SignalPower = sum(AmplitudeVector.^2/2); % 信号功率
NoisePower = SignalPower / SignalToNoiseRatio; % 噪声功率
NoiseVariance = NoisePower; % 噪声方差
SampleTime = SamplePoints / SampleFrequency; % 采样时长
ArgfrequencyVector = tau * AnalogFrequencyVector / SampleFrequency; % 数字角频率
psdindependentSequence = tau * (0:1:(SamplePoints - 1))' / SamplePoints; % 功率谱密度自变量
psddisplayindependentSequence = ((0:1:(SamplePoints - 1))' / SamplePoints) * SampleFrequency; % 功率谱密度自变量

%% 信号生成
SteeringMatrix = GenerateSteeringMatrix(ArgfrequencyVector, M);
sourceVectorSignal = SineVectorSample(AmplitudeVector, ArgfrequencyVector, PhaseVector, SamplePoints);
noiseVectorSignal = RandomVectorSample('Normal', struct('mean', 0, 'variance', NoiseVariance), M, SamplePoints);
receiveVectorSignal = SteeringMatrix * sourceVectorSignal + noiseVectorSignal;

%% 基于特征空间估计
autocorrelationMatrix = AutocorrelationMatrix(receiveVectorSignal);
[eigenvectorMatrix, eigenvalueMatrix] = EigenvalueDecomposition(autocorrelationMatrix);
[signalEigenspaceMatrix, noiseEigenspaceMatrix] = EigenvectorMatrixFactorization(eigenvectorMatrix, P);

%求功率谱密度序列
psdSequence = PsdSequence(psdindependentSequence, noiseEigenspaceMatrix);
fourierpsdSequence = FourierpsdSequence(receiveVectorSignal);

psdSequence = psdSequence * sum(fourierpsdSequence) / sum(psdSequence);

Plotdb([psddisplayindependentSequence psdSequence fourierpsdSequence], ...
    'Power Spectral Density', 'Frequency/Hz', 'Power/dB');
