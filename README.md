# 课设“基于特征空间的谱估计”

## 样本产生
信号$\bm{X}[t]$，白噪声$\bm{N}$，其中$X_n[t] = A\exp(i\omega t + n*\psi + \phi) + N_n$

## 统计量定义
### 基于信号
对于信号$\bm{X}$，均值定义为
$$\bm{\mu} = E[\bm{X}]$$
自协方差矩阵定义为
$$\Sigma = E[(\bm{X}-\bm{\mu})(\bm{X}-\bm{\mu})^\mathrm{H}]$$
自相关矩阵定义为
$$R = E[\bm{X}\bm{X}^\mathrm{H}]$$

### 基于样本
对于样本$\bm{X}[t]$，均值定义为
$$\bm{\mu} = \frac{1}{T} \sum_t \bm{X}[t]$$
自协方差矩阵定义为
$$\Sigma = \frac{1}{T-1} \sum_t (\bm{X}[t]-\bm{\mu})(\bm{X}[t]-\bm{\mu})^\mathrm{H}$$
自相关矩阵定义为
$$R = \frac{1}{T} \sum_t \bm{X}[t]\bm{X}[t]^\mathrm{H}$$

## 估计方法

### Fourier变换估计方法
