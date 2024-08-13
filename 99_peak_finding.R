# Peak finding
library(tidyverse)
test <- read_rds("cache/xanes_w_metadata.rds") |> 
  filter(is_standard, !is_TLE)

test_peak <- test |> 
  group_by(compound) |> 
  # interpolate the data:
  reframe(
    energy_interp = approx(x = energy, y = samnorm, n = 10000)$x,
    samnorm_interp = approx(x = energy, y = samnorm, n = 10000)$y
  ) |> 
  group_by(compound) |> 
  mutate(is_peak = ggpmisc::find_peaks(samnorm_interp, ignore_threshold = 0.9)) |> 
  filter(is_peak)


test |> 
  ggplot(
    aes(
      x = energy,
      y = samnorm,
      color = compound
    )
  ) +
  geom_line() +
  geom_point(
    data = test_peak,
    aes(x = energy_interp, y = samnorm_interp),
    color = "red"
  ) +
  coord_cartesian(xlim = c(2460, 2500)) +
  theme_classic()
