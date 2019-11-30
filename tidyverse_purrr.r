# purrr overview
library(tidyverse)

# iterate function (second argument) over list/vector/dataframe (first argument)
# if dataframe is an input it is iterating across columns

map(.x = mtcars, .f = mean) # default output as a list

map_dbl(.x = mtcars, .f = mean) # double output

map_df(.x = mtcars, .f = mean) # dataframe output

map_chr(.x = mtcars, .f = mean) # character output

# or with pipeline

mtcars %>% map(mean)



# we can use anonymous functions or define them directly in the map
map(.x = c(1,2,3), .f = ~{.x + 10})


# we can map multiple input objects - first element of each
map2(.x = c(1,2,3), 
     .y = c(2,3,4), 
     .f = sum)
