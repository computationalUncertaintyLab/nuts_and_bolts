---
title: Laboratory 04
---

# Laboratory 04

## Matrix Algebra
Statisticians and data scientists use the language of vectors and matrices to organize data and work with models. We will take a close look at matrix algebra, taking time to relate matrix algebra to the more familar algebra that you have worked with in the past.

### Recap on vectors and operations on vectors
#### Definition
A vector $v$ is an ordered list of real numbers. We denote a vector with a lower case letter and enclose the values in the vector with square brackets. We can write a vector $v$ as a *row vector*

$$\begin{aligned}
    v = [1,2,3,4,5]
\end{aligned}$$

or as a *column vector*

$$\begin{aligned}
    v = \left [
        \begin{matrix}
            1 \\ 
            2 \\
            3 \\
            4 \\
            5 \\
        \end{matrix} \right ]
\end{aligned}$$.

A vector has a **length**, defined as the number of values included in that vector. For example, the above vector is length 5.

We can create a vector in R by using the c operator.

::: tcolorbox
``` {}
\PY{n}{v} \PY{o}{=}\PY{n+nf}{c}\PY{p}{(}\PY{l+m}{1}\PY{p}{,}\PY{l+m}{2}\PY{p}{,}\PY{l+m}{3}\PY{p}{,}\PY{l+m}{4}\PY{p}{,}\PY{l+m}{5}\PY{p}{)}
```
:::

#### Vector times a scalar
A vector of length one is called a **scalar**. We can define the results of multiplying a vector $v=[1,2,3,4]$ by a scalar $\alpha$ as each entry of the vector times the scalar $\alpha$.

$$\begin{aligned}
    \alpha v = \left [
                    \begin{matrix}
                    \alpha \times 1 \\ 
                    \alpha \times 2 \\
                    \alpha \times 3 \\
                    \alpha \times 4 \\
                \end{matrix} \right ]
\end{aligned}$$

For example, the vector $v = [1,2,3,4,5]$ times the scalar $\alpha=7$ will result in a vector

$$\begin{aligned}
    \alpha v &= [7 \times 1, 7 \times 2, 7 \times 3, 7 \times 4  ]\\
             &= [7, 14, 21, 28]
\end{aligned}$$

R understands how to multiply vectors and scalars with no additional syntax.

::: tcolorbox
``` {}
\PY{n}{v} \PY{o}{=} \PY{n+nf}{c}\PY{p}{(}\PY{l+m}{1}\PY{p}{,}\PY{l+m}{2}\PY{p}{,}\PY{l+m}{3}\PY{p}{,}\PY{l+m}{4}\PY{p}{)}
\PY{n}{alpha} \PY{o}{=} \PY{l+m}{7}

\PY{n}{alpha}\PY{o}{*}\PY{n}{v}
```
:::

::: enumerate*
7

14

21

28
:::

#### Vector plus/minus a vector
A vector $v$ plus a vector $q$ creates a new vector that adds the individual entries of $v$ and $q$

$$\begin{aligned}
    v &= [4,-1,7] \\ 
    q &= [0,32,9] \\ 
    v + q &= [ 4+0, -1+32, 7+9] = [4,31,16]
\end{aligned}$$

A vector $v$ minus a vector $q$ creates a new vector that subtracts the individual entries of $q$ from $v$

$$\begin{aligned}
    v &= [4,-1,7] \\ 
    q &= [0,32,9] \\ 
    v - q &= [ 4-0, -1-32, 7-9] = [4,-33,-2]\\
    q - v &= [ 0-4, 32-(-1), 9-7] = [-4,33,2]
\end{aligned}$$

R also understands vector addition and subtraction with no special syntax.

::: tcolorbox
``` {}
\PY{n}{v} \PY{o}{=} \PY{n+nf}{c}\PY{p}{(}\PY{l+m}{4}\PY{p}{,} \PY{l+m}{\PYZhy{}1}\PY{p}{,} \PY{l+m}{7}\PY{p}{)}
\PY{n}{q} \PY{o}{=} \PY{n+nf}{c}\PY{p}{(}\PY{l+m}{0}\PY{p}{,} \PY{l+m}{32}\PY{p}{,} \PY{l+m}{9}\PY{p}{)}

\PY{n}{add} \PY{o}{=} \PY{n}{v}\PY{o}{+}\PY{n}{q}
\PY{n}{subtract} \PY{o}{=} \PY{n}{v}\PY{o}{\PYZhy{}}\PY{n}{q}

\PY{n+nf}{print}\PY{p}{(}\PY{n}{add}\PY{p}{)}
\PY{n+nf}{print}\PY{p}{(}\PY{n}{subtract}\PY{p}{)}
```
:::

