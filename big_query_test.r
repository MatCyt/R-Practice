# Following post from:
# https://cloud.google.com/blog/products/gcp/google-cloud-platform-for-data-scientists-using-r-with-google-bigquery


library(bigrquery)

### Connect to table

# Select project
project = "" # put project name here

# select query
sql = "SELECT * FROM " # put set.table name here

# download dataset and authenticate the account
df_query = query_exec(sql, project = project, useLegacySql = FALSE)


# Select the count of cars with mpg higher than 16
sql = "SELECT COUNT(mpg) FROM campaigData.mtcars
WHERE mpg > 16"
q_mpg16 = query_exec(sql, project = project, useLegacySql = FALSE)


# Ratio of mpg > 16 as pie chart
sql = "SELECT COUNT(mpg) FROM campaigData.mtcars"
q_mpgall = query_exec(sql, project = project, useLegacySql = FALSE)

p_mpg = c(q_mpg16[1,1], q_mpgall[1,1] - q_mpg16[1,1])
labels_mpg = c("<16mpg", ">16mpg")
pie(p_mpg, labels = labels_mpg)


