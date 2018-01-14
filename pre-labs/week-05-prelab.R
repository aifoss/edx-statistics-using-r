################################################################################
## Source: edX
## Series: Foundations of Data Analysis
## Course: 1 Statistics Using R
## Week: Week 5
## Topic: Linear Functions
## File: week-05-prelab.R
## Date: 2016-03-14
################################################################################


################################################################################
## Lab 5: Track and Field World Records
################################################################################

############################################################
## Primary Research Question:
## How has the men's shotput world record changed over time?
## What about the women's world record?
############################################################

######################################################################
## Reflect on the Question
######################################################################

########################################
## Check the Data
########################################

library(SDSFoundations)
wr <- WorldRecords

# 1a. How many different types of events (e.g., "Mens 100m", "Womens shotput", etc.)
#       are represented in the dataset?
length(unique(wr$Event))

# 1b. In what year did Usain Bolt first break the world record 
#       for the men's 100m dash?
usain_bolt <- subset(wr, Athlete=="Usain Bolt")
usain_bolt$Year

# 1c. Who was the first woman to break the women's 1 mile world record
#       with a time of less than 260 seconds?
womens_mile <- subset(wr, Event=="Womens Mile")
library(dplyr)
womens_mile_subset <- womens_mile %>%
    filter(Record < 260) %>%
    arrange(Year)
womens_mile_subset[1, "Athlete"]

########################################
## Check the Variables of Interest
########################################

# 2a. Which variable tells us the record setting time or distance?
# Record

# 2b. What type of variable is this?
# Quantitative

# 2c. Which variable tells us when the record was broken?
# Year

# 2d. What type of variable is this?
# Quantitative

########################################
## Reflect on the Method
########################################

# 3. For each sex, we will begin our analysis by generating a scatterplot
#       of shotput distance and year. Why?
# The scatterplot will show us if these two numeric variables are linearly
#   related.

# 4. What will we be able to determine once we fit a linear model
#       to this shotput world record data?
# We will be able to report the average rate of change in world record
#   shotput distance per year.

######################################################################
## Analyze the Data
######################################################################

########################################
## Break Down Your Analysis
########################################

# 1. Create a subset of the dataset that contains only the World Record cases 
#       for men’s shotput.
menshot <- wr[wr$Event=='Mens Shotput', ]

# 2. Create a subset that contains only the World Record cases 
#       for women's shotput. 
womenshot <- wr[wr$Event=='Womens Shotput', ]

# 3. Create a scatterplot of year and record shotput distance: 
#       one for men and one for women.  
plot(menshot$Year, menshot$Record,
     main='Mens Shotput World Records',
     xlab='Year',
     ylab='World Record Distance (m)',
     pch=16)

plot(womenshot$Year, womenshot$Record,
     main='Womens Shotput World Records',
     xlab='Year',
     ylab='World Record Distance (m)',
     pch=16)

# 4. Confirm from these plots that a linear model is appropriate.  

# 5. Run a linear model for each event and then interpret the results.
linFit(menshot$Year, menshot$Record)
linFit(womenshot$Year, womenshot$Record)

########################################
## Conduct Analysis in R
########################################

# 1a. How many records are in the menshot data frame?
dim(menshot)[1]

# 1b. How many records are in the womenshot data frame?
dim(womenshot)[1]

# 2a. Is a linear model appropriate for the men's shotput data?
# Yes

# 2b. Is a linear model appropriate for the women's shotput data?
# Yes

# What is the equation for the linear model that predicts the World Record
#       shotput distance for men?

# 3a. record distance = ____ + (____ * year)
# -243.3
# 0.134

# 3b. What is the value of R^2?
# 0.941

# What is the equation for the linear model that predicts the World Record
#       shotput distance for women?

# 4a. record distance = ____ + (____ * year)
# -440.3
# 0.234

# 4b. What is the value of R^2?
# 0.962

# 5. What can we say about the models for men and women?
# The rate of change is greater for women than for men.

######################################################################
## Draw Conclusions
######################################################################

########################################
## Write Your Conclusion
########################################

# Based on scatterplots of the men's and women's world record shotput distance,
# both of these events follow a strong, positive linear relationship over time.
# The men's world record distance increases by an average of 0.134 meters
# per year, while the women's record distance increases by an average of
# 0.234 meters per year. Because the itnercept estimate is the value of 
# the record distance when year is equal to 0, it is not interpretable
# in the context of the problem. Both linear models fit the data well,
# with R-squared values for the men's and women's models equal to 0.941
# and 0.962, respectively.

################################################################################