# Load Library
library(readr)

# Cheat Sheet
# https://rawgit.com/rstudio/cheatsheets/master/data-import.pdf

# compared to read.csv
# 10x faster
# produce tibbles
# dont convert vectors to factors, use row names
# more reproducible



# READ FROM FILE ----------------------------------------------------------

# Read csv
mtcars = read_csv(readr_example("mtcars.csv"))

# to read Excel files use readxl package

# all formats

read_csv() # comma delimited
read_csv2() # semicolon delimited
read_tsv() # tab delimited

# any delimiter
read_delim("file.txt", delim = "|") 

# read csv
df_dummy = read_csv2("./data/dummy.csv") # semicolon
df_mtcars = read_csv("./data/mtcars.csv") # comma delimited


## colnames
# no colnames in data
df_dummy = read_csv2("./data/dummy.csv", col_names = FALSE)

# adding own
df_dummy = read_csv2("./data/dummy.csv", col_names = c('C1', 'C2', 'C3', 'C4'))

## missing values - how they are represented in loaded datasets
df_dummy = read_csv2("./data/dummy.csv", na = 'NULL')

# skip lines
df_dummy2 = read_csv2("./data/dummy.csv", skip = 1)

# read a subset (max rows)
df_dummy3 = read_csv2("./data/dummy.csv", n_max = 2)

# In case of challenging datasets ex. first 1000 rows (readr default) are different than rest of the dataset 
challenge <- read_csv(readr_example("challenge.csv"))

# you can specify the column type by hand
challenge <- read_csv(
  readr_example("challenge.csv"), 
  col_types = cols(
    x = col_double(),
    y = col_date()
  )
)

# you can take more rows into consideration than standard 1000
challenge2 <- read_csv(readr_example("challenge.csv"), guess_max = 1500)



# WRITE TO FILE -----------------------------------------------------------

# write csv
write_csv(challenge, "./data/challenge.csv")

write_rds() # to keep the type information

# Comma delimited file
write_csv(x, path, na = "NA", append = FALSE,
          col_names = !append) 

# File with arbitrary delimiter
write_delim(x, path, delim = " ", na = "NA",
            append = FALSE, col_names = !append)