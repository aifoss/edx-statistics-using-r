################################################################################
## Source: edX
## Series: Foundations of Data Analysis
## Course: 1 Statistics Using R
## Week: Week 6
## Topic: Exponential and Logistic Function Models
## File: week-06-quiz.R
## Date: 2016-03-15
################################################################################


################################################################################
## Exponential Growth and Decay
################################################################################

# 1. What is the growth factor in each of the following scenarios?
#       (Assume time is measured in the units given; round answers to 2 decimal
#       places.)

# 1a. Water usage is increasing by 3% per year.
# 1.03

# 1b. A city grows by 28% per decade.
# 1.28

# 1c. A diamond mine is depleted by 1% per day.
# 0.99

# 1d. A forest shrinks 80% per century.
# 0.20

# 2. The amount (in milligrams) of a drug in the body t hours after taking a pill
#       is given by:
#       A(t) = 25(0.85)^t

# 2a. What is the initial dose given (in milligrams)?
# 25

# 2b. What percent of the drug leaves the body each hour?
# 15

# 2c. What is the amount of the drug left after 10 hours?
round(25*(0.85)^10, 2)

# 3. If the population grows by 10 people per year, what is the formula
#       for the population, P, at time t?
# P(t) = 100 + 10t

# 4. If the population grows by 10% each year, what is the formula
#       for the population, P, at time t?
# P(t) = 100(1.10)^t

# 5. Which scenario will result in a larger population in 10 years?
#       a. 10% growth per year
#       b. an increase of 10 people per year
# a.

################################################################################
## The Logistic Growth Model
################################################################################

# 1. The spread of this season's flu virus can be modeled logistically.
#       A group of 500 people were initially infected in a town of 75,000 people.
#       One month later, 750 people were infected.
#       Use this data to construct a logistic growth model for the spread
#       of the flu in this town and answer the following questions.
#   f(t) = C / (1 + ab^-t)

# 1a. What is the value of C?
# 75,000

# 1b. Using the value of C determined in the previous question, what is the value
#       of a, if you know that f(0) = 500? (Round to a whole number.)
# C / (a+1) = 500
# a+1 = C / 500 = 75000/500 = 150
# a = 149

# 1c. Using the values of a and C determined in the previous question,
#       what is the value of b, if you know that f(1) = 750?
#       (Round to 3 decimal places.)
# 750 = 75000 / (1 + 149 * 1/b)
# 1 + 149/b = 75000/750 = 100
# 149/b = 100 - 9 = 99
# b = 149/99
round(149/99, 3)

# 1d. The point that the model begins to show signs of slowing down
#       (or "flipping over") is called the
# inflection point

# 1e. Approximately how many people will have been infected with the flu
#       when growth begins to slow down?
# C/2 = 37500

################################################################################
## Solving for "t"
################################################################################

# log(ab) = log(a) + log(b)
# log(a/b) = log(a) - log(b)
# log(b**t) = t * log(b)

# 1. The tadpole population (in thousands) in a small pond is decreasing
#       according to the following equation:
#   Q(t) = 10(0.85)**t

# 1a. What is the initial population size at (t=0)?
# 10000

# 1b. What is the annual decay rate as a percent?
# 15

# 1c. How many tadpoles remain after 5 years have passed?
# Q(5) = 10(0.85)**5
round((10*(0.85)^5)*1000, 0)
# 4437

# 1d. How many years does it take for population to drop below 1,000?
# 10(0.85)**t = 1000
# (0.85)**t = 100
# t * log10(0.85) = log10(100) = 2
# t = 2 / log10(0.85) = 
for (t in 1:20) {
    cat(t)
    print(10 * (0.85)^t)
}
# 14.17    

################################################################################