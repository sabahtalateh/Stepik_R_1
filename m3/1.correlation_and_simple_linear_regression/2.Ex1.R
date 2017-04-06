library(ggplot2)

setwd("~/Code/Stepik_R_1/m3/1.correlation_and_simple_linear_regression")

tt <- read.table("data2.txt", header = F)
tt <- as.data.frame(tt)

fit <- lm(V1 ~ V2, tt)
summary(fit)

diam <- subset(x = diamonds, cut == 'Ideal' & carat == 0.46)
d_fit <- lm(price ~ depth, diam)
d_fit$coefficients

ggplot(diam, aes(x = diam$price, y = diam$depth))+
  geom_point()+
  geom_smooth()

my_df = iris[,c(1,4)]
regr.calc(my_df)
cor <- cor.test(my_df[,1], my_df[,2], method = "pearson")
names(my_df) <- c('v1', 'v2')
cor$p.value
v1 <- my_df[, 1]
v2 <- my_df[, 2]
fit <- lm(v1 ~ v2, my_df)
summary(fit)
fit$fitted.values


regr.calc <- function(x) {
  cor <- cor.test(x[,1], x[,2])
  if (cor$p.value > 0.05) {
    return("There is no sense in prediction")    
  }
  names(x) <- c('v1', 'v2')
  fit <- lm(v1 ~ v2, x)
  x$fit <- fit$fitted.values
  return(x)
}

ir <- iris
str(ir)
ggplot(iris, aes(x = Sepal.Width, y = Petal.Width, col = Species))+
  geom_point()+
  geom_smooth(method = 'lm')

ggplot(mtcars, aes(mpg, disp))+
  geom_point(aes(col = factor(am)))+
  geom_smooth()

ggplot(mtcars, aes(mpg, disp, col = factor(am)))+
  geom_point()+
  geom_smooth()

ggplot(mtcars, aes(mpg, disp))+
  geom_point()+
  geom_smooth(aes(col = factor(am)))














