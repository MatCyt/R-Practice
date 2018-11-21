
context("testing mean function proper output")

x_test = meanSepalLength(iris, "setosa")

test_that("function produce proper output for given example", {
  expect_equal(meanSepalLength(iris, "setosa"), 5.006)
  expect_is(x_test, "numeric")
})