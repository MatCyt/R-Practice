## dplyr | overview
 
# libraries and playground dataset
library(tidyverse)
data = mpg

## arrange 
# ascending
data %>%
  arrange(year, displ)

# descending
data %>%
  arrange(desc(displ))


## filter
data %>%
  filter(year == 2008)

data %>%
  filter(year == 2008, class == 'compact')

data %>%
  filter(year == 2008 | year == 1999)

data %>%
  filter(displ %in% c(1.8, 2, 2.8))

# missing - leave only non-missing
data %>% 
  filter(!is.na(variable), !is.na(variable))

## select

# select and drop by name
data %>%
  select(model, year, cty)

data %>%
  select(-model, -year)

# select and drop columns by position
data %>%
  select(1, 4, 6)

data %>%
  select(-c(1, 4, 6))

# select by start/end of name
data %>%
  select(starts_with('c'))

data %>%
  select(ends_with('el'))

# select by string in name
data %>%
  select(matches("o.*d")) # regular expression


## reorder columns using select

# name them
data %>%
  select(class, year, model)

# without naming all of them
data %>%
  select(class, everything()) # move class to front


## rename columns
data %>%
  rename(new_class = new_class, model = new_model) # new_name = old_name


## return column as a vector
data %>%
  pull(model)


## mutate - create new variables
data %>%
  mutate(new_column = 1,
         year_plus2 = year + 2)


## summarise
data %>%
  summarise(mean_year = mean(year),
            max_year = max(year),
            min_year = min(year))

## group by
data %>%
  group_by(model)

data %>%
  group_by(manufacturer) %>%
  summarise(avg_displ = mean(displ))

# count
data %>%
  group_by(manufacturer) %>%
  summarise(n = n())


## join
df1 %>%
  left_join(df2, by = 'column_name')


## missing values - remove by filter
data_nomissing = data %>% 
  filter(!is.na(column1), !is.na(column2))
