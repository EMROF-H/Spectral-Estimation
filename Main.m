addpath(genpath(pwd));  % 引用工程文件

%% 常量定义
tau = 2 * pi;

%% 参数定义
SampleFrequency = 5000; % 采样频率
SamplePoints = 1024;    % 采样点数

P = 8;    % 信号数量
M = 10;   % 测量装置数量
AnalogFrequencyVector = 100 * (1:2:15)';     % 信号频率矢量
AmplitudeVector = [5 2 1 4 2 5 3 1]';  % 信号幅度矢量

NoiseVariance = 10;     % 噪声方差

%% 参数生成
SampleTime = SamplePoints / SampleFrequency;    % 采样时长
FrequencyVector = tau * AnalogFrequencyVector / SampleFrequency;   % 采样频率
SteeringMatrix = GenerateSteeringMatrix(FrequencyVector, P);

%% 信号生成


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

