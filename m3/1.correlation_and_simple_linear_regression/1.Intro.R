setwd("~/Code/Stepik_R_1/m3/1.correlation_and_simple_linear_regression")

df <- mtcars
cor.test(x = df$mpg, y = df$hp)
fit <- cor.test(x = df$mpg, y = df$mpg)

cor.test(~ mpg + hp, df)

str(fit)

fit$p.value

plot(x = df$mpg, y = df$hp)

library(ggplot2)
ggplot(df, aes(x = df$mpg, y = df$hp, col = factor(cyl)))+
  geom_point(size = 5)

df_numeric <- df[,c(1,3:7)]

pairs(df_numeric)
cor(df_numeric)
library(psych)
corr <- corr.test(df_numeric)
str(corr)
corr$r

f <- corr.test(df[, c(1,5)])
f$r[,1][2]
f$p

library(psych)

corr.calc <- function(x) {
  fit <- corr.test(x)
  return(c(fit$r[2], fit$p[2]))
}

corr.calc(mtcars[, c(1,5)])

iris$Petal.Length <- -iris$Petal.Length
#step6 <- read.table("step6.csv",  header=TRUE, sep=',' )
step6 <- iris
nums <- step6[sapply(step6, is.numeric)]
fff <- corr.test(nums)
r <- fff$r
diag(r) <- 0
which.max(abs(r))
r[12]

filtered.cor <- function(x) {
  nums <- x[sapply(x, is.numeric)]  
  r <- corr.test(nums)$r
  diag(r) <- 0
  return(r[which.max(abs(r))])
}

step6 <- read.table("step6.csv",  header=TRUE, sep=',' )
filtered.cor(step6)

iris$Petal.Length <- -iris$Petal.Length
filtered.cor(iris)


test_data <- read.csv("https://stepik.org/media/attachments/course/129/test_data.csv")
gg <- shapiro.test(test_data[, 1])

yy <- corr.test(test_data)$r[2]


smart_cor <- function(x) {
  first_col_test <- shapiro.test(x[, 1])
  second_col_test <- shapiro.test(x[, 2])
  method <- "pearson"
  if (first_col_test$p < 0.05 | second_col_test$p < 0.05) {
    method <- "spearman"
  }
  return(corr.test(x, method = method)$r[2])
}

smart_cor(test_data)