``` {}
[1]  4 31 16
[1]   4 -33  -2
```

### The Matrix
A **matrix** is an ordered list of vectors.

$$\begin{aligned}
    M = \left [ \begin{matrix}
            1 & 2 & 3 \\
            4 & 5 & 6 \\
            3 & 2 & 13 \\
            90 & 23 & 0 \\
         \end{matrix} \right ]   
\end{aligned}$$

A matrix has a dimension which is an ordered pair of numbers: the first number indicates the number of rows of the matrix and the second number indicates the number of columns. For example, he matrix $M$ above has dimension $(4,3)$.

To build a matrix in R we can issue the matrix command. Matrix is a function that takes a vector as an argument and can take one of many optional arguments.

If we give the matrix function only a vector, the default behavior of this function is to create a vector.

::: tcolorbox
``` {}
\PY{n}{A} \PY{o}{=} \PY{n+nf}{matrix}\PY{p}{(}\PY{n+nf}{c}\PY{p}{(}\PY{l+m}{1}\PY{p}{,}\PY{l+m}{2}\PY{p}{,}\PY{l+m}{3}\PY{p}{,}\PY{l+m}{4}\PY{p}{,}\PY{l+m}{5}\PY{p}{,}\PY{l+m}{6}\PY{p}{)}\PY{p}{)}
\PY{n}{A}
```
:::

A matrix: 6 × 1 of type dbl

  ---
  1
  2
  3
  4
  5
  6
  ---

This is because a vector can be thought of as a matrix with one column. In other words, a matrix with dimension $(N,1)$ is a vector of length $N$.

We can provide another arguement to the `matrix` function---ncol---to specify the number of columns we want to create.

::: tcolorbox
``` {}
\PY{n}{A} \PY{o}{=} \PY{n+nf}{matrix}\PY{p}{(}\PY{n+nf}{c}\PY{p}{(}\PY{l+m}{1}\PY{p}{,}\PY{l+m}{2}\PY{p}{,}\PY{l+m}{3}\PY{p}{,}\PY{l+m}{4}\PY{p}{,}\PY{l+m}{5}\PY{p}{,}\PY{l+m}{6}\PY{p}{)}\PY{p}{,} \PY{n}{ncol}\PY{o}{=}\PY{l+m}{2}\PY{p}{)}
\PY{n}{A}
```
:::

A matrix: 3 × 2 of type dbl

  --- ---
  1   4
  2   5
  3   6
  --- ---

Above we used the ncol argument to specify a matrix with two columns. R will automatically determine the number of rows for the matrix and fill-in the values of the matrix column by column.

If we want, we can ask R to fill in values of the matrix row by row by including an additional argument in the matrix function`byrow`

::: tcolorbox
``` {}
\PY{n}{v} \PY{o}{=} \PY{n+nf}{c}\PY{p}{(}\PY{l+m}{1}\PY{p}{,}\PY{l+m}{2}\PY{p}{,}\PY{l+m}{3}\PY{p}{,}\PY{l+m}{4}\PY{p}{,}\PY{l+m}{5}\PY{p}{,}\PY{l+m}{6}\PY{p}{)}
\PY{n}{A} \PY{o}{=} \PY{n+nf}{matrix}\PY{p}{(}\PY{n}{v}\PY{p}{,} \PY{n}{ncol}\PY{o}{=}\PY{l+m}{2}\PY{p}{)}

\PY{n}{B} \PY{o}{=} \PY{n+nf}{matrix}\PY{p}{(}\PY{n}{v}\PY{p}{,} \PY{n}{ncol}\PY{o}{=}\PY{l+m}{2}\PY{p}{,} \PY{n}{byrow}\PY{o}{=}\PY{k+kc}{TRUE}\PY{p}{)}

\PY{n+nf}{print}\PY{p}{(}\PY{n}{A}\PY{p}{)}
\PY{n+nf}{print}\PY{p}{(}\PY{n}{B}\PY{p}{)}
```
:::

