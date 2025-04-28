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

# ANOVA: Test if Age differs significantly across Risk_Level groups
anova_age_risk <- aov(Age ~ Risk_Level, data = HeartRiskData)
summary(anova_age_risk)

# ANOVA: Test if Heart_rate differs significantly across Risk_Level groups
anova_heart_rate_risk <- aov(Heart_rate ~ Risk_Level, data = HeartRiskData)
summary(anova_heart_rate_risk)

# ANOVA: Test if Systolic_blood_pressure differs significantly across Risk_Level groups
anova_systolic_risk <- aov(Systolic_blood_pressure ~ Risk_Level, data = HeartRiskData)
summary(anova_systolic_risk)

# ANOVA: Test if Blood_sugar differs significantly across Risk_Level groups
anova_blood_sugar_risk <- aov(Blood_sugar ~ Risk_Level, data = HeartRiskData)
summary(anova_blood_sugar_risk)

# ANOVA: Test if CK_MB differs significantly across Risk_Level groups
anova_ck_mb_risk <- aov(CK_MB ~ Risk_Level, data = HeartRiskData)
summary(anova_ck_mb_risk)

# ANOVA: Test if Troponin differs significantly across Risk_Level groups
anova_troponin_risk <- aov(Troponin ~ Risk_Level, data = HeartRiskData)
summary(anova_troponin_risk)

# Normality check
plot(anova_age_risk, 2)  # Q-Q plot for Age vs Risk_Level

# Homogeneity of variance
bartlett.test(Age ~ Risk_Level, data = HeartRiskData)

# Histogram for Age
hist(HeartRiskData$Age, 
     main = "Distribution of Age", 
     xlab = "Age", 
     col = "lightblue", 
     border = "black")

# Boxplot for Heart_rate
boxplot(HeartRiskData$Heart_rate, 
        main = "Heart Rate Distribution", 
        ylab = "Heart Rate", 
        col = "lightgreen")

# Histogram for Systolic Blood Pressure
hist(HeartRiskData$Systolic_blood_pressure, 
     main = "Distribution of Systolic Blood Pressure", 
     xlab = "Systolic Blood Pressure", 
     col = "lightcoral", 
     border = "black")

# Bar plot for Risk_Level
barplot(table(HeartRiskData$Risk_Level), 
        main = "Distribution of Risk Level", 
        xlab = "Risk Level", 
        ylab = "Frequency", 
        col = c("lightblue", "lightgreen", "lightcoral"))

# Density plot for Blood_sugar
plot(density(HeartRiskData$Blood_sugar), 
     main = "Density Plot of Blood Sugar", 
     xlab = "Blood Sugar", 
     col = "purple")

# Pairs plot for numeric variables
pairs(HeartRiskData[, c("Age", "Heart_rate", "Systolic_blood_pressure", 
                        "Diastolic_blood_pressure", "Blood_sugar", "CK_MB", "Troponin")], 
      main = "Pairs Plot for Numeric Variables", 
      pch = 19, col = HeartRiskData$Risk_Level)

# Load necessary library for heatmap
library(corrplot)

# Calculate correlation matrix
cor_matrix <- cor(HeartRiskData[, c("Age", "Heart_rate", "Systolic_blood_pressure", 
                                    "Diastolic_blood_pressure", "Blood_sugar", "CK_MB", "Troponin")])

# Plot the correlation matrix
corrplot(cor_matrix, method = "circle", type = "upper", 
         tl.col = "black", tl.srt = 45, 
         main = "Correlation Matrix of Numeric Variables")

# Scatter plot for Age vs Heart_rate, colored by Risk_Level
plot(HeartRiskData$Age, HeartRiskData$Heart_rate, 
     main = "Scatter Plot of Age vs Heart Rate", 
     xlab = "Age", ylab = "Heart Rate", 
     col = HeartRiskData$Risk_Level, pch = 19)
legend("topright", legend = levels(HeartRiskData$Risk_Level), 
       col = 1:length(levels(HeartRiskData$Risk_Level)), 
       pch = 19)

# Boxplot of Heart_rate by Risk_Level
boxplot(Heart_rate ~ Risk_Level, data = HeartRiskData, 
        main = "Heart Rate by Risk Level", 
        xlab = "Risk Level", ylab = "Heart Rate", 
        col = c("lightblue", "lightgreen", "lightcoral"))

# Violin plot for Systolic_blood_pressure by Risk_Level
library(ggplot2)
ggplot(HeartRiskData, aes(x = Risk_Level, y = Systolic_blood_pressure, fill = Risk_Level)) +
  geom_violin(trim = FALSE) +
  labs(title = "Violin Plot of Systolic Blood Pressure by Risk Level",
       x = "Risk Level", y = "Systolic Blood Pressure") +
  theme_minimal()

