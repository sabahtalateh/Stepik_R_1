setwd("~/Code/Stepik_R_1/m2/l2")

?iris
df <- iris
str(df)

df1 <- subset(df, Species != "setosa")
str(df1)
table(df1$Species)

hist(df1$Sepal.Length)

library(ggplot2)

ggplot(df1, aes(x = Sepal.Length))+
  geom_histogram(fill = "white", col = "black", binwidth = 0.4)+
  facet_grid(Species ~ .)

ggplot(df1, aes(x = Sepal.Length, fill = Species))+
  geom_density(alpha = 0.4)

ggplot(df1, aes(x = Species, y = Sepal.Length))+
  geom_boxplot()

# Тест Шапиро-Вилка для проверки нормальности распределения
# можно ли применть Т-тест если p-значение больше чем 0.05 то всё ок
# Проверим всю нашу выборку p=0.1464 - всё ок
shapiro.test(df1$Sepal.Length)

# Проверим отдельные виды
str(df1)
shapiro.test(df1$Sepal.Length[df1$Species == 'versicolor']) # ~ 0.465 ок
shapiro.test(df1$Sepal.Length[df1$Species == 'virginica']) # ~ 0.2583 ок

# Гомогенность проверяем так p=0.1478
bartlett.test(Sepal.Length ~ Species, df1)

# p-value = 1.866e-07 - Сильно меньше 0.05 отклоняем 0-гипотезу
# Проверка равенства средних по 2 группам
t.test(Sepal.Length ~ Species, df1)
test1 <- t.test(Sepal.Length ~ Species, df1)

str(test1)
test1$p.value

# Проверка равенства среднего какому то числу
t.test(df1$Sepal.Length, mu = 6.2)

# paired == T - выборки зависимые, длина и ширина у одного цветка
t.test(df1$Sepal.Length, df1$Sepal.Width, paired = T)

# Применяет по каждому фактору
by(iris$Sepal.Length, INDICES = iris$Species, shapiro.test)

library(Hmisc)

ggplot(df1, aes(x = Species, y = Sepal.Length))+
  stat_summary(fun.data = mean_cl_normal, geom = "errorbar", width = 0.1)+
  stat_summary(fun.y = mean, geom = "point", size = 4)
  
ggplot(df1, aes(x = Species, y = Sepal.Length))+
  stat_summary(fun.data = mean_cl_normal, geom = "pointrange", size = 1)

# Если данных мало или они не нормально распределены или не гомогенны то 
# можно пользоваться критерием Вилконсона
test2 <- wilcox.test(Petal.Length ~ Species, df1)
str(test2)
test2$p.value

ggplot(df1, aes(x = Species, y = Petal.Length))+
  geom_boxplot()

wilcox.test(df1$Petal.Length, df1$Sepal.Width, paired = T)
paired_wtest <- wilcox.test(df1$Petal.Length, df1$Sepal.Width, paired = T)