``` {}
[,1] [,2]
[1,]    1    4
[2,]    2    5
[3,]    3    6
     [,1] [,2]
[1,]    1    2
[2,]    3    4
[3,]    5    6
```

We see that matrix A was "column filled" and matrix B was "row filled".

There are similar operations for matrices as there are for vectors.

#### Matrix plus/minus a matrix
Given a matrix $A$ and matrix $B$, the sum of $A$ and $B$ is a new matrix $C$ where the i,j entry of $C$ ($C_{ij}$) is the sum of the corresponding entries from $A$ and $B$ ($C_{ij} = A_{ij} + B_{ij}$). To add two matrices they must have the same dimension.

$$\begin{aligned}
    A &= \left [ \begin{matrix}
                    1 & 2 & 3 \\ 
                    4 & 5 & 6 \\
                \end{matrix}
        \right ] \\ 
    B &=  \left [ \begin{matrix}
                    6 & 5 & 4 \\ 
                    3 & 2 & 1 \\
                \end{matrix}
        \right ] \\
    %
    C &= A + B = \left [ \begin{matrix}
                    1+6 & 2+5 & 3+4 \\ 
                    4+3 & 5+2 & 6+1 \\
                \end{matrix}
        \right ]  = \left [ \begin{matrix}
                    7 & 7 & 7 \\ 
                    7 & 7 & 7 \\
                \end{matrix}
        \right ] \\ 
    D &= A - B = \left [ \begin{matrix}
                    1-6 & 2-5 & 3-4 \\ 
                    4-3 & 5-2 & 6-1 \\
                \end{matrix}
        \right ]  = \left [ \begin{matrix}
                    -5 & -3 & -1 \\ 
                    1 & 3 & 5 \\
                \end{matrix}
        \right ] \\     
\end{aligned}$$

R understands matrix addition and subtraction without any additional syntax.

::: tcolorbox
``` {}
\PY{n}{A} \PY{o}{=} \PY{n+nf}{matrix}\PY{p}{(}\PY{n+nf}{c}\PY{p}{(}\PY{l+m}{\PYZhy{}1}\PY{p}{,}\PY{l+m}{2}\PY{p}{,}\PY{l+m}{4}\PY{p}{,}\PY{l+m}{1}\PY{p}{,}\PY{l+m}{3}\PY{p}{,}\PY{l+m}{8}\PY{p}{)}\PY{p}{,} \PY{n}{ncol}\PY{o}{=}\PY{l+m}{3}\PY{p}{)}
\PY{n}{D} \PY{o}{=} \PY{n+nf}{matrix}\PY{p}{(}\PY{n+nf}{c}\PY{p}{(}\PY{l+m}{90}\PY{p}{,}\PY{l+m}{0.34}\PY{p}{,}\PY{l+m}{1.54}\PY{p}{,}\PY{l+m}{\PYZhy{}9.43}\PY{p}{,}\PY{l+m}{10}\PY{p}{,}\PY{l+m}{0}\PY{p}{)}\PY{p}{,} \PY{n}{ncol}\PY{o}{=}\PY{l+m}{3}\PY{p}{)}

\PY{n+nf}{print}\PY{p}{(}\PY{n}{A}\PY{p}{)}
\PY{n+nf}{print}\PY{p}{(}\PY{n}{D}\PY{p}{)}

\PY{n}{A}\PY{o}{+}\PY{n}{D}
```
:::

``` {}
[,1] [,2] [,3]
[1,]   -1    4    3
[2,]    2    1    8
      [,1]  [,2] [,3]
[1,] 90.00  1.54   10
[2,]  0.34 -9.43    0
```

A matrix: 2 × 3 of type dbl

  ------- ------- ----
  89.00   5.54    13
  2.34    -8.43   8
  ------- ------- ----

::: tcolorbox
``` {}
\PY{n}{A}\PY{o}{\PYZhy{}}\PY{n}{D}
```
:::

