## Scoped variables for work across multiple / conditional variables
library(tidyverse)


# SCOPED VERBS BASICS -----------------------------------------------------

# Create simple tibble
x = tibble(
    number_1 = c(1, 1, 51),
    number_2 = c(3, 42, NA),
    letter = c("w", "x", "w"))

x


#### _all
# use _all to work on all columns at the same time without specyfing them
# summarise or mutate 

# do this
x %>%
  summarise_all(n_distinct)

x %>%
  summarise_all(length)

# not this
x %>% 
  summarize(
    number_1 = n_distinct(number_1),
    number_2 = n_distinct(number_2),
    letter = n_distinct(letter))



#### _at
# use to run same function across few columns, not all, without the need to repeat yourself
# used to specify columns by the name

# this
x %>% 
  summarize_at(vars(number_1, number_2), n_distinct)

vars() # takes list of columns as list of arguments

# you can specify inside columns by conditions
x %>% 
  summarize_at(vars(contains("number")), n_distinct)

# or
x %>%
  select(contains("number")) %>%
  summarise_all(n_distinct)



#### Pass multiple functions - pass as list
x %>% 
  summarize_at(
    vars(contains("number")),
    list(median = median, distinct = n_distinct),
    na.rm = TRUE
  )


## rename all columns to lowercase
capitals =
  tribble(
    ~Country, ~Capital,
    "Namibia", "Windhoek",
    "Georgia", "Tbilisi"
  )

capitals %>% 
  rename_all(str_to_lower)



# SCOPED VERBS WITH PREDICATES --------------------------------------------

#### _if
# use to specify selected columns by condition

small_towns =
  tribble(
    ~town,     ~state,         ~population,    ~sq_miles,
    "bettles", "alaska",                12,         1.74,
    "gilbert", "arkansas",              NA,         0.38,
    NA,        "hawaii",                NA,         2,
    "ruso",    "north dakota",           4,        NA
  )

# capitalize strings in all character columns
small_towns %>% 
  mutate_if(is.character, str_to_title)

# select if
small_towns %>% 
  select_if(is.character)


### all_vars for whole row mathing condition
### any_vars - at least one value mathin condition

# find rows with no NA AT ALL
small_towns %>% 
  filter_all(all_vars(!is.na(.)))

# find rows with at least one value not bein NA
small_towns %>% 
  filter_all(any_vars(!is.na(.)))