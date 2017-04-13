setwd("~/Code/Stepik_R_1/m3/7.data_export")

install.packages('xtable')
library(xtable)

install.packages('stargazer')
library(stargazer)

fit1 <- lm(mpg ~ cyl + disp, mtcars)
fit2 <- aov(mpg ~ am * vs, mtcars)

fit_table1 <- xtable(fit1)
fit_table2 <- xtable(fit2)

print(fit_table1, type = 'html', file = 'fit_table1.html')
print(fit_table2, type = 'html', file = 'fit_table2.html')

stargazer(fit1, type = 'html', 
          dep.var.labels = 'mpg',
          covariate.labels = c('cyl', 'disp'), 
          out = 'model1.html')

