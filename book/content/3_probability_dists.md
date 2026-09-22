---
title: Probability distributions: templates
---

# Probability distributions: templates

## Introduction
There exist several probability distributions that have been studied in depth. Templates like this allow us to model data generated from an experiment quickly. Random variable templates are so useful that several computer languages have optimized how to compute probabilities, expected values, and higher moments.

We will study parametric distributions for random variables. A set of **parameters**---constants--- determine how our random variable assigns probabilities to outcomes.

## Discrete distributions
### The Bernoulli distribution
The Bernoulli distribution assigns probabilities to a random variable who support contains the values 0 and 1. The Bernoulli distribution has a single parameter, often denoted $\theta$, that controls how probabilities are assigned to these two values 0 and 1.

To communicate that a random variable $Z$ has a Bernoulli distribution with parameter $\theta$, we write $$Z \sim Bernoulli(\theta)$$

The parameter $\theta$ can take any value between 0 and 1 inclusive, or $\theta \in [0,1]$. The allowable values a set of parameters can take is called the $\textbf{parameter space}$.

The support of $Z$ is $supp(Z) = \{0,1\}$, and the probability mass function for the random variable $Z$ is $$f_{Z}(z) = \begin{cases}
                   \theta &  if  z=1\\
                   1- \theta &  if  z=0\\
               \end{cases}$$

We can use the probability mass function to compute the expectation $$\begin{aligned}
    \mathbb{E}(Z) &= f_{Z}(1) \cdot 1 + f_{Z}(0) \cdot 0\\
                  &= f_{Z}(1) \cdot 1 = f_{Z}(1)\\
                  &= \theta,
\end{aligned}$$ and we can use the probability mass function to compute the variance $$\begin{aligned}
    V(Z) &= (1 - \theta)^{2} f_{Z}(1)+ (0-\theta)^{2} f_{Z}(0) \\
         &= (1 - \theta)^{2} \theta + \theta^{2} (1-\theta)\\
         &= \theta(1-\theta) \left[ (1-\theta) + \theta  \right]\\
         &= \theta(1-\theta)
\end{aligned}$$

Define $Z \sim Bernoulli(0.45)$. Then $supp(Z) = \{0,1\}$, $P(Z=0) = 0.55$, the $P(Z=1) = 0.45$, $\mathbb{E}(Z) = 0.45$ and $V(Z) = 0.45(0.55) = 0.25$.

A clinical trial enrolls patients and follows them for one year. The clinical team wants to understand the proportion of patients that experience or do not experience an adverse event. We could model whether each patient either experiences or does not experience an adverse event using a Bernoulli distribution. Define $Z_{i}$ as a Bernoulli distributed random variable for the $i^th$ patient in the study. When $Z_{i}$ = 1 the $i^{th}$ patient experienced an adverse event and 0 otherwise.

### The Geometric distribution
If a random variable $X$ has a **Geometric** distribution then the support is the values $supp(X) = \{1,2,3,4,5,\cdots\}$ and the probability mass function is $$f_{X}(x) = p(1-p)^{x-1}$$ A random variable that has a geometric distribution has a single parameter $p$ that can take any value between 0 and 1 inclusive, or $p \in [0,1]$.

The expected value and variance are $$\begin{aligned}
    \mathbb{E}(X) &= \frac{1}{p} \\ 
    V(X)          &= \frac{1}{p} \left( \frac{1-p}{p} \right) 
\end{aligned}$$

A random variable that follows the Geometric distribution often corresponds to an experiment where there is a $p$ probability that an event occurs (often called a success), a $(1-p)$ probability an event does not occur (often called a failure). We assume that each experiment is independent from the previous experiments. The Geometric distribution assigns a probability to the the number of times the experiment is repeated until the event occurs (i.e. the number of repeated experiments until success).

Suppose we want to study the number of times a diagnostic test needs to be implemented until that test detects the presence of viral infection. Further assume we have found in a laboratory setting that the probability this test detects a viral infection is 0.70. We could model the number of attempts until detection as a random variable $A$, and the rv $A$ would follow a geometric distribution with parameter value equal to 0.70 or $A \sim Geom(0.70)$.

