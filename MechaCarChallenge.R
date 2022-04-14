library(dplyr)
library(tidyverse)

#Removing scientific notation
options("scipen"=100, "digits"=7)

#Reading Data and Creating Dataframe
MechaCar_mpg_df <- read.csv(file='MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)
head(MechaCar_mpg_df)

#Performing Linear Regression
lm_MecharCar_mpg <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=MechaCar_mpg_df)
lm_MecharCar_mpg

#Using summary() to determine p-value and r-squared value of the linear regression model
summary_lm_MecharCar_mpg <- summary(lm_MecharCar_mpg)
summary_lm_MecharCar_mpg

#Reading data and Creating Dataframe
Suspension_Coil_df <- read.csv(file='Suspension_Coil.csv',stringsAsFactors = F)
head(Suspension_Coil_df)

#Using summarize() to get the summary statistics
total_summary <- summarize(Suspension_Coil_df, Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI))
total_summary

#Summary statistics for each lot
lot_summary <- Suspension_Coil_df %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI), .groups = 'keep')
lot_summary

#Creating sample for t.test
sample_table <- Suspension_Coil_df %>% sample_n(50)
head(sample_table)

#Performing t.test sample of all lots
t.test(sample_table$PSI,mu=1500)

#Performing t.test on Lot 1
t.test(subset(Suspension_Coil_df$PSI,Suspension_Coil_df$Manufacturing_Lot=="Lot1"),mu=1500)

#Performing t.test on Lot 2
t.test(subset(Suspension_Coil_df$PSI,Suspension_Coil_df$Manufacturing_Lot=="Lot2"),mu=1500)

#Performing t.test on Lot 3
t.test(subset(Suspension_Coil_df$PSI,Suspension_Coil_df$Manufacturing_Lot=="Lot3"),mu=1500)