#' Change car weight from lbs to kg
#'
#' This function allows you to change the unit to kg for each car weight
#'
#' @param df mtcars dataset by default
#'
#' @importFrom dplyr mutate
#' @importFrom dplyr select
#'
#' @return dataframes with two columns - one with carnames and the other with weight in kgs
#' 
#' @export weightToKg

weightToKg = function(df) {
  df %>%
    mutate(weight_kg = round(wt * 1000 * 0.4536, 0),
           carnames = row.names(df)) %>%
    select(carnames, weight_kg)
}
