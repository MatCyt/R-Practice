context("testing sum function proper output")

x_test = sumThisColumn(iris, 1)

test_that("function produce proper output for given example", {
  expect_equal(sumThisColumn(iris, 2), 458.6)
  expect_is(x_test, "numeric")
})