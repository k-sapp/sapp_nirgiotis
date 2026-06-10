#' Generate Report
#'
#' Generates a summary table of flooded areas and saves a flood map PNG file
#' for each sea level rise scenario to the figures/ directory.
#'
#' @param results_list A list of data frames, one per scenario, each with
#'   columns x, y, and flooded.
#' @param scenarios A data frame with columns year and rise_m, one row
#'   per scenario.
#' @param areas A numeric vector of flooded areas in km2, one value per
#'   scenario.
#'
#' @return A data frame with columns year, rise_m, and total_area_km2,
#'   one row per scenario.
#'
#' @export
generate_report <- function(results_list, scenarios, areas) {

library(ggplot2)

#Part 1 Build summary table
  summary_table <- data.frame(
    year           = scenarios$year,
    rise_m         = scenarios$rise_m,
    total_area_km2 = areas)

# Part 2 Simple flood map for each scenario
  for (i in 1:nrow(scenarios)) {

    mask <- results_list[[i]]

    p <- ggplot(mask, aes(x = x, y = y, fill = flooded)) +
      geom_tile(color = "white") +
      scale_fill_manual(values = c("FALSE" = "lightgreen", "TRUE" = "steelblue"),
                        labels = c("FALSE" = "Dry", "TRUE" = "Flooded")) +
      labs(
        title = paste("Flood Map - Year:", scenarios$year[i]),
        subtitle = paste("Sea level rise:", scenarios$rise_m[i], "m"),
        x    = "X",
        y    = "Y",
        fill = ""
      ) +
      theme_minimal() +
      coord_equal()

    ggsave(paste0("figures/flood_map_", scenarios$year[i], ".png"),
           plot = p, width = 5, height = 5)}
  return(summary_table)}



