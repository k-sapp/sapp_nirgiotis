
# main.R
# Sea Level Rise Impact Analysis - Santa Barbara Coastline
# Authors: Kalena Sapp & Elena Nirgiotis

source("scripts/load_data.R")
source("scripts/classify_flood_zone.R")
source("scripts/compute_affected_area.R")
source("scripts/generate_report.R")

# --- Step 1: Load data ---
data           <- load_data()
elevation_grid <- data$elevation_grid
scenarios      <- data$scenarios

# --- Step 2: Loop through each scenario ---
results_list <- list()
areas        <- c()

for (i in 1:nrow(scenarios)) {
  
  # classify which cells flood under this scenario
  flood_mask <- classify_flood_zone(elevation_grid, rise_m = scenarios$rise_m[i])
  
  # compute how much area floods
  area_km2 <- compute_affected_area(flood_mask, grid_cell_size_m = 30)
  
  # store results
  results_list[[i]] <- flood_mask
  areas[i]          <- area_km2
  
  cat("Year:", scenarios$year[i], 
      "| Rise:", scenarios$rise_m[i], "m",
      "| Flooded area:", round(area_km2, 2), "km2\n")
}

# --- Step 3: Generate report ---
summary_table <- generate_report(results_list, scenarios, areas)
                                 
