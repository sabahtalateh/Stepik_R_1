aq <- airquality

library(ggplot2)

aq$Month <- factor(aq$Month, c('5', '6', '7', '8', '9'))

str(aq)

ggplot(aq, aes(x = Month, y = Ozone))+
  geom_boxplot()

plot1 <- ggplot(mtcars, aes(x = mpg, y = disp, color = hp))+
  geom_point()

str(iris)
ggplot(iris, aes(x = Sepal.Length, fill = Species))+
  geom_histogram()