A matrix: 2 × 3 of type dbl

  -------- ------- ----
  -91.00   2.46    -7
  1.66     10.43   8
  -------- ------- ----

#### Matrix times a Matrix
Two matrices $A$ and $B$ can be multiplied together $C = AB$ if the number of columns of $A$ is equal to the number of rows of $B$. In other words, if the dimension of A is (a,b) and the dimension of B is (c,d) then b and c must be equal.

The i,j entry of this product, $C_{ij}$ is the following sum of products:

$$\begin{aligned}
    C_{i,j} &= a_{i,1}b_{1,j} + a_{i,2}b_{2,j} + a_{i,3}b_{3,j} + \cdots + a_{i,N}b_{N,j}\\
            &= \sum_{e=1}^{N} a_{i,e}b_{e,j}
\end{aligned}$$

For example, suppose that $$\begin{aligned}
    A = \left [ \begin{matrix}
                     1 & 2\\
                     3 & 4 \\
                 \end{matrix} \right] 
\end{aligned}$$ and that $$\begin{aligned}
    B = \left [ \begin{matrix}
                     1 & 2 & -1\\
                     3 & 4 & -2 \\
                 \end{matrix} \right] . 
\end{aligned}$$ Then the product $C = AB$ equals

$$\begin{aligned}
    C = AB = \left [ \begin{matrix}
                            1*1 + 2*3 & 1*2 + 2*4 & 1*-1 + 2*-2 \\
                            3*1 + 4*3 & 3*2 + 4*4 & 3*-1 + 4*-2 \\
                      \end{matrix} \right] = 
                    \left [ \begin{matrix}
                            7 & 10 & -5 \\
                            15 & 22 & -11 \\
                      \end{matrix} \right] 
\end{aligned}$$

The above definition and computation can feel cumbersome. We can simplify the above calculations by introducing the inner product.

The inner product between two **vectors** $v$ and $q$, or $v'q$, is

$$\begin{aligned}
    v &= [1,2,3]\\
    q &= [4,5,6]\\
    \\
    v'q &= 1 \cdot 4 + 2 \cdot 5 + 3 \cdot 6 \\
        &= 4 + 10 + 18 = 32
\end{aligned}$$

Let us use the inner product to simplify the above matrix multiplication. First, we rewrite the matrix A as a stack of two *row* vectors

$$\begin{aligned}
    A = \begin{bmatrix}
         a_{1} \\ 
         a_{2} \\
        \end{bmatrix}
\end{aligned}$$

where $a_{1} = [1 , 2]$ and $a_{2} = [3,4]$

Second, we rewrite the matrix B as a stack of three *column* vectors

$$\begin{aligned}
    B = \begin{bmatrix}
         b_{1} & b_{2} & b_{3}
        \end{bmatrix}
\end{aligned}$$

where \$b\_{1} =

::: bmatrix
1\
3
:::

\$, \$b\_{2} =

::: bmatrix
2\
4
:::

\$, and \$b\_{3} =

::: bmatrix
-1\
-2
:::

\$

Then the product AB is a matrix of inner products

$$\begin{aligned}
    C = \begin{bmatrix}
             a_{1}'b_{1} & a_{1}'b_{2} & a_{1}'b_{3} \\ 
             a_{2}'b_{1} & a_{2}'b_{2} & a_{2}'b_{3} \\ 
         \end{bmatrix}
\end{aligned}$$

Matrix multiplication is different than mulitplication between two variables that represent real numbers because matrix multiplication is **not** commutative---the product $AB$ is not rarely equal to $BA$.

To compute the product of two matrices in R we need the %\*% operator

