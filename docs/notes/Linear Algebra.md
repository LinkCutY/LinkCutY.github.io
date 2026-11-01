# Linear Algebra

## 1 Matrix product

**Definition 1.1 (Matrix Product).** Let $A = [a_{ij}]_{m \times n}$ and $B = [b_{ij}]_{n \times s}$ be matrices. Define their product $C = [c_{ij}]_{m \times s} = AB$ by

$$
c_{ij} = \displaystyle \sum_{k=1}^{n} a_{ik} \times b_{kj}
$$

**Theorem 1.2 (Partitioning by rows and columns).** Let $a_i$ be the $i$-th column of $A$ and $b_i$ the $i$-th row of $B$. Then

$$
C = AB =\begin{pmatrix}a_1 & a_2 & \cdots & a_n\end{pmatrix} \begin{pmatrix}b_{1} \\b_{2} \\\cdots \\b_{n}\end{pmatrix} =\begin{pmatrix}a_1b_1 & a_2b_2 & \cdots & a_nb_n\end{pmatrix}
$$

Thus, partitioning the first matrix into columns and the second into rows is a common technique.

**Remark 1.3.** If we partition only one of the matrices---say, the first matrix by columns---then

$$
C = AB =\begin{pmatrix}
a_{1} & a_{2} & \cdots & a_{n}
\end{pmatrix}\begin{pmatrix}
b_{1\ 1} & b_{1\ 2} & \cdots & b_{1s} \\
b_{2\ 1} & b_{2\ 2} & \cdots & b_{2s} \\
\cdots & \cdots & \cdots & \cdots \\
b_{n1} & b_{n2} & \cdots & b_{ns}
\end{pmatrix}
$$

The $i$-th column of $C$ is $\mathbf{Col}_i C = \sum_{k = 1}^{n} a_i b_{ki}$.

If we partition $A$ by rows and $B$ by columns, then

$$
\begin{aligned}
A &=\begin{pmatrix}
a_{1} \\
a_{2} \\
\cdots \\
a_{m}
\end{pmatrix}\\\\
B &=\begin{pmatrix}
b_{1} & b_{2} & \cdots & b_{s}
\end{pmatrix}\\\\
C &= AB =\begin{pmatrix}
a_{1} \\
a_{2} \\
\cdots \\
a_{m}
\end{pmatrix}
\begin{pmatrix}
b_{1} & b_{2} & \cdots & b_{s}
\end{pmatrix}\\
&=\begin{pmatrix}
 a_1b_1 & a_1b_2 & \cdots & a_1b_s \\
 a_2b_1 & a_2b_2 & \cdots & a_2b_s \\
 \cdots & \cdots & \cdots & \cdots \\
 a_mb_1 & a_mb_2 & \cdots & a_m{b}_s
 \end{pmatrix}
\end{aligned}
$$

Thus we can:

- partition $A$ by columns and $B$ by rows, obtaining $C$ partitioned by columns;
- partition $A$ by rows and $B$ by columns, obtaining $C_{m \times s}$.

### 1.1 Properties of matrix multiplication

**Theorem 1.4 (Properties of matrix multiplication).**

1. $(AB)C = A(BC)$
2. $A(B + C) = AB + AC$
3. $k(AB) = (kA)B = A(kB)$

Note that matrix multiplication is not commutative; that is, $AB = BA$ need not hold.

**Theorem 1.5 (Connection between matrices and determinants).**

If $A$ and $B$ are square matrices of the same order, then

$$
|AB| = |A||B|
$$

*Proof.* Let $D$ be the block matrix

$$
\begin{pmatrix}
a_{11} & a_{12} & \cdots & a_{1n} & 0 & 0 & \cdots & 0 \\
a_{21} & a_{22} & \cdots & a_{2n} & 0 & 0 & \cdots & 0 \\
\cdots & \cdots & \cdots & \cdots & \cdots & \cdots & \cdots & \cdots \\
a_{n1} & a_{n2} & \cdots & a_{nn} & 0 & 0 & \cdots & 0 \\
-1 & 0 & \cdots & 0 & b_{11} & b_{12} & \cdots & b_{1n} \\
0 & -1 & \cdots & 0 & b_{21} & b_{22} & \cdots & b_{2n} \\
\cdots & \cdots & \cdots & \cdots & \cdots & \cdots & \cdots & \cdots \\
0 & 0 & \cdots & -1 & b_{n1} & b_{n2} & \cdots & b_{nn}
\end{pmatrix}
$$

