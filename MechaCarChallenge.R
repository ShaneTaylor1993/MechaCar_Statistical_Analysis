library(dplyr)
library(tidyverse)

options("scipen"=100, "digits"=7)

#Creating Dataframe
MechaCar_mpg_df <- read.csv(file='MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)
head(MechaCar_mpg_df)

#Performing Linear Regression
lm_MecharCar_mpg <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=MechaCar_mpg_df)
lm_MecharCar_mpg

#Using summary() to determine p-value and r-squared value of the linear regression model
summary_lm_MecharCar_mpg <- summary(lm_MecharCar_mpg)
summary_lm_MecharCar_mpg