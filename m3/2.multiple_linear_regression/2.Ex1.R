df <- mtcars
str(df)
df <- df[, c('wt', 'mpg', 'disp', 'drat', 'hp')]

model <- lm(wt ~ mpg + disp + hp, df)
summary(model)

at <- attitude
fit_at <- lm(formula = rating ~ complaints * critical, at)
summary(fit_at)
