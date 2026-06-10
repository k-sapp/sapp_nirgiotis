#' Classify Flood Zone
#'
#' Classifies which grid cells are flooded for a given sea level rise amount.
#'
#' @param elevation_grid A data frame with a column elevation_m containing
#'   the elevation of each grid cell in meters.
#' @param rise_m Numeric. The amount of sea level rise in meters.
#'
#' @return A data frame with a new logical column flooded, TRUE if the cell
#'   elevation is at or below rise_m, and FALSE if otherwise.
#'
#' @export
classify_flood_zone <- function(elevation_grid, rise_m) {
  elevation_grid$flooded <- elevation_grid$elevation_m <= rise_m
  return(elevation_grid)
}

