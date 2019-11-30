### lubridate - work with dates

library(tidyverse)
library(lubridate)
library(nycflights13) # practice data


# today and now
today()
now()


# CREATE DATE/TIME --------------------------------------------------------

### from string using lubridate
# just specify the order of time - lubridate will take care of the rest

ymd("2017-01-31")
mdy("January 31st, 2017")
dmy("31-Jan-2017")

ymd(20170131) # this also works

# create date-time
ymd_hms("2017-01-31 20:11:59")


### from individual components spread across columns
flights %>% 
  select(year, month, day, hour, minute)

# here we will go with make_date or make_datetime
flights %>% 
  select(year, month, day, hour, minute) %>% 
  mutate(departure = make_datetime(year, month, day, hour, minute))



# GET DATE COMPONENTS -----------------------------------------------------

# pull out individual part of date by
datetime <- ymd_hms("2016-07-08 12:34:56")

year(datetime)
month(datetime)
mday(datetime) # day of month
yday(datetime) # day of year
wday(datetime) # day of week

# same for hour(), minute(), second()

# for month and wday we can set a label to use date naming
month(datetime, label = TRUE, abbr = FALSE)
wday(datetime, label = TRUE, abbr = FALSE)

month(datetime, label = TRUE, abbr = TRUE)
wday(datetime, label = TRUE, abbr = TRUE)


### Rounding
floor_date(datetime, "week") # date, level
round_date()
ceiling_date()


# Modifying directly part of date
datetime = ymd_hms("2016-07-08 12:34:56")

# change only year in this date
year(datetime) = 2020
month(datetime) = 01
datetime

# or update instead of inplace
update(datetime, year = 2020, month = 2, mday = 2, hour = 2)


# TIME SPANS --------------------------------------------------------------

# In lubridate you can represent difference in dates as duration
as.duration(today() - ymd(19791014))

# constructors
dseconds(15)
dminutes(10)
dhours(c(12, 24))
dweeks(3)
dyears(1)

# add and multiply durations
tomorrow <- today() + ddays(1)
last_year <- today() - dyears(1)

tomorrow
last_year


# PERIODS - do not take time zones into consideration
seconds(15)
minutes(10)
hours(c(12, 24))
days(7)
months(1:6)


