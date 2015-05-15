#Q1
library(datasets)
data(iris)
s <- subset(iris, Species == "virginica")
apply(s["Sepal.Length"], 2, mean)
#mean(iris[iris$Species == "virginica",]$Sepal.Length)

#Q2
apply(iris[, 1:4], 2, mean)

#Q3
tapply(mtcars$mpg, mtcars$cyl, mean)
# or
sapply(split(mtcars$mpg, mtcars$cyl), mean)
#or
mapply(mean, split(mtcars$mpg, mtcars$cyl))

#Tips
