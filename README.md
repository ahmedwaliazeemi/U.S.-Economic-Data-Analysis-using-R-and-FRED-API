<h1>💰 U.S. Economic Data Analysis using R and FRED API </h1>

# 🎯 Project Overview

This project provides a comprehensive analysis of the relationship between major U.S. macroeconomic indicators and consumer spending. The research explores how the Consumer Price Index (CPI), Federal Funds Rate, and Unemployment Rate affect Personal Consumption Expenditures (PCE). The analysis covers data from January 2022 to 2025, retrieved directly from the Federal Reserve Economic Data (FRED) API using R programming. It applies correlation and multiple linear regression to quantify the influence of inflation, interest rates, and employment on consumer behavior.

# ✨ Key Features

Real-Time Data Retrieval: Successfully connects to and retrieves up-to-date economic time series data using the fredr package.

Data Wrangling: Cleanses and joins multiple disparate economic datasets (PCE, CPI, Unemployment, Fed Rate) into a single analytical data frame using the tidyverse.

Correlation Analysis: Calculates and visualizes the correlation between key indicators, demonstrating the individual impact of each factor on PCE.

Predictive Modeling: Constructs a Multiple Linear Regression Model to predict PCE based on the combined influence of Unemployment, CPI, and the Federal Funds Rate.

Economic Interpretation: Provides statistical evidence that inflation (CPI) had the strongest and most significant influence on consumer spending during the analysis period.

# 🛠️ Technology Stack

<h2> Core Language </h2>
Language: R

<h2> Data & Analysis Packages </h2>
API Connection: fredr
Manipulation: tidyverse
Modeling: stats (lm function)
Visualization: ggplot2
Date Handling: lubridate




# 🚀 How to Run the Analysis Locally

To replicate the analysis and run the script, you will need R and RStudio installed, along with a free FRED API Key.

Obtain API Key: Register for a free API key on the FRED website.

Clone the Repository:

git clone [https://github.com/ahmedwaliazeemi/U.S.-Economic-Data-Analysis-using-R-and-FRED-API.git](https://github.com/ahmedwaliazeemi/U.S.-Economic-Data-Analysis-using-R-and-FRED-API.git)
cd U.S.-Economic-Data-Analysis-using-R-and-FRED-API




Install Packages: Run this command in your R console:

install.packages(c("fredr", "tidyverse", "ggplot2"))





Execute the Script: Open the Economic Data Analysis using FRED API.R file in RStudio. NOTE: Replace the placeholder API key in Step 2 of the script with your own key before running.

# 📂 Repository Contents

Economic Data Analysis using FRED API.R: The main R script containing the API calls, data preparation, correlation mapping, and regression modeling.

Economic.pdf: The final project report, summarizing the methodology, results, and economic conclusions of the analysis.
