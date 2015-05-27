#Q1
set.seed(1)
rpois(5, 2)

# [1] 1 1 2 4 1


#Q2
rnorm
#Q3
#It ensures that the sequence of random numbers starts in a specific place and is therefore reproducible.

#Q4
qpois
#Q5
set.seed(10)
x <- rep(0:1, each = 5)
e <- rnorm(10, 0, 20)
y <- 0.5 + 2 * x + e
#Generate data from a Normal linear model

#Q6
rbinom

#Q7
#the function call stack

#Q8
library(datasets)
Rprof()
fit <- lm(y ~ x1 + x2)
Rprof(NULL)
#'by.total' the top-level function takes 100% of the time.
#'
#Q9
#It is the time spent by the CPU evaluating an expression

#Q10
#elapsed time may be smaller than user time
#because the time spending int expression evaluation is spllited in n processors

