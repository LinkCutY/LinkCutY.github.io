# 生成函数笔记

## 定义

定义形如 $f(x) = \sum \limits_{i = 0}^{\infty} a_i x ^ i$ 的式子为生成函数，其中 $x$ 是一个不定元，取值需要保证 $f(x)$ 收敛。需要注意的是，$x$ 在生成函数中并不以未知数的形式单独出现，其意义也脱离了代数上的未知数本身。

生成函数**大致**分为两种：$\text{OGF}$ 和 $\mathrm{EGF}$。前者主要用于无标号问题的计数，后者主要应用于有标号问题的计数。

**为了书写方便，在下文中，将 $a_0 + a_1 x + a_2 x ^ 2 \cdots$ 简写成 $\{a_0, a_1, a_2 \cdots\}$。**

## 约定

- **为了书写方便，在下文中，将 $a_0 + a_1 x + a_2 x ^ 2 \cdots$ 简写成 $\{a_0, a_1, a_2 \cdots\}$。**

- 将 $f(x)$ 中 $x ^ i$ 的系数记为 $[x ^ i]f(x)$，简记为 $f(x)[i]$。

## 数学基础

- **$\mathrm{D}$ 算子（求导算子）**

$\mathrm{D} f(x) = \lim \limits_{\delta \rightarrow 0} \dfrac{f(x +\delta) - f(x)}{\delta}$。

对于 $f(x)[i]$，对其施加以求导算子之后，$(\mathrm{D}f(x))[i] = (i + 1)f(x)[i + 1]$。

- **上升幂和下降幂**

定义 $x ^ {\underline{m}}$ 为 $x$ 的 $m$ 次下降幂，$x ^ {\underline{m}} = x(x - 1)(x - 2) \cdots (x - m + 1)$。

定义 $x ^ {\overline m}$ 为 $x$ 的 $m$ 次上升幂，$x ^ {\overline m} = x(x + 1)(x + 2) \cdots (x + m - 1)$。

下面是关于上升 / 下降幂的有用的性质：

- $x ^ {\underline{m + n}} = x ^ {\underline{m}} (x - m) ^ {\underline{n}}$

- $x ^ {\overline{m + n}} = x ^ {\overline{m}} (x + m) ^ {\overline{n}}$

- $x ^ {\underline{m}} = (-1)^ m (-x) ^ {\overline{m}} $

- $x ^ {\overline{m}} = (-1)^ m (-x) ^ {\underline{m}} $

- **$\Delta$ 算子（差分算子）**

类似求导算子，我们定义差分算子 $\Delta$，$\Delta f(x) = f(x +1) - f(x)$。

它不具有求导算子那样优美的性质，但是其对于下降幂来说，与求导的运算法则相同。具体的，$\Delta (x ^ {\underline{m}}) = m x ^ {\underline{m - 1}}$。

可以发现，差分算子和求导算子十分相似，他们也有一些比较相似的性质，例如：$\mathrm{D}(e ^ x) = e ^ x, \Delta(2 ^ x) = 2 ^ x$。

后面的两个公式常用于上升幂和下降幂的转化。

## 生成函数的封闭形式

对于 $\mathrm{OGF}$，其常常有自己的封闭形式。下面举几个例子。

- **Example 4.1：** $\{1, 1, 1,1  \cdots\}$ 的生成函数。

这是 OIer 最喜闻乐见的式子。不妨设 $f(x) = \sum \limits_{0}^{\infty} x ^ i$，则有 $xf(x) = \sum \limits_{1}^{\infty} x ^ i$。可以发现，这相当于对 $f$ 施加了 **平移算子 $\mathbf{E}$**。将两个错项相减可以得到：

$$f(x) - x f(x) = 1$$

$$f(x) = \dfrac{1}{1 - x}$$

我们称 $\dfrac{1}{1 - x}$ 为 $f(x)$ 的封闭形式。上面计算生成函数封闭形式的做法称为**错位相减**，是小学数学常用的一种方法。

利用上面的算法，可以求出下面几个生成函数的封闭形式：

- $\{1, 1, 1, 1 \cdots\} \stackrel{\text{OGF}}{\longrightarrow} \dfrac{1}{1 - x}$

- $\{1, a, a^2, a^3 \cdots\} \stackrel{\text{OGF}}{\longrightarrow} \dfrac{1}{1 - ax}$

