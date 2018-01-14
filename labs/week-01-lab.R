################################################################################
## Source: edX
## Series: Foundations of Data Analysis
## Course: 1 Statistics Using R
## Week: Week 1
## Topic: Introduction to Data
## File: week-01-lab.R
## Date: 2016-02-06
################################################################################


################################################################################
## Lab 1: Cycling in Austin
################################################################################

library(SDSFoundations)

bike <- BikeData
males <- bike[bike$gender=='M',]
male_times <- males$time
mean(male_times)

# How many daily riders are in the dataset and what is their average age?
daily_riders <- bike[bike$cyc_freq=='Daily',]
daily_rider_ages <- daily_riders$age
mean(daily_rider_ages)

############################################################
## Primary Research Question:
## How many of the cyclists rode daily, 
## how many of these riders were male and how many female, 
## and what what were their average ages?  
############################################################

############################################################
## Analysis Steps:

## 1. Make a table to show how many daily riders are in the original dataset.
cyc_freq_table <- table(bike$cyc_freq)
cyc_freq_table

## 2. Create a new datafile that includes only the daily riders.
daily_riders <-  bike[bike$cyc_freq=='Daily',]

## 3. Make a table to show the number of male and female daily riders.
gender_freq_table <- table(daily_riders$gender)
gender_freq_table

## 4. Make a vector of the ages of these daily riders.
daily_rider_ages <- daily_riders$age

## 5. Find the mean age for men and for women daily riders.
mean(daily_rider_ages)
############################################################

############################################################
## Analysis Questions:

## How many daily riders are in the dataset?
cyc_freq_table['Daily']

## How many of the daily riders are male?
gender_freq_table['M']

## What is the average age of daily riders?
mean(daily_rider_ages)

## What is the average age of the female daily riders?
female_daily_riders <- bike[bike$gender=='F' & bike$cyc_freq=='Daily',]
female_daily_rider_ages <- female_daily_riders$age
mean(female_daily_rider_ages)

## What is the average age of the male daily riders?
male_daily_riders <- bike[bike$gender=='M' & bike$cyc_freq=='Daily',]
male_daily_rider_ages <- male_daily_riders$age
mean(male_daily_rider_ages)

## How many daily male riders are age 30 or older?
age_30_or_older <- male_daily_riders[male_daily_riders$age >= 30, ]
nrow(age_30_or_older)

################################################################################