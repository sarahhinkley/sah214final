source("R/moving-average.R")
library(tidyverse)

# select() isolates columns from  data frame
# filter() isolates rows from data frame
# Creates a variable containing the Sample Date and K columns and the rows from 1889 to 1994



# This is from WEDNESDAY
BQ1_moving_average <- moving_average(BQ1, 9)
BQ2_moving_average <- moving_average(BQ2, 9)
BQ3_moving_average <- moving_average(BQ3, 9)
RMP_moving_average <- moving_average(RMP, 9)

# combine the four sites moving average into 1 
all4movingaverages <- bind_rows(BQ1_moving_average, BQ2_moving_average, BQ3_moving_average, RMP_moving_average)

movingaverage_longer <- all4movingaverages |>
  pivot_longer(
    cols = c(k_mgl, mg_mgl, ca_mgl, no3_mgl, nh4_mgl),
    names_to = "nutrient",
    values_to = "concentration"
  )


ggplot(
  data = movingaverage_longer, 
  mapping = aes(
    x = window_start, 
    y = concentration,
    color = site
  )
) + 
  geom_line() +
  facet_wrap(~nutrient, scales = "free", ncol = 1) +
  theme_bw() + 
  labs(
    x = "Years",
    y = "Concentration (mg/L)",
    color = "Site"
  )






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
