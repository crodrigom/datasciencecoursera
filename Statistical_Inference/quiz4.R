#Q1

baseline = c(140, 138, 150, 148, 135)
week2    = c(132, 135, 151, 146, 130)
difference = week2 - baseline
# H_0: there is no change (two-sided test) in the mean of the blood pressure.
n = length(baseline)

t_stat = mean(difference) / (sd(difference)/sqrt(n))
p_value = pt(q=t_stat, df=n-1, lower.tail=TRUE)
two_sided_p_value = 2 * p_value
two_sided_p_value 

# p-value: easy way using t.test
ttest = t.test(difference, alternative='two.sided')
ttest$p.value


#Q2
n = 9
mu = 1100
sd = 30
alpha = 0.05
t_stat = qt(p=(1-alpha/2), df=(n-1))
# The range of t_stat we would fail to reject H_0 is 
c(-1, 1) * t_stat

#the range of mu0 is
mu + c(-1, 1) * t_stat * sd / sqrt(n)


#Q3
#X is a binary random variable indicating whether Coke (1) or Pepsi (0) is preferred. 
#X follows a binomial distribution. 
# Probability of more than 2 out of 4 people choosing coke assuming that people
# are indifferent between coke and pepsi.
pbinom(2, size=4, prob=0.5, lower.tail=F)

#Q4
# Probability of 10 or less people infected given expected lambda people infected.
lambda = 1 / 100 * 1787
ppois(10, lambda)

#Q5
n1 = 9
n2 = 9
x1 = -3  ##treated
s1 = 1.5  ##treated
x2 = 1  ##placebo
s2 = 1.8  ##placebo

s = sqrt(((n1 - 1) * s1^2 + (n2 - 1) * s2^2)/(n1 + n2 - 2))
ts = (x1 - x2)/(s * sqrt(1/n1 + 1/n2))
2 * pt(ts, n1 + n2 - 2)

#Q6
#No, you would fail to reject. 
#The 95% interval would be wider than the 90% interval. 
#Since 1,078 is in the narrower 90% interval, it would also be in the wider 95% interval. 
#As a result, in either case it is in the interval and so you would fail to reject.

#Q7
pt = power.t.test(n=100, delta=.01, sd=.04, alt="one.sided", 
                  type="one.sample", sig.level=.05)
pt$power

#or
pnorm(1.645 * 0.004, mean = 0.01, sd = 0.004, lower.tail = FALSE)

#Q8
pt = power.t.test(delta=.01, sd=.04, alt="one.sided", 
                  type="one.sample", sig.level=.05, power=.9)
pt$n

#Q9
#As you require less evidence to reject, i.e. your alpha rate goes up, you will have larger power



