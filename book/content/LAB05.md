---
title: Laboratory 05
---

# Laboratory 05

### Data Frame
We learned in lecture that a dataframe is a specific way to organize data points sampled from a sample space $\mathcal{G}$. A dataframe supposes a dataset $\mathcal{D} = ( d_{1},d_{2},\cdots,d_{N})$ should be organized so that each row is a single outcome $d_{i}$ and each column is a position in the tuple $d_{i} = ( x,y,z,... )$

The dataframe is a common way computational scientists think about data.

#### How to read a CSV file into a data frame
The function `read.csv` takes as an argument a string that indicates a file on your local computer OR a URL online. Below the `read.csv` function is used to import into memory a **dataframe** related to bad drivers from the statsitcal news outlet called *FiveThirtyEight*.

The news article is here https://fivethirtyeight.com/features/which-state-has-the-worst-drivers/

::: tcolorbox
``` {}
\PY{n}{d} \PY{o}{=} \PY{n+nf}{read.csv}\PY{p}{(}\PY{l+s}{\PYZdq{}}\PY{l+s}{https://raw.githubusercontent.com/fivethirtyeight/data/master/bad\PYZhy{}drivers/bad\PYZhy{}drivers.csv\PYZdq{}}\PY{p}{)}
\PY{n}{d} \PY{c+c1}{\PYZsh{} Jupyter will by default print any variable}
```
:::

