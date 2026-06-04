library(tidyverse)
library(devtools)
library(testthat)
library(here)

source(here("R/scripts/generate_report.R"))

sample_scenarios <- data.frame(
  year   = c(2050, 2100),
  rise_m = c(0.5, 1.0)
)

sample_grid <- expand.grid(x = 1:3, y = 1:3)
sample_grid$elevation_m <- c(0.3, 0.6, 0.9, 1.2, 1.5, 1.8, 2.1, 2.4, 2.7)

results_list <- list(
  classify_flood_zone(sample_grid, rise_m = 0.5),
  classify_flood_zone(sample_grid, rise_m = 1.0)
)

sample_areas <- c(2.5, 5.0)

# test 1: returns a data frame
test_that("generate_report returns a data frame", {
  result <- generate_report(results_list, sample_scenarios, sample_areas)

  expect_true(is.data.frame(result))
})


# test 2: area values are matched correctly
test_that("total_area_km2 column matches input areas vector", {
  result <- generate_report(results_list, sample_scenarios, sample_areas)

  expect_equal(result$total_area_km2, sample_areas)})
