# Data interpolation example

# Create vector 
x <- c(0, 10)     
y <- c(0, 20)

data_approx1 <- approx(x, y)
data_approx1

plot(data_approx1$x, data_approx1$y)
points(x, y, 
       col = "red", 
       pch = 16)


# Create vector 
x <- c(1,8,9,4,7,6,5)     
y <- c(0,6,5,1,4,7,9)   

# Apply approx function 
data_approx1 <- approx(x, y)        
data_approx1     

# Draw output of approx function 
plot(data_approx1$x,                  
     data_approx1$y) 
points(x, y, 
       col = "red", 
       pch = 16)


# Now let's try it on a tibble
library(tidyverse)

data <- tibble(
  energy = seq(2460, 2550, by = 5),
  response = seq(1, 95, by = 5)
)


data_interp <- data |> 
  summarize(
    energy_interp = approx(x = energy, y = response, n = 100)$x,
    response_interp = approx(x = energy, y = response, n = 100)$y
  )

data_interp |> 
  ggplot() +
  aes(x = energy_interp, y = response_interp) +
  geom_point() +
  geom_point(data = data, aes(x = energy, y = response), color = "red", shape = 4)



# XANES example
covellite <- read_rds("cache/xanes_w_metadata.rds") |> 
  filter(str_detect(filename, "Covellite"))

# Plot
covellite |> 
  ggplot() +
  aes(x = energy, y = samnorm) +
  geom_point() +
  geom_line()

# now we try interpolating
covellite_interpolated <- covellite |> 
  select(filename, energy, samnorm) |> 
  group_by(filename) |> 
  reframe(
    energy_interp = approx(x = energy, y = samnorm, n = 5000)$x,
    samnorm_interp = approx(x = energy, y = samnorm, n = 5000)$y
  )

# plot
covellite_interpolated |> 
  ggplot() +
  aes(x = energy_interp, y = samnorm_interp) +
  geom_point(size = 0.5) +
  geom_line(linewidth = 0.25) +
  geom_point(
    data = covellite, aes(x = energy, y = samnorm),
    shape = 6, color = "red"
  )
