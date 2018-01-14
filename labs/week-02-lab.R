################################################################################
## Source: edX
## Series: Foundations of Data Analysis
## Course: 1 Statistics Using R
## Week: Week 2
## Topic: Univariate Descriptive Statistics
## File: week-02-lab.R
## Date: 2016-02-13
################################################################################


################################################################################
## Lab 2: Austin Animal Shelter Data
################################################################################

######################################################################
## Primary Research Question:
## Compare the weights of adult cats and dogs at the shelter.
## How typical would it be to find a 13-pound cat?
## What about 13-pound dog?
######################################################################

######################################################################
## Reflect on the Question
######################################################################

########################################
## Review of Descriptive Statistics
########################################

# 1a. Descriptive statistics can tell us:
# what the distribution of a variable looks like.

# 1b. Which of the following are examples of descriptive statistics?
# The mean and standard deviation of a distribution.

# 2. Selec the question that can be answered with descriptive statistics.
# How much do adult cats and dogs at the shelter weigh?

######################################################################
## Analyze the Data
######################################################################

library(SDCFoundations)
animal_data <- AnimalData

adults <- animal_data[animal_data$Age.Intake >= 1, ]
summary(adults$Animal.Type)

cats <- adults[adults$Animal.Type=="Cat",]
dogs <- adults[adults$Animal.Type=="Dog",]

hist(cats$Weight,
     main="Cat Weights",
     xlab="Weight")
hist(dogs$Weight,
     main="Dog Weights",
     xlab="Weight")

# 1a. How many adult dogs are in the shelter?
dim(dogs)[1]

# 1b. How many adult cats are in the shelter?
dim(cats)[1]

# 2a. What is the shape of the distribution of weight for adult dogs?
# positively skewed

# 2b. What is the shape of the distribution of weight for adult cats?
# approximately normal

# 3a. Which measure of center should be used to describe the average weight
#       of the adult cats?
# mean

# 3b. Average adult cat weight in pounds
fivenum(cats$Weight)
mean_cat_wgt <- mean(cats$Weight)
round(mean_cat_wgt, 1)

# 4. What is the standard deviation for the weight of the adult cats?
sd_cat_wgt <- sd(cats$Weight)
round(sd_cat_wgt, 2)

# 5. What is the z-score of a 13-pound adult cat?
z_cat <- (13-mean_cat_wgt) / sd_cat_wgt
round(z_cat, 1)

# 6. Which of these best describes the location of a 13-pound adult cat
##      in the shelter distribution?
# More than 2 standard deviations above the mean.

# 7. What proportion of adult cats weigh more than 13 pounds, according to your data?
#       Use the following code to answer this question: 1-pnorm(z_cat).
round(1-pnorm(z_cat), 3)

# 8a. What quantile would contain a 13-pound adult dog?
fivenum(dogs$Weight)
# first

# 8b. What percentage of adult dogs in the shelter weigh more than 13 pounds?
# approximately 75%

######################################################################
## Draw Conclusions
######################################################################

########################################
## Write Your Conclusion
########################################

sd_2_below_cat <- mean_cat_wgt - (2 * sd_cat_wgt)
round(sd_2_below_cat, 1)
sd_2_above_cat <- mean_cat_wgt + (2 * sd_cat_wgt)
round(sd_2_above_cat, 1)

median(cats$Weight)

# The distribution of adult cats in the shelter is roughly symmetric 
# with a mean of 8.6 pounds and a standard deviation of 1.9 pounds.
# About 95% of adult cats at the shelter weight between 4.8 and 12.4 pounds,
# with a median of 35.3 pounds and an IQR of 40.4 pounds.
# Half of the dogs at the shelter do weigh much more, including one that weighs 131.
# As the two distributions are to be compared, and one distribution is skewed,
# the data shows that the median weight for both groups is 8.5 for cats and 35.3 for dogs.
# A 13-pound cat would not be typical at the shelter.
# On the other hand, about 75% of all dogs at the shelter weigh more than 13 pounds.
# Overall, the distributions of weights for adult cats and adult dogs at the shelter
# differ both in shape and in measures of center and spread.
# Cats generally weigh less and have less variation in their weights than dogs,
# while dogs tend to weigh more and have more variability.

################################################################################