### The Poisson distribution
If a random variable $X$ has a Poisson distribution then the support of $X$ is all non-negative integers or $supp(X) = \{0,1,2,3,4,...\}$, and the probability mass function is

$$\begin{aligned}
    f_{X}(x) = \frac{e^{-\lambda} \lambda^{x}}{x!}
\end{aligned}$$ where $x!$ is read \"x factorial\" and is defined as $$x!=x (x-1) (x-2) (x-3) \cdots (2) (1)$$ For example, $5! = (5)(4)(3)(2)(1) = 60$. The parameter space for the single parameter $\lambda$ is all positive real numbers or $\lambda \in (0,\infty)$.

The expected value and variance are $$\begin{aligned}
    \mathbb{E}(X) &= \lambda \\ 
             V(X) &= \lambda 
\end{aligned}$$

A random variable that follows a Poisson distribution often corresponds to an experiment where the quantity of interest is a rate. A Poisson random variable assigns probabilities to the number of occurrences of an event in a given time period.

The owner of a cafe wants records the number of espressos they produce each day and wants to characterize the probability they produce 0, 1, 2, etc. espressos. For one month the owner records the number of espressos produced per day and find on average that they produce 25 per day. We can model the number of espressos per day as a random variable $X \sim Pois(25)$.

### The Binomial distribution
A random variable $X$ distributed Binomial$(N,\theta)$ has as support $supp(X) = \{0,1,2,3,4,5,\cdots,N\}$, and the probability mass function is

$$\begin{aligned}
    f_{X}(x) = \binom{N}{x} \theta^{x}(1-\theta)^{N-x}
\end{aligned}$$ where $\binom{N}{x}$ is called a binomial coefficient and is defined as $\binom{N}{x} = \frac{N!}{x!(N-x)!}$. The binomial coefficient is often read \"N choose x\" and counts the number of ways one can choose $x$ items from a set of $N$ items where the order that the $x$ items is chosen does not matter. For example, $\binom{10}{4}$ counts the number of ways to choose 4 items from a set of 10 items where the order we selected each of the four items does not matter.

The expected value and variance of $X$ are $$\begin{aligned}
    \mathbb{E}(X) &= N\theta \\ 
             V(X) &= N\theta(1-\theta)
\end{aligned}$$

Given N observations, the binomial distribution assigns probabilities to the number of observations that experience an outcome of interest where we assume that the probability any single observation experiences the event is $\theta$.

Imagine we randomize 200 patients in a clinical trial where 100 are enrolled to receive a novel treatment and 100 are enrolled to receive a control treatment. In the treatment group, 10 patients experience an adverse event from the treatment and in the control group 15 patients experience an adverse event. In previous work we found that the probability any one patient experiences an adverse event in the treatment group is 0.02 and in the control group is 0.04. We can define a random variable $T \sim Bin(100,0.02)$ that assigns a probability to the number of patients who experience an adverse event and define a random variable $C \sim Bin(100,0.04)$ that assigns probabilities to the number of patients who experience an event in the control group.

### The Discrete Uniform distribution
A random variable $X$ has a uniform discrete distribution $U(\alpha, \beta)$ is this random variable has a support equal to $supp(X) = \{\alpha, \alpha+1,\alpha+2,\cdots,\beta\}$ and a probability mass function equal to

$$\begin{aligned}
    f_{X}(x) &= \frac{1}{ N  } \\ 
           N &= \beta - \alpha + 1
\end{aligned}$$ where $N$ count the number of outcomes between $\alpha$ and $\beta$ inclusive.

The expect6ed value and variance of $X$ are $$\begin{aligned}
    \mathbb{E}(X) &= \frac{\alpha + \beta}{2} \\ 
             V(X) &= \frac{N^2-1}{12}
\end{aligned}$$

The parameters $\alpha$ and $\beta$ for a uniform discrete distribution can take any integer value so long as the constraint $\alpha < \beta$ is satisfied.

A game of dice is played between two friends. The die that roll has six sides. We can model the probability the first player rolls any of the one through six values as $F \sim U(1,6)$ and the probability the second player rolls values between one and six as $S \sim U(1,6)$.

