# Load dataset using read.csv
HeartRiskData <- read.csv("data/Heart_Attack_Risk_Levels_Dataset.csv", colClasses = c(
  Age = "numeric",
  Gender = "factor",
  Heart_rate = "numeric",
  Systolic_blood_pressure = "numeric",
  Diastolic_blood_pressure = "numeric",
  Blood_sugar = "numeric",
  CK_MB = "numeric",
  Troponin = "numeric",
  Result = "factor",
  Risk_Level = "factor"
))

# Preview structure and first few rows
str(HeartRiskData)
head(HeartRiskData)
View(HeartRiskData)

# Measures of Frequency
# Frequency count for categorical variables (e.g., Gender, Result, Risk_Level)
table(HeartRiskData$Gender)
table(HeartRiskData$Result)
table(HeartRiskData$Risk_Level)

# Measures of Central Tendency
# Mean, Median for numeric variables
mean(HeartRiskData$Age, na.rm = TRUE)
median(HeartRiskData$Age, na.rm = TRUE)

mean(HeartRiskData$Heart_rate, na.rm = TRUE)
median(HeartRiskData$Heart_rate, na.rm = TRUE)

mean(HeartRiskData$Systolic_blood_pressure, na.rm = TRUE)
median(HeartRiskData$Systolic_blood_pressure, na.rm = TRUE)

mean(HeartRiskData$Diastolic_blood_pressure, na.rm = TRUE)
median(HeartRiskData$Diastolic_blood_pressure, na.rm = TRUE)

mean(HeartRiskData$Blood_sugar, na.rm = TRUE)
median(HeartRiskData$Blood_sugar, na.rm = TRUE)

mean(HeartRiskData$CK_MB, na.rm = TRUE)
median(HeartRiskData$CK_MB, na.rm = TRUE)

mean(HeartRiskData$Troponin, na.rm = TRUE)
median(HeartRiskData$Troponin, na.rm = TRUE)

# Measures of Distribution
# Standard Deviation and Range for numeric variables
sd(HeartRiskData$Age, na.rm = TRUE)
sd(HeartRiskData$Heart_rate, na.rm = TRUE)
sd(HeartRiskData$Systolic_blood_pressure, na.rm = TRUE)
sd(HeartRiskData$Diastolic_blood_pressure, na.rm = TRUE)
sd(HeartRiskData$Blood_sugar, na.rm = TRUE)
sd(HeartRiskData$CK_MB, na.rm = TRUE)
sd(HeartRiskData$Troponin, na.rm = TRUE)

# Range of variables
range(HeartRiskData$Age, na.rm = TRUE)
range(HeartRiskData$Heart_rate, na.rm = TRUE)
range(HeartRiskData$Systolic_blood_pressure, na.rm = TRUE)
range(HeartRiskData$Diastolic_blood_pressure, na.rm = TRUE)
range(HeartRiskData$Blood_sugar, na.rm = TRUE)
range(HeartRiskData$CK_MB, na.rm = TRUE)
range(HeartRiskData$Troponin, na.rm = TRUE)

# Measures of Relationship
# Correlation between numeric variables
cor(HeartRiskData$Age, HeartRiskData$Heart_rate, use = "complete.obs")
cor(HeartRiskData$Systolic_blood_pressure, HeartRiskData$Diastolic_blood_pressure, use = "complete.obs")
cor(HeartRiskData$Blood_sugar, HeartRiskData$CK_MB, use = "complete.obs")
cor(HeartRiskData$Troponin, HeartRiskData$Heart_rate, use = "complete.obs")

# Cross-tabulation for categorical variables
table(HeartRiskData$Result, HeartRiskData$Risk_Level)

