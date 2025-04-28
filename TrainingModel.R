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

# Load necessary library
library(caret)

# Set the seed for reproducibility
set.seed(123)

# Split the dataset into training (80%) and testing (20%) sets
train_index <- createDataPartition(HeartRiskData$Risk_Level, p = 0.8, list = FALSE)

# Create training and testing datasets
train_data <- HeartRiskData[train_index, ]
test_data <- HeartRiskData[-train_index, ]

# Check the dimensions of the training and testing datasets
cat("Training data dimensions:", dim(train_data), "\n")
cat("Testing data dimensions:", dim(test_data), "\n")
