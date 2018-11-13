# Learning-R
Learning Language R to help my Daughter

In order to be useful I need to be able to analyse occurence of words et large files using R and packageslike tidyverse 
Let's star with pure R thanks to : https://campus.datacamp.com/courses/free-introduction-to-r

First : install R + R-studio
(To follow the datacamp tutorial I just need a browser)

both R-studio and the online tuto povide a console :

## Operators :
like any console I can do calculations :
7 *9 
2+2
etc...
Exponentiation as usual
2^5
Modulo => in other languages its just % but in R you double : 
28 %% 6

## Assignment :
x <- 42 # x = 42 works as well x[1]
the variable x appears to be an array as well => x[1] gives 42 (arrays or lists start at 1 not at 0)
x[2] = 43 gives you an array with 42 and 43

## Types :
extract from the tutorial :
Decimal values like 4.5 are called numerics.
Natural numbers like 4 are called integers. Integers are also numerics.
Boolean values (TRUE or FALSE) are called logical.
Text (or string) values are called characters.

you can check the type of a variable with #class()#

## Vectors : 1D arrays
they can hold different types
my_vector <- (1,2,3,"hello",5.25,FALSE)
you refer to an item with brackets 
my_vector[4] holds "hello"

### Naming vectors :
its somethimes easier to refer to vector with labels : use #names()#
integers_vector = c(1,2,3)
names(integers_vector) = c("on","two","three")
