
# load_data.R
# Purpose: Generate a simulated coastal elevation grid and load real SLR scenarios
# Inputs:  none
# Output:  list with two elements:
#            $elevation_grid (data.frame: x, y, elevation_m) - 10x10 simulated grid
#            $scenarios (data.frame: year, rise_m) - 3 SLR scenarios from OPC 2018

load_data <- function() {
  
  elevation_grid <- expand.grid(x = 1:10, y = 1:10)
  
  set.seed(42)
  elevation_grid$elevation_m <- (elevation_grid$y * 0.5) + 
    runif(100, min = -0.2, max = 0.2)
  
  # Source: City of Santa Barbara Vulnerability Assessment
  # California Ocean Protection Council Sea-Level Rise Guidance (2018)
  # Converted feet to meters
  scenarios <- data.frame(
    year   = c(2030, 2060, 2100),
    rise_m = c(0.24, 0.76, 2.01)  
  )
  
  return(list(elevation_grid = elevation_grid,
              scenarios      = scenarios))
}