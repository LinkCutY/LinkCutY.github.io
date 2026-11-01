# Notes for Analysis

## Contents

1. Limits of Sequences
2. Limits of Functions
3. Continuity
4. Notation and Conventions
5. Properties of Continuous Functions on Closed Intervals
6. Continuity of Inverse Functions
7. Uniform Continuity
8. Examples
9. The Heine–Cantor Theorem and a Summary
10. How to calculate limits

---

## 1 Limits of Sequences

### 1.1 The Definition

**Definition 1.1 (Limit of a sequence).** Let $\{a_n\}$ be a sequence and $b \in \mathbb{R}$. If for every $\varepsilon > 0$ there is $m \in \mathbb{N}$ such that

$$
\lvert a_n - b \rvert < \varepsilon \qquad \text{for all } n \ge m ,
$$

then $b$ is called the *limit* of $\{a_n\}$, written $\lim_{n \to \infty} a_n = b$.

**Example 1.2.** Show that $\lim_{n \to \infty} \frac{\sin n}{n} = 0$.

*Proof.* Since

$$
\left\lvert \frac{\sin n}{n} \right\rvert = \frac{\lvert \sin n \rvert}{n} \le \frac{1}{n} ,
$$

it is enough, given $\varepsilon > 0$, to make $\frac{1}{n} < \varepsilon$, that is, $n > \frac{1}{\varepsilon}$.

Take $N = \left\lceil \frac{1}{\varepsilon} \right\rceil + 1$. Then for every $n > N$,

$$
\left\lvert \frac{\sin n}{n} \right\rvert < \frac{1}{n} < \varepsilon ,
$$

so $\lim_{n \to \infty} \frac{\sin n}{n} = 0$. $\square$

**Example 1.3.** Show that $\lim_{n \to \infty} \sqrt[n]{n} = 1$.

*Proof.* Note that **$\lvert \sqrt[n]{n} - 1 \rvert = \sqrt[n]{n} - 1 = a_n$** for $n \ge 1$. Then

$$
n = (a_n + 1)^n > 1 + n a_n + \frac{n(n-1)}{2} a_n^2 > \frac{n(n-1)}{2} a_n^2 ,
$$

hence $a_n < \sqrt{\frac{2}{n-1}}$. Given $\varepsilon > 0$, $a_n < \varepsilon$ as soon as $\sqrt{\frac{2}{n-1}} < \varepsilon$, that is, as soon as $n > \frac{2}{\varepsilon^2} + 1$.

Take $N = \left\lceil \frac{2}{\varepsilon^2} \right\rceil + 2$. Then $\lvert \sqrt[n]{n} - 1 \rvert < \varepsilon$ for all $n > N$, hence $\lim_{n \to \infty} \sqrt[n]{n} = 1$. $\square$

> **Technique 1:** recast the original limit as a limit of a sequence

### 1.2 Consequences of the Definition

**Corollary 1.4 (Harmless constant factors).** Let $\{a_n\}$ be a sequence and $b \in \mathbb{R}$. If for every $\varepsilon > 0$ there is $m \in \mathbb{N}$ such that $\lvert a_n - b \rvert < C\varepsilon$ for all $n \ge m$, where $C > 0$ is a constant, then $\lim_{n \to \infty} a_n = b$.

**Corollary 1.5 (Uniqueness of the limit).** If $u$ and $v$ are both limits of $\{a_n\}$, then $u = v$.

*Proof.* Given $\varepsilon > 0$, choose $N_1, N_2 > 0$ with $\lvert a_n - u \rvert < \varepsilon$ for $n > N_1$ and $\lvert a_n - v \rvert < \varepsilon$ for $n > N_2$. For $n > N := \max\{N_1, N_2\}$ both inequalities hold, and the triangle inequality gives

$$
\lvert v - u \rvert \le \lvert v - a_n \rvert + \lvert a_n - u \rvert < 2\varepsilon .
$$

As $\varepsilon > 0$ is arbitrary, $u = v$. $\square$

> **Technique 2:** when absolute values appear, use the triangle inequality

**Corollary 1.6 (Bounded times null).** If $\{a_n\}$ is bounded and $\lim_{n \to \infty} b_n = 0$, then $\lim_{n \to \infty} a_n b_n = 0$.

*Proof.* Boundedness gives $\omega > 0$ with $\lvert a_k \rvert \le \omega$ for every $k$. Given $\varepsilon > 0$, there is $m$ with $\lvert b_n \rvert \le \varepsilon$ for all $n \ge m$. Hence $\lvert a_n b_n \rvert \le \omega\varepsilon$ for $n \ge m$, and Corollary 1.4 yields $\lim_{n \to \infty} a_n b_n = 0$. $\square$

**Corollary 1.7 (Order preservation).** Let $\lim_{n \to \infty} a_n = b$. Then

1. if $u < b$, there is $m$ such that $u < \frac{u+b}{2} < a_n$ for all $n \ge m$;
2. if $v > b$, there is $m$ such that $v > \frac{v+b}{2} > a_n$ for all $n \ge m$.

*Proof.* Take $\varepsilon = \frac{b-u}{2}$. For all large $n$ we then have $\lvert a_n - b \rvert < \frac{b-u}{2}$, so $a_n - b > -\frac{b-u}{2}$, that is, $a_n > \frac{b+u}{2}$; this is (1). Part (2) is analogous, with $\varepsilon = \frac{v-b}{2}$. $\square$

**Corollary 1.8.** If $a_n \le u$ for all sufficiently large $n$, then $\lim_{n \to \infty} a_n \le u$.

### 1.3 The Squeeze Theorem

**Theorem 1.9 (Squeeze theorem).** Let $\{a_n\}, \{b_n\}, \{c_n\}$ be sequences with $\lim_{n \to \infty} a_n = \lim_{n \to \infty} c_n = u$, and suppose that $a_n \le b_n \le c_n$ for all $n \ge p$. Then $\lim_{n \to \infty} b_n = u$.

*Proof.* Given $\varepsilon > 0$, $\lim_n a_n = u$ gives $N_1$ with $a_n > u - \varepsilon$ for all $n \ge N_1$, and $\lim_n c_n = u$ gives $N_2$ with $c_n < u + \varepsilon$ for all $n \ge N_2$. For $n \ge N := \max\{N_1, N_2, p\}$,

$$
u - \varepsilon < a_n \le b_n \le c_n < u + \varepsilon ,
$$

that is, $\lvert b_n - u \rvert < \varepsilon$. Hence $\lim_{n \to \infty} b_n = u$. $\square$

**Example 1.10 (Power sums).** Let $a_1, a_2, \dots, a_p > 0$. Show that

$$
\lim_{n \to \infty} \sqrt[n]{a_1^n + a_2^n + \cdots + a_p^n} = \max_{1 \le i \le p}\{a_i\} .
$$

*Proof.* Assume WLOG that $a_1 > a_2 > \cdots > a_p$. Since $a_i^n \le a_1^n$ for $i \ge 2$,

$$
a_1 \le \sqrt[n]{a_1^n + \cdots + a_p^n} \le \sqrt[n]{p\, a_1^n} = a_1\sqrt[n]{p} ,
$$

and $a_1\sqrt[n]{p} \to a_1$; the squeeze theorem gives $\lim_{n \to \infty} \sqrt[n]{a_1^n + \cdots + a_p^n} = a_1$. $\square$

