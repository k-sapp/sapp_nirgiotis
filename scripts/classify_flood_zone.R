
# classify_flood_zone.R
# Purpose: Classify which grid cells are flooded for a given sea level rise amount
# Inputs:  elevation_grid (data.frame with column elevation_m)
#          rise_m (numeric - how much sea level has risen in meters)
# Output:  elevation_grid data.frame with new column: flooded (TRUE/FALSE)

classify_flood_zone <- function(elevation_grid, rise_m) {
  
  elevation_grid$flooded <- elevation_grid$elevation_m <= rise_m
  
  return(elevation_grid)
}