::: tcolorbox
``` {}
\PY{n}{A} \PY{o}{=} \PY{n+nf}{matrix}\PY{p}{(}\PY{n+nf}{c}\PY{p}{(}\PY{l+m}{\PYZhy{}1}\PY{p}{,}\PY{l+m}{0}\PY{p}{,}\PY{l+m}{1}\PY{p}{,}\PY{l+m}{\PYZhy{}2}\PY{p}{,}\PY{l+m}{\PYZhy{}1}\PY{p}{,}\PY{l+m}{3}\PY{p}{,}\PY{l+m}{4}\PY{p}{,}\PY{l+m}{5}\PY{p}{,}\PY{l+m}{6}\PY{p}{)}\PY{p}{,}\PY{n}{ncol}\PY{o}{=}\PY{l+m}{3}\PY{p}{)}
\PY{n}{B} \PY{o}{=} \PY{n+nf}{matrix}\PY{p}{(}\PY{n+nf}{c}\PY{p}{(}\PY{l+m}{1}\PY{p}{,}\PY{l+m}{2}\PY{p}{,}\PY{l+m}{3}\PY{p}{,}\PY{l+m}{4}\PY{p}{,}\PY{l+m}{5}\PY{p}{,}\PY{l+m}{6}\PY{p}{,}\PY{l+m}{7}\PY{p}{,}\PY{l+m}{8}\PY{p}{,}\PY{l+m}{9}\PY{p}{)}\PY{p}{,}\PY{n}{ncol}\PY{o}{=}\PY{l+m}{3}\PY{p}{)}

\PY{n+nf}{print}\PY{p}{(}\PY{n}{A}\PY{p}{)}
\PY{n+nf}{print}\PY{p}{(}\PY{n}{B}\PY{p}{)}

\PY{n+nf}{print}\PY{p}{(}\PY{n}{A}\PY{o}{\PYZpc{}*\PYZpc{}}\PY{n}{B}\PY{p}{)}
\PY{n+nf}{print}\PY{p}{(}\PY{n}{B}\PY{o}{\PYZpc{}*\PYZpc{}}\PY{n}{A}\PY{p}{)}
```
:::

``` {}
[,1] [,2] [,3]
[1,]   -1   -2    4
[2,]    0   -1    5
[3,]    1    3    6
     [,1] [,2] [,3]
[1,]    1    4    7
[2,]    2    5    8
[3,]    3    6    9
     [,1] [,2] [,3]
[1,]    7   10   13
[2,]   13   25   37
[3,]   25   55   85
     [,1] [,2] [,3]
[1,]    6   15   66
[2,]    6   15   81
[3,]    6   15   96
```

Note above that we computed the product AB and BA and these products resulted in different matrices.

#### Matrix times a vector
A matrix $A$ with dimension $(r,c)$ can be multiplied by a vector $v$ if the length of $v$ is $c$. Then the product $Av$ is a vector with the the i$^{th}$ entry of $Av$ defined as $$\begin{aligned}
    (Av)_{i} = \sum_{k=1}^{c} A_{i,k} v_{k}
\end{aligned}$$

For example, Let the matrix $$\begin{aligned}
    A = \left [ \begin{matrix}
                   1 & 2 \\ 
                   3 & 4 \\
                   5 & 6 \\
         \end{matrix} \right ]
\end{aligned}$$ and the vector $$\begin{aligned}
    v = \left [ \begin{matrix}
                   4  \\ 
                   -3  \\
         \end{matrix} \right ]
\end{aligned}$$ then

$$\begin{aligned}
    Av = \left [ \begin{matrix}
                   1*4+2*-3 \\ 
                   3*4+4*-3 \\
                   5*4+6*-3 \\
         \end{matrix} \right ] = 
         \left [ \begin{matrix}
                   -2  \\ 
                   0  \\
                   2 \\
         \end{matrix} \right ]
\end{aligned}$$

The definition above can also be simplifed by using inner products. Let

$$\begin{aligned}
    A = \begin{bmatrix}
          a_{1} \\ 
          a_{2} \\ 
          a_{3} 
        \end{bmatrix}
\end{aligned}$$

where $a_{1} = [1,2]$, $a_{2} = [3,4]$, and $a_{3} = [5,6]$. Then the product $Av$ simplifies to

$$\begin{aligned}
    Av = \begin{bmatrix}
            a_{1}'v\\
            a_{2}'v\\
            a_{3}'v
         \end{bmatrix}
\end{aligned}$$

We can use the %\*% operator in R to multiply together a matrix and a vector

