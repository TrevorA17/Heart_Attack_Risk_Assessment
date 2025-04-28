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

# Load the boot package
library(boot)

# Define a custom function for bootstrapping
boot_function <- function(data, indices) {
  # Resample the data (bootstrap sampling)
  sampled_data <- data[indices, ]
  
  # Fit a model on the resampled data
  model <- glm(Risk_Level ~ Age + Gender + Heart_rate + Systolic_blood_pressure + Diastolic_blood_pressure + 
                 Blood_sugar + CK_MB + Troponin + Result, data = sampled_data, family = binomial)
  
  # Evaluate the model using accuracy (or another performance metric)
  predictions <- predict(model, sampled_data, type = "response")
  predictions_class <- ifelse(predictions > 0.5, "High", "Low") # Classify as High/Low risk
  
  # Calculate accuracy (you can replace this with any other metric)
  accuracy <- mean(predictions_class == sampled_data$Risk_Level)
  
  return(accuracy)
}

# Apply bootstrapping with 1000 resamples
set.seed(123) # For reproducibility
boot_results <- boot(data = HeartRiskData, statistic = boot_function, R = 1000)

# Print bootstrapping results
print(boot_results)

