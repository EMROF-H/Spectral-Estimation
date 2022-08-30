# 课设“基于特征空间的谱估计”

## 样本产生
信号$\pmb{X}[t]$，白噪声$\pmb{N}$，其中$X_n[t] = A\exp(i\omega t + n*\psi + \phi) + N_n$

## 统计量定义
### 基于信号
对于信号$\pmb{X}$，均值定义为
$$\pmb{\mu} = E[\pmb{X}]$$
自协方差矩阵定义为
$$\Sigma = E[(\pmb{X}-\pmb{\mu})(\pmb{X}-\pmb{\mu})^\mathrm{H}]$$
自相关矩阵定义为
$$R = E[\pmb{X}\pmb{X}^\mathrm{H}]$$

### 基于样本
对于样本$\pmb{X}[t]$，均值定义为
$$\pmb{\mu} = \frac{1}{T} \sum_t \pmb{X}[t]$$
自协方差矩阵定义为
$$\Sigma = \frac{1}{T-1} \sum_t (\pmb{X}[t]-\pmb{\mu})(\pmb{X}[t]-\pmb{\mu})^\mathrm{H}$$
自相关矩阵定义为
$$R = \frac{1}{T} \sum_t \pmb{X}[t]\pmb{X}[t]^\mathrm{H}$$

## 估计方法

### Fourier变换估计方法
