################################################################################
## Source: edX
## Series: Foundations of Data Analysis
## Course: 1 Statistics Using R
## Week: Week 5
## Topic: Linear Functions
## File: week-05-problem.R
## Date: 2016-03-14
################################################################################


################################################################################
## Question Set 1
################################################################################

# We want to find the best-fitting linear model for men's pole vault
# world records since 1970.

library(SDSFoundations)
wr <- WorldRecords
menspole <- subset(wr, Event=="Mens Polevault" & Year >= 1970)

# 1a. What is the standing world record height (in meters) for men's pole vault?
#       (Round to 2 decimal places.)
library(dplyr)
menspole_records <- menspole %>%
    select(Record) %>%
    arrange(desc(Record))
menspole_records[1, ]

# 1b. In what year did the pole vault record first exceed 6 meters?
menspole_6meters <- subset(menspole, Record > 6)
menspole_6meters[1, "Year"]

# 1c. Create a scatterplot showing the men's pole vault records since 1970
#       as a function of year. Fit a linear model to the data.
#       Which of the following best describes how the record has changed over time?
plot(menspole$Year, menspole$Record)
model <- linFit(menspole$Year, menspole$Record)
# The record pole vault height steadily increases over time.

# Report the coefficient estimates for the linear model that describes the change
#       in the men's pole vault world record since 1970.

# 1d. What is the intercept? (Round to 3 decimal places.)
round(model[[1]], 3)

# 1e. What is the slope? (Round to 3 decimal places.)
round(model[[2]], 3)

# 1f. Which of the following best describes how the men's pole vault world
#       record has changed since 1970?
# The record has increased by an average of 0.03 meters per year since 1970.

################################################################################
## Question Set 2
################################################################################

# The table below shows several points for the function C = f(h), where C is
# the cost (in dollars) for a band of 4 members to play at a wedding,
# based on the number of hours, h, they perform.

band_cost <- data.frame(rbind(c(0,140), c(2,280), c(4,420), c(6, 560)))
colnames(band_cost) <- c("h","C")

# 2a. Which variable is the independent variable?
# h

# 2b. Identify the y-intercept for this function.
model <- linFit(band_cost$h, band_cost$C)
model[[1]]

# 2c. How much does the band charge per hour that they perform?
model[[2]]

# 2d. If each member of the band earned $175 for the night and profits were split
#       evenly among them, how many hours did the band perform?
(((175*4)-140) / 70)

################################################################################
## Question Set 3
################################################################################

# We have bivariate data on a group of college students: the total amount
# (in dollars) spent on textbooks throughout their college career, and their GPA.
# The following linear regression model was used to predict GPA from number of
# dollars (in hundreds) spent:
# Predicted GPA = 2.84 + .04 * Dollars
intercept <- 2.84
slope <- .04

# 3a. What is the predicted GPA of a student who spent a total of $970
#       on textbooks in college? (Round to 2 decimal places.)
x <- 9.7
y <- intercept + slope * x
round(y, 2)

# 3b. If a student spent $0 on textbooks in college and graduated with a GPA
#       of 3.71, what is her residual? (Round to 2 decimal places.)
x <- 0
y <- 3.71
y_hat <- intercept + slope * x
residual <- y - y_hat
round(residual, 2)

# 3c. If a student spent $1,450 on textbooks and graduated with a GPA of 2.91,
#       what is his residual? (Please indicate whether the residual is positive
#       or negative in your response, and round to 2 decimal places.)
x <- 14.50
y <- 2.91
y_hat <- intercept + slope * x
residual <- y - y_hat
round(residual, 2)

################################################################################