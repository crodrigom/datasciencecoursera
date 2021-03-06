library(kernlab)
data(spam)
set.seed(3435)
trainINdicator = rbinom(4601, size = 1, prob = 0.5)
table(trainINdicator)

#divide the dataset in train and test dataset
trainSpam = spam[trainINdicator == 1,]
testSpam = spam[trainINdicator == 0,]

table(trainSpam$type)

plot(trainSpam$capitalAve ~ trainSpam$type)
plot(log10(trainSpam$capitalAve +1) ~ trainSpam$type)

plot(log10(trainSpam[,1:4] +1))

hCLuster = hclust(dist(t(trainSpam[,1:57])))
plot(hCLuster)

hCLusterUpdated = hclust(dist(t(log10(trainSpam[,1:57] + 1))))
plot(hCLusterUpdated)

# statistical modeling
trainSpam$numType = as.numeric(trainSpam$type) - 1
costFunction = function(x, y) sum(x != (y > 0.5))
cvError = rep(NA, 55)
library(boot)
for (i in 1:55) {
        lmFormula = reformulate(names(trainSpam)[i], response = "numType")
        glmFit = glm(lmFormula, family = "binomial", data = trainSpam)
        cvError[i] = cv.glm(trainSpam, glmFit, costFunction, 2)$delta[2]
}
## Which predictor has minimum cross-validated error?
names(trainSpam)[which.min(cvError)]

## Use the best model from the group
predictionModel = glm(numType ~ charDollar, family = "binomial", data = trainSpam)
## Get predictions on the test set
predictionTest = predict(predictionModel, testSpam)
predictedSpam = rep("nonspam", dim(testSpam)[1])
## Classify as `spam' for those with prob > 0.5
predictedSpam[predictionModel$fitted > 0.5] = "spam"

## Classification table
table(predictedSpam, testSpam$type)
## Error rate
(61 + 458)/(1346 + 458 + 61 + 449)


