---
title: Laboratory 03
---

# Laboratory 03

### Functions
Functions in R are used to organize our work, clarify code for others, and allows us to apply the same finite steps to many different objects.

**Example:** Suppose we want to use the frequentist approach to assign probabilities to a sample space $\mathcal{G} = \{-1,0,1\}$ based on a dataset $\mathcal{D}$. Our dataset may look like $\mathcal{D} = (-1,0,0,1,-1,1,1,1,-1)$. To assign a probability to the event $\{-1\}$ we can write R code to count the number of times the outcome $-1$ appears in our data and divide by the number of data points in our data set. For the event $\{0\}$ we can write R code to perform the *same steps* for 0 as we performed for the event $\{-1\}$. Because we are repeating the same steps for the event $\{-1\}$ and for event $\{0\}$, a function may simplify our code.

**Example:** We are asked to support a clinical team that collected data on patients who are current smokers and outcomes thought to be linked to smoking. The code needs (i) to be processed, (ii) analyzed, and (iii) reported. Though we can write our code in sequence to perform all three steps, we may be able to better organize our work into three functions: one that processes the data, a function that analyses the data, and a third to report.

#### Anatomy of a function
A function in R has the following X parts:

- *Assignment:* We create a function by assigning a variable name to the function

- *Function* : Next we need to use the reserved word "function" so that R knows we are creating a function.

- *Arguments*: After the workd function we will include open and closed parentheses. Inside these parentheses we can include one or more arguments for the function. An argument is an input to our function.

- *Code block*: We write a sequence of steps to execute R code inside two curly brackets {}. **Important: Any variables that were created inside this code block are deleted after the function is finished.**

- *Return*: Inside the code block we can also include a return statement. This statement includes variables that were generated inside the code block that we wish to keep when the function is finished executing.

#### Declaring a function
When store a function in memory, we call this **declaring a function**.

Lets declare a function called `sum_two_numbers`. This function will have two arguments: one called `x` and one called `y`. Arguments are names that we use to identify specific inputs to our function---they are placeholders for variables outside of our function that we may want to use as inputs. In the code block we will write a line of code that stores the sum of `x` and `y` as the variable `z`. The second line in the code block will `return(z)`. Because we did not return `x` or `y` they will be deleted from memory after the function is finished executing.

::: tcolorbox
``` {}
\PY{n}{sum\PYZus{}two\PYZus{}numbers} \PY{o}{=} \PY{n+nf}{function}\PY{p}{(}\PY{n}{x}\PY{p}{,}\PY{n}{y}\PY{p}{)}\PY{p}{\PYZob{}}
    \PY{n}{z} \PY{o}{=} \PY{n}{x}\PY{o}{+}\PY{n}{y}      \PY{c+c1}{\PYZsh{} line of code in the code block. This uses our x,y arguments (place holders)}
    \PY{n+nf}{return}\PY{p}{(}\PY{n}{z}\PY{p}{)}    \PY{c+c1}{\PYZsh{} Return the variable z }
\PY{p}{\PYZcb{}}
```
:::

#### Calling a function
When we declare a function it is stored in memory. If we want to apply our function to a set of arguments (inputs) then we **call** our function.

Lets call our function `sum_to_numbers` with the arguments 2 and 4.

::: tcolorbox
``` {}
\PY{n}{result} \PY{o}{=} \PY{n+nf}{sum\PYZus{}two\PYZus{}numbers}\PY{p}{(}\PY{l+m}{2}\PY{p}{,}\PY{l+m}{4}\PY{p}{)}
```
:::

We **called** our function by typing the name of the function and supplying the function with two arguments: 2 and 4. When we called the function, the following took place. 1. The variable `x` was assigned the value 2. 2. the variable `y` was assigned the value 4. 3. The first line of the code block was executed. 4. The second line of the code block was executed, returning the variable `z`. 5. The returned variable (`z`) was stored in the variable `result`.

Watch

::: tcolorbox
``` {}
\PY{n+nf}{print}\PY{p}{(}\PY{n}{result}\PY{p}{)}
```
:::

``` {}
[1] 6
```

#### Named vs unnamed arguments
When we input our argument 2 and 4 into the function `sum_to_numbers` we did not specify which value should be assigned to the argument `x` and which should be assigned to `y`. When we do not specify the argument names we are proving a function **unnamed arguments**.

We could have called the function `sum_to_numbers` by specifying which arguments correspond to which values. When we supply a name and the value to the argument we are providing **named arguments**.

::: tcolorbox
``` {}
\PY{n+nf}{sum\PYZus{}to\PYZus{}numbers}\PY{p}{(}\PY{n}{y}\PY{o}{=}\PY{l+m}{2}\PY{p}{,}\PY{n}{x}\PY{o}{=}\PY{l+m}{4}\PY{p}{)} \PY{c+c1}{\PYZsh{} named arguments}
```
:::