- $\{1, x^{k}, x^{2k}, x^{3k} \cdots\} \stackrel{\text{OGF}}{\longrightarrow} \dfrac{1}{1 - x ^ k}$

- $\{1, c^1x^k, c^2x^{2k} \cdots\} \stackrel{\text{OGF}}{\longrightarrow} \dfrac{1}{1 - cx^k}$

- $\{0, 1, \frac{1}{2}, \frac{1}{3} \cdots\} \stackrel{\text{OGF}}{\longrightarrow} -\ln(1 - x)$

- $\{1, 1, \frac{1}{2!}, \frac{1}{3!} \cdots\} \stackrel{\text{OGF}}{\longrightarrow} e^x$

- $\{1, 1, 1 \cdots\} \stackrel{\text{OGF}}{\longrightarrow} \dfrac{1}{1 - x}$

## 封闭形式的展开技巧

- **泰勒展开 / 麦克劳林展开**

$$f(x) = \sum^{\infty} \dfrac{f(x)^{(i)}}{i!}$$

上面的式子称为麦克劳林展开。注意，上面的式子没有考虑到 $f$ 的敛散性。

通过麦克劳林展开，我们可以得到几乎所有函数的展开式。

- **换元法**

利用上面得到的重要结论

$$f(x) = \dfrac{1}{1 - x} = \sum x ^ i$$

将其中的 $x$ 换成 $qx$，可以得到：

$$f(x) = \dfrac{1}{1 - qx} = \sum q^ i x ^ i$$

可以使用还原得到一些其他结论。

**Example 5.1** 求 $f(x) = \dfrac{3}{1 - 4x}$ 的展开形式。

$$f(x) = 3 \dfrac{1}{1 - 4x} = 3 \sum 4^ix^i$$

**Example 5.2** 求 $f(x) = \dfrac{1}{1 + x}$ 的展开式。

$$f(x) = \dfrac{1}{1 - (-x)} = \sum (-1) ^ i x ^ i$$

**Example 5.3** 求 $f(x) = \dfrac{5}{3 - 4x}$ 的展开式。

$$f(x) = \dfrac{5 / 3}{1 - 4/3 x} = \dfrac{5}{3} \cdot \dfrac{1}{1 - \frac{4}{3}x} = \dfrac{5}{3} \sum \left (\frac{4}{3} \right ) ^ i x^i$$

可以发现，这个方法非常好用。它可以展开几乎一切分母为一次的分式。

- **裂项法**

上面的换元法非常好用，但是只适用于 $-1$ 次的式子。对于高次的式子，我们尝试将他变成 $-1$ 次的进行解决。

**Example 5.4** 求 $f(x) = \dfrac{1}{x ^ 2 - 4x +3}$ 的展开式。

考虑到分母可以表示成 $(1 - x)(3 - x)$ 的形式，我们尝试裂项。

不妨设 $f(x) = \dfrac{1}{(1 - x)(3 - x)} = \dfrac{\mathcal{A}}{1 - x} +\dfrac{\mathcal{B}}{3 - x}$ 的形式。

可以发现，$\dfrac{\mathcal{A}}{1 - x} +\dfrac{\mathcal{B}}{3 - x} = \dfrac{\mathcal{A}(3 - x) +\mathcal{B} (1- x)}{(1 - x)(3 - x)}$

于是有 $\mathcal{A}(3 - x) +\mathcal{B} (1- x) = 1$。解这个方程，得到：

$$\mathcal{A} = 1 / 2, \mathcal{B} = -1/2$$

对于分母更高次的情况，只要有实根，就可以裂项降次。

- **递推法**

这个方法用于补裂项法的坑。

有的时候，分母是高次方程且没有实根，这非常不好，因为没法裂项。这时候可以使用这个方法。

**Example 5.5** 求 $f(x) = \dfrac{1}{1 - 2x + 7x ^ 2}$ 的展开形式。

我们发现对于分母，$\Delta = 4 - 28 < 0$，因此没有实根，无法裂项。

考虑设 $f(x) = \dfrac{1}{1 - 2x + 7x ^ 2} = a_0 + a_1x + a_2 x ^ 2 \cdots$

则有

$$(1 - 2x + 7x^2)(a_0 + a_1 x + a_2 x ^ 2 \cdots) = 1$$

做一下这个卷积，可以得到

$$
\begin{matrix}

& a_0 = 1 \\

& a_1 - 2a_0 = 0 \\

& a_2 - 2a_1 + 7a_0 = 0\\

& \cdots

\end{matrix}
$$

