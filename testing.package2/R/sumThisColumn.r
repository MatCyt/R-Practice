
#' Sum values in selected column
#'
#' @param df df on interest
#' @param column single column number as numeric value
#'
#' @return
#' @export sumThisColumn
#'
sumThisColumn = function(df, column) {

  stopifnot(is.data.frame(iris))
  stopifnot(is.numeric(column))

  sum(df[, column])
}
