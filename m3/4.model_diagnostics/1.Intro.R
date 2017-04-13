setwd("~/Code/Stepik_R_1/m3/4.model_diagnostics")
library(ggplot2)

#
# Regression diagnostics
#

swiss <- data.frame(swiss)
str(swiss)

pairs(swiss)

ggplot(data = swiss, aes(x = Examination, y = Education))+
  geom_point()+
  theme(axis.text = element_text(size = 10),
        axis.title = element_text(size = 10, face = 'bold'))

# Outliers
ggplot(data = swiss, aes(x = Examination, y = Education))+
  geom_point()+
  theme(axis.text = element_text(size = 10),
        axis.title = element_text(size = 10, face = 'bold'))+
  geom_smooth(method = 'lm')

# Normality of distribution
ggplot(data = swiss, aes(x = Examination))+
  geom_histogram()

# распределена не нормально возьмём от неё логарифм
ggplot(data = swiss, aes(x = Education))+
  geom_histogram()

ggplot(data = swiss, aes(x = log(Education)))+
  geom_histogram()

# Linearity

ggplot(data = swiss, aes(x = Examination, y = Education))+
  geom_point()+
  geom_smooth()

lm1 <- lm(data = swiss, formula = Education ~ Examination)
summary(lm1)

swiss$Examination_squared <- swiss$Examination^2
lm2 <- lm(data = swiss, formula = Education ~ Examination + Examination_squared)
summary(lm2)
anova(lm2, lm1)

swiss$lm1_fitted <- lm1$fitted.values
swiss$lm2_fitted <- lm2$fitted.values
swiss$lm1_resid <- lm1$residuals
swiss$lm2_resid <- lm2$residuals
swiss$ob_num <- 1:nrow(swiss)

ggplot(data = swiss, aes(x = Examination, y = Education))+
  geom_point()+
  geom_line(aes(x = Examination, y = lm1_fitted), col = 'red', lwd = 1)+
  geom_line(aes(x = Examination, y = lm2_fitted), col = 'blue', lwd = 1)

ggplot(data = swiss, aes(x = lm1_fitted, y = lm1_resid))+
  geom_point(size = 2)+
  geom_hline(yintercept = 0, col = 'red', lwd = 2)

ggplot(data = swiss, aes(x = lm2_fitted, y = lm2_resid))+
  geom_point(size = 2)+
  geom_hline(yintercept = 0, col = 'blue', lwd = 2)

# Независимость по остаткам
ggplot(data = swiss, aes(x = ob_num, y = lm1_resid))+
  geom_point() + geom_smooth()

ggplot(data = swiss, aes(x = ob_num, y = lm2_resid))+
  geom_point() + geom_smooth()

# гомоскедаксичность - одинаковый разброс остатков
ggplot(swiss, aes(x = lm1_fitted, y = lm1_resid))+
  geom_point()
ggplot(swiss, aes(x = lm2_fitted, y = lm2_resid))+
  geom_point()

# Нормальность распределения остатков
ggplot(swiss, aes(x = lm1_resid))+
  geom_histogram(binwidth = 4, fill = 'white', col = 'black')

qqnorm(lm1$residuals)
qqline(lm1$residuals)
shapiro.test(lm1$residuals)

ggplot(swiss, aes(x = lm2_resid))+
  geom_histogram(binwidth = 4, fill = 'white', col = 'black')
qqnorm(lm2$residuals)
qqline(lm2$residuals)
shapiro.test(lm2$residuals)

print(1)





my_vector <- c(0.027, 0.079, 0.307, 0.098, 0.021, 0.091, 0.322, 0.211, 0.069, 0.261, 0.241, 0.166, 0.283, 0.041, 0.369, 0.167, 0.001, 0.053, 0.262, 0.033, 0.457, 0.166, 0.344, 0.139, 0.162, 0.152, 0.107, 0.255, 0.037, 0.005, 0.042, 0.220, 0.283, 0.050, 0.194, 0.018, 0.291, 0.037, 0.085, 0.004, 0.265, 0.218, 0.071, 0.213, 0.232, 0.024, 0.049, 0.431, 0.061, 0.523)
my_vector <- sqrt(my_vector)
my_vector <- as.data.frame(my_vector)
shapiro.test(my_vector$my_vector)
ggplot(data = my_vector, aes(x = my_vector))+
  geom_histogram()

beta(my_vector, my_vector)

mt <- mtcars[, c(1,3)]
str(mt)

mt1 <- mtcars[, c(1)]
str(mt1)
scale(mt1)

mt2 <- mtcars[, c(3)]
str(mt2)
scale(mt2)

ff <- lm(data = mt, formula = scale(mpg) ~ scale(disp))
ff$coefficients

beta.coef <- function(x) {
  model <- lm(data = x, formula = scale(x[,1]) ~ scale(x[,2]))
  return(model$coefficients)
}

beta.coef(mtcars[, c(1,3)])
beta.coef(swiss[,c(1,4)])

library(QuantPsyc)
lm.beta(mtcars[, c(1,3)])

bb <- unlist(sapply(X = mtcars[,1:6], FUN = shapiro.test)['p.value',])
bb <- as.data.frame(bb)
bb <- unlist(bb, use.names = F)
str(bb)

library(gvlma)
d <- read.csv('homosc.csv')
gvl <- gvlma(DV ~ IV, d)
summary(gvl)


fit <- lm(mpg ~ disp, mtcars)
shapiro.test(fit$residuals)$p
resid.norm(fit)

fit <- lm(mpg ~ wt, mtcars)
shapiro.test(fit$residuals)

resid.norm  <- function(fit) {
  p <- shapiro.test(fit$residuals)$p
  color <- 'green'
  if (p < 0.05) {
    color <- 'red'
  }

  plot <- ggplot(fit, aes(x = fit$residuals))+
    geom_histogram(fill = color)
  return(plot)
}

ir <- iris[,-5]

pairs(ir)
uu <- cor(ir)
uu[row(uu) == col(uu)] <- 0
uu <- abs(uu)
rownames(which(uu == max(uu), arr.ind = T))

high.corr <- function(x) {
  corr <- cor(x)
  corr[row(corr) == col(corr)] <- 0
  corr <- abs(corr)
  return(rownames(which(corr == max(corr), arr.ind = T)))
}

remove(swiss)
sw <- swiss
high.corr(swiss)
high.corr(iris[,-5])

x1 <- rnorm(30)
x2 <- rnorm(30)
x3  <- x1 + 5
my_df <- data.frame(var1 = x1, var2 = x2, var3 = x3)
high.corr(my_df)












