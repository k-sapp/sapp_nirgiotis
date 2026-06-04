#' Load Data
#'
#' Generates a simulated 10x10 coastal elevation grid and loads real sea level
#' rise scenarios from the California Ocean Protection Council (2018).
#'
#' @return A list with two elements:
#'   elevation_grid: a data frame with columns x, y, and elevation_m
#'   representing a simulated coastal grid.
#'   scenarios: a data frame with columns year and rise_m containing
#'   three sea level rise scenarios for 2030, 2060, and 2100.
#'
#' @export
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
