
set.seed(3)
lambda = 0.2
mean.exp.distr = 1/lambda
sd.exp.distr = 1/lambda
simulation_number = 1000
size = 40
dt = data.frame(sapply(1:simulation_number, function(x) mean(rexp(size, lambda))))
names(dt) = "means"

# histogram of the averages
require(ggplot2)
library(MASS)    # for fitsidtr(...)    

# theoretical density of the averages of samples

ggplot(dt, aes(x = means)) + 
    geom_histogram(aes(y=..density..),colour = "black", fill = "white", binwidth = 0.1)+
    stat_function(fun=dnorm, args=fitdistr(dt$means,"normal")$estimate, colour = "red")+
    stat_function(aes(x = c(2, 8)), fun = dnorm, color = 'blue',
                  args = list(mean = mean.exp.distr, sd = sd.exp.distr)) +
    
    xlab('Sample mean') +
    ylab('Density') +
    ggtitle('Comparison of the sample distribution and the theoretical distribution')
    