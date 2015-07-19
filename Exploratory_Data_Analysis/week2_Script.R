library(lattice)
library(dataset)
xyplot(Ozone ~ Wind, data = airquality)

airquality <- transform(airquality, Month = factor(Month))
xyplot(Ozone ~ Wind | Month, data = airquality, layout = c(5,1))

library(nlme)
xyplot(weight ~ Time | Diet, BodyWeight, layout = c(3,1))

library(ggplot2)
qplot(displ, hwy, data = mpg)
qplot(displ, hwy, data = mpg, color = drv)
qplot(displ, hwy, data = mpg,  geom = c("point", "smooth"))
qplot(displ, hwy, data = mpg, color = drv,  geom = c("point", "smooth"))

#hist
qplot(hwy, data = mpg, fill = drv)

#faces
qplot(displ, hwy, data=mpg, facets=.~drv)
qplot(hwy, data=mpg, facets=drv~., binwidth =2)

#geom

geom = "density"
qplot(hwy, data = mpg, geom = "density")
qplot(hwy, data = mpg, geom = "density", color= drv)
qplot(hwy, displ, data = mpg,  color= drv, geom = c("point", "smooth"), method = "lm")
qplot(hwy, displ, data = mpg,  facets = .~drv, geom = c("point", "smooth"), method = "lm")


#ggplot2(part3), ggplot2(part4) are very good!

testdat <- data.frame(x = 1:100, y = rnorm(100))
testdat[50,2] = 100 ## Outlier!
plot(testdat$x, testdat$y, type = "l", ylim = c(-3,3))

g = ggplot(testdat, aes(x=x, y=y))
g + geom_line()

g + geom_line() + ylim(-3,3)

g + geom_line() + coord_cartesian(ylim = c(-3,3))


#quantile and levels, 4:30 of ggplot2(part 5) has a good example