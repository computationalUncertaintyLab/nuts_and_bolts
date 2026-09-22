---
title: Logistic regression
---

# Logistic regression

## Introduction
Logistic regression is used to model a target that reports the presence (often mapped to the value one) or absence (often mapped to the value zero) of a phenomena.

## Data setup
Compared to multivariate linear regression, we assume an identical setup for the data except for one change. Assume that we collect observations with $p$ pieces of information and a target of interest $y$. Then we may describe our dataset with $n$ observations as $$\begin{aligned}
    \mathcal{D} = \left( (y_{1}, x_{1,1}, x_{1,2}, \cdots, x_{1,p}), (y_{2}, x_{2,1}, x_{2,2}, \cdots, x_{2,p}), \cdots, (y_{n}, x_{n,1}, x_{n,2}, \cdots, x_{n,p})  \right)
\end{aligned}$$

The key difference between the data for linear regression and the data for logistic regression is that for linear regression the target variable $y$ is assumed to take any negative or positive values. However, for logistic regression we assume the only two options for $y$ are 0 or 1.

### Modeling the target
Because the target takes the value 0 or 1 a natural choice to model this target is the Bernoulli distribution. That is, we start by assuming that the random variables $Y_{i}$ that generate observations $y_{i}$ follow a Bernoulli distribution. $$\begin{aligned}
    Y_{i} \| x_{i,1},  x_{i,2}, \cdots, x_{ip} \sim Bernoulli(\theta)  
\end{aligned}$$

### A function to constrain the parameter space
$$\begin{aligned}
    Y_{i} \sim \Bernoulli( \theta(x_{i}) ) \\ 
    \theta(x_{i}) = \frac{ e^{ \beta_{0} + \sum_{k=1}^{p} \beta_{k}x_{i,k} } }{1 + e^{ \beta_{0} + \sum_{k=1}^{p} \beta_{k}x_{i,k}}
\end{aligned}$$ The parameter $\theta$ determines the probability that we assign to a one (and so then also a zero). To allow $x$ covariates to change the probability that $Y_{i} = 1$ we can change $\theta$ from a constant, $\theta$, to a function that depends on $x_{1}, x_{2}, \cdots, x_{p}$, $\theta(x)$.

A first choice for the function above may be the same as linear regression $$\theta(x_{i}) = \beta_{0} + \sum_{k=1}^{p} \beta_{k} x_{i,k}$$

However, because $\theta(x)$ is the **probability** assigned to $Y=1$ the function $\theta(x)$ needs to be confined in the interval $[0,1]$. The function above is not limited to the interval \[0,1\] and so we need to find a new function that guarantees that $\theta(x)$ is between 0 and 1.

### The full model
## One unit change
## Log odds and odds ratio
## Decision boundaries
## Homework
1.  Consider the following logistic regression model $$\begin{aligned}
            Y_{i} & \sim  Bern[\theta(x_{i})] \\ 
                  \theta(x) &= e^{\beta_{0} + \beta_{1}x_{i}} \Big / (1+e^{\beta_{0} + \beta_{1}x_{i}})
        
    \end{aligned}$$ Please derive the change in the log odds for a $k$ unit change in $x$,

2.  Suppose you find estimates $\beta_{0} = 0.5$ and $\beta_{1} = -1$ for the following logistic regression model $$\begin{aligned}
            Y_{i} & \sim  Bern[\theta(x_{i})] \\ 
                  \theta(x) &= e^{\beta_{0} + \beta_{1}x_{i}} \Big / (1+e^{\beta_{0} + \beta_{1}x_{i}})
            
    \end{aligned}$$

    1.  What does the model assume is the probability of obtaining $y=1$ when $x=0$ (i.e. $P(Y=1 | x=0)$)?

    2.  What does the model assume is the probability of obtaining $y=1$ when $x=2$ (i.e. $P(Y=1 | x=2)$)?

    3.  What does the model assume is the probability of obtaining $y=1$ when $x=3$ (i.e. $P(Y=1 | x=3)$)?

    4.  What does the model assume is the probability of obtaining $y=1$ when $x=4$ (i.e. $P(Y=1 | x=4)$)?

    5.  Why is the change in the probability of a one from $x=2$ to $x=3$ ( i.e. $P(Y=1 | x=3) - P(Y=1 | x=2)$ ) different compared to the change in the probability of a one from $x=3$ to $x=4$ ($P(Y=1 | x=4) - P(Y=1 | x=3)$ )?

3.  Suppose the following model $$\begin{aligned}
            Y_{i} & \sim  Bern[\theta(x_{i})] \\ 
                  \theta(x) &= e^{\beta_{0} + \beta_{1}x_{i,1} +\beta_{2}x_{i,2} } \Big / (1+e^{\beta_{0} + \beta_{1}x_{i}})
            
    \end{aligned}$$

    1.  Please write down the conditional expected value for $Y$, $\mathbb{E}(Y | x_{1}, x_{2})$

    2.  Please write down the conditional variance for $Y$, $\mathbb{V}(Y | x_{1}, x_{2})$

4.  You are asked to build a model to summarize the association between diabetes type II status (the target) and three covariates: age, in years, sex (Male/Female), and fasting glucose level (mg/dL) for patients at a local hospital.\
    The dataset contains observations on 1000 patients. You build a model $$\begin{aligned}
            \log \left[\frac{\theta(x)}{\theta(1-x)}\right] = \beta_{0} + \beta_{1} x_{i,1} + \beta_{2}x_{i,2} + \beta_{3}x_{i,3}
        
    \end{aligned}$$ where $x_{i,1}$ is age, $x_{i,2}$ is sex with a reference level male, and $x_{i,3}$ is fasting glucose level.

    When you estimate the parameters you find that

      ------------------- ------------------- ------------------- -------------------
       $\hat{\beta_{0}}$   $\hat{\beta_{1}}$   $\hat{\beta_{2}}$   $\hat{\beta_{3}}$
             -0.5                 1.2                -0.9                -0.75
      ------------------- ------------------- ------------------- -------------------

    1.  Convert the above estimates to odds ratios

    2.  Please interpret a one unit change in age, sex, and fasting glucose level.

    3.  Write down the equation that describes a decision boundary if we assign a 1 when the probability of a 1 is greater than 0.50 and a 0 otherwise.
