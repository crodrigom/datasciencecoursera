add2 <- function(x,y){
  x + y
}

above10 <- function(x){
  use <- x > 10
  x[use]
  
}
## default values n = 10 if not especified
above <- function(x, n = 10){
  use <- x > n
  x[use] 
}

columnmean <- function(y, removeNA = TRUE){
  nc <-ncol(y)
  means <- numeric(nc)
  for(i in 1:nc){
    means[i] <- mean(y[,i], na.rm = removeNA)
  }
  means
}

make.power <- function(n){
  pow <- function(x){
    x^2
  }
  pow
}