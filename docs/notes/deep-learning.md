# 《神经网络与深度学习》笔记

## 机器学习三大要素

### 模型

通常来说，一个模型就是一个自适应的函数族，通常表述为

$$
\mathcal{F} = \{f(\mathbf{x}; \theta) \mid \theta \in \mathbb{R}^D\}
$$

其中 $\mathbf{x}$ 是一个 $D$ 维的向量，而 $\theta$ 是该函数的参数集。

#### 线性模型

自变量元素的线性组合称为线性模型。即

$$
\begin{aligned}
f(\mathbf{x}; \theta) = \mathbf{\omega}^T \mathbf{x} + b\\
= \begin{pmatrix}
\omega_1 & \omega_2 & \cdots & \omega_D
\end{pmatrix} \begin{pmatrix}
x_1 \\
x_2 \\
\cdots \\
x_D
\end{pmatrix} + b
\end{aligned}
$$

其中 $\omega$ 为权重，$b$ 为偏移参数。

也可以写作如下的形式：

$$
\begin{aligned}
f(\mathbf{x}; \theta) = \displaystyle \sum_{k = 1}^{D} \omega_i x_i + b \\= \omega_1 x_1 + \omega_2 x_2 + \cdots + \omega_D x_D + b
\end{aligned}
$$

#### 非线性模型

将 $\mathbf{x}$ 做一些函数变换之后再嵌入线性模型，便得到非线性模型。数学化的表述为：

$$
\begin{aligned}
f(\mathbf{x}; \theta) = \omega^T \varphi(\mathbf{x}) + b\\
= \begin{pmatrix}
\omega_1 & \omega_2 & \cdots & \omega_D
\end{pmatrix} \begin{pmatrix}
\varphi_1(x_1) \\
\varphi_2(x_2) \\
\cdots \\
\varphi_D(x_D)
\end{pmatrix} + b
\end{aligned}
$$

也可展开表述为：

$$
f(\mathbf{x}; \theta) = \omega_1 \varphi_1(x_1) + \omega_2 \varphi_2(x_2) + \cdots + \omega_D \varphi(x_D) + b
$$

### 学习准则

模型的好坏可以通过期望风险 $\mathcal{R}(\theta)$ 来衡量（$\mathcal{R}$ 即 $\text{Risk}$）。其定义为：

$$
\mathcal{R}(\theta) = \mathbf{E}(\mathcal{L}(y, \hat{y_{\theta}}))
$$

其中 $\mathcal{L}(y, \hat{y_{\theta}})$ 为损失函数，用来衡量估计值和真实值之间损失的大小。

#### 损失函数

##### 0-1 损失

直接判断真实值和预测值是否相等，如果相等则定义为 $0$。也就是

$$
\mathcal{L}(y, \hat{y_{\theta}}) = 1 - [y = \hat{y_{\theta}}]
$$

##### 平方损失函数

将损失正化的一种方式。

$$
\mathcal{L}(y, \hat{y_{\theta}}) = \cfrac{1}{2} \left(y - \hat{y_{\theta}}\right)
$$

##### 交叉熵损失函数

用于分类问题。不妨设 $f(\mathbf{x}; \theta) = \hat{y_{\theta}}$ 的输出是一个概率向量 $\mathbf{p}$，满足

$$
\mathbf{p} = \begin{pmatrix}
p_1 \\
p_2 \\
\cdots \\
p_C
\end{pmatrix}
$$

满足 $\displaystyle \sum_{k = 1}^{C} p_k = 1$，$p_k$ 为预测为 $y_k$ 类别的概率。

再设一个 $\text{one-hot}$ 向量 $\mathbf{y}$，其真实值 $k$ 所在维度 $y_k$ 为 $1$，其他都为 $0$。本质上来说，$\mathbf{y}$ 是一个退化的概率向量。

定义交叉熵损失函数为：

$$
\begin{aligned}
\mathcal{L}(\mathbf{y}, \hat{y_{\theta}}) = -\mathbf{y}^T \log \mathbf{p}\\
= - \begin{pmatrix}
0 \\
0 \\
\cdots \\
1 \\
\cdots \\
0
\end{pmatrix} \begin{pmatrix}
\log p_1 & \log p_2 & \cdots & \log p_k & \cdots & \log p_C
\end{pmatrix}\\
= - \log p_k
\end{aligned}
$$

#### 风险计算

##### 经验风险

在没有测试数据集的情况下可以计算训练集上的平均损失作为经验损失：

$$
\mathcal{R}_{\mathcal{D}}^{emp}(\theta) = \cfrac{1}{N} \displaystyle \sum_{n=1}^{N} \mathcal{L}(y^{(n)}, \hat{y}_{\theta} ^{(n)})
$$

目标是找到参数 $\theta^*$ 使得经验风险最小。即

$$
\theta^* = \arg \min_{\theta} \mathcal{R}_{\mathcal{D}}^{emp} (\theta)
$$

##### 结构风险

为了避免过拟合，引入参数的正则化来限制模型能力，就是结构最小化。

$$
\begin{aligned}
\theta^* = \arg \min_{\theta} \mathcal{R}_{\mathcal{D}}^{struct} (\theta)\\
= \arg \min_{\theta} \mathcal{R}_{\mathcal{D}}^{emp} (\theta) + \cfrac{1}{2} \lambda ||\theta||^2\\
= \arg \min_{\theta} \cfrac{1}{N} \displaystyle \sum_{n=1}^{N} \mathcal{L}(y^{(n)}, f(x^{(n)}; \theta)) + \cfrac{1}{2} \lambda ||\theta||^2
\end{aligned}
$$

#### 优化算法

在确定了一个训练集 $\mathcal{D}$、假设空间 $\mathcal{F}$ 后，找到最优的参数 $\theta^*$ 是算法的目标。下面是几种常见的算法优化方式。

##### 梯度下降法

$\alpha$ 为步长，$\mathcal{R}_{\mathcal{D}}(\theta)$ 为风险函数，则有迭代公式

$$
\begin{aligned}
\theta_{t + 1} = \theta_t - \alpha \cfrac{\partial \mathcal{R}_{\mathcal{D}}(\theta)}{\partial \theta}\\
= \theta_t - \alpha \cfrac{1}{N} \displaystyle \sum_{n = 1}^{N} \cfrac{\partial \mathcal{L}(y^{(n)}, f(\mathbf{x}^{(n)}; \theta))}{\partial \theta}
\end{aligned}
$$

##### 随机梯度下降法

每次随机选择一个训练集中的数据并且做梯度下降。由于期望训练集是随机选取的，因此期望不同训练数据是自由独立的。

##### 小批量梯度下降法

结合随机梯度下降法（每次选择一个样本）和总体梯度下降法（每次选择全训练集），小批量梯度下降法每次选择训练集中的一个子集 $\mathcal{S}_t$，并且对这个子集做梯度下降：

$$
\theta_{t+1} = \theta_{t} - \alpha \cfrac{1}{|\mathcal{S}|} \displaystyle \sum_{(x, y) \in \mathcal{S}_t}^{} \cfrac{\partial \mathcal{L}(y, f(\mathbf{x}; \theta))}{\partial \theta} 
$$

