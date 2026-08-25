library(tidyverse)

# Load in the data csv files.
BQ1 <- read_csv("data/QuebradaCuenca1-Bisley.csv")
BQ2 <- read_csv("data/QuebradaCuenca2-Bisley.csv")
BQ3 <- read_csv("data/QuebradaCuenca3-Bisley.csv")
RMP <- read_csv("data/RioMameyesPuenteRoto.csv")

# select() isolates columns from  data frame
# filter() isolates rows from data frame
# Creates a variable containing the Sample Date and K columns and the rows from 1889 to 1994
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
  geom_dotplot() 
