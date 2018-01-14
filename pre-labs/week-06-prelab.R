################################################################################
## Source: edX
## Series: Foundations of Data Analysis
## Course: 1 Statistics Using R
## Week: Week 6
## Topic: Exponential and Logistic Function Models
## File: week-06-prelab.R
## Date: 2016-03-15
################################################################################


################################################################################
## Lab 6: Worldwide Trends in Internet Usage
################################################################################

############################################################
## Primary Research Question:
## What model best describes the first decade of internet usage (1990-1999)
## in the United States? Which model is a better long-term fit?
############################################################

######################################################################
## Reflect on the Question
######################################################################

########################################
## Check the Data
########################################

library(SDSFoundations)
wb <- WorldBankData

# 1a. What is the first "Low Income" country in the dataset?
low_income <- subset(wb, IncomeGroup=='Low income')
low_income[1, "Country"]

# 1b. What was the rural population of Aruba in 1970? (Report without commas.)
aruba_1970 <- subset(wb, Country=="Aruba" & year==1970)
aruba_1970$rural.population

# 1c. When was the first year Australia had data on the number of mobile device
#       subscriptions?
australia_mobile <- subset(wb, Country=="Australia" & mobile.users > 0)
australia_mobile[1, ]$year

########################################
## Check the Variables of Interest
########################################

# 2a. Which variable tells us the number of internet users in a specific year?
# internet.users

# 2b. What type of variable is this?
# quantitative

# 2c. Which variable tells us when the number of internet users was recorded?
# year

# 2d. What type of variable is this?
# quantitative

########################################
## Reflect on the Method
########################################

# 3a. What statistic helps us determine how well a particular model fits the data?
# R-squared

# 3b. In this lab, we will calculate residuals after fitting both an exponential
#       and a logistic model to a set of data. What is a residual?
# A residual is the difference between a predicted value and the actual observed
#   value.

######################################################################
## Analyze the Data
######################################################################

########################################
## Break Down Your Analysis
########################################

# 1. Create a subset of the dataset that contains only the information 
#       for the United States.
us <- wb[wb$Country.Code=="USA", ]

# 2. Create a subset of the US data that contains only the years 1990 to 1999.  
us_select <- us[us$year >= 1990, ]
us_select$internet.mil <- us_select$internet.users / 1000000
us_select$time <- us_select$year - 1990
us_select_10 <- us_select[us_select$time < 10, ]

# 3. Use a function to fit both an exponential and a logistic model to the data.  
e_model <- expFit(us_select_10$time, us_select_10$internet.mil)
l_model <- logisticFit(us_select_10$time, us_select_10$internet.mil)

# 4. Using each model, predict the number of internet users in 2006. 
e <- expFitPred(us_select_10$time, us_select_10$internet.mil, 16)
l <- logisticFitPred(us_select_10$time, us_select_10$internet.mil, 16)

# 5. Compare the size of the residuals for 2006 to determine which model 
#       appears to have better long-term fit.

# 1. In both of these models, what does Year 0 correspond to?
# 1990

# 2. Which functions will you use to fit exponential and logistic models
#       to the data?
# expFit() and logisticFit()

# 3. What will be the value of "us_select$time" for 2006?
# 16

# 4. In 1990, the number of internet users in the US was 1,958,863.
#       What will be the value of "us_select$internet.mil" for 1990
#       after this line of code is run?
#   us_select$internet.mil <- us_select$internet.users / 1000000
# 1.958863

# 5. Suppose we wanted to create a subset of data that contained only Belgium
#       entries that were from 1990 and onward. What error was made in the code
#       below?
#   world <- WorldBankData
#   belgium <- world[world$Country == 'Belgium', ]
#   recent_belgium <- world[world$year >= 1990, ]
# We pulled our data from the wrong dataset in the third line.

########################################
## Conduct Analysis in R
########################################

# 1. Report the parameters of the exponential model for the number of internet
#       users in the US for years 1990-1999. (Round to 3 decimal places.)

# a = 
round(e_model[[1]], 3)

# b = 
round(e_model[[2]], 3)

# 2. Report the parameters of the logistic model for the number of internet
#       users in the US for years 1990-1999. (Round to 1 decimal place.)

# C = 
round(l_model[[1]], 1)

# a = 
round(l_model[[2]], 1)

# 3. What was the actual number of internet users (in millions) in the United
#       States in 2006? (Round to 1 decimal place.)
us_select_2006 <- us_select[us_select$time == 16, ]
actual <- round(us_select_2006$internet.mil, 1)

# 4a. The exponential model predicted ____ million users in 2006.
#       The residual was ____.

e
actual - e

# 4b. The logistic model predicted ____ million users in 2006.
#       The residual was ____. 

l
actual - l

# 5. Based on the model residuals for 2006, which model do you think
#       does a better job of predicting (long-term) the number of internet users?
# The logistic model.

######################################################################
## Draw Conclusions
######################################################################

########################################
## Write Your Conclusion
########################################

# Both the logistic and exponential models do/does a farily good job of fitting
# the pattern of internet usage in the United States from 1990-1999,
# as shown by R-squared values greater than 0.95. If we look ahead to 2006,
# however, we see that the logistic model has a better long-term fit. This model
# predicted 127.5 million users in 2006, with a smaller residual of 78.2 million.
# The exponential model predicted far more users than there really were.
# It appears that the number of new internet users grew rapidly at first
# but then began to level off over time.

################################################################################