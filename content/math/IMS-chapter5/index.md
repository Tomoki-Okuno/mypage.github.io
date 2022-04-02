---
title: Exercise in Mathematical Statistics
summary: Chapter 5 Consistency and Limiting Distributions
tags:
- probability
- distribution
- statistics
date: "`r Sys.Date()`"

# Activate this widget? true/false
active: false

# Optional external URL for project (replaces project detail page).
external_link: ""

image:
  caption: Photo by rawpixel on Unsplash
  focal_point: Smart

links:
# - icon: twitter
#   icon_pack: fab
#   name: Follow
#   url: https://twitter.com/georgecushen
url_code: ""
url_pdf: ""
url_slides: ""
url_video: ""

# Slides (optional).
#   Associate this project with Markdown slides.
#   Simply enter your slide deck's filename without extension.
#   E.g. `slides = "example-slides"` references `content/slides/example-slides.md`.
#   Otherwise, set `slides = ""`.
# slides: example
---
<script type="text/javascript" async src="https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.7/MathJax.js?config=TeX-MML-AM_CHTML">
</script>
<script type="text/x-mathjax-config">
 MathJax.Hub.Config({
 tex2jax: {
 inlineMath: [['$', '$'] ],
 displayMath: [ ['$$','$$'], ["\\[","\\]"] ]
 }
 });
</script>

