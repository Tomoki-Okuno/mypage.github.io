---
title: Exercise in Mathematical Statistics
summary: Chapter 1 Probability and Distributions
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

There were my solutions to some of the problems in the text book called 'Introduction to Mathematical Statistics'. I worked on some of them in class Biostatistics 202A: Mathematical Statistics. The reason why I share my solutions is that not all answers are available publicly and some of the answers are often incorrect or unwise.

## 1.1 Convergence in Probability

**Example 1.2.25**  
If $C=\{(x_1, x_2, \ldots, x_n): 0\le x_1\le x_2\le\cdots\le x_{n-1}\le x_n\le 1\}$, then

$$
\begin{align*}
Q(C)&=\int_0^1\int_0^{x_n}\cdots\int_0^{x_3}\int_0^{x_2}dx_1dx_2\cdots dx_{n-1}dx_{n}\\
&=\int_0^1\int_0^{x_n}\cdots\int_0^{x_3}x_2 dx_2\cdots dx_{n-1}dx_{n}\\
&=\int_0^1\int_0^{x_n}\cdots\int_0^{x_4}\frac{x_3^2}{2} dx_3\cdots dx_{n-1}dx_{n}\\
&=\int_0^1\int_0^{x_n}\cdots\int_0^{x_5}\frac{x_4^3}{2(3)} dx_4\cdots dx_{n-1}dx_{n}\\
&=\int_0^1\int_0^{x_n}\cdots\int_0^{x_6}\frac{x_5^4}{2(3)(4)} dx_5\cdots dx_{n-1}dx_{n}\\
\vdots \\
&=\int_0^1\frac{x_n^{n-1}}{(n-1)!} dx_{n}=\frac{1}{n!}\Big[ x_n^n\Big]_0^1=\frac{1}{n!}.
\end{align*}
$$
