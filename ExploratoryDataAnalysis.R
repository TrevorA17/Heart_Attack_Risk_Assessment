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

