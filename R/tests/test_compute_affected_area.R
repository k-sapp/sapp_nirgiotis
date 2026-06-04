library(tidyverse)
library(devtools)
library(testthat)
library(here)

source(here("R/scripts/compute_affected_area.R"))

#test 1: correct area calculation
test_that("compute_affected_area returns correct area in km2", {
  flood_mask <- data.frame(flooded = c(TRUE, TRUE, FALSE, FALSE))
  result <- compute_affected_area(flood_mask, grid_cell_size_m = 1000)

  #2 flooded cells * (1000m)^2 = 2,000,000 m2 = 2 km2
  expect_equal(result, 2)
})

#test 2: no flooded cells returns zero
test_that("compute_affected_area returns 0 when no cells are flooded", {
  flood_mask <- data.frame(flooded = c(FALSE, FALSE, FALSE))
  result <- compute_affected_area(flood_mask, grid_cell_size_m = 30)

  expect_equal(result, 0)
})
