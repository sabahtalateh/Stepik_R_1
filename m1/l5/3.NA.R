library(psych)

df <- mtcars

df$vs <- factor(df$vs, labels = c("V", "S"))
df$am <- factor(df$am, labels = c("Auto", "Manual"))

sum(is.na(df$mpg))
sum(is.na(df))

df$mpg[1:10] <- NA
mean(df$mpg, na.rm = T)

aggregate(mpg ~ am, df, mean)

describe(x = df$mpg, na.rm = T)

df1 <- airquality

?airquality

str(aq1)

aq1 <- airquality[airquality$Month %in% c(7,8,9),]
aggregate(Ozone ~ Month, aq1, length)

str(airquality)

describeBy(x = airquality$Wind, group = airquality$Month, mat = T)

str(iris)

describe(x = iris)


ir <- iris
describe(iris[iris$Species == 'virginica', ])

my_vector <- rnorm(30)
my_vector[1:10] <- NA

fixed_vector <- my_vector
fixed_vector[is.na(fixed_vector)] <- mean(fixed_vector, na.rm = T)

a <- 1:10
a[3:3] <- NA
b <- replace(a, 1, 100)

b <- a
a[is.na(a)]

ind <- c()
for(i in 1:length(my_vector)) {
  if (is.na(my_vector[i])) {
    ind <- c(ind, i) 
  }
}
fixed_vector <- replace(my_vector, ind, mean(my_vector, na.rm = T))










  