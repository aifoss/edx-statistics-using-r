################################################################################
## Source: edX
## Series: Foundations of Data Analysis
## Course: 1 Statistics Using R
## Week: Week 4
## Topic: Bivariate Distributions (Categorical Data)
## File: week-04-quiz.R
## Date: 2016-03-14
################################################################################


################################################################################
## The Contingency Table
################################################################################

## Here is data from a research study on the relationship between sex
##  and fear of heights.

##                                      Men     Women   Total
## Expressed fear of heights            68      109     177
## Did not express fear of heights      94      89      183
##                                      162     198     360

men_fear <- 68
women_fear <- 109
men_no_fear <- 94
women_no_fear <- 89
fear <- men_fear + women_fear
no_fear <- men_no_far + women_no_fear
men <- men_fear + men_no_fear
women <- women_fear + women_no_fear
total <- fear + no_fear

## 1) What fraction represents the proportion of people in the study
##      that were afraid of heights?

fear / total 

## 2) How many simple events (outcomes) were possible for participants
##      in this study?

4

## 3) Of those participants that were afraid of heights, what percentage
##      were men? (Round to 1 decimal place with no % sign.)

round((men_fear/fear)*100, 1)

## 4) What percentage of women were afraid of heights? (Round to 1 decimal
##      place with no % sign.)

round((women_fear/women)*100, 1)

## 5) What percentage of all participants were not afraid of heights?
##      (Round to 1 decimal place with no % sign.)

round((no_fear/total)*100, 1)

## 6) A contingency table is used to simultaneously display counts of

## two categorical variables.

################################################################################
## Independence & Conditional Probability
################################################################################

## Below is a contingency table showing data from a University of Texas
##  Southwestern Medical Center study on Hepatits C.

##                  Tattoo in Parlor    Tattoo Elsewhere    No Tattoo   Total 
## Hepatitis C      17                  8                   18          43
## No Hepatitis C   35                  53                  495         583
## Total            52                  61                  513         626

TP_H <- 17
TP_NH <- 35
TP_Total <- TP_H + TP_NH
TE_H <- 8
TE_NH <- 53
TE_Total <- TE_H + TE_NH
NT_H <- 18
NT_NH <- 495
NT_Total <- NT_H + NT_NH
H_Total <- TP_H + TE_H + NT_H
NH_Total <- TP_NH + TE_NH + NT_NH
Total <- H_Total + NH_Total

## 1) How many simple events (outcomes) were possible for participants
##      in this study?

6

## 2) What was the total number of participants in this study?

Total

## 3) What was the marginal distribution for Hepatitis status in this study?

cat("Hepatitis:")
cat(H_Total)
cat("No Hepatitis:")
cat(NH_Total)

## 4) Overall, what percentage of participants had a tattoo?
##      (Round to 1 decimal place and do not include % sign.)

round(((TP_Total+TE_Total)/Total)*100, 1)

## 5) What percentage of those participants with Hepatitis C had a tattoo
##      done in a commercial parlor? (Round to 1 decimal and do not include
##      % sign.)

round((TP_H/H_Total)*100, 1)

## 6) What percentage of those who had a tattoo done in a commercial parlor
##      have Hepatitis C? (Round to 1 decimal and do not include % sign.)

round((TP_H/TP_Total)*100, 1)

## Calculate the probability that a randomly selected participant from the study
##      would have Hepatitis C:
##  P(Hepatitis) = outcomes with Hepatitis / total outcomes in sample space
##               = A/B
##               = C

## 7) What is the value of A?

H_Total

## 8) What is the value of B?

Total

## 9) What is the value of C, the probability of randomly selecting a participant
##      with Hepatitis? (Round to 3 decimal places.)

round(H_Total/Total, 3)

## 10) In general, what must be true of P(A)?

## It must be between the values of 0 and 1, inclusive.

################################################################################
## Graphing the Contingency Table
################################################################################

## Is there an association between car color and marital status?
## Below are data collected to address this question.

##              Red     Black/White/Silver      Other
## Married      40      22                      19
## Unmarried    45      10                      12

red_married <- 40
red_unmarried <- 45
red <- red_married + red_unmarried
mono_married <- 22
mono_unmarried <- 10
mono <- mono_married + mono_unmarried
other_married <- 19
other_unmarried <- 12
other <- other_married + other_unmarried
married <- red_married + mono_married + other_married
unmarried <- red_unmarried + mono_unmarried + other_unmarried
total <- married + unmarried

## Using the contingency table above, solve for each of the following
##  probabilities. (Report as proportions rounded to 3 decimal places.)

## 1) P(black/white/silver)

round(mono/total, 3)

## 2) P(married)

round(married/total, 3)

## 3) P(unmarried and black/white/silver)

round(mono_unmarried/total, 3)

## 4) P(red | married)

round(red_married/married, 3)

## 5) P(married | red)

round(red_married/red, 3)

## 6) What ratio would you use to solve for P(red | unmarried)
##      using the contingency table?

red_unmarried/unmarried
## 45/67

## Now solve for P(red | unmarried) using the formula below.
## (Probabilities should be reported as proportions rounded to 3 decimal places.)

## P(A|B) = P(A^B) / P(B)
## P(A^B) = X
## P(B) = Y
## P(A|B) = Z

## 7) X

X <- round(red_unmarried/total, 3)
X

## 8) Y

Y <- round(unmarried/total, 3)
Y

## 9) Z

Z <- round(X/Y, 3)
Z

## Using the above formula, solve for these three values.
## (Report each as a proportion rounded to 3 decimal places.)

## 10) P(red)

round(red/total, 3)

## 11) P(red | married)

round(red_married/married, 3)

## 12) P(red | unmarried)

round(red_unmarried/unmarried, 3)

## 13) If car color and marital status are independent, what should be true?

## P(red) = P(red|married)

## 14) Do car color and marital status appear to be independent?

## No, because the probability of having a red car is different 
##      for married and unmarried people, though the difference is small.

################################################################################