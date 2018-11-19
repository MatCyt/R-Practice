#' calculate cost per 100 miles for each car
#'
#' Based on the miles per gallon and current gallon cost - 3$ - the function returns sorted cost list for each car
#'
#' @param df mtcars dataset by default
#' 
#' @importFrom dplyr mutate
#' @importFrom dplyr arrange
#' @importFrom dplyr select
#'
#' @return dataframe with two columns - one with car names and the other with cost to drive 100 miles
#' 
#' @export costPer100

costPer100 = function(df) {
  df %>%
    mutate(cost = (100 / mpg) * 3,
           carnames = row.names(df)) %>%
    arrange(cost) %>%
    select(carnames, cost)
}