A data.frame: 51 × 8

  ---------------------- ------------------------------------------------------------------ ---------------------------------------------------------------------- ------------------------------------------------------------------------------ ---------------------------------------------------------------------------- -------------------------------------------------------------------------------------------------------- ----------------------------- -------------------------------------------------------------------------------
  State                  Number.of.drivers.involved.in.fatal.collisions.per.billion.miles   Percentage.Of.Drivers.Involved.In.Fatal.Collisions.Who.Were.Speeding   Percentage.Of.Drivers.Involved.In.Fatal.Collisions.Who.Were.Alcohol.Impaired   Percentage.Of.Drivers.Involved.In.Fatal.Collisions.Who.Were.Not.Distracted   Percentage.Of.Drivers.Involved.In.Fatal.Collisions.Who.Had.Not.Been.Involved.In.Any.Previous.Accidents   Car.Insurance.Premiums\....   Losses.incurred.by.insurance.companies.for.collisions.per.insured.driver\....
  \<chr\>                \<dbl\>                                                            \<int\>                                                                \<int\>                                                                        \<int\>                                                                      \<int\>                                                                                                  \<dbl\>                       \<dbl\>
  Alabama                18.8                                                               39                                                                     30                                                                             96                                                                           80                                                                                                       784.55                        145.08
  Alaska                 18.1                                                               41                                                                     25                                                                             90                                                                           94                                                                                                       1053.48                       133.93
  Arizona                18.6                                                               35                                                                     28                                                                             84                                                                           96                                                                                                       899.47                        110.35
  Arkansas               22.4                                                               18                                                                     26                                                                             94                                                                           95                                                                                                       827.34                        142.39
  California             12.0                                                               35                                                                     28                                                                             91                                                                           89                                                                                                       878.41                        165.63
  Colorado               13.6                                                               37                                                                     28                                                                             79                                                                           95                                                                                                       835.50                        139.91
  Connecticut            10.8                                                               46                                                                     36                                                                             87                                                                           82                                                                                                       1068.73                       167.02
  Delaware               16.2                                                               38                                                                     30                                                                             87                                                                           99                                                                                                       1137.87                       151.48
  District of Columbia   5.9                                                                34                                                                     27                                                                             100                                                                          100                                                                                                      1273.89                       136.05
  Florida                17.9                                                               21                                                                     29                                                                             92                                                                           94                                                                                                       1160.13                       144.18
  Georgia                15.6                                                               19                                                                     25                                                                             95                                                                           93                                                                                                       913.15                        142.80
  Hawaii                 17.5                                                               54                                                                     41                                                                             82                                                                           87                                                                                                       861.18                        120.92
  Idaho                  15.3                                                               36                                                                     29                                                                             85                                                                           98                                                                                                       641.96                        82.75
  Illinois               12.8                                                               36                                                                     34                                                                             94                                                                           96                                                                                                       803.11                        139.15
  Indiana                14.5                                                               25                                                                     29                                                                             95                                                                           95                                                                                                       710.46                        108.92
  Iowa                   15.7                                                               17                                                                     25                                                                             97                                                                           87                                                                                                       649.06                        114.47
  Kansas                 17.8                                                               27                                                                     24                                                                             77                                                                           85                                                                                                       780.45                        133.80
  Kentucky               21.4                                                               19                                                                     23                                                                             78                                                                           76                                                                                                       872.51                        137.13
  Louisiana              20.5                                                               35                                                                     33                                                                             73                                                                           98                                                                                                       1281.55                       194.78
  Maine                  15.1                                                               38                                                                     30                                                                             87                                                                           84                                                                                                       661.88                        96.57
  Maryland               12.5                                                               34                                                                     32                                                                             71                                                                           99                                                                                                       1048.78                       192.70
  Massachusetts          8.2                                                                23                                                                     35                                                                             87                                                                           80                                                                                                       1011.14                       135.63
  Michigan               14.1                                                               24                                                                     28                                                                             95                                                                           77                                                                                                       1110.61                       152.26
  Minnesota              9.6                                                                23                                                                     29                                                                             88                                                                           88                                                                                                       777.18                        133.35
  Mississippi            17.6                                                               15                                                                     31                                                                             10                                                                           100                                                                                                      896.07                        155.77
  Missouri               16.1                                                               43                                                                     34                                                                             92                                                                           84                                                                                                       790.32                        144.45
  Montana                21.4                                                               39                                                                     44                                                                             84                                                                           85                                                                                                       816.21                        85.15
  Nebraska               14.9                                                               13                                                                     35                                                                             93                                                                           90                                                                                                       732.28                        114.82
  Nevada                 14.7                                                               37                                                                     32                                                                             95                                                                           99                                                                                                       1029.87                       138.71
  New Hampshire          11.6                                                               35                                                                     30                                                                             87                                                                           83                                                                                                       746.54                        120.21
  New Jersey             11.2                                                               16                                                                     28                                                                             86                                                                           78                                                                                                       1301.52                       159.85
  New Mexico             18.4                                                               19                                                                     27                                                                             67                                                                           98                                                                                                       869.85                        120.75
  New York               12.3                                                               32                                                                     29                                                                             88                                                                           80                                                                                                       1234.31                       150.01
  North Carolina         16.8                                                               39                                                                     31                                                                             94                                                                           81                                                                                                       708.24                        127.82
  North Dakota           23.9                                                               23                                                                     42                                                                             99                                                                           86                                                                                                       688.75                        109.72
  Ohio                   14.1                                                               28                                                                     34                                                                             99                                                                           82                                                                                                       697.73                        133.52
  Oklahoma               19.9                                                               32                                                                     29                                                                             92                                                                           94                                                                                                       881.51                        178.86
  Oregon                 12.8                                                               33                                                                     26                                                                             67                                                                           90                                                                                                       804.71                        104.61
  Pennsylvania           18.2                                                               50                                                                     31                                                                             96                                                                           88                                                                                                       905.99                        153.86
  Rhode Island           11.1                                                               34                                                                     38                                                                             92                                                                           79                                                                                                       1148.99                       148.58
  South Carolina         23.9                                                               38                                                                     41                                                                             96                                                                           81                                                                                                       858.97                        116.29
  South Dakota           19.4                                                               31                                                                     33                                                                             98                                                                           86                                                                                                       669.31                        96.87
  Tennessee              19.5                                                               21                                                                     29                                                                             82                                                                           81                                                                                                       767.91                        155.57
  Texas                  19.4                                                               40                                                                     38                                                                             91                                                                           87                                                                                                       1004.75                       156.83
  Utah                   11.3                                                               43                                                                     16                                                                             88                                                                           96                                                                                                       809.38                        109.48
  Vermont                13.6                                                               30                                                                     30                                                                             96                                                                           95                                                                                                       716.20                        109.61
  Virginia               12.7                                                               19                                                                     27                                                                             87                                                                           88                                                                                                       768.95                        153.72
  Washington             10.6                                                               42                                                                     33                                                                             82                                                                           86                                                                                                       890.03                        111.62
  West Virginia          23.8                                                               34                                                                     28                                                                             97                                                                           87                                                                                                       992.61                        152.56
  Wisconsin              13.8                                                               36                                                                     33                                                                             39                                                                           84                                                                                                       670.31                        106.62
  Wyoming                17.4                                                               42                                                                     32                                                                             81                                                                           90                                                                                                       791.14                        122.04
  ---------------------- ------------------------------------------------------------------ ---------------------------------------------------------------------- ------------------------------------------------------------------------------ ---------------------------------------------------------------------------- -------------------------------------------------------------------------------------------------------- ----------------------------- -------------------------------------------------------------------------------