By Laplace expansion, $|D| = |A||B|$.

Meanwhile, if we partition $A$ by columns and $B$ by rows, then the $i$-th column of $AB$ is $a_i b_i$. Thus, replacing the $(n+j)$-th column $C_{n+j}$ by $C_{n+j} + \sum_{i = 1}^{n} b_{ij}C_i$ for $j = 1, 2, \dots, n$ gives $|D| = |AB|$. $\square$

### 1.2 Transpose

**Definition 1.6 (Transpose of a matrix).** If $A = \begin{pmatrix}
a_{1\ 1} & a_{1\ 2} & \cdots & a_{1n} \\
a_{2\ 1} & a_{2\ 2} & \cdots & a_{2n} \\
\cdots & \cdots & \cdots & \cdots \\
a_{n1} & a_{n2} & \cdots & a_{nn}
\end{pmatrix}$, then the transpose of $A$ is $\begin{pmatrix}
a_{1\ 1} & a_{2\ 1} & \cdots & a_{n1} \\
a_{1\ 2} & a_{2\ 2} & \cdots & a_{n2} \\
\cdots & \cdots & \cdots & \cdots \\
a_{1n} & a_{2} & \cdots & a_{1n}
\end{pmatrix}$, denoted by $A^T$.

**Theorem 1.7 (Properties of matrix transposition).**

- $(A^T)^T = A$
- $(A + B)^T = A^T + B^T$
- $(kA)^T = kA^T$
- $(AB)^T = B^TA^T$

**Remark 1.8.** It follows that if $A$ and $B$ are $n \times n$ matrices whose row sums are all $1$, then the row sums of $AB$ are also all $1$.

### 1.3 Inverse and adjugate

**Theorem 1.9 (Inverse of a matrix).** If $B$ is a matrix such that $AB = BA = E$, then $B$ is the inverse of $A$, denoted by $A^{-1}$.

The inverse of a matrix is unique: if $AB = BA = E$ and $AC = CA = E$, then $B = C$.

**Theorem 1.10 (Adjugate matrix).** Let $A_{ij}$ be the cofactor of $a_{ij}$. Then

$$
\begin{pmatrix}
A_{1\ 1} & A_{1\ 2} & \cdots & A_{1n} \\
A_{2\ 1} & A_{2\ 2} & \cdots & A_{2n} \\
\cdots & \cdots & \cdots & \cdots \\
A_{n1} & A_{n2} & \cdots & A_{nn}
\end{pmatrix}
$$

is the adjugate matrix of $A$, denoted by $A^*$ or $\operatorname{adj} A$.

Note that $AA^* = A^*A = \begin{pmatrix}
|A| & 0 & \cdots & 0 \\
0 & |A| & \cdots & 0 \\
\cdots & \cdots & \cdots & \cdots \\
0 & 0 & \cdots & |A|
\end{pmatrix} = |A|E$

Thus we can use the adjugate to compute the inverse of $A$.

### 1.4 Thm: Necessary and sufficient condition for matrix invertibility

From $AA^* = A^*A = |A|E$, if $|A| \neq 0$ then $A \frac{A^*}{|A|} = \frac{A^*}{|A|}A = E$; conversely, if $A$ is invertible then $|A| \neq 0$. Thus

$$
A^{-1} = \cfrac{1}{|A|}A^*
$$

whenever $|A| \neq 0$.

### 1.5 Thm: Properties of the inverse matrix

If $A$ is invertible, then the following properties hold:

1. $(A^{-1})^{-1} = A$
2. $|A^{-1}| = |A|^{-1}$
3. $(kA)^{-1} = k^{-1}A^{-1}$
4. $(A^T)^{-1} = (A^{-1})^{T}$
5. If $A$ and $B$ are invertible matrices, then $AB$ is invertible and $(AB)^{-1} = B^{-1}A^{-1}$.

### 1.6 Def: Matrix partitioning