**Example 1.11 (Cesàro mean).** If $\lim_{n \to \infty} a_n = 0$, then

$$
\lim_{n \to \infty} \frac{a_1 + \cdots + a_n}{n} = 0 .
$$

*Proof.* Given $\varepsilon > 0$, choose $p$ with $\lvert a_n \rvert < \varepsilon$ for all $n > p$. For $n > p$,

$$
\begin{aligned}
\left|\frac{a_1 + \cdots + a_n}{n}\right|
&\le \frac{\lvert a_1\rvert + \cdots + \lvert a_n\rvert}{n} \\
&= \frac{\bigl(\lvert a_1\rvert + \cdots + \lvert a_p\rvert\bigr) + \bigl(\underbrace{\lvert a_{p+1}\rvert + \cdots + \lvert a_n\rvert}_{(n-p)\ \text{terms}}\bigr)}{n} \\
&\le \frac{\lvert a_1\rvert + \cdots + \lvert a_p\rvert + (n-p)\varepsilon}{n} \\
&\le \frac{\lvert a_1\rvert + \cdots + \lvert a_p\rvert}{n} + \varepsilon .
\end{aligned}
$$

Now choose an integer $m > p$ with $m > \frac{\lvert a_1\rvert + \cdots + \lvert a_p\rvert}{\varepsilon}$. For $n \ge m$ the first fraction is at most $\varepsilon$, so the whole expression is at most $2\varepsilon$, and therefore $\lim_{n \to \infty} \frac{a_1 + \cdots + a_n}{n} = 0$. $\square$

### 1.4 Infinite Quantities

**Definition 1.12 (Infinite quantities).** Let $\{a_n\}$ be a sequence.

1. $\{a_n\}$ is *positively infinite* if for every $G > 0$ there is $m$ such that $a_n > G$ for all $n \ge m$; we then write $\lim_{n \to \infty} a_n = +\infty$.
2. $\{a_n\}$ is *negatively infinite* if for every $G < 0$ there is $m$ such that $a_n < G$ for all $n \ge m$; we then write $\lim_{n \to \infty} a_n = -\infty$.
3. $\{a_n\}$ is *infinite* if for every $G > 0$ there is $m$ such that $\lvert a_n \rvert > G$ for all $n \ge m$; we then write $\lim_{n \to \infty} a_n = \infty$.

**Corollary 1.13 (Elementary properties of infinities).** Let $\lim_{n \to \infty} a_n = +\infty$. Then

1. $\{a_n\}$ is bounded below;
2. if $\{b_n\}$ is bounded below, then $\lim_{n \to \infty} (a_n + b_n) = +\infty$;
3. if $b_n > 0$ for all $n \ge p$, then $\lim_{n \to \infty} a_n b_n = +\infty$;
4. if $a_n \ne 0$ for all $n$, then $\lim_{n \to \infty} a_n = \infty \iff \lim_{n \to \infty} \frac{1}{a_n} = 0$.

### 1.5 Neighbourhoods

**Definition 1.14 (Neighbourhood and punctured neighbourhood).** The $\rho$-neighbourhood of $x_0$ is

$$
O(x_0, \rho) = \{x \in \mathbb{R} \mid x_0 - \rho < x < x_0 + \rho\} ,
$$

and the corresponding punctured neighbourhood is

$$
O(x_0, \rho) - \{x_0\} = \{x \in \mathbb{R} \mid x_0 - \rho < x < x_0 + \rho,\ x \ne x_0\} .
$$

---

## 2 Limits of Functions

### 2.1 The Definition

**Definition 2.1 (Limit of a function).** Let $f$ be defined on $D$, and let $x_0$ be such that $O(x_0, \rho) - \{x_0\} \subset D$ for every $\rho > 0$. If there is $a \in \mathbb{R}$ such that for every $\varepsilon > 0$ there is $\delta > 0$ with

$$
0 < \lvert x - x_0 \rvert < \delta \ \Longrightarrow\ \lvert f(x) - a \rvert < \varepsilon ,
$$

then $a$ is called the limit of $f(x)$ at $x_0$, written $\lim_{x \to x_0} f(x) = a$.

### 2.2 Heine's Theorem

**Theorem 2.2 (Heine).** Let $f \colon D \to \mathbb{R}$.

1. If $\lim_{x \to x_0} f(x) = u$ and $\{c_n\} \subseteq D$ satisfies $c_n \to x_0$ with $c_n \ne x_0$, then $\lim_{n \to \infty} f(c_n) = u$.
2. If $u$ is not the limit of $f$ at $x_0$, then there is a sequence $\{a_n\} \subseteq D$ with $a_n \to x_0$ and $a_n \ne x_0$, such that $u$ is not the limit of $\{f(a_i) \mid i = 1, 2, 3, \dots\}$.

