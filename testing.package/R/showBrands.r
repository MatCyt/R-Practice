#' Show all car brands inside mtcars
#'
#' Based on the car names the function returns all unique brand names for the cars in the dataset
#'
#' @param df mtcars dataset by default
#'
#' @importFrom dplyr mutate
#' @importFrom dplyr select
#'
#' @return dataframe with list of uniqe brands based on car name
#'
#' @export showBrands

showBrands = function(df) {

  stopifnot(is.data.frame(df))

  brands =
    df %>%
    mutate(carnames = row.names(df),
           brand = sub("\\ .*", "", carnames)) %>%
    select(brand)
  unique(brands)
}
