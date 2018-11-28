

#' Calculate mean sepal length for selectes species
#'
#' @param iris iris default dataset
#' @param species select species of interest as character
#'
#' @import dplyr
#'
#' @return numeric value for mean of Sepal Length for selected species
#' @export meanSepalLength
meanSepalLength =  function(iris, species = "setosa") {
  stopifnot(is.data.frame(iris))

  df = iris %>%
    filter(Species == as.character(species))
  mean(df$Sepal.Length)
}

