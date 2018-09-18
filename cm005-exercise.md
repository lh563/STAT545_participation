---
title: 'cm005: `dplyr` Exercise'
output: 
    html_document:
      keep_md: true
---

**Optional, but recommended startup**:

Change the file output to both html and md _documents_ (not notebook).


# Intro to `dplyr` syntax

1. Load the `gapminder` and `tidyverse` packages. Hint: `suppressPackageStartupMessages()`!
    - This loads `dplyr`, too.
2. `knit` the document. 

```r
library(gapminder)
library(tidyverse)
```

```
## ── Attaching packages ────────────────────────────────────────────────────────────────── tidyverse 1.2.1 ──
```

```
## ✔ ggplot2 3.0.0     ✔ purrr   0.2.5
## ✔ tibble  1.4.2     ✔ dplyr   0.7.6
## ✔ tidyr   0.8.1     ✔ stringr 1.3.1
## ✔ readr   1.1.1     ✔ forcats 0.3.0
```

```
## ── Conflicts ───────────────────────────────────────────────────────────────────── tidyverse_conflicts() ──
## ✖ dplyr::filter() masks stats::filter()
## ✖ dplyr::lag()    masks stats::lag()
```


## `select()`

1. Make a data frame containing the columns `year`, `lifeExp`, `country` from the gapminder data, in that order.

```r
select(gapminder, year, lifeExp, country)
```

```
## # A tibble: 1,704 x 3
##     year lifeExp country    
##    <int>   <dbl> <fct>      
##  1  1952    28.8 Afghanistan
##  2  1957    30.3 Afghanistan
##  3  1962    32.0 Afghanistan
##  4  1967    34.0 Afghanistan
##  5  1972    36.1 Afghanistan
##  6  1977    38.4 Afghanistan
##  7  1982    39.9 Afghanistan
##  8  1987    40.8 Afghanistan
##  9  1992    41.7 Afghanistan
## 10  1997    41.8 Afghanistan
## # ... with 1,694 more rows
```
2. Select all variables, from `country` to `lifeExp`. 

```r
select(gapminder, country,lifeExp)
```

```
## # A tibble: 1,704 x 2
##    country     lifeExp
##    <fct>         <dbl>
##  1 Afghanistan    28.8
##  2 Afghanistan    30.3
##  3 Afghanistan    32.0
##  4 Afghanistan    34.0
##  5 Afghanistan    36.1
##  6 Afghanistan    38.4
##  7 Afghanistan    39.9
##  8 Afghanistan    40.8
##  9 Afghanistan    41.7
## 10 Afghanistan    41.8
## # ... with 1,694 more rows
```


3. Select all variables, except `lifeExp`.

```r
a<-select(gapminder, -lifeExp)
```


4. Put `continent` first. Hint: use the `everything()` function.

```r
select(gapminder, continent, everything())
```

```
## # A tibble: 1,704 x 6
##    continent country      year lifeExp      pop gdpPercap
##    <fct>     <fct>       <int>   <dbl>    <int>     <dbl>
##  1 Asia      Afghanistan  1952    28.8  8425333      779.
##  2 Asia      Afghanistan  1957    30.3  9240934      821.
##  3 Asia      Afghanistan  1962    32.0 10267083      853.
##  4 Asia      Afghanistan  1967    34.0 11537966      836.
##  5 Asia      Afghanistan  1972    36.1 13079460      740.
##  6 Asia      Afghanistan  1977    38.4 14880372      786.
##  7 Asia      Afghanistan  1982    39.9 12881816      978.
##  8 Asia      Afghanistan  1987    40.8 13867957      852.
##  9 Asia      Afghanistan  1992    41.7 16317921      649.
## 10 Asia      Afghanistan  1997    41.8 22227415      635.
## # ... with 1,694 more rows
```

5. Rename `continent` to `cont`.

```r
rename(gapminder,cont=continent)
```

```
## # A tibble: 1,704 x 6
##    country     cont   year lifeExp      pop gdpPercap
##    <fct>       <fct> <int>   <dbl>    <int>     <dbl>
##  1 Afghanistan Asia   1952    28.8  8425333      779.
##  2 Afghanistan Asia   1957    30.3  9240934      821.
##  3 Afghanistan Asia   1962    32.0 10267083      853.
##  4 Afghanistan Asia   1967    34.0 11537966      836.
##  5 Afghanistan Asia   1972    36.1 13079460      740.
##  6 Afghanistan Asia   1977    38.4 14880372      786.
##  7 Afghanistan Asia   1982    39.9 12881816      978.
##  8 Afghanistan Asia   1987    40.8 13867957      852.
##  9 Afghanistan Asia   1992    41.7 16317921      649.
## 10 Afghanistan Asia   1997    41.8 22227415      635.
## # ... with 1,694 more rows
```

