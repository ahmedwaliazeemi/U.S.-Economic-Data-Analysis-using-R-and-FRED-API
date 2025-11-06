# -----------------------------------------
# Ahmed Wali Azeemi
# Student ID: 20332545
# Assignment: Economic Data Analysis using FRED API

#Install and load required packages

# These packages allow me to fetch data directy from FRED and manipulate it easily.

install.packages("fredr")
install.packages("tidyverse")

# Load the libraries
library(fredr)
library(tidyverse)


# STEP 2: Set your FRED API Key that I got from the website.
# This key lets R connect to the Federal Reserve Economic Data (FRED) system.
fredr_set_key("dbb736b9561b4aea2963865f1aaf052a")


# STEP 3: Define the start date for analysis
# ------------------------------------------------------------
# We'll collect data starting from January 1, 2022.
start_date <- as.Date("2022-01-01")


# STEP 4: Download datasets from FRED

# Personal Consumption Expenditures (in billions of dollars)
pce <- fredr(series_id = "PCEC", observation_start = start_date) %>%
  select(date, pce = value)

# Consumer Price Index (CPI) for All Urban Consumers
cpi <- fredr(series_id = "CPIAUCSL", observation_start = start_date) %>%
  select(date, cpi = value)

# Federal Funds Rate (interest rate)
fed_rate <- fredr(series_id = "FEDFUNDS", observation_start = start_date) %>%
  select(date, fed_rate = value)

# Unemployment Rate (percentage of labor force unemployed)
unemployment <- fredr(series_id = "UNRATE", observation_start = start_date) %>%
  select(date, unemployment = value)

# View the first few rows of each dataset
head(pce)
head(cpi)
head(fed_rate)
head(unemployment)

# ------------------------------------------------------------
# STEP 5: Merge all datasets together
# ------------------------------------------------------------
# Combine all data into one table based on 'date'
merged_data <- pce %>%
  full_join(unemployment, by = "date") %>%
  full_join(cpi, by = "date") %>%
  full_join(fed_rate, by = "date") %>%
  arrange(date)

# Summary statistics and missing values
summary(merged_data)
colSums(is.na(merged_data))
head(merged_data)

# ------------------------------------------------------------
# STEP 6: Clean the data for correlation and regression
# ------------------------------------------------------------
# Drop rows with missing values to avoid NA errors in correlation or regression
cor_data <- merged_data %>%
  drop_na()

# ------------------------------------------------------------
# STEP 7: Correlation Analysis
# ------------------------------------------------------------
# Measure how strongly PCE relates to Unemployment, CPI, and Fed Rate
cor(cor_data$pce, cor_data$unemployment)
cor(cor_data$pce, cor_data$cpi)
cor(cor_data$pce, cor_data$fed_rate)

# ------------------------------------------------------------
# STEP 8: Data Visualization
# ------------------------------------------------------------
# Create scatter plots with regression lines to visualize relationships

# PCE vs. Unemployment
ggplot(cor_data, aes(x = unemployment, y = pce)) +
  geom_point(color = "steelblue") +
  geom_smooth(method = "lm", color = "darkred") +
  labs(title = "PCE vs. Unemployment Rate",
       x = "Unemployment Rate (%)",
       y = "Personal Consumption Expenditures")

# PCE vs. CPI
ggplot(cor_data, aes(x = cpi, y = pce)) +
  geom_point(color = "darkgreen") +
  geom_smooth(method = "lm", color = "black") +
  labs(title = "PCE vs. Consumer Price Index (CPI)",
       x = "CPI",
       y = "Personal Consumption Expenditures")

# PCE vs. Fed Funds Rate
ggplot(cor_data, aes(x = fed_rate, y = pce)) +
  geom_point(color = "purple") +
  geom_smooth(method = "lm", color = "orange") +
  labs(title = "PCE vs. Federal Funds Rate",
       x = "Federal Funds Rate (%)",
       y = "Personal Consumption Expenditures")

# ------------------------------------------------------------
# STEP 9: Regression Model
# ------------------------------------------------------------
# Build a multiple regression model to see how unemployment, CPI, and Fed Rate
# collectively influence PCE
model <- lm(pce ~ unemployment + cpi + fed_rate, data = cor_data)
summary(model)

# Plot diagnostic graphs to check model assumptions
plot(model)

# ------------------------------------------------------------
# STEP 10: Explore and Export Data
# ------------------------------------------------------------
# View the merged dataset structure
str(merged_data)
head(merged_data)

# Save the dataset to a CSV file for reporting
write.csv(merged_data, "merged_data.csv", row.names = FALSE)
