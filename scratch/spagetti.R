source("R/moving-average.R")
library(tidyverse)


# This is from WEDNESDAY
BQ1_moving_average <- moving_average(BQ1, 9)
BQ2_moving_average <- moving_average(BQ2, 9)
BQ3_moving_average <- moving_average(BQ3, 9)
RMP_moving_average <- moving_average(RMP, 9)

# combine the four sites moving average into 1
all4movingaverages <- bind_rows(
  BQ1_moving_average,
  BQ2_moving_average,
  BQ3_moving_average,
  RMP_moving_average
)

movingaverage_longer <- all4movingaverages |>
  pivot_longer(
    cols = c(k_mgl, mg_mgl, ca_mgl, no3_mgl, nh4_mgl),
    names_to = "nutrient",
    values_to = "concentration"
  )

## ^^^ALL THIS MOVED TO CLEAN DATA

movingaverage_newnames <- movingaverage_longer |>
  mutate(
    nutrient = fct_recode(
      nutrient,
      "K~mg~l^-1" = "k_mgl",
      "Mg~mg~l^-1" = "mg_mgl",
      "NO[3]-N~mu*g~l^-1" = "no3_mgl",
      "Ca~mg~l^-1" = "ca_mgl",
      "NH[4]-N~mu*g~l^-1" = "nh4_mgl"
    )
  )

ggplot(
  data = movingaverage_newnames,
  mapping = aes(
    x = window_start,
    y = concentration,
    color = site,
    linetype = site
  )
) +
  geom_line() +
  facet_wrap(
    ~nutrient,
    scales = "free",
    ncol = 1,
    labeller = label_parsed,
    strip.position = "left"
  ) +
  theme_classic() +
  labs(
    x = "Years",
    y = "Concentration",
    linetype = " ",
    color = " ",
    title = "Hurricane Hugo effects on stream chemistry in Bisley, Puerto Rico"
  ) +
  geom_vline(xintercept = ymd("1989-09-18"), linetype = "dashed") +
  theme(
    strip.placement = "outside",
    text = element_text(family = "Times New Roman"),
    strip.background = element_blank()
  )
