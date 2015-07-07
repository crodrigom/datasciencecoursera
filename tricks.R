
rep(c(0, 1, 2), times = 10)
[1] 0 1 2 0 1 2 0 1 2 0 1 2 0 1 2 0 1 2 0 1 2 0 1 2 0 1 2 0 1 2

rep(c(0, 1, 2), each = 10)
[1] 0 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 2 2

paste(LETTERS, 1:4, sep = "-")
[1] "A-1" "B-2" "C-3" "D-4" "E-1" "F-2" "G-3" "H-4" "I-1" "J-2" "K-3" "L-4" "M-1" "N-2" "O-3" "P-4"
[17] "Q-1" "R-2" "S-3" "T-4" "U-1" "V-2" "W-3" "X-4" "Y-1" "Z-2"

x[c(-2, -10)] == x[-c(2, 10)]

x <- array(rnorm(1000), dim = c(10,10,10))

library(akima)
im <- with(data,interp(x,y,z))
with(im,image(x,y,z))

list <- list()
> list[[1]] <- data.frame(x[,,1])
> list[[2]] <- data.frame(x[,,2])
> list[[3]] <- data.frame(x[,,3])
