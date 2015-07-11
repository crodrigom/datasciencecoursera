library(datasets)
data(cars)
with(cars, plot(speed, dist))

library(lattice)
data(state)
state <-data.frame(state.x77, region = state.region)
xyplot(Life.Exp ~ Income | region, data = state, layout = c(4,1))

library(ggplot2)
data(mpg)
qplot(displ, hwy, data = mpg)

# === base plotting system ===

?par # help page to graphical parameters 

hist(airquality$Ozone)
with(airquality, plot(Wind, Ozone))
# OR
plot(airquality$Wind, airquality$Ozone, pch = ".")

airquality <- transform(airquality, Month = factor(Month))
boxplot(Ozone ~ Month, airquality, xlab = "Month", ylab = "Ozone (ppb)")

par("lty"); par("col"); par("pch") # default values for these 3 parameters
par("bg"); par("mar"); par("mfrow") # default values for these 3 parameters


with(airquality, plot(Wind, Ozone))
title(main = "Ozone and WInd in New York City")
#or
with(airquality, plot(Wind, Ozone, main = "Ozone and WInd in New York City", type = "n", pch = 20))
with(subset(airquality, Month == 5), points(Wind, Ozone, col = "blue"))
with(subset(airquality, Month != 5), points(Wind, Ozone, col = "red"))
legend("topright", pch = 1, col = c("blue", "red"), legend = c("May", "Other Months"))

with(airquality, plot(Wind, Ozone, main = "Ozone and WInd in New York City", pch = 20))
model = lm(Ozone ~ Wind, airquality)
abline(model, lwd = 2)

par(mfrow = c(1,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
with(airquality, {
    plot(Wind, Ozone, main = "Ozone and Wind")
    plot(Solar.R, Ozone, main = "Ozone and Solar Radiation")
    mtext("Ozone and Weather in New York City", outer = TRUE)
})

# === Base plotting Demonstration ===
x = rnorm(100)
hist(x)
y = rnorm(100)
plot(x,y)
z <- rnorm(100)
plot(x,z)
par(mar = c(4,4,2,2))

example(points) # show demos of plots

x = rnorm(100)
y = rnorm(100)
plot(x, y, pch =20)
title("Scatterplot")
text(-2,-2, "Label")
legend("topleft", legend = "Data", pch = 20)
fit <- lm(y ~ x) # linear model
abline(fit, lwd = 3, col = "blue")

x = rnorm(100)
y = x + rnorm(100)
g = gl(2, 50, labels = c("Male", "Female"))
str(g)
plot(x,y, type = "n")
points(x[g == "Male"], y[g == "Male"], col = "green")
points(x[g == "Female"], y[g == "Female"], col = "blue", pch = 19)

# === graphics device ====

