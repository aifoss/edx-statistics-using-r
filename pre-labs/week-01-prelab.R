################################################################################
## Source: edX
## Series: Foundations of Data Analysis
## Course: 1 Statistics Using R
## Week: Week 1
## Topic: Introduction to Data
## File: week-01-prelab.R
## Date: 2016-02-06
################################################################################


################################################################################
## Lab 1: Cycling in Austin
################################################################################

library(SDSFoundations)

bike <- BikeData
View(BikeData)
str(BikeData)

# What is the age of 7th rider?
print(bike[7,2])

# How many of the first 10 bikers ride daily?
riders <- subset(bike, user_id <= 10)
print(sum(riders$cyc_freq=='Daily'))

# What is the speed of first female biker who rides less than once a month?
females <- bike[bike$gender=='F' & bike$cyc_freq=='Less than once a month',]
print(females[1,9])

############################################################
## Primary Research Question:
## How many of the cyclists were students,
## how often did they ride,
## and what was the average distance they rode?
############################################################

############################################################
## Analysis Steps:

## 1. Find the number of students in the dataset.
table(bike$student)

## 2. Pull out the student data into a separate dataframe for analysis.
student <- bike[bike$student==1, ]

## 3. Make a table to find how often the students ride.
table(student$cyc_freq)

## 4. Find the average distance ridden.
distance <- student$distance
distance
mean(distance)
############################################################

############################################################
## Analysis Questions:

# How many students are in the dataset?
nrow(student)

# How many variables are in the new dataframe "student"?
ncol(student)

# We want to know how often the students ride.
# What is the most frequently observed response?
freq_table <- table(student$cyc_freq)
order(freq_table, decreasing=TRUE)
freq_table[1]
############################################################

################################################################################