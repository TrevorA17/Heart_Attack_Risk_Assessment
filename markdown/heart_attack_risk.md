Heart Attack Risk Assessment
================
Trevor Okinda
2024

- [Student Details](#student-details)
- [Setup Chunk](#setup-chunk)
  - [Source:](#source)
  - [Reference:](#reference)
- [Understanding the Dataset (Exploratory Data Analysis
  (EDA))](#understanding-the-dataset-exploratory-data-analysis-eda)
  - [Loading the Dataset](#loading-the-dataset)
  - [Measures of Frequency](#measures-of-frequency)
  - [Measures of Central Tendency](#measures-of-central-tendency)
  - [Measures of Distribution](#measures-of-distribution)
  - [Measures of Relationship](#measures-of-relationship)
  - [ANOVA](#anova)
  - [Plots](#plots)
- [Preprocessing and Data
  Transformation](#preprocessing-and-data-transformation)
  - [Missing Values](#missing-values)
- [Training Model](#training-model)
  - [Data Splitting](#data-splitting)
  - [Cross-validation](#cross-validation)
  - [Training Different Models](#training-different-models)
  - [Performance Comparison](#performance-comparison)
  - [Saving Model](#saving-model)

# Student Details

|                       |                              |
|-----------------------|------------------------------|
| **Student ID Number** | 134780                       |
| **Student Name**      | Trevor Okinda                |
| **BBIT 4.2 Group**    | C                            |
| **Project Name**      | Heart Attack Risk Assessment |

# Setup Chunk

**Note:** the following KnitR options have been set as the global
defaults: <BR>
`knitr::opts_chunk$set(echo = TRUE, warning = FALSE, eval = TRUE, collapse = FALSE, tidy = TRUE)`.

More KnitR options are documented here
<https://bookdown.org/yihui/rmarkdown-cookbook/chunk-options.html> and
here <https://yihui.org/knitr/options/>.

### Source:

The dataset that was used can be downloaded here: *\<<a
href="https://www.kaggle.com/datasets/fajobgiua/heart-attack-risk-assessment-dataset/data\"
class="uri">https://www.kaggle.com/datasets/fajobgiua/heart-attack-risk-assessment-dataset/data\</a>\>*

### Reference:

*\<Job Giua Fa (2023). Heart Attack Risk Assessment Dataset. Kaggle. <a
href="https://www.kaggle.com/datasets/fajobgiua/heart-attack-risk-assessment-dataset\"
class="uri">https://www.kaggle.com/datasets/fajobgiua/heart-attack-risk-assessment-dataset\</a>\>  
Refer to the APA 7th edition manual for rules on how to cite datasets:
<https://apastyle.apa.org/style-grammar-guidelines/references/examples/data-set-references>*

# Understanding the Dataset (Exploratory Data Analysis (EDA))

## Loading the Dataset

``` r
# Load dataset using read.csv
HeartRiskData <- read.csv("Heart_Attack_Risk_Levels_Dataset.csv", colClasses = c(
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
```

    ## 'data.frame':    1319 obs. of  10 variables:
    ##  $ Age                     : num  63 20 56 66 54 52 38 61 49 65 ...
    ##  $ Gender                  : Factor w/ 2 levels "0","1": 2 2 2 2 2 1 1 2 1 2 ...
    ##  $ Heart_rate              : num  66 94 64 70 64 61 40 60 60 61 ...
    ##  $ Systolic_blood_pressure : num  160 98 160 120 112 112 179 214 154 160 ...
    ##  $ Diastolic_blood_pressure: num  83 46 77 55 65 58 68 82 81 95 ...
    ##  $ Blood_sugar             : num  160 296 270 270 300 87 102 87 135 100 ...
    ##  $ CK_MB                   : num  1.8 6.75 1.99 13.87 1.08 ...
    ##  $ Troponin                : num  0.012 1.06 0.003 0.122 0.003 0.004 0.003 2.37 0.004 0.011 ...
    ##  $ Result                  : Factor w/ 2 levels "negative","positive": 1 2 1 2 1 1 1 2 1 1 ...
    ##  $ Risk_Level              : Factor w/ 3 levels "High","Low","Moderate": 3 1 3 1 3 2 3 1 3 3 ...

``` r
head(HeartRiskData)
```

    ##   Age Gender Heart_rate Systolic_blood_pressure Diastolic_blood_pressure
    ## 1  63      1         66                     160                       83
    ## 2  20      1         94                      98                       46
    ## 3  56      1         64                     160                       77
    ## 4  66      1         70                     120                       55
    ## 5  54      1         64                     112                       65
    ## 6  52      0         61                     112                       58
    ##   Blood_sugar CK_MB Troponin   Result Risk_Level
    ## 1         160  1.80    0.012 negative   Moderate
    ## 2         296  6.75    1.060 positive       High
    ## 3         270  1.99    0.003 negative   Moderate
    ## 4         270 13.87    0.122 positive       High
    ## 5         300  1.08    0.003 negative   Moderate
    ## 6          87  1.83    0.004 negative        Low

``` r
View(HeartRiskData)
```

## Measures of Frequency

``` r
# Measures of Frequency
# Frequency count for categorical variables (e.g., Gender, Result, Risk_Level)
table(HeartRiskData$Gender)
```

    ## 
    ##   0   1 
    ## 449 870

``` r
table(HeartRiskData$Result)
```

    ## 
    ## negative positive 
    ##      509      810

``` r
table(HeartRiskData$Risk_Level)
```

    ## 
    ##     High      Low Moderate 
    ##      812      275      232

## Measures of Central Tendency

``` r
# Measures of Central Tendency
# Mean, Median for numeric variables
mean(HeartRiskData$Age, na.rm = TRUE)
```

    ## [1] 56.19333

``` r
median(HeartRiskData$Age, na.rm = TRUE)
```

    ## [1] 58

``` r
mean(HeartRiskData$Heart_rate, na.rm = TRUE)
```

    ## [1] 78.33662

``` r
median(HeartRiskData$Heart_rate, na.rm = TRUE)
```

    ## [1] 74

``` r
mean(HeartRiskData$Systolic_blood_pressure, na.rm = TRUE)
```

    ## [1] 127.1706

``` r
median(HeartRiskData$Systolic_blood_pressure, na.rm = TRUE)
```

    ## [1] 124

``` r
mean(HeartRiskData$Diastolic_blood_pressure, na.rm = TRUE)
```

    ## [1] 72.26914

``` r
median(HeartRiskData$Diastolic_blood_pressure, na.rm = TRUE)
```

    ## [1] 72

``` r
mean(HeartRiskData$Blood_sugar, na.rm = TRUE)
```

    ## [1] 146.6343

``` r
median(HeartRiskData$Blood_sugar, na.rm = TRUE)
```

    ## [1] 116

``` r
mean(HeartRiskData$CK_MB, na.rm = TRUE)
```

    ## [1] 15.27431

``` r
median(HeartRiskData$CK_MB, na.rm = TRUE)
```

    ## [1] 2.85

``` r
mean(HeartRiskData$Troponin, na.rm = TRUE)
```

    ## [1] 0.3609424

``` r
median(HeartRiskData$Troponin, na.rm = TRUE)
```

    ## [1] 0.014

## Measures of Distribution

``` r
# Measures of Distribution
# Standard Deviation and Range for numeric variables
sd(HeartRiskData$Age, na.rm = TRUE)
```

    ## [1] 13.63817

``` r
sd(HeartRiskData$Heart_rate, na.rm = TRUE)
```

    ## [1] 51.63027

``` r
sd(HeartRiskData$Systolic_blood_pressure, na.rm = TRUE)
```

    ## [1] 26.12272

``` r
sd(HeartRiskData$Diastolic_blood_pressure, na.rm = TRUE)
```

    ## [1] 14.03392

``` r
sd(HeartRiskData$Blood_sugar, na.rm = TRUE)
```

    ## [1] 74.92304

``` r
sd(HeartRiskData$CK_MB, na.rm = TRUE)
```

    ## [1] 46.32708

``` r
sd(HeartRiskData$Troponin, na.rm = TRUE)
```

    ## [1] 1.154568

``` r
# Range of variables
range(HeartRiskData$Age, na.rm = TRUE)
```

    ## [1]  14 103

``` r
range(HeartRiskData$Heart_rate, na.rm = TRUE)
```

    ## [1]   20 1111

``` r
range(HeartRiskData$Systolic_blood_pressure, na.rm = TRUE)
```

    ## [1]  42 223

``` r
range(HeartRiskData$Diastolic_blood_pressure, na.rm = TRUE)
```

    ## [1]  38 154

``` r
range(HeartRiskData$Blood_sugar, na.rm = TRUE)
```

    ## [1]  35 541

``` r
range(HeartRiskData$CK_MB, na.rm = TRUE)
```

    ## [1]   0.321 300.000

``` r
range(HeartRiskData$Troponin, na.rm = TRUE)
```

    ## [1]  0.001 10.300

## Measures of Relationship

``` r
# Measures of Relationship
# Correlation between numeric variables
cor(HeartRiskData$Age, HeartRiskData$Heart_rate, use = "complete.obs")
```

    ## [1] -0.02365455

``` r
cor(HeartRiskData$Systolic_blood_pressure, HeartRiskData$Diastolic_blood_pressure, use = "complete.obs")
```

    ## [1] 0.5861663

``` r
cor(HeartRiskData$Blood_sugar, HeartRiskData$CK_MB, use = "complete.obs")
```

    ## [1] 0.04575658

``` r
cor(HeartRiskData$Troponin, HeartRiskData$Heart_rate, use = "complete.obs")
```

    ## [1] 0.01117985

``` r
# Cross-tabulation for categorical variables
table(HeartRiskData$Result, HeartRiskData$Risk_Level)
```

    ##           
    ##            High Low Moderate
    ##   negative    2 275      232
    ##   positive  810   0        0

## ANOVA

``` r
# ANOVA: Test if Age differs significantly across Risk_Level groups
anova_age_risk <- aov(Age ~ Risk_Level, data = HeartRiskData)
summary(anova_age_risk)
```

    ##               Df Sum Sq Mean Sq F value Pr(>F)    
    ## Risk_Level     2  14053    7026   40.01 <2e-16 ***
    ## Residuals   1316 231095     176                   
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

``` r
# ANOVA: Test if Heart_rate differs significantly across Risk_Level groups
anova_heart_rate_risk <- aov(Heart_rate ~ Risk_Level, data = HeartRiskData)
summary(anova_heart_rate_risk)
```

    ##               Df  Sum Sq Mean Sq F value Pr(>F)
    ## Risk_Level     2    2224    1112   0.417  0.659
    ## Residuals   1316 3511149    2668

``` r
# ANOVA: Test if Systolic_blood_pressure differs significantly across Risk_Level groups
anova_systolic_risk <- aov(Systolic_blood_pressure ~ Risk_Level, data = HeartRiskData)
summary(anova_systolic_risk)
```

    ##               Df Sum Sq Mean Sq F value Pr(>F)    
    ## Risk_Level     2 124901   62451   106.1 <2e-16 ***
    ## Residuals   1316 774497     589                   
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

``` r
# ANOVA: Test if Blood_sugar differs significantly across Risk_Level groups
anova_blood_sugar_risk <- aov(Blood_sugar ~ Risk_Level, data = HeartRiskData)
summary(anova_blood_sugar_risk)
```

    ##               Df  Sum Sq Mean Sq F value Pr(>F)    
    ## Risk_Level     2  712926  356463   70.17 <2e-16 ***
    ## Residuals   1316 6685618    5080                   
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

``` r
# ANOVA: Test if CK_MB differs significantly across Risk_Level groups
anova_ck_mb_risk <- aov(CK_MB ~ Risk_Level, data = HeartRiskData)
summary(anova_ck_mb_risk)
```

    ##               Df  Sum Sq Mean Sq F value  Pr(>F)    
    ## Risk_Level     2  133077   66538   32.48 1.7e-14 ***
    ## Residuals   1316 2695613    2048                    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

``` r
# ANOVA: Test if Troponin differs significantly across Risk_Level groups
anova_troponin_risk <- aov(Troponin ~ Risk_Level, data = HeartRiskData)
summary(anova_troponin_risk)
```

    ##               Df Sum Sq Mean Sq F value Pr(>F)    
    ## Risk_Level     2  103.4   51.72   41.17 <2e-16 ***
    ## Residuals   1316 1653.5    1.26                   
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

``` r
# Normality check
plot(anova_age_risk, 2)  # Q-Q plot for Age vs Risk_Level
```

![](heart_attack_risk_files/figure-gfm/ANOVA-1.png)<!-- -->

``` r
# Homogeneity of variance
bartlett.test(Age ~ Risk_Level, data = HeartRiskData)
```

    ## 
    ##  Bartlett test of homogeneity of variances
    ## 
    ## data:  Age by Risk_Level
    ## Bartlett's K-squared = 3.626, df = 2, p-value = 0.1632

## Plots

``` r
# Histogram for Age
hist(HeartRiskData$Age, 
     main = "Distribution of Age", 
     xlab = "Age", 
     col = "lightblue", 
     border = "black")
```

![](heart_attack_risk_files/figure-gfm/Plots-1.png)<!-- -->

``` r
# Boxplot for Heart_rate
boxplot(HeartRiskData$Heart_rate, 
        main = "Heart Rate Distribution", 
        ylab = "Heart Rate", 
        col = "lightgreen")
```

![](heart_attack_risk_files/figure-gfm/Plots-2.png)<!-- -->

``` r
# Histogram for Systolic Blood Pressure
hist(HeartRiskData$Systolic_blood_pressure, 
     main = "Distribution of Systolic Blood Pressure", 
     xlab = "Systolic Blood Pressure", 
     col = "lightcoral", 
     border = "black")
```

![](heart_attack_risk_files/figure-gfm/Plots-3.png)<!-- -->

``` r
# Bar plot for Risk_Level
barplot(table(HeartRiskData$Risk_Level), 
        main = "Distribution of Risk Level", 
        xlab = "Risk Level", 
        ylab = "Frequency", 
        col = c("lightblue", "lightgreen", "lightcoral"))
```

![](heart_attack_risk_files/figure-gfm/Plots-4.png)<!-- -->

``` r
# Density plot for Blood_sugar
plot(density(HeartRiskData$Blood_sugar), 
     main = "Density Plot of Blood Sugar", 
     xlab = "Blood Sugar", 
     col = "purple")
```

![](heart_attack_risk_files/figure-gfm/Plots-5.png)<!-- -->

``` r
# Pairs plot for numeric variables
pairs(HeartRiskData[, c("Age", "Heart_rate", "Systolic_blood_pressure", 
                        "Diastolic_blood_pressure", "Blood_sugar", "CK_MB", "Troponin")], 
      main = "Pairs Plot for Numeric Variables", 
      pch = 19, col = HeartRiskData$Risk_Level)
```

![](heart_attack_risk_files/figure-gfm/Plots-6.png)<!-- -->

``` r
# Load necessary library for heatmap
library(corrplot)
```

    ## corrplot 0.95 loaded

``` r
# Calculate correlation matrix
cor_matrix <- cor(HeartRiskData[, c("Age", "Heart_rate", "Systolic_blood_pressure", 
                                    "Diastolic_blood_pressure", "Blood_sugar", "CK_MB", "Troponin")])

# Plot the correlation matrix
corrplot(cor_matrix, method = "circle", type = "upper", 
         tl.col = "black", tl.srt = 45, 
         main = "Correlation Matrix of Numeric Variables")
```

![](heart_attack_risk_files/figure-gfm/Plots-7.png)<!-- -->

``` r
# Scatter plot for Age vs Heart_rate, colored by Risk_Level
plot(HeartRiskData$Age, HeartRiskData$Heart_rate, 
     main = "Scatter Plot of Age vs Heart Rate", 
     xlab = "Age", ylab = "Heart Rate", 
     col = HeartRiskData$Risk_Level, pch = 19)
legend("topright", legend = levels(HeartRiskData$Risk_Level), 
       col = 1:length(levels(HeartRiskData$Risk_Level)), 
       pch = 19)
```

![](heart_attack_risk_files/figure-gfm/Plots-8.png)<!-- -->

``` r
# Boxplot of Heart_rate by Risk_Level
boxplot(Heart_rate ~ Risk_Level, data = HeartRiskData, 
        main = "Heart Rate by Risk Level", 
        xlab = "Risk Level", ylab = "Heart Rate", 
        col = c("lightblue", "lightgreen", "lightcoral"))

# Violin plot for Systolic_blood_pressure by Risk_Level
library(ggplot2)
```

![](heart_attack_risk_files/figure-gfm/Plots-9.png)<!-- -->

``` r
ggplot(HeartRiskData, aes(x = Risk_Level, y = Systolic_blood_pressure, fill = Risk_Level)) +
  geom_violin(trim = FALSE) +
  labs(title = "Violin Plot of Systolic Blood Pressure by Risk Level",
       x = "Risk Level", y = "Systolic Blood Pressure") +
  theme_minimal()
```

![](heart_attack_risk_files/figure-gfm/Plots-10.png)<!-- -->

# Preprocessing and Data Transformation

## Missing Values

``` r
# Check if there are any missing values in the entire dataset
missing_values <- sum(is.na(HeartRiskData))
cat("Total missing values in the dataset:", missing_values, "\n")
```

    ## Total missing values in the dataset: 0

``` r
# Check for missing values by column
missing_values_by_column <- colSums(is.na(HeartRiskData))
cat("Missing values by column:\n")
```

    ## Missing values by column:

``` r
print(missing_values_by_column)
```

    ##                      Age                   Gender               Heart_rate 
    ##                        0                        0                        0 
    ##  Systolic_blood_pressure Diastolic_blood_pressure              Blood_sugar 
    ##                        0                        0                        0 
    ##                    CK_MB                 Troponin                   Result 
    ##                        0                        0                        0 
    ##               Risk_Level 
    ##                        0

``` r
# Install and load VIM package for visualization
library(VIM)
```

    ## Loading required package: colorspace

    ## Loading required package: grid

    ## The legacy packages maptools, rgdal, and rgeos, underpinning the sp package,
    ## which was just loaded, will retire in October 2023.
    ## Please refer to R-spatial evolution reports for details, especially
    ## https://r-spatial.org/r/2023/05/15/evolution4.html.
    ## It may be desirable to make the sf package available;
    ## package maintainers should consider adding sf to Suggests:.
    ## The sp package is now running under evolution status 2
    ##      (status 2 uses the sf package in place of rgdal)

    ## VIM is ready to use.

    ## Suggestions and bug-reports can be submitted at: https://github.com/statistikat/VIM/issues

    ## 
    ## Attaching package: 'VIM'

    ## The following object is masked from 'package:datasets':
    ## 
    ##     sleep

``` r
# Visualize missing data pattern
aggr(HeartRiskData, col = c("navy", "yellow"), numbers = TRUE, sortVars = TRUE, 
     labels = names(HeartRiskData), cex.axis = 0.7, gap = 3, ylab = c("Missing data", "Frequency"))
```

![](heart_attack_risk_files/figure-gfm/Missing%20Values-1.png)<!-- -->

    ## 
    ##  Variables sorted by number of missings: 
    ##                  Variable Count
    ##                       Age     0
    ##                    Gender     0
    ##                Heart_rate     0
    ##   Systolic_blood_pressure     0
    ##  Diastolic_blood_pressure     0
    ##               Blood_sugar     0
    ##                     CK_MB     0
    ##                  Troponin     0
    ##                    Result     0
    ##                Risk_Level     0

# Training Model

## Data Splitting

``` r
# Load necessary library
library(caret)
```

    ## Loading required package: lattice

``` r
# Set the seed for reproducibility
set.seed(123)

# Split the dataset into training (80%) and testing (20%) sets
train_index <- createDataPartition(HeartRiskData$Risk_Level, p = 0.8, list = FALSE)

# Create training and testing datasets
train_data <- HeartRiskData[train_index, ]
test_data <- HeartRiskData[-train_index, ]

# Check the dimensions of the training and testing datasets
cat("Training data dimensions:", dim(train_data), "\n")
```

    ## Training data dimensions: 1056 10

``` r
cat("Testing data dimensions:", dim(test_data), "\n")
```

    ## Testing data dimensions: 263 10

## Cross-validation

``` r
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
```

    ## Random Forest 
    ## 
    ## 1319 samples
    ##    9 predictor
    ##    3 classes: 'High', 'Low', 'Moderate' 
    ## 
    ## No pre-processing
    ## Resampling: Cross-Validated (10 fold) 
    ## Summary of sample sizes: 1186, 1186, 1187, 1188, 1187, 1187, ... 
    ## Resampling results across tuning parameters:
    ## 
    ##   mtry  Accuracy   Kappa    
    ##   2     0.9977272  0.9958478
    ##   5     0.9977272  0.9958478
    ##   9     0.9984848  0.9972368
    ## 
    ## Accuracy was used to select the optimal model using the largest value.
    ## The final value used for the model was mtry = 9.

## Training Different Models

``` r
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
```

    ## Random Forest 
    ## 
    ## 1319 samples
    ##    9 predictor
    ##    3 classes: 'High', 'Low', 'Moderate' 
    ## 
    ## No pre-processing
    ## Resampling: Cross-Validated (10 fold) 
    ## Summary of sample sizes: 1186, 1188, 1186, 1187, 1187, 1187, ... 
    ## Resampling results across tuning parameters:
    ## 
    ##   mtry  Accuracy   Kappa    
    ##   2     0.9969695  0.9944583
    ##   5     0.9977329  0.9958611
    ##   9     0.9984848  0.9972368
    ## 
    ## Accuracy was used to select the optimal model using the largest value.
    ## The final value used for the model was mtry = 9.

``` r
# k-Nearest Neighbors Model
set.seed(123)
knn_model <- train(Risk_Level ~ Age + Gender + Heart_rate + Systolic_blood_pressure + 
                     Diastolic_blood_pressure + Blood_sugar + CK_MB + Troponin + Result,
                   data = HeartRiskData,
                   method = "knn",
                   trControl = ctrl)

# Print KNN Results
print(knn_model)
```

    ## k-Nearest Neighbors 
    ## 
    ## 1319 samples
    ##    9 predictor
    ##    3 classes: 'High', 'Low', 'Moderate' 
    ## 
    ## No pre-processing
    ## Resampling: Cross-Validated (10 fold) 
    ## Summary of sample sizes: 1186, 1188, 1186, 1187, 1187, 1187, ... 
    ## Resampling results across tuning parameters:
    ## 
    ##   k  Accuracy   Kappa    
    ##   5  0.6322913  0.3066309
    ##   7  0.6345351  0.2932251
    ##   9  0.6306210  0.2811498
    ## 
    ## Accuracy was used to select the optimal model using the largest value.
    ## The final value used for the model was k = 7.

``` r
# Support Vector Machine Model (Radial Basis Function Kernel)
set.seed(123)
svm_model <- train(Risk_Level ~ Age + Gender + Heart_rate + Systolic_blood_pressure + 
                     Diastolic_blood_pressure + Blood_sugar + CK_MB + Troponin + Result,
                   data = HeartRiskData,
                   method = "svmRadial",
                   trControl = ctrl)

# Print SVM Results
print(svm_model)
```

    ## Support Vector Machines with Radial Basis Function Kernel 
    ## 
    ## 1319 samples
    ##    9 predictor
    ##    3 classes: 'High', 'Low', 'Moderate' 
    ## 
    ## No pre-processing
    ## Resampling: Cross-Validated (10 fold) 
    ## Summary of sample sizes: 1186, 1188, 1186, 1187, 1187, 1187, ... 
    ## Resampling results across tuning parameters:
    ## 
    ##   C     Accuracy   Kappa    
    ##   0.25  0.9727146  0.9500219
    ##   0.50  0.9742241  0.9528134
    ##   1.00  0.9787869  0.9612199
    ## 
    ## Tuning parameter 'sigma' was held constant at a value of 0.112675
    ## Accuracy was used to select the optimal model using the largest value.
    ## The final values used for the model were sigma = 0.112675 and C = 1.

## Performance Comparison

``` r
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
```

    ## 
    ## Call:
    ## summary.resamples(object = model_comparison)
    ## 
    ## Models: RandomForest, KNN, SVM 
    ## Number of resamples: 10 
    ## 
    ## Accuracy 
    ##                   Min.   1st Qu.    Median      Mean   3rd Qu.      Max. NA's
    ## RandomForest 0.9923664 1.0000000 1.0000000 0.9984848 1.0000000 1.0000000    0
    ## KNN          0.6015038 0.6106870 0.6377307 0.6345351 0.6591194 0.6666667    0
    ## SVM          0.9473684 0.9770992 0.9811460 0.9787869 0.9848485 0.9924812    0
    ## 
    ## Kappa 
    ##                   Min.   1st Qu.    Median      Mean   3rd Qu.      Max. NA's
    ## RandomForest 0.9860579 1.0000000 1.0000000 0.9972368 1.0000000 1.0000000    0
    ## KNN          0.2211910 0.2434347 0.3077199 0.2932251 0.3272322 0.3786906    0
    ## SVM          0.9043460 0.9577209 0.9657313 0.9612199 0.9723560 0.9862276    0

``` r
# Visual comparison plots
bwplot(model_comparison)   # Boxplot of accuracy, kappa, etc.
```

![](heart_attack_risk_files/figure-gfm/Performance%20Comparison-1.png)<!-- -->

``` r
dotplot(model_comparison)  # Dotplot comparison
```

![](heart_attack_risk_files/figure-gfm/Performance%20Comparison-2.png)<!-- -->

## Saving Model

``` r
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
```

    ## [1] Low
    ## Levels: High Low Moderate
