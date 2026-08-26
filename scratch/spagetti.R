source("R/moving-average.R")
library(tidyverse)

# Load in the data csv files.
BQ1 <- read_csv("data/QuebradaCuenca1-Bisley.csv")
BQ2 <- read_csv("data/QuebradaCuenca2-Bisley.csv")
BQ3 <- read_csv("data/QuebradaCuenca3-Bisley.csv")
RMP <- read_csv("data/RioMameyesPuenteRoto.csv")

# select() isolates columns from  data frame
# filter() isolates rows from data frame
# Creates a variable containing the Sample Date and K columns and the rows from 1889 to 1994



# This is from WEDNESDAY
moving_average(BQ1, 9)
moving_average(BQ2, 9)
moving_average(BQ3, 9)
moving_average(RMP, 9)

# THESE PLOTS ARENT FINAL

# This is from MONDAY
# First Attempt at a plot: Sample Date vs. K (Potassium) at BQ1
ggplot(
    data = BQ1_1989_1994,
    mapping = aes(
        x = Sample_Date,
        y = K
    )
) +
  geom_point() 


# This is from TUESDAY
ggplot(
  data = BQ1_tibs,
  mapping = aes(
    x = nineweek_start, 
    y = concentration_K
  )
) +
  geom_line()
