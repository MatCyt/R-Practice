
context("showBrands function output")
library(testing.package)

df_test_2 = showBrands(mtcars)

test_that("function is returning data frame", {
  expect_is(showBrands(mtcars), "data.frame")
})

test_that("output has right format", {
  expect_equal(ncol(df_test_2), 1)
  expect_is(df_test_2$brand, "character")
  expect_identical(df_test_2, na.omit(df_test_2))
})
