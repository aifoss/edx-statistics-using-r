################################################################################
## Source: edX
## Series: Foundations of Data Analysis
## Course: 1 Statistics Using R
## Week: Week 4
## Topic: Bivariate Distributions (Categorical Data)
## File: week-04-lab.R
## Date: 2016-03-14
################################################################################


################################################################################
## Lab 4: Austin City Limits
################################################################################

######################################################################
## Primary Research Question:
## Among male artists, is there an association between winning a Grammy
## and the genre of music that he plays?
######################################################################

######################################################################
## Reflect on the Question
######################################################################

########################################
## Review of Conditional and Marginal 
## Probability
########################################

# 1a. The probability that an event will occur, given that a different event
#       has also occurred, is known as:
# a conditional probability

# 1b. Which of the following must be true for two events, A and B, to be
#       considered independent?
# P(A) = P(A|B)

# 2. One of the following questions will be answered in this lab 
#       by comparing marginal and conditional probabilities.
#   Select the question that should be answered using this method:
# Among male artists, is there an association between winning a Grammy award
#   and the genre of music that you play?

######################################################################
## Analyze the Data
######################################################################

# 1. Subset the data (males only).
# 2. Create a table to show the marginal distributions for Genre and Grammy.
# 3. Create a contingency table to show the conditional distribution 
#       for Genre and Grammy.
# 4. Make a bar chart to better visualize how many artists in each Genre 
#       received a Grammy.
# 5. Calculate P(A):  the probability of winning a Grammy.
# 6. Calculate P(A|B): the probability of winning Grammy, given the artist's 
#       Genre.
# 7. Interpret what these probabilities tell us about the relationship 
#       between Genre and winning a Grammy.

library(SDSFoundations)
acl <- AustinCityLimits
males <- subset(acl, Gender=="M")

#####################
## Contingency Table
#####################

# 1. How many male artists won a Grammy?
grammy <- table(males$Grammy)
grammy
grammy[2]

# 2. How many male artists did not win a Grammy?
grammy[1]

# 3. Which genre had the greatest number of Grammy wins?
twoway <- table(males$Grammy, males$Genre)
twoway
barplot(twoway, legend=T, beside=T)

# 4. What is the probability that a randomly selected artist was a Grammy winner?
# (Report as a proportion rounded to 3 decimal places.)
grammy_winners <- subset(males, Grammy=="Y")
round(dim(grammy_winners)[1]/dim(males)[1], 3)

# 5. To determine the probability of winning a Grammy if the artist was
#       a singer-songwriter, you would divide ____ by ____. 
#       (Enter numerical values.)
# 2
# 7

# 6. To determine the probability that a randomly-selected Grammy winner
#       was a singer-songwriter, you would divide ____ by ____.
#       (Enter numerical values.)
# 2
# 35

#############################
## Conditional Probabilities
#############################

# What is the probability that a randomly selected male artist
#   from each of the following genres won a Grammy?
#   (Report as proportions rounded to 3 decimal places.)

prop.table(twoway, 2)

# 7a. Country?
# 0.636

# 7b. Jazz?
# 0.571

# 7c. Rock/folk/indie?
# 0.393

# 7d. Singer-songwriter?
# 0.286

# 7e. Our conclusion should be that winning a Grammy ____ independent of Genre.
# is not

######################################################################
## Draw Conclusions
######################################################################

########################################
## Write Your Conclusion
########################################

# There is an association between winning a Grammy and the Genre of music
# an artist plays. The probability of winning a Grammy, regardless of Genre,
# is 43.21%. However, examination of a contingency table containing both Grammy
# and Genre showed that the conditional probability of winning a Grammy changes
# by genre. If an artist is in the Country Genre, the conditional probability
# of winning a Grammy is 63.64%, while if an artist is in the Singer-Songwriter
# Genre, the conditional probability of winning a Grammy is 28.6%. Visual
# examination of the barplot shows the conditional probabilities of winning
# a Grammy are not equal across Genres.

################################################################################