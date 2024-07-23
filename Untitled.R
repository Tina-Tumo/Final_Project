library(tidyverse)

data <- read_csv("artik.csv")
data |>
  ggplot(mapping = aes(x = time, y = temperature)) + geom_point()
