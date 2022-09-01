addpath(genpath(pwd)); % 引用工程文件

%% 参数定义
SampleFrequency = 5000; % 采样频率
SamplePoints = 1024; % 采样点数

M = 10; % 测量装置数量
P = 8; % 信号数量
AmplitudeVector = [5, 2, 1, 4, 2, 5, 3, 1]'; % 信号幅度矢量
AnalogFrequencyVector = 100 * (1:2:15)'; % 信号频率矢量
PhaseVector = [0, 0, 0, 0, 0, 0, 0, 0]; % 信号相位矢量

NoiseVariance = 10; % 噪声方差

%% 常量定义
tau = 2 * pi;

%% 参数生成
SampleTime = SamplePoints / SampleFrequency; % 采样时长
ArgfrequencyVector = tau * AnalogFrequencyVector / SampleFrequency; % 采样频率
psdindependentSequence = tau * ((0:1:(SamplePoints - 1)) / SamplePoints) * SampleFrequency; % 功率谱密度自变量

%% 信号生成
SteeringMatrix = GenerateSteeringMatrix(ArgfrequencyVector, M);
sourceVectorSignal = SineVectorSample(AmplitudeVector, FrequencyVector, PhaseVector, SamplePoints);
noiseVectorSignal = RandomVectorSample('Normal', struct('mean', 0, 'variance', NoiseVariance), M, SamplePoints);
receiveVectorSignal = SteeringMatrix * sourceVectorSignal + noiseVectorSignal;

%% 基于特征空间估计
autocorrelationMatrix = AutocorrelationMatrix(receiveVectorSignal);
[eigenvectorMatrix, eigenvalueMatrix] = EigenvalueDecomposition(autocorrelationMatrix);
[signalEigenspaceMatrix, noiseEigenspaceMatrix] = EigenvectorMatrixFactorization(eigenvectorMatrix, signalNumber);

%% 求功率谱密度序列
psdSequence = PsdSequence(psdindependentSequence, noiseEigenspaceMatrix)

% size = 128;

% signal = RandomGenerate('ComplexNormal',struct('mean',0,'variance',1),size)                 ...
%        + SineGenerate('Complex',struct('amplitude',10,'frequency',1/16*pi,'parse',0),size)  ...
%        + SineGenerate('Complex',struct('amplitude',6,'frequency',1/10*pi,'parse',2),size);

% subplot(2, 2, 1);
% PlotComplex(signal,'Complex Signal');

% selfCorrelation = xcorr(signal);
% subplot(2, 2, 2);
% PlotComplex(selfCorrelation,'Self Correlation');

% powerSpectralDensity = fft(selfCorrelation);
% subplot(2, 2, 3);
% PlotComplex(powerSpectralDensity,'Power Spectral Density');
