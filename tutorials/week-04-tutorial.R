################################################################################
## Source: edX
## Series: Foundations of Data Analysis
## Course: 1 Statistics Using R
## Week: Week 4
## Topic: Bivariate Distributions (Categorical Data)
## File: week-04-tutorial.R
## Date: 2016-03-14
################################################################################


################################################################################
## Table Proportions
################################################################################

library(SDSFoundations)

acl <- AustinCityLimits

grammy_table <- table(acl$Grammy)
grammy_table
prop.table(grammy_table) # proportions

gg_table <- table(acl$Grammy, acl$Gender)
gg_table
prop.table(gg_table)
prop.table(gg_table, 1) # by row
prop.table(gg_table, 2) # by column

################################################################################
## Grouped Bar Charts
################################################################################

barplot(grammy_table,
        main="ACL Grammy Winners",
        xlab="Grammy Winner",
        ylab="Counts")

barplot(gg_table,
        main="ACL Grammy Winners by Gender",
        xlab="Gender",
        ylab="Counts",
        beside=T,
        legend=T)

barplot(prop.table(gg_table,2))

################################################################################