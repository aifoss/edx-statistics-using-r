################################################################################
## Source: edX
## Series: Foundations of Data Analysis
## Course: 1 Statistics Using R
## Week: Week 5
## Topic: Linear Functions
## File: week-05-quiz.R
## Date: 2016-03-14
################################################################################


################################################################################
## Functions and Models
################################################################################

################################################################################
## The Line of Best Fit
################################################################################

# 2. Do states with higher populations have more millionaires?
#       Here is data from 2008.

connecticut <- c(86000, 3500000)
delaware <- c(18000, 800000)
maine <- c(22000, 1300000)
massachusetts <- c(141000, 6400000)
new_hampshire <- c(26000, 1300000)
new_jersey <- c(207000, 8700000)
new_york <- c(368000, 19300000)
pennsylvania <- c(228000, 12400000)
rhode_island <- c(20000, 1100000)
vermont <- c(11000, 600000)

mils_by_state <- data.frame(rbind(connecticut, delaware, maine, massachusetts,
                       new_hampshire, new_jersey, new_york,
                       pennsylvania, rhode_island, vermont))
colnames(mils_by_state) <- c("millionaires", "population")

# Using linFit(), the following linear model is found:
# Millionaires = 6.296 + (1.921 * State.Population)

linFit(mils_by_state$population, mils_by_state$millionaires)

# 2a. What is the correlation between Millionaires and State.Population?
#       (Round to 3 decimal places.) 
corr <- cor(mils_by_state$population, mils_by_state$millionaires)
round(corr, 3)

# 2b. What is the coefficient of determination (R-squared)?
#       (Round to 3 decimal places.)
# 0.984 

################################################################################
## Interpreting the Linear Model
################################################################################

################################################################################