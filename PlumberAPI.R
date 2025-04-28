# plumber.R

# Load the saved Random Forest model
loaded_best_rf_model <- readRDS("./models/best_rf_model.rds")

#* @apiTitle Heart Risk Prediction API

#* @apiDescription Predicts the Risk Level (Low, Moderate, High) based on patient medical data.

#* @param Age Patient's age
#* @param Gender Patient's gender (0 = Female, 1 = Male)
#* @param Heart_rate Heart rate (beats per minute)
#* @param Systolic_blood_pressure Systolic blood pressure (mmHg)
#* @param Diastolic_blood_pressure Diastolic blood pressure (mmHg)
#* @param Blood_sugar Blood sugar level (mg/dL)
#* @param CK_MB Creatine kinase-MB level
#* @param Troponin Troponin level
#* @param Result Test result ("positive" or "negative")

#* @get /predict_heart_risk
function(Age, Gender, Heart_rate, Systolic_blood_pressure, Diastolic_blood_pressure,
         Blood_sugar, CK_MB, Troponin, Result) {
  
  # Create a data frame for prediction
  new_data <- data.frame(
    Age = as.numeric(Age),
    Gender = factor(Gender, levels = levels(loaded_best_rf_model$trainingData$Gender)),
    Heart_rate = as.numeric(Heart_rate),
    Systolic_blood_pressure = as.numeric(Systolic_blood_pressure),
    Diastolic_blood_pressure = as.numeric(Diastolic_blood_pressure),
    Blood_sugar = as.numeric(Blood_sugar),
    CK_MB = as.numeric(CK_MB),
    Troponin = as.numeric(Troponin),
    Result = factor(Result, levels = levels(loaded_best_rf_model$trainingData$Result))
  )
  
  # Make prediction
  prediction <- predict(loaded_best_rf_model, newdata = new_data)
  
  # Return the predicted Risk_Level
  return(list(Risk_Level = as.character(prediction)))
}
