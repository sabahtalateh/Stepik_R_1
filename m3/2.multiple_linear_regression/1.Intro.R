library(ggplot2)

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

#
# categorial predictors
#

hist(swiss$Catholic, col = 'red')
swiss$religion <- ifelse(swiss$Catholic > 60, 'Lots', 'Few')
swiss$religion <- as.factor(swiss$religion)

fit3 <- lm(Fertility ~ Examination + religion, data = swiss)
summary(fit3)

fit4 <- lm(Fertility ~ religion * Examination, data = swiss)
summary(fit4)

ggplot(swiss, aes(x = Examination, y = Fertility))+
  geom_point()+
  geom_smooth(method = 'lm')

ggplot(swiss, aes(x = Examination, y = Fertility, col = religion))+
  geom_point()+
  geom_smooth(method = 'lm')

fit5 <- lm(Fertility ~ religion * Infant.Mortality * Examination, data = swiss)
summary(fit5)


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

mt <- mtcars
mt$am <- factor(mtcars$am, labels = c('Automatic', 'Manual'))

mt$wt_centered <- mt$wt - mean(mt$wt)
mt$wt_centered <- mtcars$wt - mean(mtcars$wt)
mt_fit1 <- lm(mpg ~ wt * am, mt)  
summary(mt_fit1)

mtcars$am <- factor(mtcars$am)

ggplot(mtcars, aes(x = wt, y = mpg, col = am))+
  geom_smooth(method = 'lm')

mean(mt$wt)
  
  
  















