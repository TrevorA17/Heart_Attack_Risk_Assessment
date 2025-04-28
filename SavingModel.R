# Create a folder if it doesn't exist
if (!dir.exists("./models")) {
  dir.create("./models")
}

# Save the best model (Random Forest)
saveRDS(rf_model, "./models/best_rf_model.rds")

# To load the saved model later
loaded_best_rf_model <- readRDS("./models/best_rf_model.rds")

# Example of making a prediction with the loaded model
new_data <- data.frame(
  Age = 55,
  Gender = factor(1, levels = levels(HeartRiskData$Gender)),
  Heart_rate = 72,
  Systolic_blood_pressure = 140,
  Diastolic_blood_pressure = 85,
  Blood_sugar = 180,
  CK_MB = 2.5,
  Troponin = 0.05,
  Result = factor("negative", levels = levels(HeartRiskData$Result))
)

# Predict the Risk_Level
predicted_risk <- predict(loaded_best_rf_model, newdata = new_data)

# Print the prediction
print(predicted_risk)