Dividing $A = \begin{pmatrix}
a_{1\ 1} & a_{1\ 2} & \cdots & a_{1n} \\
a_{2\ 1} & a_{2\ 2} & \cdots & a_{2n} \\
\cdots & \cdots & \cdots & \cdots \\
a_{n1} & a_{n2} & \cdots & a_{nn}
\end{pmatrix}$ into submatrices is called a partition of $A$.

The rules of matrix arithmetic remain unchanged under partitioning. Thus we can use partitioned matrices to compute matrix products.

Suppose that after partitioning, $A = \begin{pmatrix}
A_{1\ 1} & A_{1\ 2} & \cdots & A_{1p} \\
A_{2\ 1} & A_{2\ 2} & \cdots & A_{2p} \\
\cdots & \cdots & \cdots & \cdots \\
A_{m1} & A_{m2} & \cdots & A_{mp}
\end{pmatrix}$, $B =\begin{pmatrix}
B_{1\ 1} & B_{1\ 2} & \cdots & B_{1s} \\
B_{2\ 1} & B_{2\ 2} & \cdots & B_{2s} \\
\cdots & \cdots & \cdots & \cdots \\
B_{q1} & B_{q2} & \cdots & B_{qs}
\end{pmatrix}$

For $AB$ to be meaningful, we must have $p = q$; that is,

$$
\text{\textbf{The column partition of $A$ must match the row partition of $B$.}}
$$

A consequence of matrix partitioning is that if $A = \begin{pmatrix}
O & E_{n-1} \\
0 & O
\end{pmatrix}$, then $A^p =\begin{pmatrix}
O & E_{n-p} \\
O & O
\end{pmatrix}$ always holds.

**Proof**: Partition $A$ by columns. Then

$$
A =\begin{pmatrix}
0 & e_{1} & e_{2} & \cdots & e_{n-1}
\end{pmatrix}
$$

$$
A^2 =\begin{pmatrix}
0 & A{e}_1 & A{e}_2 & \cdots & A{e}_{n-1}
\end{pmatrix}
$$

By definition, $A e_j$ is the $j$-th column of $A$; hence

$A^2 =\begin{pmatrix}
0 & 0 & e_1 & e_2 & \cdots & e_{n-2}
\end{pmatrix}$

The remaining steps are straightforward.

Note also that if $A = [A_{ij}]_{p \times q}$, then

$$
A^T = \begin{pmatrix}
A_{11}^T & A_{12}^T & \cdots & A_{1q}^T \\[6pt]
A_{21}^T & A_{22}^T & \cdots & A_{2q}^T \\[6pt]
\cdots & \cdots & \cdots & \cdots \\[6pt]
A_{p1}^T & A_{p2}^T & \cdots & A_{pq}^T \\[6pt]
\end{pmatrix}
$$

## 2 Vector spaces

### 2.1 Basis and dimension

**Definition 2.1 (Basis of a vector space).** Let $V$ be a vector space over a field $F$, and let $\varepsilon_1, \varepsilon_2, \dots, \varepsilon_n \in V$ satisfy:

1. $\varepsilon_1, \varepsilon_2, \cdots, \varepsilon_n$ are linearly independent;
2. every element of $V$ can be expressed as a linear combination of $\varepsilon_1, \dots, \varepsilon_n$.

Then $\varepsilon_1, \dots, \varepsilon_n$ form a basis of $V$.

**Remark 2.2.** A basis of $V$ is not unique, but any two bases have the same number of vectors.

**Definition 2.3 (Dimension of a vector space).** The number of vectors in a basis is called the dimension of the vector space.

**Example 2.4.**

$$
\mathbb{R}^n = \left\{\begin{pmatrix}
a_{1} \\
a_{2} \\
\cdots \\
a_{n}
\end{pmatrix} \mid a_i \in \mathbb{R}, 1 \le i \le n \right\}
$$

### 2.2 Coordinate vectors

**Definition 2.5 (Coordinate vector).** Let $\varepsilon_1, \dots, \varepsilon_n$ be a basis of $V$. For every $\alpha\in V$,

$$
\alpha = x_1 \varepsilon_1 + x_2 \varepsilon_2 + \cdots + x_n \varepsilon_n
$$

We call $\begin{pmatrix} x_1 \\ x_2 \\ \cdots \\ x_n \end{pmatrix}$
the coordinate vector of $\alpha$ relative to this basis.