::: tcolorbox
``` {}
\PY{n}{A} \PY{o}{=} \PY{n+nf}{matrix}\PY{p}{(}\PY{n+nf}{c}\PY{p}{(}\PY{l+m}{1}\PY{p}{,}\PY{l+m}{2}\PY{p}{,}\PY{l+m}{3}\PY{p}{,}\PY{l+m}{4}\PY{p}{,}\PY{l+m}{5}\PY{p}{,}\PY{l+m}{6}\PY{p}{)}\PY{p}{,} \PY{n}{ncol}\PY{o}{=}\PY{l+m}{2}\PY{p}{,} \PY{n}{byrow}\PY{o}{=}\PY{k+kc}{TRUE}\PY{p}{)}
\PY{n}{v} \PY{o}{=} \PY{n+nf}{c}\PY{p}{(}\PY{l+m}{4}\PY{p}{,}\PY{l+m}{\PYZhy{}3}\PY{p}{)}

\PY{n+nf}{print}\PY{p}{(}\PY{l+s}{\PYZdq{}}\PY{l+s}{Matrix A\PYZdq{}}\PY{p}{)}
\PY{n+nf}{print}\PY{p}{(}\PY{n}{A}\PY{p}{)}

\PY{n+nf}{print}\PY{p}{(}\PY{l+s}{\PYZdq{}}\PY{l+s}{Vector v\PYZdq{}}\PY{p}{)}
\PY{n+nf}{print}\PY{p}{(}\PY{n}{v}\PY{p}{)}

\PY{n+nf}{print}\PY{p}{(}\PY{l+s}{\PYZdq{}}\PY{l+s}{Av\PYZdq{}}\PY{p}{)}
\PY{n}{product} \PY{o}{=} \PY{n}{A}\PY{o}{\PYZpc{}*\PYZpc{}}\PY{n}{v}
\PY{n+nf}{print}\PY{p}{(}\PY{n}{product}\PY{p}{)}
```
:::

``` {}
[1] "Matrix A"
     [,1] [,2]
[1,]    1    2
[2,]    3    4
[3,]    5    6
[1] "Vector v"
[1]  4 -3
[1] "Av"
     [,1]
[1,]   -2
[2,]    0
[3,]    2
```

#### Matrix Transpose
Given a matrix $M$, the **tranpose** of $M$, $M^{'}$ or $M^{T}$, is a matrix where the first row of $M^{'}$ corresponds to the first column of $M$, the second row of $M^{'}$ corresponds to the second columns of $M$ and so on. If $M$ has dimension $(r,c)$ than $M^{'}$ has dimensions $(c,r)$.

For example, if $$\begin{aligned}
    M = \left [ \begin{matrix}
            1 & 2 & 3 \\
            4 & 5 & 6 \\
            3 & 2 & 13 \\
            90 & 23 & 0 \\
         \end{matrix} \right ]
\end{aligned}$$ then the tranpose of $M$, $$\begin{aligned}
    M^{'} = \left [ \begin{matrix}
            1 & 4 & 3 & 90 \\
            2 & 5 & 2 & 23 \\ 
            3 &  6 &  13 & 0 \\
         \end{matrix} \right ]   
\end{aligned}$$

We can use the `t()` operator to transpose a matrix in R.

::: tcolorbox
``` {}
\PY{n}{M} \PY{o}{=} \PY{n+nf}{matrix}\PY{p}{(}\PY{n+nf}{c}\PY{p}{(} \PY{l+m}{1}\PY{p}{,}\PY{l+m}{2}\PY{p}{,}\PY{l+m}{3}\PY{p}{,}\PY{l+m}{4}\PY{p}{,}\PY{l+m}{5}\PY{p}{,}\PY{l+m}{6}\PY{p}{,}\PY{l+m}{3}\PY{p}{,}\PY{l+m}{2}\PY{p}{,}\PY{l+m}{13}\PY{p}{,}\PY{l+m}{90}\PY{p}{,}\PY{l+m}{23}\PY{p}{,}\PY{l+m}{0}\PY{p}{)}\PY{p}{,}\PY{n}{ncol}\PY{o}{=}\PY{l+m}{3}\PY{p}{,}\PY{n}{byrow}\PY{o}{=}\PY{k+kc}{TRUE}\PY{p}{)}

\PY{n+nf}{print}\PY{p}{(}\PY{l+s}{\PYZdq{}}\PY{l+s}{The matrix M\PYZdq{}}\PY{p}{)}
\PY{n+nf}{print}\PY{p}{(}\PY{n}{M}\PY{p}{)}

\PY{n+nf}{print}\PY{p}{(}\PY{l+s}{\PYZdq{}}\PY{l+s}{The transpose\PYZdq{}}\PY{p}{)}
\PY{n}{Mt} \PY{o}{=} \PY{n+nf}{t}\PY{p}{(}\PY{n}{M}\PY{p}{)}

\PY{n+nf}{print}\PY{p}{(}\PY{n}{Mt}\PY{p}{)}
```
:::

