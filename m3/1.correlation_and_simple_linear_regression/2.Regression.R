library(ggplot2)

df <- mtcars
df_numbers <- df[, c(1, 3:7)]

fit <- lm(mpg ~ hp, df)

summary(fit)

ggplot(df, aes(hp, mpg))+
  geom_point(size = 3)+
  geom_smooth(method = "lm")+
  facet_grid(.~cyl)

ggplot(df, aes(hp, mpg))+
  geom_point(size = 3)+
  geom_smooth(method = "lm")

ggplot(df, aes(hp, mpg))+
  geom_smooth(method = "lm")+
  facet_grid(.~cyl)

ggplot(df, aes(hp, mpg))+
  geom_smooth(method = "lm", se = F)+
  facet_grid(.~cyl)

fitted_mpg <- data.frame(mpg = df$mpg, fitted = fit$fitted.values)

# Мы построили линию тренда и теперь можем попробовать предсказать сколько будет
# расход топлива для новых значений hp

new_hp <- data.frame(hp = c(100, 150, 200, 400))
new_hp$mpg <- predict(fit, new_hp)

predict(fit, new_hp)




df <- mtcars
fit <- lm(mpg ~ cyl, df)
summary(fit)

ggplot(df, aes(cyl, mpg))+
  geom_point(size = 3)+
  geom_smooth(method = "lm")
  
df$cyl <- factor(df$cyl, labels = c("four", "six", "eight"))
fit <- lm(mpg ~ cyl, df)
summary(fit)

ggplot(df, aes(cyl, mpg))+
  geom_point(size = 3)  

aggregate(mpg ~ cyl, df, mean)



