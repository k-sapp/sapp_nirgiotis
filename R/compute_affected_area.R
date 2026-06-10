#' Compute Affected Area
#'
#' Calculates the total flooded area in km2 based on a flood mask and grid
#' cell size.
#'
#' @param flood_mask A data frame with a logical column flooded, where TRUE
#'   indicates a flooded cell.
#' @param grid_cell_size_m Numeric. The side length of each grid cell in meters.
#'
#' @return A numeric value representing the total flooded area in km2.
#'
#' @export
compute_affected_area <- function(flood_mask, grid_cell_size_m) {
  n_flooded <- sum(flood_mask$flooded)
  area_m2   <- n_flooded * (grid_cell_size_m ^ 2)
  area_km2  <- area_m2 / 1e6
  return(area_km2)
}
