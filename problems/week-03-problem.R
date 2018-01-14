################################################################################
## Source: edX
## Series: Foundations of Data Analysis
## Course: 1 Statistics Using R
## Week: Week 3
## Topic: Bivariate Distributions
## File: week-03-problem.R
## Date: 2016-02-21
################################################################################


################################################################################
## Question Set 1
################################################################################

# During a professional bull-riding event, riders usually attempt to ride
# a bull three or more times. This means that they can record a "ride"
# (successfully staying on the bull) multiple times in the same event.

# 1. Subset the dataset for riders that had at least 1 ride in the 2014 season.
#       Call this dataset new_bull.
library(SDSFoundations)
bull <- BullRiders
new_bull <- bull[bull$Rides14 > 0, ]

# 2. Create a new variable or vector for he average number of rides per event
#       for each bull rider in the new_bull dataset.
rides_per_event <- new_bull$Rides14 / new_bull$Events14

# 3. Make a histogram of your "rides per event" variable and find the five-number
#       summary for your "rides per event" variable.
hist(rides_per_event)
fivenum(rides_per_event)

# 1a. What is the minimum value?
# 0.20
round(min(rides_per_event), 2)

# 1b. What is the median?
# 1
median(rides_per_event)

# 1c. What is the maximum value?
# 2
round(max(rides_per_event), 2)

# 1d. Create a scatterplot of "rides per event" and yearly rankning (defined by
#       "Rank14" variable) and add a line of best fit. Which of the following
#       best describe the relationship between these two variables?
# The two variables have a negative linear relationship.
plot(rides_per_event, new_bull$Rank14)
abline(lm(new_bull$Rank14 ~ rides_per_event), col="blue")

# 1e. What is the correlation coefficient for rides per event and yearly ranking?
# -0.495
round(cor(rides_per_event, new_bull$Rank14), 3)

# 1f. Suppose that college GPA and graduate school GPA have a correlation
#       coefficient of 0.75. Based on this, what proportion of variation 
#       in graduate school GPS is left unexplained after taking college GPA
#       into account?
# 0.4375
r_squared <- 0.75 * 0.75
round(1-r_squared, 4)

################################################################################
## Question Set 2
################################################################################

# Using the dataset below, find the correlation coefficient between time spent
#   studying and exam grade.
minutes_spent <- c(30, 45, 180, 95, 130, 140, 30, 80, 60, 110, 0,  80)
exam_grade    <- c(74, 68, 87,  90, 94,  84,  92, 88, 82, 93,  65, 90)
df <- data.frame(minutes_spent = minutes_spent, exam_grade = exam_grade)

# 2a. What is the correlation coefficient based on the data?
# 0.597
cor <- cor(df$minutes_spent, df$exam_grade)
round(cor, 3)

# 2b. Approximately what percentage of the variation in exam scores can be
#       explained by the amount of time that each student studied?
# 36
r_squared <- cor ^ 2
percentage <- round(r_squared * 100, 0)

# 2c. Create a scatterplot of the data (exam grades and time spent studying).
#       What is the value of the outlier (the student that got a high grade
#       but didn't study very long)?
# X = 30
# Y = 92
plot(df$minutes_spent, df$exam_grade)

# 2d. When the outlier is removed, what is the new value or r?
# 0.737
outlier_index <- which(df$minutes_spent == 30 & df$exam_grade == 92)
new_df <- df[-outlier_index, ]
new_cor <- cor(new_df$minutes_spent, new_df$exam_grade)
round(new_cor, 3)

# 2e. How did the outlier impact our efforts to assess the relationship
#       between time spent studying and exam grades?
# The outlier caused the relationship to look weaker than it really is.

################################################################################