6

#### Default arguments
When we declare a function we specify which arguments are needed for the function to execute all the lines in the coded block. We expect all these arguments to have values, but there may be a time when we do not necessarily need someone who uses our function to specify all the arguments. Instead, we can provide **default** argument values.

Lets create a function called `sumMult` that takes as input a vector that we will assign the name `v` and a logical value called `sum_or_mult`. If the value of `sum_or_mult` is TRUE then we will add all the items in the vector. If the value of `sum_or_mult` is FALSE then we will multiply all the values.

By default, we will add all the items. This means that is the user does not supply a value for the argument `sum_or_mult` then we automatically assign to `sum_or_mult` the value TRUE. To give the function `sumMult` a default value for the argument `sumMult` we will include after `sum_or_mult` an equals sign and our desired default value.

::: tcolorbox
``` {}
\PY{n}{sumMult} \PY{o}{=} \PY{n+nf}{function}\PY{p}{(}\PY{n}{v}\PY{p}{,}\PY{n}{sum\PYZus{}or\PYZus{}mult}\PY{o}{=}\PY{k+kc}{TRUE}\PY{p}{)}\PY{p}{\PYZob{}} \PY{c+c1}{\PYZsh{} This assigns the sum\PYZus{}or\PYZus{}mult a default value of TRUE}
    
    \PY{c+c1}{\PYZsh{}\PYZsh{} if sum\PYZus{}or\PYZus{}mult is TRUE, we sum. if sum\PYZus{}or\PYZus{}mult is FALSE, we multiply}
    \PY{n+nf}{if }\PY{p}{(}\PY{n}{sum\PYZus{}or\PYZus{}mult}\PY{o}{==}\PY{k+kc}{TRUE}\PY{p}{)}\PY{p}{\PYZob{}}
        \PY{n}{summation}\PY{o}{=}\PY{l+m}{0}
        \PY{n+nf}{for }\PY{p}{(}\PY{n}{item} \PY{n}{in} \PY{l+m}{1}\PY{o}{:}\PY{n+nf}{length}\PY{p}{(}\PY{n}{v}\PY{p}{)}\PY{p}{)}\PY{p}{\PYZob{}}
            \PY{n}{summation} \PY{o}{=} \PY{n}{summation} \PY{o}{+} \PY{n}{item}
        \PY{p}{\PYZcb{}}
        \PY{n+nf}{return}\PY{p}{(}\PY{n}{summation}\PY{p}{)}
    \PY{p}{\PYZcb{}}
    \PY{n}{else}\PY{p}{\PYZob{}}
        \PY{n}{product} \PY{o}{=} \PY{l+m}{1}
        \PY{n+nf}{for }\PY{p}{(}\PY{n}{item} \PY{n}{in} \PY{l+m}{1}\PY{o}{:}\PY{n+nf}{length}\PY{p}{(}\PY{n}{v}\PY{p}{)}\PY{p}{)}\PY{p}{\PYZob{}}
            \PY{n}{product} \PY{o}{=} \PY{n}{product} \PY{o}{*} \PY{n}{item}
        \PY{p}{\PYZcb{}}
        \PY{n+nf}{return}\PY{p}{(}\PY{n}{product}\PY{p}{)}
    \PY{p}{\PYZcb{}}
\PY{p}{\PYZcb{}}
```
:::

Lets create a vector called `fun_vector` and assign to it `c(4,2,-2,9,10,11,-0.3)` and lets call the function `sumMult`.

::: tcolorbox
``` {}
\PY{n}{fun\PYZus{}vector} \PY{o}{=} \PY{n+nf}{c}\PY{p}{(}\PY{l+m}{4}\PY{p}{,}\PY{l+m}{2}\PY{p}{,}\PY{l+m}{\PYZhy{}2}\PY{p}{,}\PY{l+m}{9}\PY{p}{,}\PY{l+m}{10}\PY{p}{,}\PY{l+m}{11}\PY{p}{,}\PY{l+m}{\PYZhy{}0.3}\PY{p}{)}

\PY{n}{result1} \PY{o}{=} \PY{n+nf}{sumMult}\PY{p}{(}\PY{n}{fun\PYZus{}vector}\PY{p}{)}                  \PY{c+c1}{\PYZsh{} Default for sum\PYZus{}or\PYZus{}mult is TRUE}

\PY{n}{result2} \PY{o}{=} \PY{n+nf}{sumMult}\PY{p}{(}\PY{n}{fun\PYZus{}vector}\PY{p}{,}\PY{n}{sum\PYZus{}or\PYZus{}mult}\PY{o}{=}\PY{k+kc}{TRUE}\PY{p}{)} \PY{c+c1}{\PYZsh{} We are always allowed to assign this argument a value }

\PY{n}{result3} \PY{o}{=} \PY{n+nf}{sumMult}\PY{p}{(}\PY{n}{fun\PYZus{}vector}\PY{p}{,}\PY{n}{sum\PYZus{}or\PYZus{}mult}\PY{o}{=}\PY{k+kc}{FALSE}\PY{p}{)} \PY{c+c1}{\PYZsh{} and we can assign this argument a different value then the default}
```
:::

