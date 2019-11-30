# stringr practice 
library(tidyverse)
library(stringr)

# all stringr functions start with str_ - to check them out go with str_ 
str_

# length of a string
str_length('test')
str_length(c('test', 'dummy test', '5'))

# combine two strings
str_c("dummy:", " test")

str_c("dummy:", " test", sep = 'XXX')

# vectors recycled - nice
str_c("prefix-", c("a", "b", "c"), "-suffix")


### SUBSETTING
# str_sub() take start-end position of arguments used to cut the string out
x <- c("Apple", "Banana", "Pear")
str_sub(x, 1, 3)
str_sub(x, -3, -1) # backwards counts


# To lower, to upper, to title
test <- c('test', 'TEST')

str_to_lower(test)
str_to_title(test)
str_to_upper(test)



# MATCHING PATTERNS WITH REGULAR EXPRESSIONS ------------------------------

# str_view()
# str_view_all()

x = c("apple", "banana", "pear")

# simplest matching with exact strings
str_view(x, "an")

# . matches any character (except a newline):
str_view(x, ".a.")

# And this tells R to look for an explicit .
str_view(c("abc", "a.c", "bef"), "a\\.c")


# ^ to match start of a string
str_view(x, "^a")

# $ to match the end
str_view(x, "a$")



# TOOLS -------------------------------------------------------------------

# detect matches
str_detect(x, "e")


# cut out part of the string
str_subset(str_subset(words, "x$"))

# count matching
str_count(x, "a")

# replacing matches
str_replace(x, "[aeiou]", "-")

# splitting
str_split()

