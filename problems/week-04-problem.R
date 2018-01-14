################################################################################
## Source: edX
## Series: Foundations of Data Analysis
## Course: 1 Statistics Using R
## Week: Week 4
## Topic: Bivariate Distributions (Categorical Data)
## File: week-04-problem.R
## Date: 2016-03-14
################################################################################


################################################################################
## Question Set 1
################################################################################

# You want to see if an artist's popularity on Facebook (whether or not
# they have 100,000 or more likes) has anything to do with their age.

# 1. Generate a table to show the number of artists that are "popular"
#       and those that are not.
library(SDSFoundations)
acl <- AustinCityLimits
popularity <- table(acl$Facebook.100k)
popularity

# 2. Generate a table to show the number of "popular" artists 
#       within each age group.
twoway <- table(acl$Facebook.100k, acl$Age.Group)
twoway

# 1a. How many artists in the dataset have 100,000 or more likes on Facebook?
# 85

# 1b. Which age group has the highest number of artists that have 100,000
#       or more likes on Facebook?
# Thirties

# 1c. For each age group, fill in the proportion of artists who have 100,000
#       or more likes on Facebook.
prop.table(twoway, 2)

# Twenties
# 0.786

# Thirties
# 0.775

# Forties
# 0.800

# Fifties or Older
# 0.594

################################################################################