::: tcolorbox
``` {}
\PY{n+nf}{print}\PY{p}{(}\PY{n}{result1}\PY{p}{)}
\PY{n+nf}{print}\PY{p}{(}\PY{n}{result2}\PY{p}{)}
\PY{n+nf}{print}\PY{p}{(}\PY{n}{result3}\PY{p}{)}
```
:::

``` {}
[1] 28
[1] 28
[1] 5040
```

#### Binding and Scope
To show that the variables summation and product are deleted after we call the function, lets try to print the variable `summation`.

::: tcolorbox
``` {}
\PY{n+nf}{print}\PY{p}{(}\PY{n}{summation}\PY{p}{)}
```
:::

``` { frame="single" framerule="2mm" rulecolor="\\color{outerrorbackground}"}
Error in print(summation): object 'summation' not found
Traceback:

1. print(summation)
```

R replies that it looked but cannot find the object summation. The function `sumMult` created a variable called `summation` operated with it inside the code block of our function and then deleted this variable.

When a variable name is assigned an object in R, the name and the object are associated with one another in the computer. The process of associating an object to a name in the computer is called **binding**.

When we call a function, the values we provide are bound to each argument name, the function is executed, and those variables are deleted. Which variables we can access during the executing of an R program is called **lexical scope**. Varables created inside a function can only be accessed and used by lines of code inside the code block. These variables are "in scope" of the function.

#### Assignment
Lets explore how functions can help us organize our work, clarify code for others, and repeat similar operations on objects of the same type.

##### Unnamed and named arguments
1.  Declare a function `subtract` that takes two arguments: `x` and `y`. Inside the code block assign the variable `z` to be `x` minus `y` and return the variable `z`.

2.  Call the function `subtract` on the values 2 and 6.

3.  Call the function `subtract` on the values 2 and 6 but bind 2 to the argument `y` and 6 to the argument `x`.

4.  Why did the results for 2. and for 3. change?

##### Successive subtraction
1.  Declare a function `vec_subtract` that takes a vector argument that we will bind to `v`. Inside the code block compute the first item minus the second item minus the third item and so on. Store this subtarction in the variable `s` and return the variable `s`.

2.  Call the function on the vector \[1,2,3,4,5\]

##### Frequentist approach to probability assignment
1.  Run the code below called `random_vector`. This is a function that creates a vector of length 1000 filled with numbers between 0 and 1. The second line calls the function with no arguments and creates a variable called `rand_vec`.

2.  Declare a function `freq_assign` that takes two arguments: `v` and `outcome`.

3.  Inside the code block perform the following operations

4.  Use the `length` function (pre-built by R) to compute the length of `v` and store this value in the variable `N`.

5.  Create a variable called `outcome_of_interest` and assign to it an empty vector `c()`.

6.  Create a for loop that iterates the variable `i` from the value 1 to the value `N`.

7.  Inside the for loop use an if/else to identify if each item in `v` is less than or equal to `outcome`. If the item is less than or equal to `outcome` then append the value 1 to `outcome_of_interest` else append the value 0. We should expect a vector `outcome_of_interest` that is the same length as `v` which contains 1s for every value less than outcome and 0s otherwise.

8.  Use the sum function in R (pre-built) to compute the sum of `outcome_of_interest` and assign this value the name `count`

9.  return `count/N`

10. Call the function on `rand_vec` and record the result. Use $0.5$ as the input value for `outcome`.

::: tcolorbox
``` {}
\PY{n}{random\PYZus{}vector} \PY{o}{=} \PY{n+nf}{function}\PY{p}{(}\PY{n}{N}\PY{o}{=}\PY{l+m}{1000}\PY{p}{)}\PY{p}{\PYZob{}}
    \PY{n+nf}{return}\PY{p}{(}\PY{n+nf}{runif}\PY{p}{(}\PY{n}{N}\PY{p}{)}\PY{p}{)}
\PY{p}{\PYZcb{}}
\PY{n}{rand\PYZus{}vec} \PY{o}{=} \PY{n+nf}{random\PYZus{}vector}\PY{p}{(}\PY{p}{)}
```
:::