## Continuous distributions
Up until this point we have characterized discrete sample spaces and random variables that are defined on discrete sample spaces, called discrete random variables.

A **continuous sample space**, $\Omega$, is a subset of the real line $(\mathbb{R})$. There are an infinite, uncountable number of outcomes possible in a continuous sample space and this introduces some oddities when we try to assign probabilities on a sample space like this.

A **continuous random variable** is a function from a continuous sample space to the real line.

### Discrete to continuous: Points to intervals
Consider a discrete sample space with outcomes $\Omega = \{0, 1/4, 2/4, 3/4, 1 \}$, and define a random variable $X$ that has a uniform discrete distribution with parameters 0 and 1 or $X \sim U(0,4)$.Because there are 5 outcomes the probability of each outcome is $1/5$.

Let's increase the size of our discrete sample space to contain 100 values between 0 and 1 by setting $\Omega = \{0, 1/99, 2/99, 3/99, \cdots, 98/99, 1 \}$. If we define a uniformly distributed random variable on this space then the probability of each outcome is 1/100.

As we increase the number of points in our sample space, the probability assigned to each individual point will shrink towards zero. [In a continuous space the probability of any individual value is zero.]{.underline}

Because the $P(X=x) = 0$ for a continuous random variable defined on a continuous $\Omega$, we need a new way to define probabilities for a continuous random variables.

### Densities
For a continuous random variable $X$ with support $supp(X) = A$, where $A$ is an interval of the real line, we will assign non-negative probabilities to any interval that is a subset of $A$ according to a probability density function $f_{X}$.

A probability density function $f_{X}$ will help us compute the probability over an interval in $A$. A probability density must have values that are non-negative (i.e. on or above the horizontal line x=0 in an xy-plane) and the area under this probability density function for the set $A$ must equal one.

The probability that a random variable with pdf $f_{X}$ assigns to the interval $(a,b) \subset A$ is the area under $f_{X}$ from a to b.

\<picture\>

### Uniform continuous distribution
For a discrete random variable, $X$, the discrete uniform distribution from $\alpha$ to $\beta$ assigns the same probability to every outcome $\alpha,alpha+1,\cdots,\beta$.

For a continuous random variable $Y$, the continuous uniform distribution from $a$ to $b$ or $Y \sim U(a,b)$ will assign the same probability to any interval of the same length between the values $a$ and $b$.

The probability density function on the set $A = (a,b)$ is $$\begin{aligned}
    f_{Y}(y) = \frac{1}{b-a} \; 
\end{aligned}$$

To compute the probability of an interval, lets say $(c,d)$ where $c > a$ and $d < b$, we need to compute the area under $f_{Y}(y)$ from $c$ to $d$.

\<picture\>

The area under $f_{Y}(y)$ is equivalent to the area of a rectangle with width $d-c$ and height $\frac{1}{b-a}$. This area equals $\frac{d-c}{b-a}$ and so

$$\begin{aligned}
    P( c < Y < d ) = \frac{d-c}{b-a}
\end{aligned}$$

We can also define the cumulative density function (cdf), $F_{Y}(y)$, as

$$\begin{aligned}
    F_{Y}(y) = P(Y < y) = P(a < Y < y ) = \frac{y-a}{b-a}
\end{aligned}$$ The cdf is an important function for continuous random variables because this function inputs a value $y$ and returns the probability over all values less than $y$---an interval.

\<picture\>

The expected value and variance are $$\begin{aligned}
    \mathbb{E}(Y) &= \frac{a+b}{2}\\
             V(Y) &= \frac{(b-a)^{2}}{12}
\end{aligned}$$

### Just-in-time integration
We recognized that the area under the probability density function of a continuous uniform random variable $f_{Y}(y)$ is the same as the area of a rectangle.

But there are several continuous random variables with non-linear densities that are not easy to compute. We need a special tool and special notation to handle computing areas under these densities.

Suppose we define a continuous random variable $Z$ that has two parameters, $\mu$ and $\sigma$, with the following probability density function $$\begin{aligned}
    f_{Z}(z) = \frac{1}{\sqrt{2 \pi \sigma^{2} } } e^{ -\frac{(z-\mu)^{2}}{2\sigma^{2}}  }
