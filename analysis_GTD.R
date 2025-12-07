# Global Terrorism Database Collaborative Analysis

# Load necessary libraries
library(dplyr)
library(readr)
library(ggplot2)

# Load the dataset
gtd_data <- read.csv("globalterrorismdb_0718dist.csv", 
                     stringsAsFactors = FALSE)

# Basic data exploration
glimpse(gtd_data)

gtd_clean <- gtd_data %>%
  select(eventid, attacktype1, attacktype1_txt) %>%
  filter(!is.na(attacktype1_txt))

head(gtd_clean)