[Introduction to Mathematical Statistics (8th Edition)](https://minerva.it.manchester.ac.uk/~saralees/statbook2.pdf)

## 5.1 Convergence in Probability
- To emphasize the fact that we are working with sequences of random variables, we may place a subscript $n$ on the appropriate random variables; for example, write $X$ as $X_n$.
- The Weak Law of Large Numbers says that all the mass of the distribution of $\overline{X}_n$ is conversing to $\mu$ as $n\rightarrow\infty$.
- The Strong Law of Large NUmbers is a first moment theorem, while the WLLN requires the existance of the second moment.
- The sample mean $\overline{X}$ and the sample variance $S^2$ are unbiased for $\mu$ and $\sigma^2$.
- The sample mean $\overline{X}_n$ is consistent for $\mu$ by the WLLN.
- Consistency is a very important property for an estimator to have. It is a poor estimator that does not approach its target as the sample size gets large.

### Theorem 5.1.2.
Suppose $X_n\stackrel{P}{\rightarrow} X$ and $Y_n\stackrel{P}{\rightarrow} Y$. 
Then $X_n + Y_n\stackrel{P}{\rightarrow} X + Y$.

Proof: Let $\epsilon \gt 0$ be given. Using the triangle inequality, we can write
$$
|X_n - X| + |Y_n - Y| \ge |(X_n + Y_n) - (X + Y)| \ge \epsilon. 
$$
Since $P$ is monotone relative to set containment, we have
$$
\begin{align*}
P[|(X_n + Y_n) - (X + Y)| \ge \epsilon]
\le & P[|X_n - X| + |Y_n - Y| \ge \epsilon] \\\\
\le & P[|X_n - X|\ge \epsilon/2] \\\\ 
& + P[|Y_n - Y| \ge \epsilon/2].
\end{align*}
$$
By the hypothesis of the theorem, the last two terms converge to $0$ as $n\rightarrow\infty$, which gives us the desired result.

The sample variance converges in probability to $\sigma^2$, assume further that $E[X_1^4]\lt\infty$, so that $Var(S^2)\lt\infty$.
$$
\begin{align*}
S_n^2 = \frac{1}{n-1}\sum_{i=1}^n (X_i - \overline{X} _ n)^2
& = \frac{n}{n-1} \left(\frac{1}{n}\sum_{i=1}^n X_i^2 - \overline{X}_n^2\right)\\\\
& \stackrel{P}{\rightarrow} 1\cdot[E(X_1^2) - \mu^2] = \sigma^2.
\end{align*}
$$

### Exercise
#### 5.1.1.
Let {$a_n$} be a sequence of real numbers. Hence, we can also say that {$a_n$} is a sequence of constant (degenerate) random variables. Let $a$ be a real number. Show that $a_n \to a$ is equivalent to $a_n \stackrel{P}{\rightarrow} a$.

**Solution.**
$$
\begin{align*}
a_n \to a 
&\Leftrightarrow \forall\epsilon \gt 0, \exists N \in \mathbb{N} \text{ such that }
|a_n - a|\le \epsilon \text{ for } n \gt N\\\\
&\Leftrightarrow P(|a_n - a|\le \epsilon) \to 1\:\text{ as } n\to \infty\\\\
&\Leftrightarrow P(|a_n - a|\gt \epsilon) \to 0\:\text{ as } n\to \infty\\\\
&\Leftrightarrow a_n \stackrel{P}{\rightarrow} a.
\end{align*}
$$
#### 5.1.2.
Let the random variable $Y_n$ have a distribution that is $Binomial(n, p)$.

(a) $Y_n/n \stackrel{P}{\to} p$. This result is one form of the weak law of large numbers.  
(b) $1 - Y_n/n \stackrel{P}{\to} 1-p$.  
(c) $Y_n/n(1 - Y_n/n) \stackrel{P}{\to} p(1-p$.

**Solution.**  
(a) Let $X_1,...,X_n \stackrel{iid}{\sim} \text{Bernoulli}(p)$, then we know that $E(X_i)=p$ and $Var(X_i) = 1 - p \lt \infty$. Thus $\overline{X} _ n \stackrel{P}{\to} p$ by WLLN.  
Since $\sum_{i=1}^n X_i\sim \text{Binomial}(n, p)$ has the same distribution as $Y_n$,
$$
Y_n/n = \sum_{i=1}^n X_i/n = \overline{X}_n\stackrel{P}{\to} p.
$$
(b) Let $g(x) = 1-x$. Since $g$ is continuous at all $x$ and $Y_n/n \stackrel{P}{\to} p$
$$
1 - Y_n/n = g(Y_n/n)\stackrel{P}{\to} g(p) = 1 - p.
$$
(c) By the corollary: If $X_n\stackrel{P}{\to} a$ and $Y_n\stackrel{P}{\to} b$, then
$X_nY_n\stackrel{P}{\to} ab$,
$$
Y_n/n(1 - Y_n/n) \stackrel{P}{\to} p(1 - p) \quad\text{by (a) and (b)}.
$$

#### 5.1.7.
Let $X_1,...,X_n$ be iid random variables with common pdf
$$
f(x) = \begin{cases}
e^{-(x-\theta)} & x>\theta, \:-\infty\lt\theta\lt\infty\\\\
0 & \text{elsewhere}.
\end{cases}
$$
This pdf is called the **shifted exponential**. Let $Y_n = \min\{X_1,...,X_n\}$.
Prove that $Y_n  \to \theta$ in probability by first obtaining the cdf of $Y_n$.

**Solution.** 
$$
\begin{align*}
P(Y_n \ge y) &= P(\min\{X_1,...,X_n\} \ge y)\\\\
&= P(X_1 \ge y)\cdots P(X_n \ge y)\\\\
&= F_X^n(X\ge y) \quad\text{since } X_1,...,X_n \text{ are iid}\\\\
&= \begin{cases}
1 & y\le\theta\\\\
\left[\int_y^\infty e^{-(t-\theta)}dt\right]^n = e^{-n(y-\theta)}& y\gt\theta.
\end{cases}
\end{align*}
$$
Hence, the cdf of $Y_n$ is
$$
\begin{align*}
F_{Y_n}(y) &= 1 - P(Y_n \ge y) \\\\
&= \begin{cases}
0 & y\le\theta\\\\
1 - e^{-n(y-\theta)}& y\gt\theta.
\end{cases}
\end{align*}
$$
Let $\epsilon \gt 0$ be given. 
$$
\begin{align*}
P(|Y_n - \theta| \gt \epsilon) &= P(Y_n - \theta \gt \epsilon)\quad\text{since } Y_n \gt \theta\\\\
&= P(Y_n > \theta + \epsilon)\\\\
&= 1 - F_{Y_n}(\theta + \epsilon)\\\\
&= e^{-n\epsilon} \to 0 \quad\text{ as } n\to \infty,
\end{align*}
$$
which means $Y_n\stackrel{P}{\to} \theta$.

#### 5.1.8.
Using the assumptions behind the confidence interval given in expression (4.2.9), show that
$$
\sqrt{\frac{S_1^2}{n_1}+\frac{S_2^2}{n_2}}\Big/
\sqrt{\frac{\sigma_1^2}{n_1}+\frac{\sigma_2^2}{n_2}}
\stackrel{P}{\to} 1
$$
**Solution.** Let
$$
g(x, y) = \sqrt{\frac{x^2}{n_1}+\frac{y^2}{n_2}}\Big/
\sqrt{\frac{\sigma_1^2}{n_1}+\frac{\sigma_2^2}{n_2}}.
$$
Since $S_1\stackrel{P}{\to} \sigma_1, S_2\stackrel{P}{\to} \sigma_2$ and $g(x, y)$ is continuous at all $(x, y)$
$$
\sqrt{\frac{S_1^2}{n_1}+\frac{S_2^2}{n_2}}\Big/
\sqrt{\frac{\sigma_1^2}{n_1}+\frac{\sigma_2^2}{n_2}}
= g(S_1, S_2) \stackrel{P}{\to} g(\sigma_1, \sigma_2) = 1.
$$

#### 5.1.9.
For Exercise 5.1.7, obtain the mean of $Y_n$. Is $Y_n$ an unbiased estimator of $\theta$? Obtain an unbiased estimator of $\theta$ based on $Y_n$.

**Solution.** First, we obtain the pdf, $f_{Y_n}(y)$:
$$
f_{Y_n}(y) = F_{Y_n}'(y) = \begin{cases}
0 & y\le\theta\\\\
ne^{-n(y-\theta)}& y\gt\theta.
\end{cases}
$$
Hence, the mean of $Y_n$ is
$$
\begin{align*}
E(Y_n) &= n\int_\theta^\infty ye^{-n(y-\theta)}dy\\\\
&= \int_0^\infty \left(\frac{t}{n}+\theta\right)e^{-t}dt\quad(t = n(y-\theta))\\\\
&= \frac{1}{n} + \theta\quad\text{since} \int_0^\infty te^{-t}dt = \int_0^\infty e^{-t}dt =1.
\end{align*}
$$
Hence, $Y_n$ is *biased* for $\theta$, but $Y_n - 1/n$ is an unbiased estimator of $\theta$ since
$$
E(Y_n - 1/n) = E(Y_n) - 1/n = \theta.
$$

### 5.2 Convergence in Distribution
- Often, we say that the distribution of $X$ is the **asymptotic distribution** of the sequence {$X_n$}.
- While convergence in probability is a way of saying that a sequence of random variables $X_n$ is getting close to another random variable $X$, convergence in distribution is only concerned with the cdfs $F_{X_n}$ and $F_X$.
- In general, $X_n \stackrel{P}{\to} X \Rightarrow X_n \stackrel{D}{\to} X$. However
$X_n \stackrel{D}{\to} X$ but $X_n \stackrel{P}{\nrightarrow} X$. The converse is true only if $X$ id degenerate.

#### Simple example that illustrates the difference between two convergences:
Let $X$ be a continuous random variable with a pdf $f_X(x)$ that is symmetric at 0. Then it is easy to show that the pdf of $-X$ is also $f_X(x)$. Thus, $X$ and $-X$ have the same distributions. Define the sequence of random variables $X_n$ as
$$
X_n = \begin{cases}
 X & \text{if } n \text{ is odd}\\\\
-X & \text{if } n \text{ is even}.
\end{cases}
$$
Clearly, $F_{X_n}=F_{X}$ for all $x$ in the support of $X$, so that $X_n \stackrel{D}{\rightarrow}X$. 
On the other hand, $X$ does not get close to $X$. In particular, $X_n \stackrel{P}{\nrightarrow} X$ in probability.
$$
\begin{align*}
\end{align*}
$$
