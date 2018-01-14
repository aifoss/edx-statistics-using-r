################################################################################
## Source: edX
## Series: Foundations of Data Analysis
## Course: 1 Statistics Using R
## Week: Week 2
## Topic: Univariate Descriptive Statistics
## File: week-02-quiz.R
## Date: 2016-02-13
################################################################################


################################################################################
# Twelve coworkers log their hours worked overtime in the past month:
# {10,   2,   6,   12,   14,   15,   15,   24,   15,   25,   3,   12}

overtimes <- c(10, 2, 6, 12, 14, 15, 15, 24, 15, 25, 3, 12)

# Q: What is the mean of the sample?
sum <- sum(overtimes)
n <- length(overtimes)
mean_actual <- sum / n
mean_actual

mean_expected <- mean(overtimes)
mean_expected

# Q: What is the standard deviation of the sample?

mean_diff <- overtimes - mean_actual
squared_mean_diff <- mean_diff * mean_diff
sum_of_squared_mean_diff <- sum(squared_mean_diff)
sum_of_squared_mean_diff_div_n <- sum_of_squared_mean_diff / (n-1)
sd_actual <- sqrt(sum_of_squared_mean_diff_div_n)
sd_actual

sd_expected <- sd(overtimes)
sd_expected

# Q: What is the 5-number summary for sample?
summary <- summary(overtimes)
summary

# min 
min <- summary[[1]]
min

# Q1
q1 <- summary[[2]]
q1

# Q2
q2 <- summary[[3]]
q2

# Q3
q3 <- summary[[5]]
q3

# max
max <- summary[[6]]
max

# Q: The mean number of overtime hours was?

mean <- summary[['Mean']]
mean

# Q: The median number of overtime hours was?

median <- summary[['Median']]
median

# Q: The ranges was?

range <- max - min
range

# Q: The IQR was?

iqr <- q3 - q1
iqr

# Q: What is the shape of this distrubtion of scores?

hist(overtimes)

################################################################################