因此，$a_0 = 1, a_1 = 2$，对于 $n > 1$，$a_n = 2a_{n - 1} - 7 a_{n - 2}$。这样我们得到一个递推形式。

利用**特征根方程**即可求出该递推式的通项。

-------------

学了上面这么多展开技巧，我们来举几个实际例子。

**Example 5.6 斐波那契数列通项**

定义 $f_0 = 0, f_1 = 1$，$\forall n \ge 2, f_n = f_{n - 1} + f_{n - 2}$。求 $f$ 的通项。

不妨设 $\mathcal{F}(x) = \sum f_i x_i = \{0, 1, 1, 2, 3, 5, 8 \cdots\}$

我们对 $F$ 施加一个平移算子，也就是乘上 $x$，得到

$$x \mathcal{F}(x) = \sum f_i x^{i +1} = \{0, 0, 1, 1, 2, 3, 5, 8, \cdots\}$$

再施加一次平移算子，得到

$$x ^ 2 \mathcal{F}(x) = \sum f_i x^{i +2} = \{0, 0, 0, 1, 1, 2, 3, 5, \cdots\}$$

可以发现，$(\mathcal{F}(x) - x\mathcal{F}(x) - x ^ 2 \mathcal{F}(x))[n] = 0$（As for $x \ge 2$）。对于 $x < 2$，我们强行补上即可。所以得到：

$$\mathcal{F}(x) - x \mathcal{F}(x) - x ^ 2 \mathcal{F}(x) = 1$$

$$\mathcal{F}(x) = \dfrac{1}{1 - x - x ^ 2}$$

这样我们得到了 $\mathcal{F}(x)$ 的封闭形式。

接下来我们要对这个封闭形式进行展开。发现分母有实根，这非常好。我们求出它的两个实根，分别为

$$x_1 = \dfrac{-1 - \sqrt 5}{2}, x_2 = \dfrac{-1 +  \sqrt 5}{2}$$

采用展开技巧中的**裂项法**对他进行**裂项**，得到

$$\mathcal{F}(x) = \dfrac{\mathcal{A}}{x_1 - x} + \dfrac{\mathcal{B}}{x_2 - x}$$

可以解得 $\mathcal{A} = \dfrac{\sqrt5}{5}, \mathcal{B} = -\dfrac{\sqrt5}{5}$。

将 $\mathcal{A, B}$ 代入并进行一顿化简（化简过程使用换元法）后，可以得到斐波那契数列的通项公式：

$$f_n = \dfrac{\sqrt5}{5}\left[  \left ( \dfrac{1 + \sqrt 5}{2}\right ) ^ n - \left ( \dfrac{1 - \sqrt 5}{2}\right ) ^ n \right]$$

-------------

## 普通型生成函数的应用

