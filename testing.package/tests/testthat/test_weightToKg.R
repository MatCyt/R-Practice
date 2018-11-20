context("weightToKg function output")
library(testing.package)

df_test_3 = weightToKg(mtcars)

test_that("function is returning data frame", {
  expect_is(weightToKg(mtcars), "data.frame")
})

test_that("output has right format", {
  df_test_3 = weightToKg(mtcars)
  expect_equal(ncol(df_test_3), 2)
  expect_equal(nrow(df_test_3), nrow(mtcars))
  expect_is(df_test_3$weight_kg, "numeric")
  expect_true(all(df_test_3$weight_kg < 3000))
})
