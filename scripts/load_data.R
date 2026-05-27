
load_data <- function() {
  
  elevation_grid <- expand.grid(x = 1:10, y = 1:10)
  
  set.seed(42)
  elevation_grid$elevation_m <- (elevation_grid$y * 0.5) + 
    runif(100, min = -0.2, max = 0.2)
  
  # Source: City of Santa Barbara Vulnerability Assessment
  # California Ocean Protection Council Sea-Level Rise Guidance (2018)
  # Converted from feet to meters
  scenarios <- data.frame(
    year   = c(2030, 2060, 2100),
    rise_m = c(0.24, 0.76, 2.01)  # 0.8ft, 2.5ft, 6.6ft converted to meters
  )
  
  return(list(elevation_grid = elevation_grid,
              scenarios      = scenarios))
}