#### Selecting a column and the \$ operator
With a dataframe you can select rows by asking R to return the number column where the first column in the dataframe is 1, the second column 2, and so on. You can also ask R to return a column of your dataframe by column name.

The 3rd column of the dataframe that we read records, by state, the percentage of fatal collision that involved a driver who was impaired by alcohol.

We can ask R for the 3rd column by using square brackets in the same way that we used square brackets to select rows and columns of matrices.

::: tcolorbox
``` {}
\PY{n}{d}\PY{p}{[}\PY{p}{,}\PY{l+m}{3}\PY{p}{]}
```
:::

::: enumerate*
39

41

35

18

35

37

46

38

34

21

19

54

36

36

25

17

27

19

35

38

34

23

24

23

15

43

39

13

37

35

16

19

32

39

23

28

32

33

50

34

38

31

21

40

43

30

19

42

34

36

42
:::

We can request a column from a dataframe by asking for 1. The dataframe 2. square brackets Inside the square brackets you divide the rows you want selected and the columns you want selected by a comma.

For example, if we wanted to look at the 10th row and 3rd column we can write

::: tcolorbox
``` {}
\PY{n}{d}\PY{p}{[}\PY{l+m}{10}\PY{p}{,}\PY{l+m}{3}\PY{p}{]}
```
:::

21

If instead we wanted to view rows 10,11,12 and columns 3 and 4 we could write

::: tcolorbox
``` {}
\PY{n}{d}\PY{p}{[} \PY{l+m}{10}\PY{o}{:}\PY{l+m}{12}\PY{p}{,} \PY{n+nf}{c}\PY{p}{(}\PY{l+m}{3}\PY{p}{,}\PY{l+m}{4}\PY{p}{)}  \PY{p}{]}
```
:::

A data.frame: 3 × 2

  ---- ---------------------------------------------------------------------- ------------------------------------------------------------------------------
       Percentage.Of.Drivers.Involved.In.Fatal.Collisions.Who.Were.Speeding   Percentage.Of.Drivers.Involved.In.Fatal.Collisions.Who.Were.Alcohol.Impaired
       \<int\>                                                                \<int\>
    10 21                                                                     29
    11 19                                                                     25
    12 54                                                                     41
  ---- ---------------------------------------------------------------------- ------------------------------------------------------------------------------

The above examples select columns and rows by number. One advantage of a dataframe is that we can select columns **by name**.

For example, we may be interested in rows 10-12 of the column "Percentage.Of.Drivers.Involved.In.Fatal.Collisions.Who.Were.Speeding"

::: tcolorbox
``` {}
\PY{n}{d}\PY{p}{[}\PY{l+m}{10}\PY{o}{:}\PY{l+m}{12}\PY{p}{,}\PY{l+s}{\PYZdq{}}\PY{l+s}{Percentage.Of.Drivers.Involved.In.Fatal.Collisions.Who.Were.Speeding\PYZdq{}}\PY{p}{]}
```
:::

::: enumerate*
21

19

54
:::

We can ask for **all** rows that correspond to a column by leaving the entry to the left of the comma blank.

