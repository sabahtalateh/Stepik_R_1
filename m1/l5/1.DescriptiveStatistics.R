?mtcars
df <- mtcars

str(df)
# Сделать из факторную переменную
df$vs <- factor(df$vs, labels = c("V", "S"))
df$am <- factor(df$am, labels = c("Auto", "Manual"))
str(df)

# Медиана
median(df$mpg)
mean(df$mpg)
# стандартное отклонение
sd(df$mpg)
# размах - мин и макс значение
range(df$mpg)

mean(df$mpg[df$cyl == 6 & df$vs == 'S'])
sd(df$hp[df$cyl != 3 & df$am == 'Auto'])

mean(mtcars$qsec[mtcars$cyl != 3 & mtcars$mpg > 20])

?aggregate

mean_hp_vs = aggregate(x = df$hp, by = list(df$vs), FUN = mean)
colnames(mean_hp_vs)
# Переименовать колонки
colnames(mean_hp_vs) <- c("VS", "Mean HP")

# то же что aggregate(x = df$hp, by = list(df$vs), FUN = mean)
aggregate(hp ~ vs, df, mean)

aggregate(hp ~ vs + am, df, mean)

aggregate(x = df[, -c(8,9)], by = list(df$am), FUN = median)

# одно и то же
aggregate(x = df[c(1,3)], by = list(df$am, df$vs), FUN = sd)
aggregate(cbind(mpg, disp) ~ am + vs, df, sd)
cbind(df$mpg, df$disp)

aggregate(cbind(hp, disp) ~ am, df, sd)
