################################################################################
## Source: edX
## Series: Foundations of Data Analysis
## Course: 1 Statistics Using R
## Week: Week 3
## Topic: Bivariate Distributions
## File: week-03-lab.R
## Date: 2016-02-21
################################################################################


################################################################################
## Lab 3: Professional Bull Riding
################################################################################

######################################################################
## Primary Research Question:
## In 2012, which variable had the strongest linear relationship
## with Earnings: Ride Percentage or Cup Points?
######################################################################

######################################################################
## Reflect on the Question
######################################################################

########################################
## Review of Correlation
########################################

# 1a. A correlation can tell us:
# the direction and strength of a linear relationship between two quantitative
#   variables

# 1b. Look at the scatterplot below. Select the answer that best describes
#       what would happen to the value of the correlation coefficient r[xy]
#       if the circled point were removed from the analysis.
# The value of r[xy] would increase.

# 2. One of the following questions will be answered in this lab using correlation.
#       Select the question that can be answered with correlation.
# Which variable has the strongest linear relationship with earnings:
#   successful ride percentage or Cup points?

######################################################################
## Analyze the Data
######################################################################

library(SDSFoundations)
bull <- BullRiders
new_bull12 <- bull[bull$Events12 > 0, ]

# Earnings Distribution

# 1a. What is the shape of the Earnings distribution for 2012?
# positively skewed
hist(new_bull12$Earnings12)

# 1b. What was the average amount earned by a bull rider?
# 147952
round(median(new_bull12$Earnings12), 0)

# 1c. What was the highest amount earned by a bull rider?
# 1464476
round(max(new_bull12$Earnings12), 0)

# Make a Scatterplot of Earnings and Ride Percentage
plot(new_bull12$RidePer12, new_bull12$Earnings12)

# 2a. Does the scatterplot show a linear relationship?
# Yes

# 2b. What is the correlation of Earnings with Ride Percentage for 2012?
# 0.593
round(cor(new_bull12$RidePer12, new_bull12$Earnings12), 3)

# Create a Scatterplot of Earnings and Cup Points
plot(new_bull12$CupPoints12, new_bull12$Earnings12)
abline(lm(new_bull12$Earnings12 ~ new_bull12$CupPoints12), col="blue")

# 3a. Does the scatterplot show a linear relationship?
# Yes

# 3b. What is the correlation of Earnings with Cup Points for 2012?
# 0.657
round(cor(new_bull12$CupPoints12, new_bull12$Earnings12), 3)

# Outliers and Influential Points

# identify specific case
outlier_index <- which(new_bull12$Earnings12 == max(new_bull12$Earnings12))

# 4a. The extreme earnings data point belonged to the rider that came in ____
#       place in 2012.
# first
new_bull12[outlier_index, "Rank12"]

# 4b. Where does this data point fall in the scatterplot?
# Above the line

# subset the data
no_outlier <- new_bull12[new_bull12$Earnings12 < 1000000, ]

# 4c. After removing the outlier, what was the new correlation of Earnings
#       and Ride Percentage of 2012?
# 0.804
round(cor(no_outlier$RidePer12, no_outlier$Earnings12), 3)
plot(no_outlier$Rides12, no_outlier$Earnings12)
abline(lm(no_outlier$Earnings12 ~ no_outlier$Rides12), col="blue")

# 4d. After removing the outlier, what was the new correlation of Earnings
#       and Cup Points of 2012?
# 0.893
round(cor(no_outlier$CupPoints12, no_outlier$Earnings12), 3)
plot(no_outlier$CupPoints12, no_outlier$Earnings12)
abline(lm(no_outlier$Earnings12 ~ no_outlier$CupPoints12), col="red")

# 4e. We would say that this data point was an influent point because it
# masked the strength of the relationships between Earnings
#   and the other variables

######################################################################
## Draw Conclusions
######################################################################

########################################
## Write Your Conclusion
########################################

# An initial examination of the relationships between Ride Percentage (RidePer)
# and Earnings, and Cup Points (CupPoints) and Earnings showed that Cup Points
# had the stronger relationship to Earnings. Ride Percentage and Earnings
# showed a correlation value of 0.593 while Cup POints and Earnings had
# a correlation value of 0.657. Visual examination showed an outlier
# in both relationships - a rider who has earned over 1 million dollars.
# Removal of this increased the initial relationship: Ride Percentage and
# Earnings now had a correlation value of 0.804 and Cup Points and Earnings
# had a correlation value of 0.893. Cup Points still had the higher relationship
# to Earnings. Visual examination showed a good linear relationship
# for both Ride Percentage and Cup Points, indicating the correct use
# of the correlation coefficient.

################################################################################