**Example 6.1** [$\texttt{ACW 3132}$](https://www.acwing.com/problem/content/3135/)

一共八种物品，你要买这些物品。每个物品可以买无限件。

不妨将这八种物品设为 $\mathcal{A, B, C, D, E, F, G, H}$，每种物品的购买有限制：

- $\mathcal{A}$：只能购买偶数个。

- $\mathcal{B}$：只能购买 $0$ 个或 $1$ 个。

- $\mathcal{C}$：只能购买 $0$ 个，$1$ 个或 $2$ 个。

- $\mathcal{D}$：只能购买奇数个。

- $\mathcal{E}$：只能购买 $4$ 的倍数个。

- $\mathcal{F}$：只能购买 $0, 1, 2$ 或 $3$ 个。

- $\mathcal{G}$：只能购买 $\le 1$ 个。

- $\mathcal{H}$：只能购买 $3$ 的倍数个。

求购买 $n$ 个物品的方案数。$n \le 10 ^ {500}$，答案对 $10007$ 取模。

**做法一**：背包。设 $f_i$ 表示选择了 $i$ 个物品的方案数。转移即可。

**做法二**：流氓算法。使用背包打表，用 BM 弄出通项。

**做法三**：使用生成函数。

我们考虑每种物品的生成函数对应的是什么。对于 $\mathcal{A}$ 物品，不妨将其生成函数设为 $\mathcal{A(x)}$，后面同理。

- $\mathcal{A(x)} = 1 + x ^ 2 +x ^ 4 +\cdots = \dfrac{1}{1 - x ^ 2}$

- $\mathcal{B(x)} = 1 + x = \dfrac{1 - x ^ 2}{1 - x}$

- $\mathcal{C(x)} = 1 + x + x ^ 2 = \dfrac{1 - x ^ 3}{1 - x}$

- $\mathcal{D(x)} = x + x ^ 3 + x ^ 5 + \cdots = \dfrac{x}{1 - x ^ 2}$

- $\mathcal{E(x)} = 1 + x^4 + x^8 + \cdots = \dfrac{1}{1 - x ^ 4}$

- $\mathcal{F(x)} = 1 + x + x ^ 2 + x ^ 3 = \dfrac{1 - x ^ 4}{1 - x}$

- $\mathcal{G(x)} = 1 +x = \dfrac{1 - x ^ 2}{1 - x}$

- $\mathcal{H(x)} = 1 + x ^ 3 + x ^ 6 +\cdots = \dfrac{1}{1 - x^3}$

把这些东西乘起来消消乐，剩下的答案就是：

$$\dfrac{x}{(1 - x) ^ 4}$$

这样我们得到了封闭形式。展开就可以得到答案。我们尝试对这个东西进行展开。利用广义二项式定理，我们可以得到：

$$
\begin{array}{c}

\dfrac{1}{(1 - x) ^ 4} &= \sum_{i = 0} \dfrac{(-4)^{\underline{i}}}{i!} (-x) ^ i\\\\

&= \sum_{i=0} \dfrac{(-4) ^ {\underline{i}}(-1)^i}{i!} x^i \\\\

&= \sum_{i=0} \dfrac{4^{\overline{i}}}{i!} x^i\\\\

&= \sum_{i=0} \dfrac{(3+i)^{\underline{i}}}{i!}x^i\\\\

&= \sum_{i = 0} \dbinom{3+i}{i} x^i

\end{array}
$$

乘上 $x$ 相当于对其施以平移算子，答案即为

$$\dfrac{(n +2)(n + 1)n}{6}$$

**Bonus**：最后对于 $\dfrac{1}{(1 - x) ^ 4}$ 的化简，其实有更简单的方法。

对于 $\dfrac{1}{1 - x}$ 求三阶导，发现就等于 $\dfrac{1}{(1 - x) ^ 4}$。

**Example 6.2** [P2000 拯救世界](https://www.luogu.com.cn/problem/P2000)

和上一题差不多，列出来十个生成函数，乘起来消消乐就可以了。

**Example 6.3** [Super Poker II](https://www.luogu.com.cn/problem/UVA12298)

写出四种扑克的 $\mathrm{OGF}$，乘起来就可以了。由于没有绑账号所以没有写。

## Some Important Tricks

 - 对 $\mathcal{F(x)}$ 乘以 $\mathcal{A(x)} = 1 +x +x ^ 2 + x ^ 3 \cdots$，可以求出 $\mathcal{F(x)}$ 的前缀和。例子：[差分与前缀和](https://www.luogu.com.cn/problem/P5488)

-------------

## 指数型生成函数

指数型生成函数（$\mathbf{EGF}$），通常用于有标号方案计数，如图计数等。

对于数列 $P$，其 $\mathbf{EGF}$ 定义为：

$$\sum_{i = 0} \dfrac{P_i}{i!} x^i$$

下面是一些常见数列的 $\mathbf{EGF}$。

- $\{1, 1, 1, 1 \cdots\} \stackrel{\text{EGF}}{\longrightarrow} e ^ x$

- $\{1, -1, 1, -1 \cdots\} \stackrel{\text{EGF}}{\longrightarrow} e ^ {-x}$

- $\{1, c, c^2, c^3 \cdots\} \stackrel{\text{EGF}}{\longrightarrow} e ^ {cx}$

- $\{1, 0, 1, 0 \cdots\} \stackrel{\text{EGF}}{\longrightarrow} \dfrac{e^x + e ^ {-x}}{2}$

- $\{1, a, a ^ {2 \over}, a ^ {3 \over}, a ^ {4 \over} \cdots \} \stackrel{\text{EGF}}{\longrightarrow} (1 + x) ^ a$

上述推导可以直接在 $0$ 处泰勒展开。

## 指数型生成函数应用

**Example 8.1**

> $n$ 个点的无向连通图计数。

设 $B = \sum 2 ^ {\binom{i}{2}} x ^ i$，表示无向图的方案数。

设 $A = \sum f_ix^i$，表示无向连通图方案数。

则有 $B = e ^ A$，将 $B$ 取 $\ln$ 可以得到 $A$。