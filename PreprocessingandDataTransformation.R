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

# Check if there are any missing values in the entire dataset
missing_values <- sum(is.na(HeartRiskData))
cat("Total missing values in the dataset:", missing_values, "\n")

# Check for missing values by column
missing_values_by_column <- colSums(is.na(HeartRiskData))
cat("Missing values by column:\n")
print(missing_values_by_column)

# Install and load VIM package for visualization
library(VIM)

# Visualize missing data pattern
aggr(HeartRiskData, col = c("navy", "yellow"), numbers = TRUE, sortVars = TRUE, 
     labels = names(HeartRiskData), cex.axis = 0.7, gap = 3, ylab = c("Missing data", "Frequency"))