**Corollary 2.3 (Consequence of Heine's theorem).** The following two statements are equivalent:

1. $f$ has a limit at $x_0$;
2. for every sequence $c_n \subseteq D$ with $c_n \to x_0$ and $c_n \ne x_0$, the sequence $f(c_n)$ converges.

Hence limits of functions may be tested through limits of sequences.

*Proof (necessity).* Take sequences $\{a_n\}, \{b_n\} \subseteq D$ with $a_n \to x_0$, $b_n \to x_0$, and put $u := \lim_n f(a_n)$, $v := \lim_n f(b_n)$; we show that $u = v$. Define

$$
c_n = \begin{cases} a_n, & n \ \text{odd}, \\ b_n, & n \ \text{even}. \end{cases}
$$

Then $c_n \to x_0$ and $c_n \ne x_0$, so by (2) the sequence $f(c_n)$ converges, say to $w$. But $w = \lim_k f(c_{2k-1}) = u$ and $w = \lim_k f(c_{2k}) = v$, hence $u = v$. $\square$

**Theorem 2.4 (Cauchy criterion).** The following two statements are equivalent:

1. $f$ has a limit at $x_0$;
2. for every $\varepsilon > 0$ there is $\delta > 0$ such that $\lvert f(y) - f(x) \rvert < \varepsilon$ whenever $x, y \in O(x_0, \delta) - \{x_0\}$.

*Proof (necessity).* Take a sequence $c_n \to x_0$. By Heine's theorem it suffices to show that $f(c_n)$ converges, and by the Cauchy criterion for sequences it suffices to show that $f(c_n)$ is a Cauchy sequence.

Given $\varepsilon > 0$, choose $\delta > 0$ with $\lvert f(x) - f(y) \rvert < \varepsilon$ for all $x, y \in O(x_0, \delta) - \{x_0\}$. Since $c_n \to x_0$, there is $m$ with $\lvert c_n - x_0 \rvert < \delta$ for $n \ge m$, so $c_n \in O(x_0, \delta) - \{x_0\}$. Therefore, for all $n, p \ge m$ both $c_n$ and $c_p$ lie in $O(x_0, \delta) - \{x_0\}$, and $\lvert f(c_n) - f(c_p) \rvert < \varepsilon$. Thus $f(c_n)$ is a Cauchy sequence. $\square$

**Example 2.5.** Show that $\lim_{x \to 0} e^x = 1$.

*Proof.* Given $\varepsilon > 0$, the inequality $\lvert e^x - 1 \rvert < \varepsilon$ is equivalent to $1 - \varepsilon < e^x < 1 + \varepsilon$, that is, to $\ln(1 - \varepsilon) < x < \ln(1 + \varepsilon)$ when $\varepsilon < 1$; when $\varepsilon \ge 1$ it is enough to require $x < \ln(1 + \varepsilon)$. Hence $\delta = \ln(1 + \varepsilon)$ works for $\varepsilon \ge 1$, and $\delta = \min\{\ln(1 + \varepsilon),\ -\ln(1 - \varepsilon)\}$ works for $\varepsilon < 1$. $\square$

**Example 2.6.** (1) For every $x \ne 0$ with $\lvert x \rvert < \frac{\pi}{2}$ one has $\cos x < \frac{\sin x}{x} < 1$;

(2) $\lim_{x \to 0} \cos x = 1$;

(3) $\lim_{x \to 0} \frac{\sin x}{x} = 1 = \lim_{x \to 0} \frac{\tan x}{x}$.

*Proof (2).* Since $\cos x = 1 - 2\sin^2\frac{x}{2}$ and

$$
0 \le \sin^2\frac{x}{2} < \left(\frac{x}{2}\right)^2 , \qquad \lim_{x \to 0}\left(\frac{x}{2}\right)^2 = 0 ,
$$

the squeeze theorem gives $\lim_{x \to 0} \sin^2\frac{x}{2} = 0$, hence $\lim_{x \to 0} \cos x = 1$. $\square$

### 2.3 Basic Properties

**Proposition 2.7.** Let $\lim_{x \to x_0} f(x) = u$. Then

1. $\lim_{x \to x_0} \lvert f(x) \rvert = \lvert u \rvert$;
2. if $v > u$, then $f(x) < \frac{u+v}{2} < v$ for all $x$ in some punctured neighbourhood of $x_0$;
3. if $w < u$, then $f(x) > \frac{u+w}{2} > w$ for all $x$ in some punctured neighbourhood of $x_0$;
4. $f$ is bounded on some punctured neighbourhood of $x_0$.

*Proof.* (1) Given $\varepsilon > 0$ we have $\lvert f(x) - u \rvert < \varepsilon$ near $x_0$, hence $\bigl\lvert \lvert f(x)\rvert - \lvert u\rvert \bigr\rvert < \varepsilon$.

(2) With $\varepsilon = \frac{v-u}{2}$ we get $\lvert f(x) - u \rvert < \frac{v-u}{2}$ near $x_0$, that is, $f(x) < u + \frac{v-u}{2} = \frac{u+v}{2} < v$. $\square$

**Theorem 2.8 (Squeeze theorem).** If $\lim_{x \to x_0} f(x) = \lim_{x \to x_0} h(x) = u$ and $f(x) \le g(x) \le h(x)$ on some punctured neighbourhood of $x_0$, then $\lim_{x \to x_0} g(x) = u$.

*Proof.* Given $\varepsilon > 0$, $\lim f = u$ gives $\delta_1 > 0$ with $\lvert f(x) - u \rvert < \varepsilon$, hence $f(x) > u - \varepsilon$, on $O(x_0, \delta_1) - \{x_0\}$; similarly $\lim h = u$ gives $\delta_2 > 0$ with $h(x) < u + \varepsilon$ on $O(x_0, \delta_2) - \{x_0\}$. On $O(x_0, \delta) - \{x_0\}$ with $\delta := \min\{\delta_1, \delta_2, p\}$ we then have $u - \varepsilon < g(x) < u + \varepsilon$, so $\lim_{x \to x_0} g(x) = u$. $\square$

**Corollary 2.9 (Arithmetic of limits).**

1. If $\lim_{x \to x_0} f(x) = 0$ and $g$ is bounded on some punctured neighbourhood of $x_0$, then $\lim_{x \to x_0} f(x)g(x) = 0$.
2. If $\lim_{x \to x_0} f(x) = u$ and $\lim_{x \to x_0} g(x) = v$, then $\lim_{x \to x_0} f(x)g(x) = uv$ and $\lim_{x \to x_0} a f(x) = au$.
3. If $\lim_{x \to x_0} f(x) = u \ne 0$, then $f(x) \ne 0$ on some punctured neighbourhood of $x_0$, and $\lim_{x \to x_0} \frac{1}{f(x)} = \frac{1}{u}$.

*Proof (2).* Given $\varepsilon > 0$, choose $\delta_1 > 0$ with $\lvert f(x) - u \rvert < \varepsilon$ on $O(x_0, \delta_1) - \{x_0\}$ and $\delta_2 > 0$ with $\lvert g(x) - v \rvert < \varepsilon$ on $O(x_0, \delta_2) - \{x_0\}$. For $x \in O(x_0, \delta) - \{x_0\}$ with $\delta := \min\{\delta_1, \delta_2\}$,

$$
\lvert f(x) + g(x) - (u + v) \rvert \le \lvert f(x) - u \rvert + \lvert g(x) - v \rvert < 2\varepsilon .
$$

Also $\lim_{x \to x_0} f(x) = u$ gives $\lim_{x \to x_0} (f(x) - u) = 0$, while $g$ is locally bounded near $x_0$. Hence

$$
\lim_{x \to x_0} (f(x) - u)g(x) = 0 ,
$$

and therefore

$$
\lim_{x \to x_0} f(x)g(x) = \lim_{x \to x_0} (f(x) - u)g(x) + \lim_{x \to x_0} u g(x) = uv .
$$

$\square$

*Proof (3).* From $\lim_{x \to x_0} f(x) = u$ we get $\lim_{x \to x_0} \lvert f(x) \rvert = \lvert u \rvert$. By Proposition 2.7(2) there is $\rho > 0$ with $\lvert f(x) \rvert > \frac{\lvert u\rvert}{2}$ on $O(x_0, \rho) - \{x_0\}$; in particular $f(x) \ne 0$ there, and

$$
\left\lvert \frac{1}{\lvert f(x)\rvert} \right\rvert < \frac{2}{\lvert u\rvert} ,
$$

so $\frac{1}{f(x)}$ is locally bounded near $x_0$. Since $\lim_{x \to x_0} \lvert f(x) - u \rvert = 0$,

$$
\lim_{x \to x_0} \frac{f(x) - u}{f(x)} = 0 ,
\qquad
\lim_{x \to x_0} \frac{f(x) - u}{f(x)u} = \lim_{x \to x_0}\left(\frac{1}{u} - \frac{1}{f(x)}\right) = 0 ,
$$

whence $\lim_{x \to x_0} \frac{1}{f(x)} = \frac{1}{u}$. $\square$

### 2.4 Composition

Recall that $(g \circ f)(x) = g(f(x))$.

**Theorem 2.10 (Limit of a composite function).** Let $\lim_{x \to x_0} g(x) = u$ and $\lim_{t \to t_0} f(t) = x_0$, and suppose that $f$ never equals $x_0$ on some punctured neighbourhood $O(t_0, \rho) - \{t_0\}$. Then

$$
\lim_{t \to t_0} g(f(t)) = u .
$$

*Proof.* Given $\varepsilon > 0$, choose $\delta > 0$ with $\lvert g(x) - u \rvert < \varepsilon$ for all $x \in O(x_0, \delta) - \{x_0\}$. Since $\lim_{t \to t_0} f(t) = x_0$ and $\delta > 0$, there is $\lambda > 0$ with $\lvert f(t) - x_0 \rvert < \delta$ for all $t \in O(t_0, \lambda) - \{t_0\}$. For $t \in O(t_0, \mu) - \{t_0\}$ with $\mu := \min\{\lambda, \rho\}$ we then have $\lvert f(t) - x_0 \rvert < \delta$ and $f(t) \ne x_0$, so $f(t) \in O(x_0, \delta) - \{x_0\}$, and therefore $\lvert g(f(t)) - u \rvert < \varepsilon$. $\square$

**Example 2.11.** Since $\lim_{y \to 0} \frac{\sin y}{y} = 1$, the substitutions $y = 2x$ and $y = x^2$ give

$$
\lim_{x \to 0} \frac{\sin 2x}{2x} = 1 ,
\qquad
\lim_{x \to 0} \frac{\sin x^2}{x^2} = 1 .
$$

**Example 2.12.** Compute $\lim_{x \to 0} \frac{a_m x^m + a_{m+1} x^{m+1} + \cdots + a_n x^n}{b_m x^m + b_{m+1} x^{m+1} + \cdots + b_n x^n}$ with $b_m \ne 0$.

*Proof.* Clearly $\lim_{x \to 0} \frac{b_m x^m + b_{m+1} x^{m+1} + \cdots + b_n x^n}{b_m x^m} = 1$. Hence

$$
\lim_{x \to 0} \frac{a_m x^m + \cdots + a_n x^n}{b_m x^m + \cdots + b_n x^n}
= \lim_{x \to 0} \frac{a_m x^m + \cdots + a_n x^n}{b_m x^m} \cdot \frac{b_m x^m}{b_m x^m + \cdots + b_n x^n}
= \frac{a_m}{b_m} .
$$

$\square$

**Remark 2.13.** The draft states the value $1$ and gives only the line above; by the computation just made the general answer is $a_m/b_m$.

### 2.5 One-sided Limits and Limits at Infinity

**Definition 2.14 (One-sided limits).**

*Left limit.* Suppose $f$ is defined on $[a, x_0)$ for some $a < x_0$. Then $v$ is the left limit of $f$ at $x_0$ if

$$
\forall \varepsilon > 0\ \exists \delta > 0\ \forall x \in (x_0 - \delta, x_0):\quad \lvert f(x) - v \rvert < \varepsilon ,
$$

written $\lim_{x \to x_0^-} f(x) = v$.

*Right limit.* Suppose $f$ is defined on $(x_0, b]$ for some $b > x_0$. Then $w$ is the right limit of $f$ at $x_0$ if

$$
\forall \varepsilon > 0\ \exists \delta > 0\ \forall x \in (x_0, x_0 + \delta):\quad \lvert f(x) - w \rvert < \varepsilon ,
$$

written $\lim_{x \to x_0^+} f(x) = w$.

**Remark 2.15.** $\lim_{x \to x_0} f(x) = u$ if and only if $\lim_{x \to x_0^-} f(x) = \lim_{x \to x_0^+} f(x) = u$.

**Definition 2.16 (Limits at infinity).**

$\lim_{x \to +\infty} f(x) = u$ means: for every $\varepsilon > 0$ there is $M > 0$ such that $\lvert f(x) - u \rvert < \varepsilon$ for all $x \ge M$.

$\lim_{x \to -\infty} f(x) = u$ means: for every $\varepsilon > 0$ there is $M > 0$ such that $\lvert f(x) - u \rvert < \varepsilon$ for all $x \le -M$.

$\lim_{x \to \infty} f(x) = u$ means $\lim_{x \to +\infty} f(x) = \lim_{x \to -\infty} f(x) = u$.

**Example 2.17.** Let $m < n$. Compute $\lim_{x \to +\infty} \frac{a_m x^m + a_{m+1} x^{m+1} + \cdots + a_n x^n}{b_n x^n}$.

*Proof.*

$$
\lim_{x \to +\infty} \frac{a_m x^m + \cdots + a_n x^n}{b_n x^n}
= \lim_{x \to +\infty} \left( \frac{a_m x^m}{b_n x^n} + \frac{a_{m+1} x^{m+1}}{b_n x^n} + \cdots + \frac{a_n x^n}{b_n x^n} \right)
= \frac{a_n}{b_n} .
$$

$\square$

**Example 2.18.** Show that $\lim_{x \to \infty} \left(1 + \frac{1}{x}\right)^x = e$.

*Proof.* We first treat $x \to +\infty$. For every $x \ge 1$,

$$
\left(1 + \frac{1}{\lfloor x \rfloor + 1}\right)^{\lfloor x \rfloor}
\le \left(1 + \frac{1}{x}\right)^x
\le \left(1 + \frac{1}{\lfloor x \rfloor}\right)^{\lfloor x \rfloor + 1} .
$$

Moreover

$$
\lim_{x \to +\infty} \left(1 + \frac{1}{\lfloor x \rfloor + 1}\right)^{\lfloor x \rfloor}
= \lim_{x \to +\infty} \left(1 + \frac{1}{\lfloor x \rfloor}\right)^{\lfloor x \rfloor}
= \lim_{x \to +\infty} \left(1 + \frac{1}{\lfloor x \rfloor}\right)^{\lfloor x \rfloor + 1}
= e ,
$$

so by the squeeze theorem $\lim_{x \to +\infty} \left(1 + \frac{1}{x}\right)^x = e$; the case $x \to -\infty$ is analogous. $\square$

**Remark 2.19 (Exercise).** If $\lim_{n \to \infty} a_n = u$ and $f(x) = a_{\lfloor x \rfloor}$, then $\lim_{x \to +\infty} f(x) = u$.

## 3 Continuity

### 3.1 The Definition

**Definition 3.1 (Continuity).** $f$ is continuous at $x_0$ if there is $\rho > 0$ such that $f$ is defined on $O(x_0, \rho)$ and $\lim_{x \to x_0} f(x) = f(x_0)$. Equivalently, for every $\varepsilon > 0$ there is $\delta > 0$ such that $\lvert f(x) - f(x_0) \rvert < \varepsilon$ for all $x \in O(x_0, \delta)$.

**Example 3.2.** Show that $f(x) = \sin x$ is continuous on $\mathbb{R}$.

*Proof.* The product-to-sum formula $\sin x - \sin y = 2\cos\frac{x+y}{2}\sin\frac{x-y}{2}$ gives

$$
\lvert \sin x - \sin y \rvert \le 2\left\lvert \sin\frac{x-y}{2} \right\rvert \le \lvert x - y \rvert .
$$

Given $x_0 \in \mathbb{R}$ and $\varepsilon > 0$, take $\delta = \varepsilon$; then $\lvert x - x_0 \rvert < \delta$ implies $\lvert f(x) - f(x_0) \rvert \le \lvert x - x_0 \rvert < \varepsilon$. $\square$

### 3.2 Algebra of Continuous Functions

**Proposition 3.3.** If $f$ and $g$ are continuous at $x_0$, then

$$
\lim_{x \to x_0} f(x)g(x) = f(x_0)g(x_0),
\qquad
\lim_{x \to x_0} \frac{f(x)}{g(x)} = \frac{f(x_0)}{g(x_0)} \quad (g(x_0) \ne 0).
$$

### 3.3 Composition of Continuous Functions

**Theorem 3.4.**

1. If $\lim_{n \to \infty} a_n = x_0$ and $f$ is continuous at $x_0$, then $\lim_{n \to \infty} f(a_n) = f(x_0)$.
2. If $\lim_{t \to t_0} f(t) = x_0$ and $g$ is continuous at $x_0$, then $\lim_{t \to t_0} g(f(t)) = g(x_0)$.
3. If $f$ is continuous at $t_0$ and $g$ is continuous at $f(t_0)$, then $g \circ f$ is continuous at $t_0$.

*Proof.* (1) Given $\varepsilon > 0$, continuity of $f$ at $x_0$ gives $\delta > 0$ with $\lvert f(x) - f(x_0) \rvert < \varepsilon$ for all $x \in O(x_0, \delta)$. Since $\lim_{n \to \infty} a_n = x_0$ and $\delta > 0$, there is $m$ with $\lvert a_n - x_0 \rvert < \delta$ for $n \ge m$, i.e. $a_n \in O(x_0, \delta)$. Hence $\lvert f(a_n) - f(x_0) \rvert < \varepsilon$.

(2) Given $\varepsilon > 0$, choose $\delta > 0$ with $\lvert g(x) - g(x_0) \rvert < \varepsilon$ for all $x \in O(x_0, \delta)$. Since $\lim_{t \to t_0} f(t) = x_0$ and $\delta > 0$, there is $\rho > 0$ with $\lvert f(t) - x_0 \rvert < \delta$ for all $t \in O(t_0, \rho) - \{t_0\}$, i.e. $f(t) \in O(x_0, \delta)$. Hence $\lvert g(f(t)) - g(x_0) \rvert < \varepsilon$.

(3) From $\lim_{t \to t_0} f(t) = f(t_0)$ and (2) we get $\lim_{t \to t_0} g(f(t)) = g(f(t_0)) = (g \circ f)(t_0)$, so $g \circ f$ is continuous at $t_0$. $\square$

### 3.4 Continuity on a Closed Interval

Let $f$ be defined on $[a, b]$.

- $f$ is left-continuous at $b$ if $\lim_{x \to b^-} f(x) = f(b)$;
- $f$ is right-continuous at $a$ if $\lim_{x \to a^+} f(x) = f(a)$;
- $f$ is continuous on $[a, b]$ if it is right-continuous at $a$, left-continuous at $b$, and continuous on $(a, b)$.

If $f$ is continuous on $[a, b]$, then

- $\{f(x) \mid x \in [a, b]\}$ is again a closed interval (Corollary 5.2);
- $f$ is uniformly continuous on $[a, b]$ (Heine–Cantor, Theorem 9.1).

**Proposition 3.5.** If $\{c_n\}$ is a sequence in $[a, b]$ and $\lim_{n \to \infty} c_n = u$, then $u \in [a, b]$. Moreover, if $f$ is continuous on $[a, b]$, then $\lim_{n \to \infty} f(c_n) = f(u)$.

**Proposition 3.6 (Approximating sequences for the supremum).** If a non-empty set $B$ has supremum $d$, then there is a sequence $c_n$ in $B$ with $\lim_{n \to \infty} c_n = d$.

*Proof.* For every $n \ge 1$ the number $d - \frac{1}{n}$ is not an upper bound of $B$, so there is $x_n \in B$ with $d - \frac{1}{n} < x_n \le d$. Hence $\{x_n\} \subseteq B$ and $\lim_{n \to \infty} x_n = d$. $\square$

---

## 4 Notation and Conventions

- $I$ always denotes an interval, $[a,b]$ a closed interval, and $(a,b)$ the open interval $\{x \mid a < x < b\}$. The draft's $]a,b[$ notation is replaced by $(a,b)$ throughout.
- $f(D) := \{f(x) \mid x \in D\}$ is the image (range) of $f$ on $D$.
- We write $f \in C(D)$ when $f$ is continuous on $D$.
- $f$ is strictly increasing on $D$ means: for all $x_1,x_2 \in D$, $x_1 < x_2 \Rightarrow f(x_1) < f(x_2)$.
- Proofs use the $\varepsilon$–$\delta$ language; $x \to u^-$ and $x \to u^+$ denote the left and right limits.

---

## 5 Properties of Continuous Functions on Closed Intervals

### 5.1 The Intermediate Value Theorem

**Theorem 5.1 (Intermediate Value Theorem, IVT).** Let $f \in C([a,b])$ and $f(a) < f(b)$ (or $f(a) > f(b)$). Then for every $\omega$ lying between $f(a)$ and $f(b)$ there exists $x \in [a,b]$ with $f(x) = \omega$.

*Proof.* Assume WLOG that $f(a) < f(b)$ and that $f(a) < \omega < f(b)$; the endpoint cases are $x = a$ and $x = b$. Put

$$
S := \{x \in [a,b] \mid f(x) \le \omega\},\qquad x_0 := \sup S .
$$

Since $a \in S$ we have $S \neq \varnothing$, and since $b \notin S$ the set $S$ is bounded above by $b$; hence $x_0$ exists and $a \le x_0 \le b$.

*First, $f(x_0) \le \omega$.* Choose a sequence $x_n \in S$ with $x_n \to x_0$ (possible by the definition of the supremum). Continuity at $x_0$ and $f(x_n) \le \omega$ give $f(x_0) = \lim_n f(x_n) \le \omega$.

*Second, $f(x_0) \ge \omega$.* If $x_0 < b$, then $x \notin S$ for every $x \in (x_0,b]$, that is, $f(x) > \omega$; letting $x \to x_0^+$ and using right-continuity gives $f(x_0) \ge \omega$. If $x_0 = b$, the first part already gives $f(x_0) = f(b) > \omega$.

Therefore $f(x_0) = \omega$. $\square$

### 5.2 Continuous Images of Closed Intervals

**Corollary 5.2.** If $f \in C([a,b])$, then $f([a,b])$ is a closed interval, namely

$$
f([a,b]) = \Bigl[\min_{[a,b]} f,\ \max_{[a,b]} f\Bigr].
$$

*Proof.* Let $m := \min_{[a,b]} f$ and $M := \max_{[a,b]} f$; both exist by the extreme value theorem. The inclusion $f([a,b]) \subseteq [m,M]$ is immediate. For the reverse one, take $\omega \in [m,M]$ and choose $c,d \in [a,b]$ with $f(c) = m$ and $f(d) = M$. If $c < d$, apply Theorem 5.1 on $[c,d]$; if $c > d$, apply it on $[d,c]$; if $c = d$, then $m = M$ and $\omega = m = f(c)$. In all cases $\omega \in f([a,b])$. $\square$

**Corollary 5.3 (Coincidence).** If $f,g \in C([a,b])$, $f(a) \le g(a)$ and $f(b) \ge g(b)$, then $f(x_0) = g(x_0)$ for some $x_0 \in [a,b]$.

*Proof.* Apply Theorem 5.1 to $h := f-g$, for which $h(a) \le 0 \le h(b)$. $\square$

---

## 6 Continuity of Inverse Functions

### 6.1 Monotonicity and Injectivity

**Theorem 6.1.** Let $f \in C([a,b])$ satisfy $f(a) < f(b)$, and assume that $f$ is injective on $[a,b]$. Then $f$ is strictly increasing on $[a,b]$, and $f([a,b]) = [f(a), f(b)]$.

*Proof.* *Step 1: $f(a) < f(u)$ for every $u \in (a,b]$.* Suppose not, so $f(a) \ge f(u)$. Injectivity rules out equality, hence $f(a) > f(u)$ and $f(u) < f(a) < f(b)$. By Theorem 5.1 there exists $z \in (u,b)$ with $f(z) = f(a)$, contradicting injectivity.

*Step 2: $f(v) < f(w)$ whenever $a < v < w \le b$.* Suppose $f(v) \ge f(w)$; then $f(v) > f(w)$. By Step 1, $f(a) < f(v)$, and $f(w)$ lies strictly between them, so Theorem 5.1 provides $z \in (a,v)$ with $f(z) = f(w)$, again contradicting injectivity.

Steps 1 and 2 show that $f$ is strictly increasing. For the image, the inclusion $f([a,b]) \subseteq [f(a),f(b)]$ is clear, and the reverse inclusion follows from Theorem 5.1. $\square$

### 6.2 The Inverse Function Theorem

**Theorem 6.2 (Continuity of the inverse).** Let $f$ be continuous and strictly increasing on $[a,b]$, and put $\alpha := f(a)$, $\beta := f(b)$. Then $f^{-1}$ is continuous and strictly increasing on $[\alpha,\beta]$.

*Proof.* *Existence.* By Theorem 6.1, $f([a,b]) = [\alpha,\beta]$ and $f$ is injective, so $f^{-1} \colon [\alpha,\beta] \to [a,b]$ is well defined.

*Strict increase.* Take $\alpha \le u < v \le \beta$. If $f^{-1}(u) \ge f^{-1}(v)$, monotonicity of $f$ gives $u = f(f^{-1}(u)) \ge f(f^{-1}(v)) = v$, a contradiction.

*Left continuity.* Let $\alpha < u \le \beta$ and $c := f^{-1}(u)$, so that $a < c \le b$. Given $\varepsilon > 0$, assume $\varepsilon < c-a$. Since $f$ is continuous at $c$, there is $\delta > 0$ such that $\lvert x-c \rvert < \delta$ implies $\lvert f(x)-f(c) \rvert < \varepsilon$; shrink $\delta$ so that $c-\delta \ge a$. Set $\delta_1 := u - f(c-\delta) > 0$, which is positive because $f$ is strictly increasing and $c-\delta < c$. For every $y$ with $u-\delta_1 < y \le u$ we then have $f(c-\delta) < y \le u$, and monotonicity of $f^{-1}$ gives

$$
c-\delta \le f^{-1}(y) \le c .
$$

Hence $\lvert f^{-1}(y)-c \rvert < \delta < \varepsilon$, that is, $\lim_{y \to u^-} f^{-1}(y) = f^{-1}(u)$.

*Right continuity.* Let $\alpha \le u < \beta$ and $c := f^{-1}(u)$, so that $a \le c < b$. Given $\varepsilon > 0$, assume $\varepsilon < b-c$; choose $\delta > 0$ with $c+\delta \le b$ and $\lvert x-c \rvert < \delta \Rightarrow \lvert f(x)-f(c) \rvert < \varepsilon$, and set $\delta_2 := f(c+\delta)-u > 0$. If $0 \le y-u < \delta_2$, then $u \le y < f(c+\delta)$, hence

$$
c \le f^{-1}(y) < c+\delta ,
$$

so $\lim_{y \to u^+} f^{-1}(y) = f^{-1}(u)$.

Thus $f^{-1}$ is left- and right-continuous at every point of $[\alpha,\beta]$ (one-sided at the endpoints), and therefore continuous. $\square$

---

## 7 Uniform Continuity

### 7.1 Definition

**Definition 7.1 (Uniform continuity).** Let $f$ be defined on $D$. It is *uniformly continuous* on $D$ if

$$
\forall \varepsilon>0,\ \exists \delta>0,\ \forall x_1,x_2 \in D:\quad
\lvert x_1-x_2 \rvert<\delta \ \Rightarrow\ \lvert f(x_1)-f(x_2) \rvert<\varepsilon .
$$

### 7.2 The Negation

**Definition 7.2 (Failure of uniform continuity).** $f$ is *not uniformly continuous* on $D$ if and only if

$$
\exists \varepsilon_0>0,\ \forall \delta>0,\ \exists x_1,x_2 \in D:\quad
\lvert x_1-x_2 \rvert<\delta \ \text{and}\ \lvert f(x_1)-f(x_2) \rvert \ge \varepsilon_0 .
$$

### 7.3 The Sequential Criterion

**Theorem 7.3 (Sequential criterion).** Let $f$ be defined on $D$.

1. If $f$ is uniformly continuous on $D$ and $\{a_n\},\{b_n\} \subseteq D$ satisfy $\lim_{n\to\infty}(b_n-a_n)=0$, then $\lim_{n\to\infty}\bigl(f(b_n)-f(a_n)\bigr)=0$.
2. Conversely, $f$ fails to be uniformly continuous on $D$ if and only if there exist $\varepsilon_0>0$ and sequences $\{a_n\},\{b_n\} \subseteq D$ such that the distance between the two sequences tends to $0$ while the corresponding values stay at least $\varepsilon_0$ apart:

$$
\lim_{n\to\infty}(b_n-a_n)=0,\qquad
\forall n \in \mathbb{N}:\ \lvert f(b_n)-f(a_n) \rvert \ge \varepsilon_0 .
$$

*Proof.* (1) Given $\varepsilon>0$, take $\delta$ from Definition 7.1. Since $b_n-a_n \to 0$, we have $\lvert b_n-a_n \rvert<\delta$ for all large $n$, hence $\lvert f(b_n)-f(a_n) \rvert<\varepsilon$.

(2) If the stated condition holds, then for every $\delta$ there is $n>1/\delta$, so $a_n,b_n$ lie within $\delta$ of each other while their images are at least $\varepsilon_0$ apart; this is precisely the negation in Definition 7.2, so $f$ is not uniformly continuous. Conversely, that definition read with $\delta = 1/n$ produces such sequences. $\square$

---

## 8 Examples

### 8.1 Verifying Uniform Continuity from the Definition

**Example 8.1.** $f(x) = \sin x$ is uniformly continuous on $\mathbb{R}$.

*Proof.* The product-to-sum identity gives

$$
\lvert \sin x-\sin y \rvert
= 2\left|\sin\frac{x-y}{2}\right|\left|\cos\frac{x+y}{2}\right|
\le 2\left|\sin\frac{x-y}{2}\right| \le \lvert x-y \rvert .
$$

Given $\varepsilon>0$, take $\delta=\varepsilon$. $\square$

**Example 8.2.** $f(x) = 2x$ is uniformly continuous on $\mathbb{R}$.

*Proof.* $\lvert f(x)-f(y) \rvert = 2\lvert x-y \rvert$; given $\varepsilon>0$, take $\delta=\varepsilon/2$. $\square$

**Example 8.3.** $f(x) = x^2$ is uniformly continuous on $[0,1]$ (but not on $[0,+\infty)$, see Example 8.6).

*Proof.* For $x,y \in [0,1]$, $\lvert x^2-y^2 \rvert = \lvert x-y \rvert\lvert x+y \rvert \le 2\lvert x-y \rvert$; given $\varepsilon>0$, take $\delta=\varepsilon/2$. $\square$

### 8.2 The Lipschitz Condition

**Proposition 8.4 (Lipschitz implies uniform continuity).** If there is a constant $M>0$ with

$$
\lvert f(x_1)-f(x_2) \rvert \le M\lvert x_1-x_2 \rvert
\quad\text{for all } x_1,x_2 \in D,
$$

then $f$ is uniformly continuous on $D$. In particular, $\delta=\varepsilon/M$ works.

*Proof.* Given $\varepsilon>0$, take $\delta=\varepsilon/M>0$. If $\lvert x_1-x_2 \rvert<\delta$, then $\lvert f(x_1)-f(x_2) \rvert \le M\lvert x_1-x_2 \rvert < \varepsilon$. $\square$

### 8.3 Proving Failure of Uniform Continuity

**Example 8.5.** $f(x) = \frac{1}{x}$ is not uniformly continuous on $(0,1)$.

*Proof.* Take $a_n = \frac{1}{n}$ and $b_n = \frac{1}{n+1}$. Then $a_n,b_n \in (0,1)$ and

$$
b_n-a_n = -\frac{1}{n(n+1)} \to 0,\qquad
\lvert f(b_n)-f(a_n) \rvert = \lvert (n+1)-n \rvert = 1 .
$$

By Theorem 7.3(2) with $\varepsilon_0=1$, $f$ is not uniformly continuous. $\square$

**Example 8.6.** $f(x) = x^2$ is not uniformly continuous on $[0,+\infty)$.

*Proof.* Take $a_n = n$ and $b_n = n+\frac{1}{n}$. Then $b_n-a_n=\frac{1}{n} \to 0$, while

$$
\lvert f(b_n)-f(a_n) \rvert
= \Bigl(n+\frac{1}{n}\Bigr)^2-n^2 = 2+\frac{1}{n^2} \ge 2 .
$$

Take $\varepsilon_0=2$. $\square$

**Example 8.7.** $f(x) = \sin\frac{1}{x}$ is not uniformly continuous on $(0,1)$.

*Proof.* Take $a_n = \frac{1}{2n\pi}$ and $b_n = \frac{1}{2n\pi+\pi/2}$. Then $a_n,b_n \to 0$, hence $b_n-a_n \to 0$; but $f(a_n)=0$ and $f(b_n)=1$, so $\lvert f(b_n)-f(a_n) \rvert=1$. Take $\varepsilon_0=1$. $\square$

---

## 9 The Heine–Cantor Theorem and a Summary

**Theorem 9.1 (Heine–Cantor).** If $f \in C([a,b])$, then $f$ is uniformly continuous on $[a,b]$.

*Proof.* Suppose $f$ is not uniformly continuous on $[a,b]$. By Theorem 7.3(2) there are $\varepsilon_0>0$ and $a_n,b_n \in [a,b]$ with $\lvert b_n-a_n \rvert \to 0$ and $\lvert f(b_n)-f(a_n) \rvert \ge \varepsilon_0$. By the Bolzano–Weierstrass theorem a subsequence $a_{n_k}$ converges to some $x_0 \in [a,b]$; then $\lvert b_{n_k}-a_{n_k} \rvert \to 0$ gives $b_{n_k} \to x_0$. Continuity at $x_0$ forces $f(a_{n_k})-f(b_{n_k}) \to 0$, contradicting the lower bound $\varepsilon_0$. $\square$

**Remark 9.2.** Both "closed" and "bounded" are needed in Theorem 9.1: Example 8.5 has a bounded but not closed interval, and Example 8.6 a closed but unbounded one. The correct generalisation replaces $[a,b]$ by any compact set $K \subseteq \mathbb{R}$; the proof uses only continuity and the fact that every sequence in a compact set has a convergent subsequence.

**Table 1.** A comparison of continuity, uniform continuity and the Lipschitz condition; the last column lists standard counterexamples.

| Property | Quantifiers | Typical examples | Counterexample |
| :--- | :--- | :--- | :--- |
| Continuous | $\forall x\,\forall\varepsilon\,\exists\delta(x,\varepsilon)$ | all elementary functions | — |
| Uniformly continuous | $\forall\varepsilon\,\exists\delta(\varepsilon)\,\forall x$ | $\sin x$; $x^2$ on $[0,1]$ | $1/x$ on $(0,1)$ |
| Lipschitz | $\lvert f(x)-f(y) \rvert \le M\lvert x-y \rvert$ | $2x$; $\sin x$; $x^2$ on $[0,1]$ | $\sqrt{x}$ on $[0,1]$ |

**Remark 9.3.** $\sqrt{x}$ is uniformly continuous on $[0,1]$ (Heine–Cantor) but does not satisfy a Lipschitz condition, since $(\sqrt{x}-0)/(x-0) = 1/\sqrt{x} \to +\infty$ as $x \to 0^+$. Thus uniform continuity is strictly weaker than the Lipschitz condition.

---

## 10 How to calculate limits

**Theorem 10.1 (Some important limits).**

(1) Let $a > 1$, $\alpha \in \mathbb{R}$, then $\lim_{x \to +\infty} \frac{x^{\alpha}}{a^x} = 0$

(2) Let $\alpha > 0$, then $\lim_{x \to +\infty} \frac{\ln x}{x^{\alpha}} = 0$

(3) $\lim_{x \to 0} \frac{\sin x}{x} = \lim_{x \to 0} \frac{\tan x}{x} = 1$

(4) $\lim_{x \to 0} \frac{\ln (1 + x)}{x} = 1$

(5) Let $a > 0$, then $\lim_{x \to 0} \frac{a^x - 1}{x} = \ln a$. Specially, $\lim_{x \to 0} \frac{e^x - 1}{x} = 1$.

(6) Let $\alpha \ne 0$, then $\lim_{x \to 0} \frac{(1 + x)^{\alpha} - 1}{\alpha x} = 1$

*Proof (2).* By (1), $\lim_{x \to +\infty} \frac{x^{\alpha}}{e^x} = 0$. Let $x = \ln y$, $\lim_{y \to +\infty} \ln y = +\infty$.

$$
\lim_{y \to +\infty} \cfrac{(\ln y)^{\alpha}}{e^{\ln y}} = \cfrac{(\ln y)^{\alpha}}{y} = 0
$$

$\square$

*Proof (4).*

$$
\lim_{x \to 0} (1+x)^{\frac{1}{x}} = e
$$

$$
\lim_{x \to 0} \ln \left( (1 + x)^{\frac{1}{x}} \right) = 1 = \lim_{x \to 0} \cfrac{1}{x} \ln (1 + x)
$$

$\square$

*Proof (5).* By (4), $\lim_{y \to 0} \frac{\ln(1 + y)}{y} = 1$.

Let $y = a^x - 1$, $\lim_{x \to 0} (a^x - 1) = 0$, and for all $x \ne 0$, $a^x - 1 \ne 0$.

$$
1 = \lim_{x \to 0} \cfrac{\ln (1 + (a^x - 1))}{a^x - 1} = \lim_{x \to 0} \cfrac{x \ln a}{a^x - 1}
$$

$\square$

*Proof (6).* By (4), $\lim_{y \to 0} \frac{\ln(1 + y)}{y} = 1$. Let $y = (1 + x)^{\alpha} - 1$,

$$
\lim_{x \to 0} \left( (1 + x)^{\alpha} - 1 \right) = 0
$$

$$
1 = \lim_{x \to 0} \cfrac{\ln \left( 1 + (1 + x)^{\alpha} - 1 \right)}{(1 + x)^\alpha - 1} = \lim_{x \to 0} \cfrac{\alpha \ln (1 + x)}{(1 + x)^{\alpha} - 1} = \lim_{x \to 0} \cfrac{\alpha x}{(1 + x)^{\alpha} - 1}
$$

$\square$

**Example 10.2.**

$$
\lim_{x \to 0} \cfrac{\ln (1 + x^2)}{(e^{2x}-1) \tan x}
$$

*Proof.*

$$
\lim_{x \to 0} \cfrac{\ln (1 + x^2)}{x^2} = 1 \quad \lim_{x \to 0} \cfrac{e^{2x} - 1}{x} = \ln(e^2) = 2 \quad \lim_{x \to 0} \cfrac{\tan x}{x} = 1
$$

So

$$
= \lim_{x \to 0} \cfrac{x^2}{2x \cdot x} = \cfrac{1}{2}
$$

$\square$

**Example 10.3.**

$$
\lim_{x \to 0} \cos(x)^{\frac{1}{x^2}}
$$

*Proof.* First calculate $\lim_{x \to 0} \frac{1}{x^2} \ln \cos x$.

$$
\begin{aligned}
\lim_{x \to 0} \cfrac{1}{x^2} \ln \cos x &= \lim_{x \to 0} \cfrac{1}{x^2} \ln \left( 1 - \sin \left( \cfrac{x}{2}\right)^2\right) \\
&= \lim_{x \to 0} - \cfrac{2}{x^2} \sin \left( \cfrac{x}{2} \right)^2
= -2 \cdot \cfrac{1}{x^2} \cdot \left( \cfrac{x}{2}\right)^2 = \cfrac{1}{2}
\end{aligned}
$$

$\square$

**Example 10.4.**

$$
\lim_{x \to 0} \cfrac{\tan x - \sin x}{x^3}
$$

*Proof.*

$$
\begin{aligned}
\lim_{x \to 0} \cfrac{\tan x - \sin x}{x^3} &= \lim_{x \to 0} \cfrac{\tan x (1 - \cos x)}{x^3} \\
&= \lim_{x \to 0} \cfrac{\tan x \cdot 2 \sin \left( \cfrac{x}{2}\right)^2}{x^3}
= \lim_{x \to 0} \cfrac{x \cdot 2 \left( \cfrac{x}{2}\right)^2}{x^3} = \cfrac{1}{2}
\end{aligned}
$$

$\square$

**Remark 10.5.** Replacements can only be applied when it comes to production form.

**Definition 10.6 ($o$-symbol).** If $\lim_{x \to x_0} \frac{f(x)}{g(x)} = 0$, then denote $f(x) = o(g(x))\ (x \to x_0)$.

If $\lim_{x \to x_0} \frac{f_1(x) - f_2(x)}{g(x)} = 0$, then denote

$$
f_1(x) - f_2(x) = o(g(x))\ (x \to x_0) \quad \text{or} \quad f_1(x) - f_2(x) + o(g(x))\ (x \to x_0)
$$

**Definition 10.7 ($O$-symbol).**

$$
f(x) = O(g(x)) \quad (x \to +\infty)
$$

is referred to

$$
\forall G > 0,\ \exists M > 0,\ \text{s.t.}\ \forall x \ge G,\ \lvert f(x) \rvert \le M \lvert g(x) \rvert
$$

**Definition 10.8 (Equivalent).** $f_1(x) \sim f_2(x)\ (x \to x_0)$ is:

$$
\lim_{x \to x_0} \cfrac{f_1(x)}{f_2(x)} = 1
$$

**Remark 10.9.**

$$
f(x) \sim h(x) \Longleftarrow f(x) - h(x) = o(h(x))\ (x \to x_0)
$$

If $f_1(x) = o(g(x))\ (x \to x_0)$, $f_2(x) = o(g(x))\ (x \to x_0)$, then $f_1 + f_2 = o(g(x))\ (x \to x_0)$ and $k f_1(x) = o(g(x))\ (x \to x_0)$.

**Example 10.10.**

$$
\lim_{x \to 0} \cfrac{\sqrt{1 + x} - e^{\frac{x}{3}}}{\ln (1 + 2x)}
$$

*Proof.*

$$
\lim_{x \to 0} \cfrac{\sqrt{1 + x} - 1}{2x} = \lim_{x \to 0} \cfrac{(1 + x)^{\frac{1}{2}} - 1}{2x} = \lim_{x \to 0} \cfrac{\cfrac{1}{2}x}{2x} = \cfrac{1}{4}
$$

$$
\lim_{x \to 0} \cfrac{e^{\frac{x}{3}} - 1}{2x} = \lim_{x \to 0} \cfrac{\cfrac{1}{3}x}{2x} = \cfrac{1}{6}
$$

$$
LHS = \cfrac{1}{4} - \cfrac{1}{6} = \cfrac{1}{12}
$$

$\square$

**Example 10.11.**

$$
\lim_{x \to \infty} x \left( \sqrt[3]{x^3 + x} - \sqrt[3]{x^3 - x}\right)
$$

*Proof.*

$$
\begin{aligned}
\mathbf{LHS} &= \lim_{x \to \infty} x \cfrac{2x}{\sqrt[3]{(x^3 + x)^2} + \sqrt[3]{(x^3+x)(x^3-x)} + \sqrt[3]{(x^3 - x)^2}} \\
&= \lim_{x \to \infty} \cfrac{2}{\sqrt[3]{\left( 1 + \cfrac{1}{x^2}\right)^2} + \sqrt[3]{1 - \cfrac{1}{x^4}} + \sqrt[3]{\left( 1 - \cfrac{1}{x^2}\right)^2}} = \cfrac{2}{3}
\end{aligned}
$$

$\square$

**Definition 10.12 (Derivative).** If $f(x)$ is defined on $O(x_0, \delta)$, and if

$$
\lim_{x \to x_0} \cfrac{f(x) - f(x_0)}{x - x_0}
$$

exists, then we call the limit "the derivative of $f(x)$".

If $f(x)$ is differentiable at $x_0$,

$$
\lim_{x \to x_0} \cfrac{f(x) - f(x_0)}{x - x_0} = f'(x_0)
$$

$$
\lim_{x \to x_0} \cfrac{f(x) - f(x_0) - f'(x_0)(x - x_0)}{x - x_0} = 0
$$

$$
f(x) - f(x_0) - f'(x_0)(x - x_0) = o(x - x_0) \quad (x \to x_0)
$$

$$
f(x) - f(x_0) = f'(x_0)(x - x_0) + o(x - x_0) \quad (x \to x_0)
$$

**Example 10.13.** $f(x) = \sqrt[3]{x}$ is not differentiable at $0$.

*Proof.*

$$
\cfrac{f(x) - f(0)}{x-0} = \cfrac{1}{\sqrt[3]{x^2}}
$$

$$
\lim_{x \to 0} \cfrac{1}{\sqrt[3]{x^2}} = \infty
$$

$\square$

**Example 10.14.** $f(x) = \left\lvert x \right\rvert$ is not differentiable at $0$.

*Proof.*

$$
\lim_{x \to 0^+} \cfrac{f(x) - f(0)}{x - 0} = 1
$$

$$
\lim_{x \to 0^-} \cfrac{f(x) - f(0)}{x - 0} = -1
$$

The left- and right-limits are different. $\square$

**Definition 10.15 (Differentiable).** $f$ is defined around $x_0$. If $\exists a \in \mathbb{R}$ such that

$$
f(x) - f(x_0) = a(x - x_0) + o(x - x_0)
$$

then $f(x)$ is differentiable at $x_0$.

$$
\,\mathrm{d}f = f'(x_0) \,\mathrm{d}x
$$