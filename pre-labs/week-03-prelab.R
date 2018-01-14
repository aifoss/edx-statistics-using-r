################################################################################
## Source: edX
## Series: Foundations of Data Analysis
## Course: 1 Statistics Using R
## Week: Week 3
## Topic: Bivariate Distributions
## File: week-03-prelab.R
## Date: 2016-02-21
################################################################################


################################################################################
## Lab 3: Professional Bull Riding
################################################################################

############################################################
## Primary Research Question:
## For the 2013 season, is there a linear relationship
## between how often a rider placed in the Top 10
## and the number of times he stayed on his bull
## for a full 8 seconds?
############################################################

######################################################################
## Reflect on the Question
######################################################################

########################################
## Check the Data
########################################

library(SDSFoundations)
bull <- BullRiders

# 1a. How many observations are in the dataset?
dim(bull)[1]

# 1b. How many of the first 10 riders in the dataset have been pro for 10 years
#   or more?
first_10 <- bull[1:10, ]
pro_10 <- first_10[which(first_10$YearsPro >= 10), ]
dim(pro_10)[1]

# 1c. Of the top 15 riders so far in 2015, how many rides were completed
#   by the rider with the fewest buck-outs in 2014?
top_15 <- bull[which(bull$Rank15 <= 15), ]
sorted <- top_15[order(top_15$BuckOuts14), ]
fewest_buckout_rider <- sorted[1,]
num_rides <- fewest_buckout_rider$Rides14
num_rides

########################################
## Check the Variables of Interest
########################################

# 2a. Which variable tells us how many times the rider has placed in the Top 10
#   at the end of the 2013 season? 
# Top10_13

# 2b. What type of variable is this?
# Numerical

# 2c. Which variable tells us the number of times a rider stayed on his bull
#   for the full 8 seconds in 2013?
# Rides13

# 2d. What type of variable is this?
# Numerical

########################################
## Reflect on the Method
########################################

# 3. We will use correlation to answer this lab question. Why?
# We want to explore a linear relationship bewteen two quantitative variables.

# 4. We should generate a scatterplot of these two variables before we continue
#   our analysis. Why?
# We want to confirm that the relationship is linear.

######################################################################
## Analyze the Data
######################################################################

########################################
## Break Down Your Analysis
########################################

# 1. Create a subset of the data which contains only those riders that have
#       participated in at least one event in 2013.
new_bull <- bull[bull$Events13 > 0, ]

# 2. Create a scatterplot of the two variables of interest.

# visualize and describe the first variable of interest
hist(new_bull$Rides13)
fivenum(new_bull$Rides13)
mean(new_bull$Rides13)
sd(new_bull$Rides13)

# visualize and describe the second variable of interest
hist(new_bull$Top10_13)
fivenum(new_bull$Top10_13)
mean(new_bull$Top10_13)
sd(new_bull$Top10_13)

# create a scatterplot
plot(new_bull$Rides13, new_bull$Top10_13)

# 3. Check to see that the relationship is linear.
#       Plot a line of best fit as a guide.
abline(lm(new_bull$Top10_13 ~ new_bull$Rides13), col="blue")

# 4. Is the relationship is linear, calculate the correlation coefficient.
cor(new_bull$Rides13, new_bull$Top10_13)

# 5. Carefully examine any outliers.

# 6. Interpret what the correlation says about the linear relationship
#       between these variables.
vars <- c("Top10_13", "Rides13")
cor(new_bull[, vars])

########################################
## Conduct Analysis in R
########################################

# What do the histogram and descriptive statistics tell us 
#   about the distribution of the Rides13 variable?

# 1a. On average, a bull rider in 2013 has how many rides?
#       (Report the median as the histogram is not symmetrical.)
median(new_bull$Rides13)

# 1b. These bull riders made it into the Top 10 an average of ___ times in 2013.
#       (Hint: Remember again that the histogram is not symmetrical.)
median(new_bull$Top10_13)

# What does the scatterplot show us?

# 2a. The relationship looks ___, ____, and ____.
# linear, moderately strong, positive

# 2b. It looks like bull riders that appear frequently in the Top 10 list
#       tend to have a ___ number of successful rides.
# higher

# 3a. The correlation, rounded to three decimal places, between the number
#       of Top 10 appearances and the number of successful rides for 2013 is
round(cor(new_bull$Rides13, new_bull$Top10_13), 3)

# 3b. How many times does this value appear in the correlation matrix?
# 2

# 4. On the scatterplot, we see a datapoint with a fairly large residual.
#       This rider has 22 rides, but he only placed in the Top 10 two times.
#       This rider's data point falls ___ the line of best fit.
#       If his data followed the line of best fit, he should have placed
#       in the Top 10 about ___ times.
plot(new_bull$Rides13, new_bull$Top10_13)
abline(lm(new_bull$Top10_13 ~ new_bull$Rides13), col="red")
# below, 6

# 5. After looking at the data for this rider, can you explain why he has placed
#       in the Top 10 so few times?
new_bull[which(new_bull$Top10_13 == 2 & new_bull$Rides13 == 22), ]
# His rider percentage was only 33%, which wasn't high enough to place him
#   in the Top 10.

######################################################################
## Draw Conclusions
######################################################################

########################################
## Write Your Conclusion
########################################

# There is a strong positive linear relationship between the number of
# 8-second rides a bull rider completed and the total number of times
# he made it in the Top 10 after the 2013 season (r = .917).
# The avarage numer of rides for these bull riders was around 19.
# There were no significant outliers.
# One rider appeared to have placed in the top-10 rankings only twice,
# despite an above-average number of rides.
# Upon closer inspection, we could see that he did not have a very high
# ride percentage which might account for his few appearances in the Top 10.

################################################################################