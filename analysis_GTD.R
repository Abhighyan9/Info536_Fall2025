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

# Bar chart of most common attack types
ggplot(attack_counts, 
       aes(x = reorder(attacktype1_txt, n_attacks), 
           y = n_attacks)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  coord_flip() +
  labs(
    title = "Most Common Terrorist Attack Types",
    x = "Attack Type",
    y = "Number of Attacks"
  ) +
  theme_minimal()




