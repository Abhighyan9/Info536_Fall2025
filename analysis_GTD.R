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

#Count the number of each attack type.

attack_counts <- gtd_clean %>%
  group_by(attacktype1_txt) %>%
  summarise(n_attacks = n()) %>%
  arrange(desc(n_attacks))

head(attack_counts)
