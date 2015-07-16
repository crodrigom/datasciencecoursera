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
