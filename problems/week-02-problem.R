################################################################################
## Source: edX
## Series: Foundations of Data Analysis
## Course: 1 Statistics Using R
## Week: Week 2
## Topic: Univariate Descriptive Statistics
## File: week-02-problem.R
## Date: 2016-02-13
################################################################################


################################################################################
## Question Set 1
################################################################################

library(SDSFoundations)
animal_data <- AnimalData

# 1a. What was the most common way that dogs arrived in the shelter?
dogs <- subset(animal_data, Animal.Type=="Dog")

intake_types <- summary(dogs$Intake.Type)
intake_types
max <- max(intake_types)
max
which(intake_types==max)

# 1b. What proportion of dogs were brought to the shelter as an owner surrender?
surrender <- intake_types[['Owner Surrender']]
total <- sum(intake_types)
round(surrender/total, 3)

# 1c. Of the dogs that were brought to the shelter as an owner surrender,
#       how many were returned to their owner?
os_dogs <- subset(dogs, Intake.Type=="Owner Surrender")
num_os_dogs <- dim(os_dogs)[1]
rto_dogs <- subset(os_dogs, Outcome.Type=="Return to Owner")
num_rto_dogs <- dim(rto_dogs)[1]

# 1d. What was the mean number of days that the dogs referenced in Question 1c spent
#       at the shelter before being returned to their owner?
mean_days <- mean(rto_dogs$Days.Shelter)
round(mean_days, 1)

# 1e. What would be the correct graph type to show the distribution of dog intake types?
# Bar graph

################################################################################