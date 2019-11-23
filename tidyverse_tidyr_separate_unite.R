# load
library(tidyverse)


# dummy dataset
table = read_csv("./data/mtcars.csv")

## SEPARATE
# separate() pulls apart one column into multiple columns, by splitting wherever a separator character appears
# by default, separate() will split values wherever it sees a non-alphanumeric character

table = table %>%
  mutate(test_col = 'a_b/c_d')

table2 = table %>% 
  separate(test_col, into = c("AB", "CD"), sep = "/")

# you can use a number at sep ex sep = 2 as positions to split at
table2 = table %>% 
  separate(test_col, into = c("AB", "CD"), sep = 2)

# you can use convert to detect new column type

## UNITE
# unite() is the inverse of separate(): it combines multiple columns into a single column
table2

table2 %>% 
  unite(ABCD, AB, CD)

# default is underscore, we can change that
table2 %>% 
  unite(ABCD, AB, CD, sep = " ### ")
