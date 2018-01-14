################################################################################
## Source: edX
## Series: Foundations of Data Analysis
## Course: 1 Statistics Using R
## Week: Week 5
## Topic: Linear Functions
## File: week-05-lab.R
## Date: 2016-03-14
################################################################################


################################################################################
## Lab 5: Track and Field World Records
################################################################################

######################################################################
## Primary Research Question:
## How have world record times for the men's and women's mile event changed
## over the years?
######################################################################

######################################################################
## Reflect on the Question
######################################################################

########################################
## Review of Linear Modeling
########################################

# 1a. When fitting a model to data, what should you do first to examine the data?
# Create a scatterplot of the two variables of interest.

# 1b. When fitting a linear model, what will tell you the proportion of variance
#       in the dependent variable that can be explained by the independent
#       variable?
# the R-squared value

# 2. You will be answering one of the following questions in lab.
#       Which of these questions might be answered using linear modeling?
# How have world record times for the men's and women's mile event changed
#   over the years?

######################################################################
## Analyze the Data
######################################################################

library(SDSFoundations)
wr <- WorldRecords

# 1. Create a subset of the data that contains World Record cases 
#       for the men’s Mile event.

mens_mile <- wr[wr$Event=='Mens Mile', ]

# 2. Create a subset of the data that contains World Record cases 
#       for the women's Mile event. 

womens_mile <- wr[wr$Event=='Womens Mile', ]

# 3. Create a scatterplot for each relationship of Mile time and year: 
#       one for men and one for women.

plot(mens_mile$Year, mens_mile$Record,
     main='Mens Mile World Records',
     xlab='Year',
     ylab='World Record Speed (sec)',
     pch=16)

plot(womens_mile$Year, womens_mile$Record,
     main='Womens Mile World Records',
     xlab='Year',
     ylab='World Record Speed (sec)',
     pch=16)

# 4. Confirm from these plots that a linear model is appropriate.  

# 5. Run a linear model for each event and then interpret the results. 
#       Be sure to calculate R-squared values for each model.

linFit(mens_mile$Year, mens_mile$Record)
linFit(womens_mile$Year, womens_mile$Record)

# 1. Which scatterplot shows a stronger linear relationship between World
#       Record times in the Mile and Year:
# Men's

# 2. On average, how many seconds do men trim off the world record time
#       in the Mile each year? (Round to 3 decimal places.)
# 0.393

# 3. On average, how many seconds do women trim off the world record time
#       in the Mile each year? (Round to 3 decimal places.)
# 0.973

# 4. How many years would you predict it would take for the men's mile record
#       to decrease by one full second?
round(1/0.39347, 1)

# 5. How many years would you predict it would take for the women's mile record
#       to decrease by one full second?
round(1/0.97288, 1)

# 6. What proportion of variance in the men's World Record times in the Mile
#       can be explaine by year? (Round to 3 decimal places.)
# 0.977

# 7. What proportion of variance in the women's World Record times in the Mile
#       can be explaine by year? (Round to 3 decimal places.)
# 0.896

# 8. Which of the following is a reasonable conclusion to draw from this analysis?
# World record times in the Mile have decreased linearly over the last several
#   decades for both mena and women.

######################################################################
## Draw Conclusions
######################################################################

########################################
## Write Your Conclusion
########################################

# Based on scatterplots of the men's and women's world record mile event,
# both of these events follow a strong, negative relationship over time.
# For both groups, the assumption of linearity appears to be satisfied.
# The men's world record mile time decreases by an average of .393 seconds
# per year, while the women's record distance decreases by an average of
# .973 seconds per year. Because the intercept estimate is the value of
# the record distance when year is equal to 0, it is not interpretable
# in the context of the problem. Both linear models fit the data sell,
# with R-squared values for the men's and women's models equal to .977
# and .896, respectively. For the men's world record, 97.7% of the variance
# is explained by the linear mdoel of year, while for the female world record,
# 89.6% of the variance in performance can be explained by the linear model
# of year.

################################################################################