::: tcolorbox
``` {}
\PY{n}{d}\PY{p}{[}\PY{p}{,}\PY{l+s}{\PYZdq{}}\PY{l+s}{Percentage.Of.Drivers.Involved.In.Fatal.Collisions.Who.Were.Speeding\PYZdq{}}\PY{p}{]}
```
:::

::: enumerate*
39

41

35

18

35

37

46

38

34

21

19

54

36

36

25

17

27

19

35

38

34

23

24

23

15

43

39

13

37

35

16

19

32

39

23

28

32

33

50

34

38

31

21

40

43

30

19

42

34

36

42
:::

Finally, there is a shorthand for the code `d``[``,"Percentage.Of.Drivers.Involved.In.Fatal.Collisions.Who.Were.Speeding"``]` using the dollarsign operator. The dollar sign operator can be thought of as a function that takes a column name as input and returns the column of data inside your data frame corresponding to that column.

::: tcolorbox
``` {}
\PY{n}{d}\PY{o}{\PYZdl{}}\PY{n}{Percentage.Of.Drivers.Involved.In.Fatal.Collisions.Who.Were.Speeding}
```
:::

``` {}
NULL
```

#### Logical indexing
We are allowed to use logical indexing like we learned when selecting items in vectors and matrices to select rows and columns of a data frame. For example, suppose we are interested in **all** columns of our data frame where the Percentage Of Drivers Involved In Fatal Collisions Who Were Speeding is above 40%.

::: tcolorbox
``` {}
\PY{n}{d}\PY{p}{[} \PY{n}{d}\PY{o}{\PYZdl{}} \PY{l+s}{\PYZdq{}}\PY{l+s}{Percentage.Of.Drivers.Involved.In.Fatal.Collisions.Who.Were.Speeding\PYZdq{}} \PY{o}{\PYZgt{}} \PY{l+m}{40}\PY{p}{,} \PY{p}{]}
```
:::

A data.frame: 8 × 8

  ---- -------------- ------------------------------------------------------------------ ---------------------------------------------------------------------- ------------------------------------------------------------------------------ ---------------------------------------------------------------------------- -------------------------------------------------------------------------------------------------------- ----------------------------- -------------------------------------------------------------------------------
       State          Number.of.drivers.involved.in.fatal.collisions.per.billion.miles   Percentage.Of.Drivers.Involved.In.Fatal.Collisions.Who.Were.Speeding   Percentage.Of.Drivers.Involved.In.Fatal.Collisions.Who.Were.Alcohol.Impaired   Percentage.Of.Drivers.Involved.In.Fatal.Collisions.Who.Were.Not.Distracted   Percentage.Of.Drivers.Involved.In.Fatal.Collisions.Who.Had.Not.Been.Involved.In.Any.Previous.Accidents   Car.Insurance.Premiums\....   Losses.incurred.by.insurance.companies.for.collisions.per.insured.driver\....
       \<chr\>        \<dbl\>                                                            \<int\>                                                                \<int\>                                                                        \<int\>                                                                      \<int\>                                                                                                  \<dbl\>                       \<dbl\>
     2 Alaska         18.1                                                               41                                                                     25                                                                             90                                                                           94                                                                                                       1053.48                       133.93
     7 Connecticut    10.8                                                               46                                                                     36                                                                             87                                                                           82                                                                                                       1068.73                       167.02
    12 Hawaii         17.5                                                               54                                                                     41                                                                             82                                                                           87                                                                                                       861.18                        120.92
    26 Missouri       16.1                                                               43                                                                     34                                                                             92                                                                           84                                                                                                       790.32                        144.45
    39 Pennsylvania   18.2                                                               50                                                                     31                                                                             96                                                                           88                                                                                                       905.99                        153.86
    45 Utah           11.3                                                               43                                                                     16                                                                             88                                                                           96                                                                                                       809.38                        109.48
    48 Washington     10.6                                                               42                                                                     33                                                                             82                                                                           86                                                                                                       890.03                        111.62
    51 Wyoming        17.4                                                               42                                                                     32                                                                             81                                                                           90                                                                                                       791.14                        122.04
  ---- -------------- ------------------------------------------------------------------ ---------------------------------------------------------------------- ------------------------------------------------------------------------------ ---------------------------------------------------------------------------- -------------------------------------------------------------------------------------------------------- ----------------------------- -------------------------------------------------------------------------------

