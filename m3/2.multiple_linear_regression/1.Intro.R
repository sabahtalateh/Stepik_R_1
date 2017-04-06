#
# Multiple linear regression
#

setwd("~/Code/Stepik_R_1/m3/2.multiple_linear_regression")

swiss <- data.frame(swiss)
str(swiss)

hist(swiss$Fertility, col = 'red')

fit <- lm(Fertility ~ Examination + Catholic, swiss)
summary(fit)

fit2 <- lm(Fertility ~ Examination * Catholic, swiss)
summary(fit2)

confint(fit2)

test_data <- read.csv("https://stepic.org/media/attachments/course/129/fill_na_test.csv")
str(test_data)

vv <- subset(test_data, !is.na(y))
fit <- lm(y ~ x_1 + x_2, vv)
test_data$pred <- predict(fit, test_data)
test_data$y_full <- 0
test_data$y_full <- ifelse(is.na(test_data$y), test_data$pred, test_data$y)
test_data$pred <- NULL

fill_na <- function(x) {
  fit <- lm(y ~ x_1 + x_2, x)
  x$y_full <- ifelse(is.na(x$y), predict(fit, x), x$y)
  return(x)
}

fill_na(test_data)




#test_data$y_full <- ifelse(is.na(test_data$y), predicted, test_data$y)

for (i in 1:nrow(test_data)) {
  row <- test_data[i,]
  row$y_full <- 22
  #if (is.na(row$y)) {
  #  row$y_full <- predicted[i]
  #} else {
  #  row$y_full <- row$y
  #}
}
test_data
  
  
  
  
  
  
  















