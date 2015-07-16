q1

library(nlme)
library(lattice)
xyplot(weight ~ Time | Diet, BodyWeight)

#q7

qplot(Wind, Ozone, data = airquality, facets = . ~ Month)

airquality = transform(airquality, Month = factor(Month))
qplot(Wind, Ozone, data = airquality, facets = . ~ Month)

#q9

library(ggplot2)
g <- ggplot(movies, aes(votes, rating))
print(g)