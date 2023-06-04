setwd("C:/Users/mmm/Downloads/Telegram Desktop/dr hamada/New folder (2)/labs")
getwd()
Data <- read.csv('G2_anthropometry.csv')
str(Data)
summary(Data)

# converting gender value "cm" into "M"

# converting gender value "M" into "1"

# converting gender value "F" into "2"

Data[ Data$gender == 'M', 'gender'] = '1'
Data[ Data$gender == 'F', 'gender'] = '2'


# converting gender column into a vector

gender = Data$gender
class(gender)
gender = factor(gender)
summary(gender)
Data$gender = gender
Data
levels(Data$gender) <- c("Male","Female" )


#removing " cm" from height column and converting it into numeric datatype

Data$height = gsub(" cm","",Data$height)
class(Data$height)
Data$height = as.numeric(Data$height)
Data$age
?mice
# rounding the values of age

for (val in 1:length(Data$age))
  Data$age[val] = round(Data$age[val])

Data$age


# filling missing values in foot_length variable

complete.cases(Data)
Data[!complete.cases(Data), ]

install.packages("mice")
library(mice)

Pre.imputation <- mice(Data , m = 5, meth = c("pmm"), maxit = 20)
Pre.imputation$imp
Data <- complete(Pre.imputation, 5)

# Data visualization

install.packages("tidyverse")
library(tidyverse)
library(ggplot2)
draw1 <- ggplot(Data)
draw1 <- ggplot(Data, aes(x=foot_length, y=height))
draw1
draw1 + geom_point()

# barchart

draw_bar <- ggplot(Data, aes(x=gender, fill = gender))
draw_bar + geom_bar()


#scatter plot
ggplot(Data, aes(height, age)) +geom_point()




















