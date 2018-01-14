################################################################################
## Source: edX
## Series: Foundations of Data Analysis
## Course: 1 Statistics Using R
## Week: Week 6
## Topic: Exponential and Logistic Function Models
## File: week-06-tutorial.R
## Date: 2016-03-15
################################################################################


################################################################################
## Exponential and Logistic Models
################################################################################

library(SDSFoundations)

wb <- WorldBankData
gbr <- wb[wb$Country.Code=='GBR', ]
gbr2000 <- gbr[gbr$year >= 2000 & gbr$year < 2010, ]

time <- gbr2000$year - 2000
mv <- gbr2000$motor.vehicles

plot(time, mv)

expFit(time, mv)
logisticFit(time, mv)

tripleFit(time, mv)

expFitPred(time, mv, 12)
logisticFitPred(time, mv, 12)

################################################################################