\end{aligned}$$ defined over all negative and positive numbers or $\mathbb{R}$.

\<pciture\>

The area under this density is not at all straight forward to compute. However, we may be able to use the area of several rectangles---areas that we can compute---to approximate the area under this more complicated curve. Approximating the area under a curve with a set of simpler curves is called **Riemann integration**.

Lets suppose we are interested in $$\begin{aligned}
    P( -1 < Z < 1 )
\end{aligned}$$ which is the area under $f_{Z}(z)$ from the value -1 to the value 1.

\<picture\>

One way to approximate this area is to split up the interval $I = (-1,1)$ into (lets say) 20 pieces $P = \{ (-1,-9/10),[-9/10, -8/10), \cdots, [1/10,2/10), [2/10, 3/10], \cdots [9/10,1) \}$. For each smaller interval $P_{i}$ we can choose a single point $z_{i}$, where $z_{-10}$ is a point between -1 and -9/10, the point $z_{-9}$ is a point between -9/10 and -8/10 and so on. We can create rectangles with width $1/10$ and height $f(z_{i})$ and sum these rectangles to approximate the area under $f_{Z}$.

\<picutre\>

The area of these rectangles is $$\begin{aligned}
    P(-1 < z < 1) \approx \sum_{i=-10}^{10} \frac{1}{10} f(z_{i})
\end{aligned}$$

As we split this interval into more and more intervals the rectangles will better and better approximate the area under $f_{Z}$.

\<picture\>

If these exists a number $S$ such that the more splits we create the approximate area gets closer to $S$, then $S$ is called the integral of $f_{Z}$ from $-1$ to $1$ and is the exact area under $f_{Z}$.

We write $$\begin{aligned}
    \int_{z=-1}^{z=1} f_{Z}(z) dz
\end{aligned}$$ to represent the area under the probability density $f_{Z}$ between the values -1 and 1.

For a continuous random variable $X \sim U(a,b)$ the integral from $a$ to a value $x$ is the area of a rectangle. $\int_{x=a}^{x=x} f_{X}(x) dx = \frac{x-a}{b-a}$.

The cumulative density function evaluate at a value $y$ for a random variable $Y$ is the area under the probability density function from the smallest possible value in the support of $Y$ to $y$. This can be represented with an integral $F_{Y}(y) = \int_{y=-\infty}^{y=y} f_{Y}(y) dy$.

### Normal Distribution
A continuous random variable $X$ has a Normal distribution with parameters $\mu$ and $\sigma$ if the support of $X$ is all real numbers and the probability density function is $$\begin{aligned}
    f_{X}(x) = \frac{1}{\sqrt{2 \pi \sigma^{2}}} e^{ - (x - \mu)^{2} / 2\sigma^{2}  }
\end{aligned}$$

The normal distribution has several important properties that apply **only to the normal distribution**.

#### The expected value and variance are equal to distinct parameters
The expected value and variance of $X$ are $$\begin{aligned}
    \mathbb{E}(X) &= \mu\\
             V(X) &= \sigma^{2} 
\end{aligned}$$

For most continuous distributions the expected value and variance are a combination of all the paramter values. The normal distribution is unique in that the expected value only contains a single parameter $\mu$ and the variance only contains a unique parameter $\sigma$.

#### Shifting and scaling by a constant is easy
If a random variable $Y = c + X$ where $X \sim \mathcal{N}(\mu,\sigma^{2})$ then the distribution of $Y$ is $Y \sim N(\mu + c, \sigma^{2})$. If a random variable $Y = cX$ where $X \sim \mathcal{N}(\mu,\sigma^{2})$ then the distribution of $Y$ is $Y \sim N(\mu, c^{2}\sigma^{2})$.

These shifting and scaling properties are unique to the normal distribution.

## Quantiles and the quantile function
A $(100 \times p)$ **quantile** is a value $x$ such that $$\begin{aligned}
    P( X < x )    \leq p \\ 
    P( X \leq x ) \geq p 
\end{aligned}$$ where $p \in [0,1]$.

