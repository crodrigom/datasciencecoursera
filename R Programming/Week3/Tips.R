# Splitting

library(datasets)
s <- split(airquality, airquality$Month)
lapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")]))
sapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")]))

sapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")], na.rm = TRUE))

#Splitting in more than one level
> x <- rnorm(10)
> f1 <- gl(2,5)
> f2 <- gl(5,2)
> f1
[1] 1 1 1 1 1 2 2 2 2 2
Levels: 1 2
> f2
[1] 1 1 2 2 3 3 4 4 5 5
Levels: 1 2 3 4 5
> interaction(f1,f2)
[1] 1.1 1.1 1.2 1.2 1.3 2.3 2.4 2.4 2.5 2.5
Levels: 1.1 2.1 1.2 2.2 1.3 2.3 1.4 2.4 1.5 2.5

str(split(x, list(f1,f2)))
List of 10
$ 1.1: num [1:2] -0.378 -0.177
$ 2.1: num(0) 
$ 1.2: num [1:2] -1.52 -1.08
$ 2.2: num(0) 
$ 1.3: num 0.259
$ 2.3: num -1.25
$ 1.4: num(0) 
$ 2.4: num [1:2] 0.442 -1.07
$ 1.5: num(0) 
$ 2.5: num [1:2] 0.442 0.867

# splitting but without empty levels
str(split(x, list(f1,f2), drop = TRUE))
List of 6
$ 1.1: num [1:2] -0.378 -0.177
$ 1.2: num [1:2] -1.52 -1.08
$ 1.3: num 0.259
$ 2.3: num -1.25
$ 2.4: num [1:2] 0.442 -1.07
$ 2.5: num [1:2] 0.442 0.867