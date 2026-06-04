library(tidyverse)
library(devtools)
library(testthat)
library(here)

source(here("R/scripts/load_data.R"))

result <- load_data()

#test 1: output has all correct elements
test_that("load_data returns a list with elevation_grid and scenarios", {
  expect_true(is.list(result))
  expect_true("elevation_grid" %in% names(result))
  expect_true("scenarios" %in% names(result))
})

#test 2: scenarios has correct years
test_that("scenarios contains correct year values", {
  scenarios <- result$scenarios

  expect_equal(scenarios$year, c(2030, 2060, 2100))
})