If $X$ is a discrete random variable the $P(X < x)$ may not equal $P(X \leq)$. However when $X$ is a continuous random variable the $P(X < x)$ will equal $P(X \leq x)$ and so for a continuous random variable the $(100 \times p)$ quantile is a value $x$ such that

$$\begin{aligned}
    P( X < x ) =  p 
\end{aligned}$$

Define $X \sim \mathcal{N}(0,1)$.Then The 97.5th quantile for $X$ is the value 1.96 because $P(X < 1.96) = 0.975$. The 2.5th quantile for $X$ is the value -1.96 because $P(X < -1.96) = 0.025$. The 90th quantile for $X$ is the value 1.28 because $P(X < 1.28) = 0.90$ and so the value -1.28 is the 10th quantile because $P(X < -1.28) = 0.10$.

Define $Y \sim Binom(10,0.3)$. Then the 90th quantile is the value $5$. This is because $P(Y \leq 5) = 0.95 \geq 0.90$ and $P(Y < 5 ) = 0.85 \leq 0.90$.

We can also define a **Quantile function** for a random variable $X$ that takes as input values of $p \in [0,1]$ and returns the value $x$ such that

$$\begin{aligned}
    P( X < x )    \leq p \\ 
    P( X \leq x ) \geq p 
\end{aligned}$$

Often we can think of the quantile function as the inverse of the cumulative mass (density) function. For a random variable $Y$, the cmf or cdf takes as input values in the support of $Y$ and returns the probability that $P(Y \leq y)$. Instead, the Quantile function takes as input a probability and returns the value such that $P( Y \leq y) \geq p$ and $P(Y < y) \leq p$.

## Exercises
1.  Let $X \sim Bernoulli(0.2)$

    1.  P(X=0) = ?

    2.  P(X=1) = ?

    3.  Please compute $\mathbb{E}(X)$

    4.  Please compute $V(X)$

    5.  Define the $supp(X)$

2.  Let $Y \sim Bernoulli(\theta)$, and show that $P(Y=1) = \mathbb{E}(Y)$

3.  Let $Y \sim Bernoulli(\theta)$, and show that $V(Y) \leq \mathbb{E}(Y)$

4.  Let $Y \sim Bernoulli(\theta)$, and let $Z$ be the following function of $Y$: $$\begin{aligned}
            Z(y) = \begin{cases}
                    1 &  if  y = 0\\
                    0 &  if  y = 1
                \end{cases}
        
    \end{aligned}$$ What probability distribution does $Z$ follow and why?

5.  Design an experiment (short description) and define a random variable $Y$ that may follow a geometric distribution. In the context of your experiment, how would you communicate $\mathbb{E}(Y)$ to another without statistical expertise?

6.  Define a random variable $R$ with a binomial distribution $(R \sim Bin(10,0.2))$.

    1.  Compute $\mathbb{E}(R)$

    2.  Compute $V(R)$

    3.  Describe to someone who may not have statistical expertise what $P(R=3)$ means? Be sure to include assumptions about the Binomial distribution and how the parameters $N,\theta$ relate to this probability.

    4.  For what value of $\theta$ is $V(R)$ the highest? Why does this make sense intuitively?

7.  Suppose $Y \sim Pois(2)$

    1.  Compute $P(Y=2)$

    2.  Compute $P(Y \leq 2)$

    3.  Compute $P(Y > 2)$

8.  $X \sim \mathcal{N}(\mu, \sigma^{2})$

    1.  Let $Y = X - \mu$. What is the distribution of $Y$?

    2.  Let $Z = Y/\sigma$. What is the distribution of $Z$?

    3.  Compute $P(Z = 0)$

9.  Suppose we define a new random variable $W$ with support $supp(W) = [0,1]$ and probability density function $$\begin{aligned}
              f_{W}(w) = 2w
           
    \end{aligned}$$

    1.  Compute $P(W < 1/2) = \int_{0}^{1/2} f_{W}(w)\; dw$

    2.  Compute $P(W < 1) = \int_{0}^{1} f_{W}(w)\; dw$

10. Let $X$ be a continuous random variable. Is $P(X \leq x) = P(X < x)$? Why or why not?
