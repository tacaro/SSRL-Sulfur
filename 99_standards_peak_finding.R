# Setup

library(tidyverse)

# load standards
standards <- read_rds("cache/xanes_w_metadata.rds") |> 
  filter(is_standard, !is_TLE)

standards_k_edge <- readxl::read_excel("data/Standards_K_Edge.xlsx") |> 
  arrange(`k-edge_position`) |> 
  mutate(offset = row_number())



standards_interpolated <- standards |> 
  group_by(compound) |> 
  # interpolate the data for smoother peak finding:
  reframe(
    energy_interp = approx(x = energy, y = samnorm, n = 10000)$x,
    samnorm_interp = approx(x = energy, y = samnorm, n = 10000)$y
  ) |> 
  left_join(standards_k_edge, by = join_by(compound))




standards_interpolated |> 
  ggplot(
    aes(energy_interp, samnorm_interp + offset, color = compound)
  ) +
  geom_line() +
  geom_point(
    data = function(df) df |> filter(energy_interp == `k-edge_position`),
    aes(x = `k-edge_position`, y = samnorm_interp),
    color = "red"
    ) +
  coord_cartesian(xlim = c(2460, 2490)) +
  theme_classic()

