# Learning-R

My goal is to help my daughter in her linguistic studies,

and to be able to analyse occurences of words in large files using R and packages like tidyverse.

Let's start with pure R thanks to : https://campus.datacamp.com/courses/free-introduction-to-r

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
> Decimal values like 4.5 are called numerics.
> Natural numbers like 4 are called integers. Integers are also numerics.
> Boolean values (TRUE or FALSE) are called logical.
> Text (or string) values are called characters.

you can check the type of a variable with **class()**

## Vectors : 1D arrays
they can hold different types
you refer to an item with brackets 
```
my_vector <- c(1,2,3,"hello",5.25,FALSE)
my_vector[4] # holds "hello"
```
### Naming vectors :
its somethimes easier to refer to vector with labels : use **names()**
```
> dayNames <- c("Sunday","Monday")
> days <- c(1,2)
> names(days) <- dayNames
> days["Sunday"]
> 1
```
### Operations on vectors :
#### on every item :
```
one_vector <- c(10,20,30)
another_vector <- c(2)
one_vector * another_vector holds c(20,40,60)

third_vector <- c(1,2,3)
one_vector * third_vector holds c(10,40,90)
```
#### Summarizing operations :
`total_result <= sum(one_vector) holds 60`
`mean_result <= mean(one_vector) holds 20`

### Vector selection 
You can get a part of a vector
```
> my_vector <- c(1,2,3,4,5,6)
> x <- my_vector[1:3]
> x
[1] 1 2 3
```
Be careful with the types
```
> my_vector <- c(1,2,3,"hello",5.25,FALSE)
> x <- my_vector[1:3]
> x
[1] "1" "2" "3"
```
You can select by comparing :
```
> my_vector <- c(1,2,3,4,5,6)
> select_vector <- my_vector >= 4
> select_vector
[1] FALSE FALSE FALSE  TRUE  TRUE  TRUE
> over3_vector = my_vector[select_vector]
> over3_vector
[1] 4 5 6
```

### Matrix a 2D arrays of items of the same type
matrix(1:12, byrow = TRUE, nrow = 4) filling way : byrow
```
> matrix(1:12,byrow=TRUE,nrow=4)
     [,1] [,2] [,3]
[1,]    1    2    3
[2,]    4    5    6
[3,]    7    8    9
[4,]   10   11   12
```
Reverse order (by columns)
```
> matrix(1:12,byrow=FALSE,nrow=4)
     [,1] [,2] [,3]
[1,]    1    5    9
[2,]    2    6   10
[3,]    3    7   11
[4,]    4    8   12
```
#### A collection of vectors
```
> x <- c(1,2,3)
> y <- c(4,5,6)
> z <- c(7,8,9)
> 
> xyz <- c(x,y,z)
> xyz
[1] 1 2 3 4 5 6 7 8 9
> # matrix
> xyz_matrix <- matrix(xyz,byrow = TRUE,nrow = 3)
> xyz_matrix
     [,1] [,2] [,3]
[1,]    1    2    3
[2,]    4    5    6
[3,]    7    8    9
```
a vector of vectors is still a 1D array as you see (xyz)
but it is convenient to use vectors of the same length, concatenate them in another vector and them fill the matrix with a nrow equal to the number of initial vectors.

#### Naming row and columns
```
> results_math <- c(12,13,15)
> results_english <- c(18,10,13)
> candidates <- c("Elsa","John","Martia")
> subjects <- c("Math","French")
> results_matrix <- matrix(c(results_math,results_english),nrow=3,byrow=FALSE)
> rownames(results_matrix) <- candidates
> colnames(results_matrix) <- subjects
> results_matrix
       Math French
Elsa     12     18
John     13     10
Martia   15     13
```
#### Adding a column to the matrix
```
> means <- rowMeans(results_matrix)
> results_matrix <- cbind(results_matrix,means)
> results_matrix
       Math French means
Elsa     12     18  15.0
John     13     10  11.5
Martia   15     13  14.0
```
```
> sums <- rowSums(results_matrix)
> results_matrix <- cbind(results_matrix,sums)
> results_matrix
       Math French sums
Elsa     12     18   30
John     13     10   23
Martia   15     13   28
```
#### Adding a row to the matrix
```
> subjects <- c("Math","French")
> 
> results_math_class1 <- c(12.0,13.0,15.0)
> results_english_class1 <- c(18.0,10.0,13.0)
> candidates_class1 <- c("Elsa","John","Martia")
> results_matrix_class1 <- matrix(c(results_math_class1,results_english_class1),nrow=3,byrow=FALSE)
> 
> rownames(results_matrix_class1) <- candidates_class1
> results_math_class2 <- c(16.0,12.0,7.0,17.0)
> results_english_class2 <- c(12.0,12.5,14.0,17.0)
> candidates_class2 <- c("Alan","Beatriz","Johan","Sylvia")
> results_matrix_class2 <- matrix(c(results_math_class2,results_english_class2),nrow=4,byrow=FALSE)
> rownames(results_matrix_class2) <- candidates_class2
> 
> results_matrix <- rbind(results_matrix_class1,results_matrix_class2)
> colnames(results_matrix) <- subjects
> results_matrix
        Math French
Elsa      12   18.0
John      13   10.0
Martia    15   13.0
Alan      16   12.0
Beatriz   12   12.5
Johan      7   14.0
Sylvia    17   17.0
```