or maybe we are interested in not all columns, but just the states where this percentage is above 40%. We can subset to a specific column by including in square brackets the name of the column

::: tcolorbox
``` {}
\PY{n}{d}\PY{p}{[} \PY{n}{d}\PY{o}{\PYZdl{}} \PY{l+s}{\PYZdq{}}\PY{l+s}{Percentage.Of.Drivers.Involved.In.Fatal.Collisions.Who.Were.Speeding\PYZdq{}} \PY{o}{\PYZgt{}} \PY{l+m}{40}\PY{p}{,} \PY{l+s}{\PYZdq{}}\PY{l+s}{State\PYZdq{}} \PY{p}{]}
```
:::

::: enumerate*
'Alaska'

'Connecticut'

'Hawaii'

'Missouri'

'Pennsylvania'

'Utah'

'Washington'

'Wyoming'
:::

If we wanted to include more than one column then we can include a vector that contains each column we want to select.

::: tcolorbox
``` {}
\PY{n}{d}\PY{p}{[} \PY{n}{d}\PY{o}{\PYZdl{}}\PY{l+s}{\PYZdq{}}\PY{l+s}{Percentage.Of.Drivers.Involved.In.Fatal.Collisions.Who.Were.Speeding\PYZdq{}} \PY{o}{\PYZgt{}} \PY{l+m}{40}\PY{p}{,} \PY{n+nf}{c}\PY{p}{(}\PY{l+s}{\PYZdq{}}\PY{l+s}{State\PYZdq{}}\PY{p}{,}\PY{l+s}{\PYZdq{}}\PY{l+s}{Car.Insurance.Premiums....\PYZdq{}}\PY{p}{)} \PY{p}{]}
```
:::

A data.frame: 8 × 2

  ---- -------------- -----------------------------
       State          Car.Insurance.Premiums\....
       \<chr\>        \<dbl\>
     2 Alaska         1053.48
     7 Connecticut    1068.73
    12 Hawaii         861.18
    26 Missouri       790.32
    39 Pennsylvania   905.99
    45 Utah           809.38
    48 Washington     890.03
    51 Wyoming        791.14
  ---- -------------- -----------------------------

#### Functions for data frames
There are several useful functions that take as an argument a data frame. The `nrow` function takes a data frame as an argument and returns the number of rows (i.e. the number of data points) in the data frame. The `ncol` function takes a data frame as an argument and returns the number of columns in the data frame.

::: tcolorbox
``` {}
\PY{n}{number\PYZus{}of\PYZus{}rows} \PY{o}{=} \PY{n+nf}{nrow}\PY{p}{(}\PY{n}{d}\PY{p}{)}
\PY{n}{number\PYZus{}of\PYZus{}columns} \PY{o}{=} \PY{n+nf}{ncol}\PY{p}{(}\PY{n}{d}\PY{p}{)}

\PY{n+nf}{print}\PY{p}{(}\PY{n}{number\PYZus{}of\PYZus{}rows}\PY{p}{)}
\PY{n+nf}{print}\PY{p}{(}\PY{n}{number\PYZus{}of\PYZus{}columns}\PY{p}{)}
```
:::

``` {}
[1] 51
[1] 8
```

The `colnames` function takes as an argument a data frame and returns a vector that contains the name of each column in the data frame.

::: tcolorbox
``` {}
\PY{n}{column\PYZus{}names} \PY{o}{=} \PY{n+nf}{colnames}\PY{p}{(}\PY{n}{d}\PY{p}{)}
\PY{n+nf}{print}\PY{p}{(}\PY{n}{column\PYZus{}names}\PY{p}{)}
```
:::

