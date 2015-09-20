# randon normals
t = rnorm(1000,mean = 0)

#variance
var(t)
mean(t^2) - (mean(t)^2) # mean of squares minus the square of mean

#standard deviation
sd(t)
sqrt(mean(t^2) - (mean(t)^2)) # square root of variance(sigma)

#standard error
sd_error = sd(t)/sqrt(length(t)) #sd divided by the square root of the sample size


#==========

#IID -> independent identically distributed


# number of simulations
nosim = 10000

#number of samples per simulation
n = 10

#organizing the 1000 times 10 draws from a random distribution in a matrix
norm = matrix(rnorm(nosim * n), nosim)

# calculating the mean of each row.
#each row is the mean of ten IID draws from the standard normal distribution
my_mean = apply(norm, 1, mean)

# aproximation of the standard deviation of average of ten draws from the standard normal distribution
sd(my_mean)

#comparing...
1/ sqrt(n)


#=====
#runif is a straight from 0 and 1
norm = matrix(runif(nosim * n), nosim)
my_mean = apply(norm, 1, mean)
#distribution of 10 uniforms from this population
sd(my_mean)


#===== fair coin flips have variance 0.25
# number of simulations




# ====== 06 02 Normal Distribution
#percentile

pnorm(1160, mean = 1020, sd = 50, lower.tail = FALSE)

(1160 - 1020)/50
pnorm(2.8, lower.tail = FALSE)

#quantile
qnorm(.75, mean = 1020, sd = 50)


# ====== 06 03 Poisson






