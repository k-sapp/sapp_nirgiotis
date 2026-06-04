
# compute_affected_area.R
# Purpose: Calculate total flooded area in km²
# Inputs:  flood_mask (data.frame with a 'flooded' TRUE/FALSE column)
#          grid_cell_size_m (numeric - size of each cell in meters)
# Output:  numeric - total flooded area in km²

compute_affected_area <- function(flood_mask, grid_cell_size_m) {
  
  # count how many cells are flooded
  n_flooded <- sum(flood_mask$flooded)
  
  # convert cell count to area in km²
  area_m2  <- n_flooded * (grid_cell_size_m ^ 2)
  area_km2 <- area_m2 / 1e6
  
  return(area_km2)
}
