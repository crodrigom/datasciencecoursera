

# Load the ToothGrowth data and perform some basic exploratory data analyses 
# Provide a basic summary of the data

# Use confidence intervals and/or hypothesis tests to compare tooth growth by supp and dose. 

# State your conclusions and the assumptions needed for your conclusions.

library(ggplot2)
library(datasets)
data(ToothGrowth)
str(ToothGrowth) # internal strcuct of dataset
head(ToothGrowth)
summary(ToothGrowth)


plot <- ggplot(ToothGrowth, 
               aes(x=as.factor(dose),y=len,fill=as.factor(supp)))
plot + geom_boxplot(notch=F) + facet_grid(.~supp) +
    scale_x_discrete("Dosage (Milligram)") +   
    scale_y_continuous("Length of Teeth") +  
    ggtitle("Relation tooth lenght and dose levels for orange juice (OJ) and ascordic acide(VC)")

table(ToothGrowth$supp, ToothGrowth$dose)


fit <- lm(len ~ dose + supp, data=ToothGrowth)
summary(fit)

confint(fit)