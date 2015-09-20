
n<-20 # number of coins flips
pvals <- seq(0.1, 0.9, by = 0.05) # true values of the sucessufull probability of the coin flip
nosim <- 1000 # number of simularions, 0.01 confidentiality

coverage <- sapply(pvals, function(p) { # loop over the true sucess probability
      phats <- rbinom(nosim, prob = p, size = n)/n # generate a thousand sets of coin flips and taking the sample proportion in each case
      ll <- phats - qnorm(0.975) * sqrt(phats * (1 - phats)/n) # lower limit of confidence
      ul <- phats + qnorm(0.975) * sqrt(phats * (1 - phats)/n) # upper limit of confidence
      mean(ll<p&ul>p) # proportional of times they can cover that true value of p
})
