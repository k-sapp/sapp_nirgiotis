library(tidyverse)
library(devtools)
library(testthat)
library(here)

source(here("R/scripts/classify_flood_zone.R"))

sample_grid <- data.frame(
  elevation_m = c(0.5, 1.0, 1.5, 2.0, 3.0))

# test 1: cells at or below rise_m are marked as flooded

test_that("cells at or below rise_m are marked as flooded", {
  result <- classify_flood_zone(sample_grid, rise_m = 1.5)
  expect_equal(result$flooded, c(TRUE, TRUE, TRUE, FALSE, FALSE))
})

# test 2: rise_m higher than all elevations floods everything

test_that("rise_m above all elevations marks every cell as flooded", {
  result <- classify_flood_zone(sample_grid, rise_m = 999)

  expect_true(all(result$flooded))})



