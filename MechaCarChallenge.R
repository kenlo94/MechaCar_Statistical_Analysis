#Deliverable 1

# load dplyr package
library(dplyr)

# read file
MechaCarData <- read.csv(file='MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)

# perform linear regression
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=MechaCarData)

# perform summary
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=MechaCarData))


#Deliverable 2

# read file
SuspensionData <- read.csv(file='Suspension_Coil.csv',check.names=F,stringsAsFactors = F)

# get a total summary
SuspensionSummary <- SuspensionData %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI))

# get the lot summary
SuspensionLot_S <- SuspensionData %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI), .groups = 'keep')


#Deliverable 3

# perform t-test on all lots
t.test(SuspensionData$PSI,mu = 1500)

# perform t-test on Lot 1
t.test(subset(SuspensionData,Manufacturing_Lot=="Lot1")$PSI,mu = 1500)

# perform t-test on Lot 2
t.test(subset(SuspensionData,Manufacturing_Lot=="Lot2")$PSI,mu = 1500)

# perform t-test on Lot 3
t.test(subset(SuspensionData,Manufacturing_Lot=="Lot3")$PSI,mu = 1500)