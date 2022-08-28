addpath(genpath(pwd));

size = 128;

signal = RandomGenerate('ComplexNormal',struct('mean',0,'variance',1),size)                 ...
       + SineGenerate('Complex',struct('amplitude',10,'frequency',1/16*pi,'parse',0),size)  ...
       + SineGenerate('Complex',struct('amplitude',6,'frequency',1/10*pi,'parse',2),size);

subplot(2, 2, 1);
PlotComplex(signal,'Complex Signal');

selfCorrelation = xcorr(signal);
subplot(2, 2, 2);
PlotComplex(selfCorrelation,'Self Correlation');

powerSpectralDensity = fft(selfCorrelation);
subplot(2, 2, 3);
PlotComplex(powerSpectralDensity,'Power Spectral Density');