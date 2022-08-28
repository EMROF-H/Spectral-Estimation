addpath(genpath(pwd));

size = 1024;

signal = RandomGenerate('ComplexNormal',struct('mean',0,'variance',1),size)                 ...
       + SineGenerate('Complex',struct('amplitude',10,'frequency',1/128*pi,'parse',0),size)  ...
       + SineGenerate('Complex',struct('amplitude',6,'frequency',1/50*pi,'parse',2),size);
plot(real(signal));