``` {}
[1] "State"
[2] "Number.of.drivers.involved.in.fatal.collisions.per.billion.miles"
[3] "Percentage.Of.Drivers.Involved.In.Fatal.Collisions.Who.Were.Speeding"
[4]
"Percentage.Of.Drivers.Involved.In.Fatal.Collisions.Who.Were.Alcohol.Impaired"
[5] "Percentage.Of.Drivers.Involved.In.Fatal.Collisions.Who.Were.Not.Distracted"
[6] "Percentage.Of.Drivers.Involved.In.Fatal.Collisions.Who.Had.Not.Been.Involve
d.In.Any.Previous.Accidents"
[7] "Car.Insurance.Premiums{\ldots}"
[8]
"Losses.incurred.by.insurance.companies.for.collisions.per.insured.driver{\ldots}"
```

The `summary` function is a function that takes as an argument a data frame and returns, for each column in the data frame, the minimum value, maximum value, mean (average), median, 25th percentile (called the 1st quartile), and the 75th percentile (called the 3rd quartile).

::: tcolorbox
``` {}
\PY{n+nf}{summary}\PY{p}{(}\PY{n}{d}\PY{p}{)}
```
:::

``` {}
State          
 Length:51         
 Class :character  
 Mode  :character  
                   
                   
                   
 Number.of.drivers.involved.in.fatal.collisions.per.billion.miles
 Min.   : 5.90                                                   
 1st Qu.:12.75                                                   
 Median :15.60                                                   
 Mean   :15.79                                                   
 3rd Qu.:18.50                                                   
 Max.   :23.90                                                   
 Percentage.Of.Drivers.Involved.In.Fatal.Collisions.Who.Were.Speeding
 Min.   :13.00                                                       
 1st Qu.:23.00                                                       
 Median :34.00                                                       
 Mean   :31.73                                                       
 3rd Qu.:38.00                                                       
 Max.   :54.00                                                       
 Percentage.Of.Drivers.Involved.In.Fatal.Collisions.Who.Were.Alcohol.Impaired
 Min.   :16.00                                                               
 1st Qu.:28.00                                                               
 Median :30.00                                                               
 Mean   :30.69                                                               
 3rd Qu.:33.00                                                               
 Max.   :44.00                                                               
 Percentage.Of.Drivers.Involved.In.Fatal.Collisions.Who.Were.Not.Distracted
 Min.   : 10.00                                                            
 1st Qu.: 83.00                                                            
 Median : 88.00                                                            
 Mean   : 85.92                                                            
 3rd Qu.: 95.00                                                            
 Max.   :100.00                                                            
 Percentage.Of.Drivers.Involved.In.Fatal.Collisions.Who.Had.Not.Been.Involved.In.Any.Previous.Accidents
 Min.   : 76.00                                                                                        
 1st Qu.: 83.50                                                                                        
 Median : 88.00                                                                                        
 Mean   : 88.73                                                                                        
 3rd Qu.: 95.00                                                                                        
 Max.   :100.00                                                                                        
 Car.Insurance.Premiums{\ldots}
 Min.   : 642.0            
 1st Qu.: 768.4            
 Median : 859.0            
 Mean   : 887.0            
 3rd Qu.:1007.9            
 Max.   :1301.5            
 Losses.incurred.by.insurance.companies.for.collisions.per.insured.driver{\ldots}
 Min.   : 82.75                                                              
 1st Qu.:114.64                                                              
 Median :136.05                                                              
 Mean   :134.49                                                              
 3rd Qu.:151.87                                                              
 Max.   :194.78                                                              
```

### Assignment
We are going to look at a dataset that was collected on University "Fight Songs" that are played during sporting events. The article about the data set is here= https://projects.fivethirtyeight.com/college-fight-song-lyrics/

1.  The data is at the URL (https://raw.githubusercontent.com/fivethirtyeight/data/master/fight-songs/fight-songs.csv). Please read in this raw CSV as a data.frame

2.  Use the nrow and ncol function to describe the number of fight songs sampled and the number of different characteristics collected about each song.

3.  How many songs were sampled with a BPM (beats per minute) above 150?

4.  Select the rows where BPM is greater than 150 and select the column "nonsense" (Whether or not the song uses nonsense syllables (e.g. "Whoo-Rah" or "Hooperay") )

5.  Summarize the data frame. Why do you think the summary function does not produce useful information for many of the columns?
