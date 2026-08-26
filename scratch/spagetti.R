library(tidyverse)

# Load in the data csv files.
BQ1 <- read_csv("data/QuebradaCuenca1-Bisley.csv")
BQ2 <- read_csv("data/QuebradaCuenca2-Bisley.csv")
BQ3 <- read_csv("data/QuebradaCuenca3-Bisley.csv")
RMP <- read_csv("data/RioMameyesPuenteRoto.csv")

# select() isolates columns from  data frame
# filter() isolates rows from data frame
# Creates a variable containing the Sample Date and K columns and the rows from 1889 to 1994

# DON'T COMBINE CODE FROM MONDAY AND TUESDAY !!!!

# This is from MONDAY
BQ1_1989_1994 <- BQ1 |> 
  select(Sample_Date, K) |> 
  filter(Sample_Date >= "1989-01-01" & Sample_Date <= "1994-12-31")

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
BQ1_tibs <- tibble( 
  nineweek_start = seq(ymd("1989-01-01"), ymd("1994-12-31"), by = "9 weeks"), 
  concentration_K = NA
)

for (i in 1:length(BQ1_tibs$nineweek_start)) {
  # what's the start of the window?
  window <- BQ1_tibs$nineweek_start[i]
  # what's the end of the window?
  window_end <- window + 63
  # which K values fall in that window?
  concentration_K_ranges <- BQ1$K[
    BQ1$Sample_Date >= window & BQ1$Sample_Date < window_end
  ]
  # what's the mean of those values?
  mean_K_ranges <- mean(concentration_K_ranges, na.rm = TRUE)
  # how do you put that mean in your result?
  BQ1_tibs$concentration_K[i] <- mean_K_ranges
}


ggplot(
  data = BQ1_tibs,
  mapping = aes(
    x = nineweek_start, 
    y = concentration_K
  )
) +
  geom_line()