``` {}
[1] "The matrix M"
     [,1] [,2] [,3]
[1,]    1    2    3
[2,]    4    5    6
[3,]    3    2   13
[4,]   90   23    0
[1] "The transpose"
     [,1] [,2] [,3] [,4]
[1,]    1    4    3   90
[2,]    2    5    2   23
[3,]    3    6   13    0
```

#### Matrix inverse
For a super fun overview of matrix multiplication and the concept of identities and inverses, click [here](https://www.youtube.com/watch?v=vTtx-mC61Tw)!

##### The identity matrix
The **identity matrix** of dimension $r$, usually labled $I_{r}$, is a matrix with $r$ rows and $r$ columns such that the diagonal elements of the matrix, the (1,1) entry, (2,2) entry, up to (r,r) entry are the number 1 and all other entries are 0. For example,

$$\begin{aligned}
    I_{2} = \left [ \begin{matrix}
                        1 & 0 \\ 
                        0 & 1 \\
                     \end{matrix}
             \right ] 
\end{aligned}$$ This matrix is called the identity matrix because any matrix $A$ times $I$ returns $A$. To be more precise, this matrix is the *multiplicative* identity matrix. But the adjective *multiplicative* is usually dropped.

##### The inverse matrix
The **inverse** of a matrix $A$---$A^{-1}$---is a matrix such that, if $A$ has the same number of rows and columns (called square) then $$\begin{aligned}
    A A^{-1} = A^{-1}A = I
\end{aligned}$$

The idea of a matrix inverse is the same as in algebra. If we have a variable $a$ then the inverse of $a$, called $a^{-1}$ is the unique number such that $$a \cdot a^{-1} = a^{-1} \cdot a = 1.$$

In matrix algebra, the identity matrix takes the place of the "1" in algebra.

We can compute the inverse of a matrix $A$ in R using the `solve` function.

::: tcolorbox
``` {}
\PY{n}{A} \PY{o}{=} \PY{n+nf}{matrix}\PY{p}{(}\PY{n+nf}{c}\PY{p}{(}\PY{l+m}{3}\PY{p}{,}\PY{l+m}{4}\PY{p}{,}\PY{l+m}{5}\PY{p}{,}\PY{l+m}{6}\PY{p}{)}\PY{p}{,}\PY{n}{ncol}\PY{o}{=}\PY{l+m}{2}\PY{p}{)}

\PY{n+nf}{print}\PY{p}{(}\PY{l+s}{\PYZdq{}}\PY{l+s}{A\PYZdq{}}\PY{p}{)}
\PY{n+nf}{print}\PY{p}{(}\PY{n}{A}\PY{p}{)}

\PY{n+nf}{print}\PY{p}{(}\PY{l+s}{\PYZdq{}}\PY{l+s}{A inverse\PYZdq{}}\PY{p}{)}
\PY{n}{Ainverse} \PY{o}{=} \PY{n+nf}{solve}\PY{p}{(}\PY{n}{A}\PY{p}{)}
\PY{n+nf}{print}\PY{p}{(}\PY{n}{Ainverse}\PY{p}{)}
```
:::

``` {}
[1] "A"
     [,1] [,2]
[1,]    3    5
[2,]    4    6
[1] "A inverse"
     [,1] [,2]
[1,]   -3  2.5
[2,]    2 -1.5
```

### Assignment
1.  Define the vector v of length 3 with the following numbers: -1,0,1

2.  Define the matrix A with dimension (2,3) by filling, column wise, the values: 1,2,3,4,5,6

3.  Multiply A by v (Av)

4.  Multiply v by A (vA). Why does R return an error?

5.  Write a function that takes two argument which are both matrices and returns the product of these matrices.