**Theorem 2.6 (Uniqueness of coordinates).** If there is another representation

$$
\alpha = x_1' \alpha_1 + x_2' \alpha_2 + \cdots + x_n' \alpha_n
$$

then

$$
(x_1 - x_1') \alpha_1 + (x_2 - x_2') \alpha_2 + \cdots + (x_n - x_n')\alpha_n = 0
$$

Let $\varepsilon_1, \dots, \varepsilon_n$ be a basis of $V$ over $F$, and let $\alpha_1, \dots, \alpha_s \in V$ satisfy

$$
\begin{pmatrix}
\alpha_1 & \alpha_2 & \cdots & \alpha_s
\end{pmatrix} = \begin{pmatrix}
\varepsilon_1 & \varepsilon_2 & \cdots & \varepsilon_n
\end{pmatrix} \begin{pmatrix}
a_{11} & a_{12} & a_{13} & \cdots & a_{1s} \\
a_{21} & a_{22} & a_{23} & \cdots & a_{2s} \\
a_{31} & a_{32} & a_{33} & \cdots & a_{3s} \\
\vdots & \vdots & \vdots & \ddots & \vdots \\
a_{n1} & a_{n2} & a_{n3} & \cdots & a_{ns}
\end{pmatrix}
$$

Then $\alpha_1, \dots, \alpha_s$ are linearly dependent (since $r_A < s$).

*Proof.*

$$
\begin{pmatrix}
\alpha_1 & \alpha_2 & \cdots & \alpha_s
\end{pmatrix} \begin{pmatrix}
x_1 \\
x_2 \\
\cdots \\
x_n
\end{pmatrix} = 0 \leftrightarrow \begin{pmatrix}
\varepsilon_1 & \varepsilon_2 & \cdots & \varepsilon_n
\end{pmatrix} A \begin{pmatrix}
x_1 \\
x_2 \\
\cdots \\
x_s
\end{pmatrix} \Longleftarrow A \begin{pmatrix}
x_1 \\
x_2 \\
\cdots \\
x_s
\end{pmatrix} = 0
$$

$\square$

### 2.3 Example: $F[x]_4$

**Example 2.7.** Consider $F[x]_4$.

$$
\begin{array}{c}
f_1 = 1 - x + 2x^2\\
f_2 = 1 + x^2 - x^3\\
f_3 = 1 - x + x^4\\
f_4 = 1 - x^4\\
f_5 = 1 - 2x + x^3 - 2x^4
\end{array}
$$

Let $1, x, x^2, x^3, x^4$ be a basis of $F[x]_4$.

Then

$$
\begin{pmatrix}
f_{1} & f_{2} & f_{3} & f_{4} & f_{5}
\end{pmatrix} =\begin{pmatrix}
1 & x & x^2 & x^3 & x^4
\end{pmatrix}\begin{pmatrix}
1 & 1 & 1 & 1 & 1 \\
-1 & 0 & -1 & 0 & -2 \\
2 & 1 & 0 & 0 & 0 \\
0 & -1 & 0 & 0 & 1 \\
0 & 0 & 1 & -1 & -2
\end{pmatrix}
$$

**Remark 2.8.** To prove that a set of vectors is linearly independent, we can pass to their coordinate vectors.

### 2.4 Transition matrix

**Definition 2.9 (Transition matrix).** Let $\varepsilon_1, \varepsilon_2, \dots, \varepsilon_n$ be a basis of $V$ over $F$,
and let $\varepsilon_1', \varepsilon_2', \dots, \varepsilon_n'$ be another basis of $V$ over $F$.

For every $\alpha \in V$,

$$
\alpha = \begin{pmatrix}
\varepsilon_1 & \varepsilon_2 & \cdots & \varepsilon_n
\end{pmatrix}\begin{pmatrix}
x_{1} \\
x_{2} \\
\cdots \\
x_{n}
\end{pmatrix}
$$

$$
\alpha = \begin{pmatrix}
\varepsilon_1' & \varepsilon_2' & \cdots & \varepsilon_n'
\end{pmatrix}\begin{pmatrix}
x_{1}' \\
x_{2}' \\
\cdots \\
x_{n}'
\end{pmatrix}
$$

There is a matrix $A = \begin{pmatrix}
a_{11} & a_{12} & a_{13} & \cdots & a_{1n} \\
a_{21} & a_{22} & a_{23} & \cdots & a_{2n} \\
a_{31} & a_{32} & a_{33} & \cdots & a_{3n} \\
\vdots & \vdots & \vdots & \ddots & \vdots \\
a_{n1} & a_{n2} & a_{n3} & \cdots & a_{nn}
\end{pmatrix}$ such that

$$
\begin{pmatrix}
\varepsilon_1' & \varepsilon_2' & \cdots & \varepsilon_n'
\end{pmatrix} = \begin{pmatrix}
\varepsilon_1 & \varepsilon_2 & \cdots & \varepsilon_n
\end{pmatrix} \begin{pmatrix}
a_{11} & a_{12} & a_{13} & \cdots & a_{1n} \\
a_{21} & a_{22} & a_{23} & \cdots & a_{2n} \\
a_{31} & a_{32} & a_{33} & \cdots & a_{3n} \\
\vdots & \vdots & \vdots & \ddots & \vdots \\
a_{n1} & a_{n2} & a_{n3} & \cdots & a_{nn}
\end{pmatrix}
$$

Then $A$ is invertible.

We call $A$ the transition matrix from $\varepsilon_1, \varepsilon_2, \dots, \varepsilon_n$ to $\varepsilon_1', \varepsilon_2', \dots, \varepsilon_n'$.

We also have

$$
\begin{pmatrix}
x_1 \\
x_2 \\
\cdots \\
x_n
\end{pmatrix}= A \begin{pmatrix}
x_1' \\
x_2' \\
\cdots \\
x_n'
\end{pmatrix}
$$

**Remark 2.10.** How do we find the transition matrix?

Let $B = CA$; then $A = C^{-1}B$.

Apply elementary row operations to the block matrix $(C, B)$ to obtain $(E, C^{-1}B)$.

**Example 2.11.** In $\mathbb{R}^3$, take two bases:

$$
\begin{aligned}
\varepsilon_1 =\begin{pmatrix}
1 \\
2 \\
1
\end{pmatrix}\quad
\varepsilon_2 =\begin{pmatrix}
2 \\
3 \\
3
\end{pmatrix}\quad\varepsilon_3 =\begin{pmatrix}
3 \\
2 \\
1
\end{pmatrix}
\end{aligned}
$$

$$
\eta_1 =\begin{pmatrix}
3 \\
1 \\
4
\end{pmatrix}\quad\eta_3 =\begin{pmatrix}
5 \\
2 \\
1
\end{pmatrix}\quad\eta_3 =\begin{pmatrix}
1 \\
1 \\
-6
\end{pmatrix}
$$

(1) Find the transition matrix from $\varepsilon$ to $\eta$.

(2) If the coordinate vector of $\alpha$ relative to $\eta$ is $\begin{pmatrix}
0 \\
-1 \\
1
\end{pmatrix}$, find its coordinate vector relative to $\varepsilon$.

### 2.5 Linear subspaces

**Definition 2.12 (Dimension and basis of a linear subspace).**

For the matrix

$$
A = \begin{pmatrix}
a_{11} & a_{12} & a_{13} & \cdots & a_{1n} \\
a_{21} & a_{22} & a_{23} & \cdots & a_{2n} \\
a_{31} & a_{32} & a_{33} & \cdots & a_{3n} \\
\vdots & \vdots & \vdots & \ddots & \vdots \\
a_{n1} & a_{n2} & a_{n3} & \cdots & a_{nn}
\end{pmatrix}
$$

the set

$$
\left \{\begin{pmatrix}
x_{1} \\
x_{2} \\
\cdots \\
x_{n}
\end{pmatrix} \mid AX = 0\right\}
$$

is a linear subspace.

Its dimension is $n - r_A$.

**Note**: see the MIT video.

Let $V$ be a vector space over $F$, and let $\alpha_1, \alpha_2, \dots, \alpha_s \in V$.

$W = L \begin{pmatrix}
\alpha_1 & \alpha_2 & \cdots & \alpha_s
\end{pmatrix} = \left\{ \sum_{i=1}^{s} k_i \alpha_i \mid k_i \in F, 1 \le i \le s \right\}$

(1) If $L(\alpha_1, \alpha_2, \dots, \alpha_s) = L(\beta_1, \beta_2, \dots, \beta_t)$, then the vector systems $(\alpha_1, \dots, \alpha_s)$ and $(\beta_1, \dots, \beta_t)$ are equivalent.

That is, every vector in $L(\alpha_1, \dots, \alpha_s)$ also lies in $L(\beta_1, \dots, \beta_t)$.

Let $\eta_1, \eta_2, \dots, \eta_r$ be a maximal linearly independent subset of $\alpha_1, \dots, \alpha_s$; then $L(\alpha_1, \dots, \alpha_s) = L(\eta_1, \dots, \eta_r)$.

Thus $\eta_1, \dots, \eta_r$ form a basis of the subspace spanned by $\alpha_1, \dots, \alpha_s$.

## 3 Euclidean spaces

### 3.1 Inner product and length

**Definition 3.1 (Euclidean space).**

Let $V$ be a vector space over $\mathbb{R}$.

Define a map $(\cdot,\cdot) : V \times V \to \mathbb{R}$. It is called an inner product if, for all $\alpha, \beta, \gamma \in V$ and $k \in \mathbb{R}$, it satisfies:

(1) $(\alpha, \beta) = (\beta, \alpha)$

(2) $(\alpha + \beta, \gamma) = (\alpha, \gamma) + (\beta, \gamma)$

(3) $(k \alpha, \beta) = k(\alpha, \beta)$, $k \in \mathbb{R}$

(4) $(\alpha, \alpha) \ge 0$ for all $\alpha \in V$, and $(\alpha, \alpha) = 0$ if and only if $\alpha = 0$.

The value $(\alpha, \beta)$ is the inner product of $\alpha$ and $\beta$, and $V$ is called a Euclidean space.

**Example 3.2.**

$$
\mathbb{R}^n = \left\{\begin{pmatrix}
a_{1} \\
a_{2} \\
\cdots \\
a_{n}
\end{pmatrix} \mid a_i \in \mathbb{R}\right\}
$$

**Example 3.3.** define $C[a, b]$ as continuous functions on $[a, b]$.

$$
\left( f(x), g(x)\right) = \displaystyle \int_{a}^{b} f(x)g(x) \,\mathrm{d} x
$$

Then $(f(x), g(x))$ makes an Euclidean space.

**Theorem 3.4 (The properties of Euclidean spaces).**

(1)

$$
\left( \displaystyle \sum_{i = 1}^{m} k_i \alpha_i, \displaystyle \sum_{j= 1}^{n} k_j' \beta_j \right) = \displaystyle \sum_{i = 1}^{m} \displaystyle \sum_{j = 1}^{n} k_ik_j'(\alpha_i, \beta_j)
$$

(2)

$$
(0, \alpha)= 0 \cdot (0, \alpha) = 0
$$

**Definition 3.5 (The length of vector).** Let $_RV$ as an Euclidean space. $\forall \alpha \in V$, $(\alpha,  \alpha) \ge 0$, define

$$
||\alpha|| = \sqrt{(\alpha, \alpha)}
$$

as the length of vector.

### 3.2 Cauchy–Schwarz and the triangle inequality

**Theorem 3.6 (Cauchy-Schwaz-inequality).**

$$
\forall \alpha, \beta \in V, |(\alpha, \beta)|\le ||\alpha||\cdot||\beta||
$$

the "=" holds if and only if $\alpha, \beta$ are linearly dependent.

Accordingly,

$$
|a_1b_1 + a_2b_2 + \cdots + a_nb_n| \le \sqrt{a_1^2 + a_2^2 + \cdots + a_n^2} \sqrt{b_1^2 + b_2^2 + \cdots + b_n^2}
$$

Let $_RV$ be an Euclidean space.

$$
\forall \alpha, \beta \in _RV, |(\alpha, \beta)| \le ||\alpha||||\beta||
$$

define the angle between $\alpha$ and $\beta$ $\angle (\alpha, \beta) = \varphi$, $0 \le \varphi \le \pi$, satisfying that

$$
\cos \varphi = \cfrac{(\alpha, \beta)}{||\alpha||||\beta||}
$$

When $(\alpha, \beta) = 0$, we call $\alpha  \beta$

**Corollary 3.7.** if $_RV$ is an Eucildean space, $\alpha, \beta \in _RV$, then

$$
||\alpha + \beta|| \le ||\alpha|| + ||\beta||
$$

holds.

*Proof.*

$$
\begin{aligned}
||\alpha + \beta||^2 &= (\alpha + \beta, \alpha + \beta)\\
&= (\alpha, \alpha) + 2(\alpha, \beta) + (\beta, \beta)\\
&\le (\alpha, \alpha) + 2 ||\alpha|| \cdot ||\beta|| + (\beta, \beta)
&= \left( ||\alpha|| + ||\beta|| \right)^2
\end{aligned}
$$

$\square$

Let $_RV$ be an Euclidean space, $\dim V = n$.

let  $\varepsilon_1 \sim \varepsilon_n$ be a set of basis for $_RV$.

$\forall \alpha, \beta \in _RV$,

$$
\begin{aligned} 
\alpha = x_1 \varepsilon_1 + x_2 \varepsilon_2 + \cdots + x_n \varepsilon_n\\
\beta = y_1 \varepsilon_1 + y_2 \varepsilon_2 + \cdots + y_n \varepsilon_n
\end{aligned}
$$

$$
\begin{aligned}
(\alpha, \beta) &= \left( \displaystyle \sum_{i = 1}^{n} x_i \varepsilon_i, \displaystyle \sum_{j = 1}^{n} y_j \varepsilon_j  \right)\\&= \displaystyle \sum_{i = 1}^{n} \displaystyle \sum_{j=1}^{n} x_iy_j(\varepsilon_i, \varepsilon_j)\\
&=\begin{pmatrix}
x_1 & x_2 & \cdots & x_n
\end{pmatrix} \begin{pmatrix}
(\varepsilon_1, \varepsilon_1) & (\varepsilon_1, \varepsilon_2) & \cdots & (\varepsilon_1, \varepsilon_n) \\
(\varepsilon_2, \varepsilon_1) & (\varepsilon_2, \varepsilon_2) & \cdots & (\varepsilon_2, \varepsilon_n) \\
\cdots & \cdots & \cdots & \cdots \\
(\varepsilon_n, \varepsilon_1) & (\varepsilon_n, \varepsilon_2) & \cdots & (\varepsilon_n, \varepsilon_n)
\end{pmatrix}\begin{pmatrix}
y_{1} \\
y_{2} \\
\cdots \\
y_{n}
\end{pmatrix}
\end{aligned}
$$

then we call $[(\varepsilon_i, \varepsilon_j)]_{n \times n}$ as the matrix of basis $\varepsilon_1 \sim \varepsilon_n$

### 3.3 Orthogonal and orthonormal bases

**Definition 3.8 (verdict set of vector).**

$$
\forall \alpha_i, \alpha_j \in \{\alpha_1, \alpha_2 \cdots \alpha_s\}, i \ne j,  (\alpha_i, \alpha_j) = 0
$$

then we call $\{\alpha_1, \alpha_2 \cdots \alpha_s\}$ a verdict set of vectors.

**Corollary 3.9.** if $\alpha_1, \alpha_2 \cdots \alpha_s$ are verdict, then they must be linearly independent.

**Definition 3.10 (Orthogonal basis and orthonomal basis).** On Euclidean space $_RV$, $\alpha_1, \alpha_2 \cdots \alpha_n$ makes an orthogonal set of vectors. Then we call $\alpha_1, \alpha_2 \cdots \alpha_s$ an orthogonal basis of $_RV$.

Furthermore, if $||\alpha_i|| = 1$ holds for all $1 \le i \le n$, then we call $\alpha_1, \alpha_2 \cdots \alpha_n$ an orthogonomal basis.

when $\alpha_1, \alpha_2 \cdots \alpha_n$ is an orthonomal basis, then

$$
(\alpha_i,  \alpha_j) = 
\begin{cases}
1  , i = j\\
0 , i \ne j
\end{cases}
$$

### 3.4 Gram–Schmidt orthogonalization

**Definition 3.11 (Schwidt orthogonalize).** let $_RV$ be a $n$ dimension Euclidean space, $\alpha_1, \alpha_2 \cdots \alpha_n$ is a basis for $_RV$. let

$\beta_1 = \alpha_1$

$\beta_2 = \alpha_2 + k_{12} \alpha_1$, satisfying that $(\beta_2, \beta_1) = 0$

$(\beta_1, \beta_2) = (\alpha_2 + k_1 \beta_1, \beta_1) = (\alpha_2, \beta_1) + k_{12} (\beta_1, \beta_1) = 0$

so $k_{12} = - \frac{(\alpha_2, \beta_1)}{(\beta_1, \beta_1)}$, $\beta_2 = \alpha_2 - \frac{(\alpha_2, \beta_1)}{(\beta_1, \beta_1)} \beta_1$

$(\beta_1, \beta_2) = (\alpha_1, \alpha_2) \cdot\begin{pmatrix}
1 & * \\
0 & 1
\end{pmatrix}$

let $\beta_3 = \alpha_3 + k_{13}\beta_1 + k_{23}\beta_2$, satisfying that $(\beta_3, \beta_1) = (\beta_3, \beta_2) = 0$.

$k_{13}  = -\frac{(\alpha_3, \beta_1)}{(\beta_1, \beta_1)}, k_{23} = - \frac{(\alpha_3,  \beta_2)}{(\beta_2, \beta_2)}$

So

$$
\beta_3 = \alpha_3 - \cfrac{(\alpha_3, \beta_2)}{(\beta_2, \beta_2)} \beta_2- \cfrac{(\alpha_3, \beta_1)}{(\beta_1, \beta_1)} \beta_1
$$

Accordingly,

$$
\beta_n = \alpha_n - \displaystyle \sum_{i = 1}^{n - 1} \cfrac{(\alpha_n, \beta_i)}{(\beta_i, \beta_i)} \beta_i
$$

$$
\begin{pmatrix}
\beta_1 & \beta_2 & \cdots & \beta_n
\end{pmatrix} = \begin{pmatrix}
\alpha_1 & \alpha_2 & \cdots & \alpha_n
\end{pmatrix} \begin{pmatrix}
1 & * & * & * \\
 & 1 & * & * \\
 &  & 1 & * \\
 &  &  & 1
\end{pmatrix}
$$

**Example 3.12.** On $\mathbb{R}^4$,

$$
\alpha_1 =\begin{pmatrix}
1 \\
0 \\
1 \\
0
\end{pmatrix}, \alpha_2 =\begin{pmatrix}
0 \\
1 \\
2 \\
1
\end{pmatrix}, \alpha_3 =\begin{pmatrix}
-2 \\
-1 \\
0 \\
1
\end{pmatrix}
$$

(1) get a orthonomal basis for $L(\alpha_1, \alpha_2, \alpha_3)$.

*Proof.* (1):

$$
\begin{aligned}
(\alpha_1, \alpha_2, \alpha_3) = \begin{pmatrix}
1 & 0 & -2 \\
0 & 1 & 1 \\
1 & 2 & 0 \\
0 & 1 & 1
\end{pmatrix} \longrightarrow
\begin{pmatrix}
1 & 0 & -2 \\
0 & 1 & 1 \\
0 & 2 & 2 \\
0 & 1 & 1
\end{pmatrix}\\
\longrightarrow
\begin{pmatrix}
1 & 0 & -2 \\
0 & 1 & 1 \\
0 & 0 & 0 \\
0 & 0 & 0
\end{pmatrix}
\end{aligned}
$$

So $\alpha_1, \alpha_2$ is the maximum independent set of vector for $L(\alpha_1, \alpha_2, \alpha_3)$, while $\alpha_3 = -2 \alpha_1 + \alpha_2$. $\square$

let $\beta_1 = \alpha_1 =\begin{pmatrix}
1 \\
0 \\
1 \\
0
\end{pmatrix}$, then $\beta_2 = \alpha_2 - \frac{(\alpha_2, \beta_1)}{(\beta_1, \beta_1)} \beta_1 =\begin{pmatrix}
0 \\
1 \\
2 \\
1
\end{pmatrix} -\begin{pmatrix}
1 \\
0 \\
1 \\
0
\end{pmatrix} =\begin{pmatrix}
-1 \\
0 \\
1 \\
1
\end{pmatrix}$