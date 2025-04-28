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

# Load the caret package
library(caret)

# Set up 10-fold Cross-Validation
ctrl_10fold <- trainControl(method = "cv", number = 10)


# Train a model using Random Forest with 10-fold CV
rf_model_cv <- train(Risk_Level ~ Age + Gender + Heart_rate + Systolic_blood_pressure + Diastolic_blood_pressure + 
                       Blood_sugar + CK_MB + Troponin + Result, 
                     data = HeartRiskData, 
                     method = "rf", 
                     trControl = ctrl_10fold)

# Print model results
print(rf_model_cv)

# Load necessary libraries
library(caret)
library(e1071)  # for SVM if not already installed

# Set up 10-fold Cross-Validation
ctrl <- trainControl(method = "cv", number = 10)

# Random Forest Model
set.seed(123)
rf_model <- train(Risk_Level ~ Age + Gender + Heart_rate + Systolic_blood_pressure + 
                    Diastolic_blood_pressure + Blood_sugar + CK_MB + Troponin + Result,
                  data = HeartRiskData,
                  method = "rf",
                  trControl = ctrl)

# Print Random Forest Results
print(rf_model)


# k-Nearest Neighbors Model
set.seed(123)
knn_model <- train(Risk_Level ~ Age + Gender + Heart_rate + Systolic_blood_pressure + 
                     Diastolic_blood_pressure + Blood_sugar + CK_MB + Troponin + Result,
                   data = HeartRiskData,
                   method = "knn",
                   trControl = ctrl)

# Print KNN Results
print(knn_model)


# Support Vector Machine Model (Radial Basis Function Kernel)
set.seed(123)
svm_model <- train(Risk_Level ~ Age + Gender + Heart_rate + Systolic_blood_pressure + 
                     Diastolic_blood_pressure + Blood_sugar + CK_MB + Troponin + Result,
                   data = HeartRiskData,
                   method = "svmRadial",
                   trControl = ctrl)

# Print SVM Results
print(svm_model)

# Load caret if not already loaded
library(caret)

# Compare the three models using resamples
model_comparison <- resamples(list(
  RandomForest = rf_model,
  KNN = knn_model,
  SVM = svm_model
))

# Summary of the model performance metrics
summary(model_comparison)

# Visual comparison plots
bwplot(model_comparison)   # Boxplot of accuracy, kappa, etc.
dotplot(model_comparison)  # Dotplot comparison

