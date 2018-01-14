################################################################################
## Source: edX
## Series: Foundations of Data Analysis
## Course: 1 Statistics Using R
## Week: Week 3
## Topic: Bivariate Distributions
## File: week-03-tutorial.R
## Date: 2016-02-21
################################################################################


################################################################################
## Scatterplots
################################################################################

library(SDSFoundations)

bull <- BullRiders

plot(bull$YearsPro, bull$BuckOuts14,
     xlab="Years Pro", ylab="Buckouts 14",
     main="Plot of Years Prof vs Buckouts")
abline(lm(bull$BuckOuts14 ~ bull$YearsPro))

plot(bull$Events14, bull$BuckOuts14,
     xlab="Events 14", ylab="Buckouts 14",
     main="Plot of Events vs Buckouts 14")
abline(lm(bull$BuckOuts14 ~ bull$Events14))

################################################################################
## Correlation
################################################################################

cor(bull$YearsPro, bull$BuckOuts14)
cor(bull$Events14, bull$BuckOuts14)

myvars <- c("YearsPro","Events14","BuckOuts14")
cor(bull[, myvars])

################################################################################