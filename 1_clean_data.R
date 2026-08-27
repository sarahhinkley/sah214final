library(tidyverse)
source("R/moving-average.R") # Use this pathway to source the moving average from this folder and file

BQ1 <- read_csv("data/QuebradaCuenca1-Bisley.csv")
BQ2 <- read_csv("data/QuebradaCuenca2-Bisley.csv")
BQ3 <- read_csv("data/QuebradaCuenca3-Bisley.csv")
RMP <- read_csv("data/RioMameyesPuenteRoto.csv")


BQ1_timeline <- filter(BQ1, Sample_Date >= ymd("1988-01-01") & Sample_Date <= ymd("1994-12-31"))
BQ2_timeline <- filter(BQ2, Sample_Date >= ymd("1988-01-01") & Sample_Date <= ymd("1994-12-31"))
BQ3_timeline <- filter(BQ3, Sample_Date >= ymd("1988-01-01") & Sample_Date <= ymd("1994-12-31"))
RMP_timeline <- filter(RMP, Sample_Date >= ymd("1988-01-01") & Sample_Date <= ymd("1994-12-31"))


BQ1_moving_average <- moving_average(BQ1_timeline, 9)
BQ2_moving_average <- moving_average(BQ2_timeline, 9)
BQ3_moving_average <- moving_average(BQ3_timeline, 9)
RMP_moving_average <- moving_average(RMP_timeline, 9)


all4movingaverages <- bind_rows(BQ1_moving_average, BQ2_moving_average, BQ3_moving_average, RMP_moving_average)

movingaverage_longer <- all4movingaverages |>
  pivot_longer(
    cols = c(k_mgl, mg_mgl, ca_mgl, no3_mgl, nh4_mgl),
    names_to = "nutrient",
    values_to = "concentration"
  )

write_csv(movingaverage_longer, "output/movingaverage.csv")