## `arrange()`

1. Order by year.

```r
arrange(gapminder,lifeExp)
```

```
## # A tibble: 1,704 x 6
##    country      continent  year lifeExp     pop gdpPercap
##    <fct>        <fct>     <int>   <dbl>   <int>     <dbl>
##  1 Rwanda       Africa     1992    23.6 7290203      737.
##  2 Afghanistan  Asia       1952    28.8 8425333      779.
##  3 Gambia       Africa     1952    30    284320      485.
##  4 Angola       Africa     1952    30.0 4232095     3521.
##  5 Sierra Leone Africa     1952    30.3 2143249      880.
##  6 Afghanistan  Asia       1957    30.3 9240934      821.
##  7 Cambodia     Asia       1977    31.2 6978607      525.
##  8 Mozambique   Africa     1952    31.3 6446316      469.
##  9 Sierra Leone Africa     1957    31.6 2295678     1004.
## 10 Burkina Faso Africa     1952    32.0 4469979      543.
## # ... with 1,694 more rows
```


2. Order by year, in descending order.


3. Order by year, then by life expectancy.

## Piping, `%>%`

Note: think of `%>%` as the word "then"!

1. Combine `select()` Task 1 with `arrange()` Task 3.
com+shift+m
control+m

```r
b<-gapminder %>% 
  select(year,lifeExp,country) %>% 
  arrange(year,lifeExp)
```


## `filter()`

1. Only take data with population greater than 100 million.

```r
gapminder %>% 
  filter(!(pop>1000000))
```

```
## # A tibble: 180 x 6
##    country continent  year lifeExp    pop gdpPercap
##    <fct>   <fct>     <int>   <dbl>  <int>     <dbl>
##  1 Bahrain Asia       1952    50.9 120447     9867.
##  2 Bahrain Asia       1957    53.8 138655    11636.
##  3 Bahrain Asia       1962    56.9 171863    12753.
##  4 Bahrain Asia       1967    59.9 202182    14805.
##  5 Bahrain Asia       1972    63.3 230800    18269.
##  6 Bahrain Asia       1977    65.6 297410    19340.
##  7 Bahrain Asia       1982    69.1 377967    19211.
##  8 Bahrain Asia       1987    70.8 454612    18524.
##  9 Bahrain Asia       1992    72.6 529491    19036.
## 10 Bahrain Asia       1997    73.9 598561    20292.
## # ... with 170 more rows
```


2. Of those, only take data from Asia.

## git stuff (Optional)

Knit, commit, push!

# Break/Challenge: metaprogramming

Here's an activity for you to do during the break, in case you're all caught up. It should help you understand metaprogramming a bit more.

Suppose you're the instructor of an R programming course. You write an assignment question to evaluate whether students can write an `if` statement, for which an answer to the question looks something like this:

```
my_commute <- 60
if (my_commute > 30) {
    print("That's a long commute!")
} else {
    print("That's a short commute.")
}
```

Your task is to use metaprogramming to check whether a response (like the one above) works and contains an `if` statement. You should roughly follow these steps, using [adv-r: expressions](https://adv-r.hadley.nz/expressions.html) as a resource (especially Section 18.1).

1. Wrap the above block of code in the `expr()` function from the `rlang` package.
2. Use the `eval()` function to execute the code, to see if the code runs.
3. Use the `as.character()` function to check whether this response contains an `if` statement.

# Relational/Comparison and Logical Operators in R

1. Find all entries of Canada and Algeria occuring in the '60s. 

```r
gapminder %>% 
  filter((country=="Canada"|country=="Algeria")&year>=1960&year<1970)
```

```
## # A tibble: 4 x 6
##   country continent  year lifeExp      pop gdpPercap
##   <fct>   <fct>     <int>   <dbl>    <int>     <dbl>
## 1 Algeria Africa     1962    48.3 11000948     2551.
## 2 Algeria Africa     1967    51.4 12760499     3247.
## 3 Canada  Americas   1962    71.3 18985849    13462.
## 4 Canada  Americas   1967    72.1 20819767    16077.
```

2. Find all entries of Canada, and entries of Algeria occuring in the '60s. 
3. Find all entries _not_ including Canada and Algeria.

# Bonus Exercises

If there's time remaining, we'll practice with these three exercises. I'll give you 1 minute for each, then we'll go over the answer.

1. Take all countries in Europe that have a GDP per capita greater than 10000, and select all variables except `gdpPercap`. (Hint: use `-`).

2. Take the first three columns, and extract the names.

3. Of the `iris` data frame, take all columns that start with the word "Petal". 
    - Hint: take a look at the "Select helpers" documentation by running the following code: `?tidyselect::select_helpers`.
    - Exercise from [r-exercises](https://www.r-exercises.com/2017/10/19/dplyr-basic-functions-exercises/).
