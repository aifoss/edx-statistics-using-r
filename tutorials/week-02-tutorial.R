################################################################################
## Source: edX
## Series: Foundations of Data Analysis
## Course: 1 Statistics Using R
## Week: Week 2
## Topic: Univariate Descriptive Statistics
## File: week-02-tutorial.R
## Date: 2016-02-13
################################################################################


################################################################################
## Visualizaing Univariate Data
################################################################################

library(SDSFoundations)

animal_data <- AnimalData

table(animal_data$Sex)
plot(animal_data$Sex,
     main="Bar Chart of Animal Genders",
     xlab="Animal Gender",
     ylab="Frequency")

hist(animal_data$Age.Intake,
     main="Historgram of Intake Ages",
     xlab="Age at Intake")

################################################################################
## Histograms by Groups
################################################################################

female_age <- animal_data$Age.Intake[animal_data$Sex=='Female']
male_age <- animal_data$Age.Intake[animal_data$Sex=='Male']

hist(female_age,
     main="Histogram of Female Ages",
     xlab="Age at Intake of Female Animals")

hist(male_age,
     main="Histogram of Male Ages",
     xlab="Age at Intake of Male Animals",
     breaks=15)

max(male_age)
max(female_age)

max_idx <- which(animal_data$Age.Intake == 17)
animal_data[max_idx, ]

################################################################################
## Univariate Descriptive Statistics
################################################################################

mean(animal_data$Age.Intake)
median(animal_data$Age.Intake)

sd(animal_data$Age.Intake)
fivenum(animal_data$Age.Intake)

################################################################################