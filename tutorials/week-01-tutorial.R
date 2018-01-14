################################################################################
## Source: edX
## Series: Foundations of Data Analysis
## Course: 1 Statistics Using R
## Week: Week 1
## Topic: Introduction to Data
## File: week-01-tutorial.R
## Date: 2016-02-06
################################################################################

################################################################################

data(mtcars)

View(mtcars)
str(mtcars)

table(mtcars$cyl)

mtcars[2,5]
mtcars[,5]

mtcars$cyl == 8
cyl8 <- mtcars[mtcars$cyl==8, ]
cyl8
cyl8mpg <- mtcars$mpg[mtcars$cyl==8]
cyl8mpg

mean(cyl8mpg)

################################################################################