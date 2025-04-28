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
