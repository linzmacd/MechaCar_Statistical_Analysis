# Load dplyr package
library(dplyr)

# Deliverable 1: Linear Regression to Predict MPG
# Load mpg data
mpg <- read.csv(file="Resources/MechaCar_mpg.csv")

# Perform linear regression
lm_mpg <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data = mpg)

# Determine p-value and r-squared value
summary(lm_mpg)

# Deliverable 2: Summarize Coil Data
# Load suspension coil data
coil <- read.csv(file="Resources/Suspension_Coil.csv")

# Create a summary df of PSIs
total_summary <- coil %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI))

# Create a summary df of PSIs by Lot Number
lot_summary <- coil %>% 
  group_by(Manufacturing_Lot) %>% 
  summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI))

# Deliverable 3: T-Tests on Suspension Coils 
# Perform t-test on all samples
t.test(coil$PSI, mu=1500)

# Perform t-test on each lot of samples
lot1 <- subset(coil, Manufacturing_Lot=="Lot1")
lot2 <- subset(coil, Manufacturing_Lot=="Lot2")
lot3 <- subset(coil, Manufacturing_Lot=="Lot3")
t.test(lot1$PSI, mu=1500)
t.test(lot2$PSI, mu=1500)
t.test(lot3$PSI, mu=1500)
