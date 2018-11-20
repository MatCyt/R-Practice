
context("costPer100 function output")
library(testing.package)

df_test_1 = costPer100(mtcars)

test_that("function is returning data frame", {
  expect_is(costPer100(mtcars), "data.frame")
})

test_that("output has right format", {
  expect_equal(ncol(df_test_1), 2)
  expect_equal(nrow(df_test_1), nrow(mtcars))
  expect_is(df_test_1$cost, "numeric")
  expect_is(df_test_1$carnames, "character")
})
