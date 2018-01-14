################################################################################
## Source: edX
## Series: Foundations of Data Analysis
## Course: 1 Statistics Using R
## Week: Week 6
## Topic: Exponential and Logistic Function Models
## File: week-06-lab.R
## Date: 2016-03-15
################################################################################


################################################################################
## Lab 6: Worldwide Trends in Internet Usage
################################################################################

######################################################################
## Primary Research Question:
## Denmark is a high-income country in Europe of about 5.5 million people.
## What is the best-fitting model for growth of internet usage in Denmark
## since 1990?
######################################################################

######################################################################
## Reflect on the Question
######################################################################

########################################
## Review of Exponential and Logistic Models
########################################

# 1. When choosing between two models with very similiar R-squared values,
#       what additional statistic should you examine to help you select
#       the best-fitting model?
# The residuals

# 2. Which parameter represents the rapidity of growth (or change)
#       in both the exponential and the logistic models?
# b

# 3. Most biological data will follow a logistic growth model. Why?
# The logistic model takes into account the fact that most growth does not
#   continue indefinitely.

######################################################################
## Analyze the Data
######################################################################

# 1. Create a variable that represents proportion of the population 
#       using the internet (internet users divided by population).
library(SDSFoundations)
wb <- WorldBankData
denmark <- wb[wb$Country=="Denmark", ]
denmark$internet.prop <- denmark$internet.users / denmark$population

# 2. Create a subset of the data that only contains data from 1990 onward.
denmark_select <- subset(denmark, year >= 1990)

# 3. Create a new variable that is "years since 1990". 
denmark_select$years.since <- denmark_select$year - 1990

# 4. Create two new data frame for the country of interest.

# 5. Determine the best-fitting model (exponential or logistic) 
#       for internet usage in each country from 1990 onward.
e_model <- expFit(denmark_select$years.since, denmark_select$internet.prop)
l_model <- logisticFit(denmark_select$years.since, denmark_select$internet.prop)

########################################
## Model Fit Statistics
########################################

# Report the model fit statistic (R**2) for each of the following models.
# Round to 4 decimal places.

# 1a. Exponential growth model for Denmark:
round(e_model[[3]], 4)

# 1b. Logistic growth model for Denmark:
round(l_model[[4]], 4)

# 1c. What is the best-fitting model for growth of internet usage in Denmark
#       from 1990 onward?
# logistic

########################################
## Exponential Models
########################################

# 2a. What is the growth factor for the exponential model? 
#       (Round to 3 decimal places.)
round(e_model[[2]], 3)

# 2b. What is the percent growth rate of internet use, according to 
#       the exponential model? (Round to a whole-number percentage.)
round((e_model[[2]]*100)-100, 0)

########################################
## Logistic Models
########################################

# 3a. What is the carrying capacity in Denmark? (Round to 4 decimal places.)
round(l_model[[1]], 4)

# 3b. What is the value of b (growth indicator) in Denmark?
#       (Round to 2 decimal places.)
round(l_model[[3]], 2)

########################################
## Prediction Using Both Models
########################################

# 4a. In what YEAR does the exponential model predict that 70% of the Denmark
#       population would be using the internet? Use the equation to solve.
#       (Round to a whole number.)
# 2006

# 4b. In what YEAR does the logistic model predict that 70% of the Denmark
#       population would be using the internet? Use the equation to solve.
#       (Round to a whole number.)
# 2003

######################################################################
## Draw Conclusions
######################################################################

########################################
## Write Your Conclusion
########################################

# After using both an exponential and a logistic function to model Denmark's
# growth of internet usage since 1990, we found that the logistic model fit
# better with a high R-squared value of .995, compared to an R-squared value
# of .800 for the exponential model. In addition, it is visually clear from
# the graphs that the logistic model fit the observed data better than
# the exponential model. All of this suggests that we should trust predictions
# from the logistic model more than predictions from the exponential model.
# The exponential model suggests that in 1990, there was a predicted proportion
# of .00585 of Denmark's population that used internet, with the proportion
# of internet users increasing by a factor of 1.347 every year after 1990,
# on average. The logistic model shows that the predicted carrying capacity
# of the proportion of people who use internet in Denmark was .8967. Since
# the logistic model fits better, the proportion of internet users in Denmark
# will probably eventually level off rather than continuing to grow exponentially.

################################################################################