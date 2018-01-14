################################################################################
## Source: edX
## Series: Foundations of Data Analysis
## Course: 1 Statistics Using R
## Week: Week 2
## Topic: Univariate Descriptive Statistics
## File: week-02-prelab.R
## Date: 2016-02-13
################################################################################


################################################################################
## Lab 2: Austin Animal Shelter Data
################################################################################

############################################################
## Primary Research Question:
## How many days do animals spend in the shelter
## before they are adopted?
############################################################

######################################################################
## Reflect on the Question
######################################################################

########################################
## Check the Data
########################################

library(SDSFoundations)
animal_data <- AnimalData

# 1a. How many variables are in the dataset?
dim(animal_data)[2]

# 1b. How many of the first 10 animals in the dataset were adopted?
first_10 <- animal_data[1:10, ]
summary(first_10$Outcome.Type)

# 1c. Was the first owner-surrendered animal in the dataset neutered?
surrendered <- subset(first_10, Intake.Type=="Owner Surrender")
first_surrendered <- surrendered[1,]
first_surrendered$Neutered.Status == "Neutered"

########################################
## Check the Variables of Interest
########################################

# 2a. What variable tells us the length of time an animal stayed in the shelter?
# Days.Shelter

# 2b. What type of variable is this?
# numerical

# 2c. What variable tells us if the animal was adopted?
# Outcome.Type

# 2d. What type of variable is this?
# categorical

########################################
## Reflect on the Method
########################################

# 3. We will use descriptive statistics to answer this question of interest. Why?
# We want to describe the distribution of a quantitative variable.

# 4. We should generate a histogram of the distribution before we calculate
#      descriptive measures of center and spread. Why?
# We need to check the shape of the distribution.

######################################################################
## Analyze the Data
######################################################################

########################################
## Break Down Your Analysis
########################################

# 1. Determine which animals in the dataset were adopted.
table(animal_data$Outcome.Type)
adopted <- animal_data[animal_data$Outcome.Type=="Adoption", ]
days_to_adopt <- adopted$Days.Shelter

# 2. Generate a histogram for the length of time these adopted animals were in the shelter.
hist(days_to_adopt)

# 3. Select the appropriate measure of center and spread to describe the distribution.
fivenum(days_to_adopt)
mean_days <- mean(days_to_adopt)
sd <- sd(days_to_adopt)

# 4. Identify which animal was an outlier on this particular variable.
max_idx <- which(animal_data$Days.Shelter==max(days_to_adopt))

########################################
## Conduct Analysis in R
########################################

# 1. How would you describe the shape of the distribution of days_to_adopt?
# positively skewed

# 2. Which measures of center and spread should you report for this data?
# median and IQR

# 3a. Center = ?
fivenum <- fivenum(days_to_adopt)
fivenum
center <- fivenum[3]
center

# 3b. Spread = ?
spread <- fivenum[4] - fivenum[2]
spread

# It looks like one adopted animal spent much more time in the shelter than the others.
# 4a. How many days was this animal in the shelter?
max_days <- animal_data[max_idx, ]$Days.Shelter

# 4b. What was the z-score for this particular animal?
z_score <- (max_days - mean_days) / sd
z_score

# 5. Why should we NOT report a z-score for this animal, 
# even though we can calculate one?
# The distribution is skewed.

######################################################################
## Draw Conclusions
######################################################################

########################################
## Write Your Conclusion
########################################

# On average, animals spent fewer than two weeks in the shelter before being adopted
# (median = 13 days, IQR = 30 days). The length of time was highly skewed to the right,
# however, The longest period of time an animal was in the shelter was 211 days
# before being atoped. This animal was a 2-year-old dog that entered the shelter injured.
# The middle 50% of the distribution were adopted beteween 8 and 38 days.

################################################################################