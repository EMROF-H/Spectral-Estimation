# 课设“基于特征空间的谱估计”

## 样本产生
信号 $\pmb{X}[t]$ ，白噪声 $\pmb{N}$ ，其中 $X_n[t] = A\exp(i\omega t + n*\psi + \phi) + N_n$ 

## 统计量定义
### 基于信号
对于信号 $\pmb{X}$ ，均值定义为
$$\pmb{\mu} = E[\pmb{X}]$$
自协方差矩阵定义为
$$\Sigma = E[(\pmb{X}-\pmb{\mu})(\pmb{X}-\pmb{\mu})^\mathrm{H}]$$
自相关矩阵定义为
$$R = E[\pmb{X}\pmb{X}^\mathrm{H}]$$

### 基于样本
对于样本 $\pmb{X}[t]$ ，均值定义为
$$\pmb{\mu} = \frac{1}{T} \sum_t \pmb{X}[t]$$
自协方差矩阵定义为
$$\Sigma = \frac{1}{T-1} \sum_t (\pmb{X}[t]-\pmb{\mu})(\pmb{X}[t]-\pmb{\mu})^\mathrm{H}$$
自相关矩阵定义为
$$R = \frac{1}{T} \sum_t \pmb{X}[t]\pmb{X}[t]^\mathrm{H}$$

## 估计方法:MUSIC (MUltiple SIgnal Classification)
### 信号建模
首先，我们认为信号有 $p$ 个频率分量，定义信号幅度矢量为
$$\pmb{S} = [s_1,s_2,...,s_p]^\mathrm{T}$$
而我们测出 $M$ 个测量值( $M{\leqslant}p+1$ )，那么定义旋转矢量（Steering Vector）
$$\pmb{a}(\omega) = [1,e^{j\omega},e^{j2\omega},...,e^{j(M-1)\omega}]^\mathrm{T}$$
他表示 $M$ 个等相位差测量装置的相位分布情况，而 $\omega$ 即为相邻接收装置的相位差；
现假设第1个接收装置接收到的信号没有相位差，那么他接收到的信号应为 $x_1 = [1,1,...,1]\pmb{S}$ ，自然也就知道了第 $m$ 个接收装置接收到的信号为
$$x_m = e^{j(m-1)\omega}x_1$$
设接收信号矢量
$$\pmb{x}=[x_1,x_2,...,x_M]^\mathrm{H}$$
把他展开，可以提取出 $\pmb{a}(\omega)$ 得到
$$\pmb{x} = \pmb{A}\pmb{S}$$
其中
$$\pmb{A} = [\pmb{a}(\omega_1),\pmb{a}(\omega_2),...,\pmb{a}({\omega}_p)]$$
是一个由旋转矢量组成的范德蒙矩阵(Vandermonde matrix)；
除此之外，信号在传输过程中会出现噪声，我们设噪声为 $\pmb{N}$ ，它的各个分量都是方差为 $\sigma^2$ 的白噪声且互相正交；从而得到接收信号最终的建模为
$$\pmb{x} = \pmb{A}\pmb{S}+\pmb{N}$$

### 估计步骤
#### 1.求信号的自相关矩阵
我们拿到了信号 $\pmb{x}$ ，先求其自相关矩阵
$$\pmb{R}_x = E[\pmb{x}\pmb{x}^\mathrm{H}]$$
代入可得
$$\pmb{R}_x = E[(\pmb{A}\pmb{S} + \pmb{N})(\pmb{S}^\mathrm{T}\pmb{A}^\mathrm{T} + \pmb{N}^\mathrm{T})]$$
展开得
$$\pmb{R}_x = E[\pmb{A}\pmb{S}\pmb{S}^\mathrm{T}\pmb{A}^\mathrm{T}] + E[\pmb{A}\pmb{S}\pmb{N}^\mathrm{T}] + E[\pmb{N}\pmb{S}^\mathrm{T}\pmb{A}^\mathrm{T}] + E[\pmb{N}\pmb{N}^\mathrm{T}]$$
由于 $\pmb{N}$ 的性质，得 $E[\pmb{A}\pmb{S}\pmb{N}^\mathrm{T}] = E[\pmb{N}\pmb{S}^\mathrm{T}\pmb{A}^\mathrm{T}] = 0$ ，所以我们有
$$\pmb{R}_x = \pmb{A}(E[\pmb{S}\pmb{S}^\mathrm{T}])\pmb{A}^\mathrm{T} + E[\pmb{N}\pmb{N}^\mathrm{T}]$$
即
$$\pmb{R}_x = \pmb{A}\pmb{R}_s\pmb{A}^\mathrm{T} + \pmb{R}_n$$
最终可以得到
$$\pmb{R}_x = \pmb{A}\pmb{R}_s\pmb{A}^\mathrm{T} + \sigma^2\pmb{I}$$
其中 $\pmb{R}_x$ 是 $M$ 阶方阵，而 $\pmb{R}_s$ 是 $p$ 阶方阵。

#### 2.特征空间
根据自相关矩阵的性质，接收信号 $\pmb{x}$ 的自相关矩阵 $\pmb{R}_x$ 一定是一个厄米矩阵，所以可以进行特征值分解且特征值一定为实数；将分解后得特征值按照从大到小得顺序排列，得到特征向量组 ${\pmb{v}_1,\pmb{v}_2,...,\pmb{v}_M}$ ，定义前 $p$ 个特征向量组 $\pmb{U}_s = [\pmb{v}_1,\pmb{v}_2,...,\pmb{v}_p]$ 即为信号子空间，而后 $M-p$ 个特征向量组 $\pmb{U}_s = [\pmb{v}_1,\pmb{v}_2,...,\pmb{v}_p]$ 即为噪声子空间，且与信号子空间正交；
由此，我们可以定义信号矢量 $\pmb{e}$ 与噪声子空间的平方范数
$$d^2 = {\Vert{\pmb{U}_n^\mathrm{H}\pmb{e}}\Vert}^2 = \pmb{e}^\mathrm{H}\pmb{U}_n\pmb{U}_n^\mathrm{H}\pmb{e} = \sum_{i=p+1}^{M}{|\pmb{e}^\mathrm{H}\pmb{v}_i|}^2$$
其表征了 $\pmb{e}$ 在噪声子空间投影的大小，自然如果  $\pmb{e}$ 完全由信号组成，则其与噪声子空间正交，其平方范数 $d^2=0$ ，那么 $d^2$ 的倒数会产生一个尖峰，也就是功率谱中信号频率位置的冲激函数。最后，MUSIC方法估计的功率谱为
$$\hat{P}(e^{j\omega}) = \frac{1}{d^2} = \frac{1}{\sum_{i=p+1}^M{|\pmb{b}^\mathrm{H}\pmb{v}_i|}^2}$$

$\pmb{U}_s = [\pmb{v}_1,\pmb{v}_2,...,\pmb{v}_p]$
$\pmb{U}_n = [\pmb{v}_p,\pmb{v}_{(p+1)},...,\pmb{v}_M]$